package ac.kr.ft.com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ac.kr.ft.com.dto.FileDTO;
import ac.kr.ft.com.service.IFileService;
import ac.kr.ft.com.util.CmmUtil;
import ac.kr.ft.com.util.DateUtil;

@Controller
public class FileController {
	private Logger log = Logger.getLogger(this.getClass());
	private String FileSaveRootPath = "c:/SW_workspace/workspace/FT/WebContent"; //저장될 웹루트

	
	@Resource(name = "FileService")
	private IFileService fileService;
	
	
	/**
	 * 싱글 파일 업로드 팝업 창 보기 
	 * */
	@RequestMapping(value="file/FileUploadSingPOP")
	public String add(@RequestParam Map<String, Object> map, ModelMap model) {
		log.info("Welcome file/FileUploadSinglePOP !!"); 
		
		return "/file/FileUploadSinglePOP";
	}
	
	
	/**
	 * 파일 업로드 처리를 위한 처리 함수 
	 * */
	@RequestMapping(value="file/FileUploadProc", method=RequestMethod.POST)
	public String FileUploadProc(HttpServletRequest request, HttpSession session, @RequestParam("fileUpload") MultipartFile file, ModelMap model) throws Exception {

		String msg = ""; //결과 메시지 받기
		
		log.info("Welcome file/FileUploadProc !!"); 

		try{
			
			//파일 업로드 결과 시퀀스 전달 받은 input 객체
			String jObj = CmmUtil.nvl((String)request.getParameter("jObj"));
			
			//이미지 보여줄 객체
			String vObj = CmmUtil.nvl((String)request.getParameter("vObj"));
			
			String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"), "10000001"); //로그인된 사용자 아이디
			
			//파일 원본 이름 저장
			String fileOrgName = file.getOriginalFilename();
			
			//파일 저장되는 확장자 추출
			int pos = fileOrgName.lastIndexOf( "." ); //확장자 위치
			String ext = fileOrgName.substring( pos + 1 ).toLowerCase(); //확장자
			
			log.info("file ext : "+ ext);			
			
			//이미지 파일이 아니라면 에러 처리
			if (!(ext.equals("jpg")||ext.equals("jpeg")||ext.equals("png")||ext.equals("gif"))){
				 throw new Exception("이미지 파일이 아닙니다.");
				 
			}
			
			//저장될 파일 이름
			String fileSaveName = user_no +"_FILE_"+ DateUtil.getDate("yyyyMMddHHmmss") +"."+ ext;
			
			//저장 경로
			String savePath = "/upload/" + DateUtil.getTodayYYYY() + "/" + DateUtil.getTodayMM() + "/" + DateUtil.getTodayDD();
			
			log.info("jObj : "+ jObj);
			log.info("vObj : "+ vObj);
			log.info("user_no : "+ user_no);
			log.info("fileOrgName : "+ fileOrgName);
			log.info("ext : "+ ext);
			log.info("fileSaveName : "+ fileSaveName);
			log.info("savePath : "+ savePath);
			
			//실제 파일을 업로드하기 위한 파일 객체 생성
			File f = new File(FileSaveRootPath + savePath + "/"+ fileSaveName);
			
			//폴더가 없다면 폴더 생성
			if (!f.exists()) {
				f.mkdirs();
				
			}

			//파일 저장
			file.transferTo(f);

			/*
			 * DB처리
			 * */
			
			log.info("Start DB proc : file/FileUploadProc !!");
			
			//파일 시퀀스 가져오기
			FileDTO rDTO = fileService.getFileInfoSeq();
			
			if (rDTO == null){
				rDTO = new FileDTO(); 
			}
			
			String fileGRP = CmmUtil.nvl(rDTO.getFile_grp()); //파일 그룹 아이디
			
			log.info("fileGRP : "+ fileGRP);
			
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFile_org_name(fileOrgName); //파일 원래 이름
			fileDTO.setFile_save_name(fileSaveName); //저장된 파일 이름
			fileDTO.setFile_path(savePath); //저장 경로
			fileDTO.setReg_id(user_no); //회원번호
			fileDTO.setFile_grp(fileGRP);; //그룹 아이디
			
			//파일 정보 저장하기
			fileService.insertFileInfo(fileDTO);
			
			model.addAttribute("jObj", jObj); //fileGRP 객체
			model.addAttribute("fileGRP", fileGRP); //저장된 fileGRP 전달하기
			
			model.addAttribute("vObj", vObj); //이미지 보여줄 객체
			model.addAttribute("viewImgSRC", savePath + "/"+ fileSaveName); //보여줄 이미지 경로
			
			log.info("End file/FileUploadProc !!");

		} catch (IOException e) {
			log.info("ERROR IOException : "+ e.toString());
			msg = e.toString();
			
		} catch (Exception e) {
			log.info("ERROR Exception : "+ e.toString());
			msg = e.toString();
			
		}

		model.addAttribute("msg", msg); //메시지 보여주기
		
		return "/file/fileMsg";
	}
	
}
