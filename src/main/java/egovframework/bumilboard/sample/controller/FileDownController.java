package egovframework.bumilboard.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class FileDownController {

    @GetMapping("fileDownload.do")
    public void fileDownload4(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //String path =  request.getSession().getServletContext().getRealPath("저장경로");

        String filename =request.getParameter("fileName");
        String originalFileName = request.getParameter("originalFileName");
        String fileExt = request.getParameter("ext");
        System.out.println("originalFileName = " + originalFileName);
        String realFilename="";
        System.out.println(filename);
        
        String downloadFileName = URLEncoder.encode(originalFileName.substring(0, originalFileName.length() - fileExt.length() - 1));
        //String downloadFileName = originalFileName.substring(0, originalFileName.length() - fileExt.length() - 1);
        System.out.println(downloadFileName);
        
        try {
            String browser = request.getHeader("User-Agent");
            //파일 인코딩
            if (browser.contains("MSIE") || browser.contains("Trident")
                    || browser.contains("Chrome")) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
                        "%20");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
        } catch (UnsupportedEncodingException ex) {
            System.out.println("UnsupportedEncodingException");
        }
        
        realFilename = request.getServletContext().getRealPath("/upload") + filename;
        //realFilename = "C:\\Users\\장철현\\eclipse-workspace\\bumilBoard\\src\\main\\webapp\\upload\\" + filename;
        System.out.println(realFilename);
        File file1 = new File(realFilename);
        if (!file1.exists()) {
            return ;
        }
        
        // 파일명 지정
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=" + downloadFileName + "." + fileExt + ";");
        
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realFilename);

            int ncount = 0;
            byte[] bytes = new byte[512];

            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (Exception e) {
            System.out.println("FileNotFoundException : " + e);
        }
    }
}