package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.FileDTO;

public interface IFileService {
	
	List<FileDTO> getFileInfoList(FileDTO fileDTO) throws Exception;
	
	FileDTO getFileInfo(FileDTO fileDTO) throws Exception;
	
	FileDTO getFileInfoSeq() throws Exception;
	
	void insertFileInfo(FileDTO fileDTO) throws Exception;
	
	void DeleteFileInfoALL(FileDTO fileDTO) throws Exception;
	
	void DeleteFileInfo(FileDTO fileDTO) throws Exception;	

}
