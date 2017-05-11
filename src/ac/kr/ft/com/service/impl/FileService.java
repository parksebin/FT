package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.FileDTO;
import ac.kr.ft.com.persistance.mapper.FileMapper;
import ac.kr.ft.com.service.IFileService;

@Service("FileService")
public class FileService implements IFileService{
	
	@Resource(name="FileMapper")
	private FileMapper fileMapper;
	
	@Override
	public List<FileDTO> getFileInfoList(FileDTO fileDTO) throws Exception{
		return fileMapper.getFileInfoList(fileDTO);
	}
	
	@Override
	public FileDTO getFileInfo(FileDTO fileDTO) throws Exception{
		return fileMapper.getFileInfo(fileDTO);
		
	}
	
	@Override
	public FileDTO getFileInfoSeq() throws Exception{
		return fileMapper.getFileInfoSeq();
		
	}
	
	@Override
	public void insertFileInfo(FileDTO fileDTO) throws Exception{
		fileMapper.insertFileInfo(fileDTO);
	}
	
	@Override
	public void DeleteFileInfoALL(FileDTO fileDTO) throws Exception{
		fileMapper.DeleteFileInfoALL(fileDTO);
	}
	
	@Override
	public void DeleteFileInfo(FileDTO fileDTO) throws Exception{
		fileMapper.DeleteFileInfo(fileDTO);
	}
	
	
}
