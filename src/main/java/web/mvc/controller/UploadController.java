package web.mvc.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web.mvc.dto.UploadDTO;

@Controller
@RequestMapping("/gallery")
public class UploadController {

	@RequestMapping("/upload")
	public String upload2(UploadDTO upload ,  HttpSession session){
		String saveDir = session.getServletContext().getRealPath("/save/gallery");
		String originalFileName= upload.getFile().getOriginalFilename();
		upload.setFileName(originalFileName);
		upload.setFileSize(upload.getFile().getSize());
		
		try {
			upload.getFile().transferTo(new File(saveDir+"/"+originalFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "info/gallery";
	}
	
	
	/**
	 * �ٿ�ε� �׸�������
	 * */
	@RequestMapping("/downList")
	public ModelAndView downList(HttpSession session ) {
		String path =session.getServletContext().getRealPath("/save/gallery");
		File file = new File(path);
		String fileNames [] =file.list();
		
		return new ModelAndView("info/gallery", "fileNames" ,fileNames);
	}
	
	/**
	 * �ٿ�ε��ϱ�
	 * */
	@RequestMapping("/down")
	public ModelAndView down(String fileName,HttpSession session) {
		String path = session.getServletContext().getRealPath("/save/gallery");
		
		return new ModelAndView("downLoadView","fname", new File(path+"/"+fileName) );
	}
	
	
	
	
}
