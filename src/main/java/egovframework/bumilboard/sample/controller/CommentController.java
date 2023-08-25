package egovframework.bumilboard.sample.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.bumilboard.sample.service.AnswerService;
import egovframework.bumilboard.sample.vo.AnswerVo;

@Controller
public class CommentController {
	@Autowired
	AnswerService answerService;
	
	
	@ResponseBody
	@PostMapping("/writeAnswer.do")
	public ResponseEntity<String> writeAnswer(@RequestBody AnswerVo answerVo, HttpSession session) {
		
		answerVo.setWriter_id((String)session.getAttribute("id"));
		
		if(session.getAttribute("id") == null || !((String) session.getAttribute("id")).equals("admin")) {
			return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		
		try {
			int result = answerService.writeAnswer(answerVo);
			
			if(result == 1) {
				return new ResponseEntity<>("ok", HttpStatus.OK);
			} else {
				return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
			}
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
	}
	
	@ResponseBody
	@DeleteMapping("/answer/{board_id}.do")
	public ResponseEntity<String> deleteAnswer(@PathVariable int board_id, HttpSession session) {
		
		if(session.getAttribute("id") == null || !((String) session.getAttribute("id")).equals("admin")) {
			return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		
		try {
			int result = answerService.deleteAnswer(board_id);
			
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
	
	
	@ResponseBody
	@PutMapping("/answer/{board_id}.do")
	public ResponseEntity<String> updateAnswer(@PathVariable int board_id, @RequestBody AnswerVo answerVo, HttpSession session) {
		answerVo.setBoard_id(board_id);
		
		if(session.getAttribute("id") == null || !((String) session.getAttribute("id")).equals("admin")) {
			return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		
		try {
			int result = answerService.updateAnswer(answerVo);
			
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
	
	
}
