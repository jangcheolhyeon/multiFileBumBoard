package egovframework.bumilboard.sample.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.bumilboard.sample.service.AnswerService;
import egovframework.bumilboard.sample.service.BoardService;
import egovframework.bumilboard.sample.service.LoginService;
import egovframework.bumilboard.sample.vo.AnswerVo;
import egovframework.bumilboard.sample.vo.BoardVo;
import egovframework.bumilboard.sample.vo.Pagination;
import egovframework.bumilboard.sample.vo.ServiceVo;
import egovframework.bumilboard.sample.vo.SideBoardVo;
import egovframework.bumilboard.sample.vo.TypeVo;
import egovframework.bumilboard.sample.vo.fileVo;

@Controller
public class TestController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	AnswerService answerService;
	
	
	
	@Resource(name = "egovIdGnrService")
	EgovIdGnrService reqIdgenService;
	
	@GetMapping("/test.do")
	public String test() {
		System.out.println("testController");
		return "testPage";
	}
	
	
	@GetMapping("/list.do")
	public String list(Model m, Integer page, Integer pageSize) {
		System.out.println("list");
		if(page == null) page = 1;
		if(pageSize == null) pageSize = 10;
		
		int boardListCnt = boardService.selectBoardListCnt();
		Pagination pageInfo = new Pagination(boardListCnt, page, pageSize);
		m.addAttribute("pageInfo", pageInfo);
		System.out.println(pageInfo);
		
		Map map = new HashMap();
		map.put("offset", (page-1) * pageSize);
		map.put("pageSize", pageSize);
		
		List<BoardVo> boardList = boardService.selectBoardList(map);
		
		System.out.println(boardList);
		m.addAttribute("boardList", boardList);
		return "list";
	}
	
	@GetMapping("/view.do")
	public String view() {
		
		return "view";
	}
	
	@GetMapping("/readBoard.do")
	public String readBoard(Model m, Integer board_id, HttpServletRequest request, HttpServletResponse response) {
		BoardVo boardVo = boardService.getBoardOne(board_id);
		
		
		//쿠키에다가 bno를 넘겨서 있으면 view_cnt를 올리지 않기
		Cookie[] cookies = request.getCookies();
		Cookie oldCookie = null;
		
		
		// boardView가 key인 값이 있으면 oldCookie에다가 쿠키값 넣어주기
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				
				if(cookie.getName().equals("boardView")) {
					oldCookie = cookie;
				}
			}
		} 
		
		//위에서 쿠키가 발견됐을 경우
		if(oldCookie != null) {
			if(!oldCookie.getValue().contains(board_id + "")) {
				boardService.increaseViewCount(board_id);
				
				oldCookie = new Cookie("boardView", board_id + "");
				oldCookie.setMaxAge(60 * 2);
				response.addCookie(oldCookie);
			} 
		} else {
			boardService.increaseViewCount(board_id);
			
			oldCookie = new Cookie("boardView", board_id + "");
			oldCookie.setMaxAge(60 * 2);
			response.addCookie(oldCookie);
		}
		
		
		
		
		AnswerVo answerVo = answerService.getAnswerOne(board_id);
		m.addAttribute("answer", answerVo);
		
		SideBoardVo sideBoards = boardService.selectSideBoards(board_id);
		System.out.println(sideBoards);
		
		List<fileVo> boardFiles = boardService.getFilesInBoard(board_id);
		
		m.addAttribute("boardFiles", boardFiles);
		m.addAttribute("board", boardVo);
		m.addAttribute("sideBoards", sideBoards);
		
		return "view";
	}
	
	@GetMapping("/write.do")
	public String write(Model m) {
		List<TypeVo> type1List = boardService.getType1List();
		m.addAttribute("type1List", type1List);
		
		List<ServiceVo> serviceList = boardService.getServiceList();
		m.addAttribute("serviceList", serviceList);
		m.addAttribute("modifyState", 0);
		
		return "write";
	}
	
	//게시판 수정
	@GetMapping("/modifyBoard.do")
	public String modifyBoard(
			Integer board_id,
			@RequestParam(value="password", required = false) String password,
			HttpSession session,
			Model m
			) {
		
		System.out.println("password = " + password);
		System.out.println("session id = " + ((String)session.getAttribute("id")));
		
		if(password == null && session.getAttribute("id") == null) {
			return "redirect:/list.do";
		}
		
		if(session.getAttribute("id") != null && ((String) session.getAttribute("id")).equals("admin")) {
			password = boardService.getBoardPassword(board_id);
		}
		
		List<fileVo> boardFiles = boardService.getFilesInBoard(board_id);
		m.addAttribute("boardFiles", boardFiles);
				
		
		List<TypeVo> type1List = boardService.getType1List();
		m.addAttribute("type1List", type1List);
		System.out.println(type1List);
		
		List<ServiceVo> serviceList = boardService.getServiceList();
		m.addAttribute("serviceList", serviceList);
		
		m.addAttribute("modifyState", 1);
		
		BoardVo boardVo = boardService.getBoardOne(board_id);
		m.addAttribute("boardInfo", boardVo);
		return "write";
	}
	
	
	
	@PostMapping("/modifyBoard.do")
	public String modifyBoardSave(BoardVo boardVo,
			fileVo file_name,
			HttpServletRequest request,
			MultipartHttpServletRequest multipartRequest) throws IOException{
		
		System.out.println("modifyBoard.do");
		System.out.println(boardVo);

		System.out.println("file_names");
		System.out.println(file_name);
		
		//jsp에서 받아온 파일들의 명을 , 단위로 나눠서 분리(기존에 db에 저장했었는데 수정하면서 삭제한 파일들)
		  List<String> clientFileNamesList = new ArrayList<>();
		  
		  if(file_name.getFile_name() != null) { 
			  String[] clientOriginalFiles = file_name.getFile_name().split(","); 
			  for(String element : clientOriginalFiles) { 
				  clientFileNamesList.add(element);
				  System.out.println(element); 
			  }
		  }
		  
		 
		  System.out.println("완성된 classFileNaemList");
		  System.out.println(clientFileNamesList);
		
		  
		  //db에 있는 이름들을 가져와서 jsp에서 받아온 파일의 이름들과 비교해서 없으면 삭제할 예정
		  //1. update하면서 기존 파일을 뺀 경우
		  List<fileVo> originalDBFiles = boardService.getFilesInBoard(boardVo.getBoard_id());
		  System.out.println("db에서 가져온거");
		  System.out.println(originalDBFiles);
			
		  //첨부했는데 수정하면서 삭제한 경우
		  if(clientFileNamesList.size() == 0) {
			  for(int i=0;i<originalDBFiles.size();i++) {
				  String currentDBFileName = originalDBFiles.get(i).getFile_name();		 
				  
				  Map map= new HashMap();
				  map.put("board_id", boardVo.getBoard_id());
				  map.put("file_name", currentDBFileName);
				  boardService.deleteBoardFile(map);			  
			  
				  for(int j=0;j<originalDBFiles.size();j++) {
					  String elementFileName = originalDBFiles.get(j).getFile_name();
					  
					  //File file = new File("C:\\Users\\장철현\\eclipse-workspace\\bumilBoard\\src\\main\\webapp\\upload\\" + elementFileName );
					  File file = new File(request.getServletContext().getRealPath("/upload") + elementFileName );
						
					  if(file.exists()) {
						  file.delete();
					  }
				  }
			  }
		  }
		  
		  else if(clientFileNamesList.size() != 0) {
			  List<fileVo> fileNameList = boardService.deleteBoardFilesUpload(boardVo.getBoard_id());
			  List<fileVo> deleteFileList = new ArrayList<>();
			  for(int i=0;i<fileNameList.size();i++) {
				  String elementFileName = fileNameList.get(i).getFile_name();
				  
				  if(!clientFileNamesList.contains(elementFileName)) {
					  System.out.println("불포함입니다.");
					  System.out.println(elementFileName);
					  
					  
					  //File file = new File("C:\\Users\\장철현\\eclipse-workspace\\bumilBoard\\src\\main\\webapp\\upload\\" + elementFileName );
					  File file = new File(request.getServletContext().getRealPath("/upload") + elementFileName );		
					  
					  System.out.println("elementFileName = " + elementFileName);
					  if(file.exists()) {
						  file.delete();
					  }
					  
					  //db에서 삭제
					  Map map = new HashMap();
					  map.put("board_id", boardVo.getBoard_id());
					  map.put("file_name", elementFileName);
					  
					  boardService.deleteBoardFile(map);
				  }
			  }
		  }
		
		
		//2. update하면서 기존 파일을 놔둔 경우
		
		
		
		
		
		//upload 된 파일들이랑 db에 파일 삭제하고 다시 저장할것
		// upload 기존 파일 삭제
		
				
		System.out.println(boardVo);
		String fileName = null;
		
		System.out.println("multipartRequest : " + multipartRequest);
		System.out.println(multipartRequest);
        List<MultipartFile> fileList = multipartRequest.getFiles("uploadFile");
        
        int file_idx = 0;
        if(!fileList.isEmpty()){
            for(MultipartFile mf : fileList){
                System.out.println("원본파일명 : " + mf.getOriginalFilename());
                System.out.println("파일 사이즈 : " + mf.getSize());
                
                if(mf.getSize() == 0) break;

                String originalFileName = mf.getOriginalFilename();
                System.out.println("원노파일 : " + originalFileName);
                String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
                System.out.println("확장자 : " + ext);

                


                System.out.println("최종이름 : " + fileName);
                UUID uuid = UUID.randomUUID();	//UUID 구하기
                fileName=uuid+"."+ext;

                //mf.transferTo(new File("C:\\Users\\장철현\\eclipse-workspace\\bumilBoard\\src\\main\\webapp\\upload\\" + fileName));

                mf.transferTo(new File(request.getServletContext().getRealPath("/upload") + fileName));

                System.out.println("저장까지??");
                
                Map map = new HashMap();
                map.put("board_id", boardVo.getBoard_id());
                map.put("original_file_name", mf.getOriginalFilename());
                map.put("file_order", file_idx);
                map.put("file_size", Long.valueOf(mf.getSize()).intValue());
                map.put("file_name", fileName);
                map.put("file_ext", ext);
                boardService.insertFile(map);
                file_idx++;
            }
        }
		
		boardService.updateBoard(boardVo);
		
		return "redirect:/list.do";
		
		
        
		
	}
	
	
	
	
	//게시판 삭제
	@ResponseBody
	@DeleteMapping("/board/{board_id}/{userInsertPassword}.do")
	public ResponseEntity<String> deleteAnswer(@PathVariable int board_id, @PathVariable String userInsertPassword, HttpServletRequest request,  HttpSession session) {
		
		System.out.println("board_id = " + board_id);
		System.out.println("password = " + userInsertPassword);
		String password = "";
		if(session.getAttribute("id") != null && ((String) session.getAttribute("id")).equals("admin")) {
			password = boardService.getBoardPassword(board_id);
		} else {
			password = userInsertPassword;
		}
		
		
		try {			
			//upload폴더에 있는 파일들 삭제(db file_table에서 file들의 정보를 가져와 upload에서 이름 일치하는거 삭제)
			List<fileVo> filesName = boardService.deleteBoardFilesUpload(board_id);
			System.out.println("fileNames = " + filesName);
			for(fileVo element : filesName) {
				String elementFileName = element.getFile_name();
				//File file = new File("C:\\Users\\장철현\\eclipse-workspace\\bumilBoard\\src\\main\\webapp\\upload\\" + elementFileName );
				  File file = new File(request.getServletContext().getRealPath("/upload") + elementFileName );		

				if(file.exists()) {
					file.delete();
				}
			}
			
			int result = boardService.deleteBoard(board_id, password);

			
			
			if(result == 1) {
				return new ResponseEntity<>("OK", HttpStatus.OK);
			} else {
				return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
			}
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);	
		}
				
	}
	
	
	
	//type1이 바뀌면 type2도 교체
	@ResponseBody
	@GetMapping("/updateType2/{code}.do")
	public List<TypeVo> updateType2(@PathVariable String code){
		List<TypeVo> list = boardService.getType2List(code);
		
		
		return list;
	}
	
	
	//게시글 비밀번호 가져오기
	@ResponseBody
	@GetMapping("/getBoardPassword/{board_id}.do")
	public String getBoardPassword(@PathVariable int board_id) {
		String pwd = boardService.getBoardPassword(board_id);

		return pwd;
	}
	
	
	// 이게 로직
	@PostMapping("/showWriteData.do")
	public String viewData(BoardVo boardVo, 
			HttpServletRequest request,
			MultipartHttpServletRequest multipartRequest) throws IOException{
		System.out.println("showWirete");
		System.out.println(boardVo);
		
		
		int bnoNum = boardService.getSeqNumber();
		System.out.println("sequence bnoNum = " + bnoNum);
		boardVo.setBoard_id(bnoNum);
		
		//password
		//boardVo.setBoard_password("12345");
		
		boardService.insertBoard(boardVo);
		
		
		
		System.out.println(boardVo);
		String fileName = null;
		
		System.out.println("multipartRequest : " + multipartRequest);
		System.out.println(multipartRequest);
        List<MultipartFile> fileList = multipartRequest.getFiles("uploadFile");

        
        if(!fileList.isEmpty()){
        	int file_idx = 0;
            for(MultipartFile mf : fileList){
                System.out.println("원본파일명 : " + mf.getOriginalFilename());
                System.out.println("파일 사이즈 : " + mf.getSize());
                
                if(mf.getSize() == 0) break;

                String originalFileName = mf.getOriginalFilename();
                System.out.println("원노파일 : " + originalFileName);
                String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
                System.out.println("확장자 : " + ext);

                


                System.out.println("최종이름 : " + fileName);
                UUID uuid = UUID.randomUUID();	//UUID 구하기
                fileName=uuid+"."+ext;
                
                //mf.transferTo(new File("C:\\Users\\장철현\\eclipse-workspace\\bumilBoard\\src\\main\\webapp\\upload\\" + fileName));
                mf.transferTo(new File(request.getServletContext().getRealPath("/upload") + fileName));
                
                System.out.println("저장까지??");
                
                Map map = new HashMap();
                map.put("board_id", bnoNum);
                map.put("original_file_name", mf.getOriginalFilename());
                map.put("file_order", file_idx);
                map.put("file_size", Long.valueOf(mf.getSize()).intValue());
                map.put("file_name", fileName);
                map.put("file_ext", ext);
                boardService.insertFile(map);
                file_idx++;
            }
        }
		
		
		return "redirect:/list.do";
	}
	
	
	
	

	
	
	//여기서부터는 form태그 없이 데이터 넘기기 test
	@GetMapping("/write1.do")
	public String write1() {
		return "write1";
	}
	
	
	
	
	//loginPage
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login.do")
	public String login(String id, String password, HttpServletRequest request) {
		
		if(loginService.loginCheck(password) != 1) {
			return "redirect:/login.do";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(60*10);
		
		
		System.out.println(session.getAttribute("id"));
		return "redirect:/list.do";
		
		
	}
	
	//loginout
	@GetMapping("/logout.do")
	public String logout(String id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/list.do";
	}
	
	
	
}
