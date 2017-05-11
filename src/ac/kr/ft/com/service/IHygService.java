package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.HygDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;

public interface IHygService {
	List<HygDTO> getHYGList() throws Exception;

	HygDTO getHYGDetail(HygDTO hygDto)throws Exception;

	boolean createHYGInfo(HygDTO hygDto)throws Exception;

	boolean deleteHYGInfo(HygDTO hygDto)throws Exception;

	boolean updateHYGInfo(HygDTO hygDto)throws Exception;
	
	boolean deleteAllCheckList(HygDTO hygDto) throws Exception;
	
}



