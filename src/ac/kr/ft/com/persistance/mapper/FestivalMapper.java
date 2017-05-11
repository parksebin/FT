package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.FestivalDTO;
import config.Mapper;

@Mapper("FestivalMapper")
public interface FestivalMapper {
 
	List<FestivalDTO> getFestList() throws Exception;

	FestivalDTO getBusiList(FestivalDTO festivalDto) throws Exception;

	List<FestivalDTO> getBusiListAjax(FestivalDTO pDTO) throws Exception;
	
	int createfestInfo(FestivalDTO festivalDTO) throws Exception;

	void insertFest01(FestivalDTO festivalDTO) throws Exception;
	 
	void insertFestt02(FestivalDTO festivalDTO) throws Exception;
	
	FestivalDTO getfestDetail(FestivalDTO festivalDTO) throws Exception;
	
	FestivalDTO getbusiFestDetail(FestivalDTO festivalDTO) throws Exception;
	
	int festupdateform (FestivalDTO festivalDTO ) throws Exception;
	
	int deletefestInfo (FestivalDTO festivalDTO) throws Exception;

}