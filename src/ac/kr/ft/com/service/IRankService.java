package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.FestivalDTO;

public interface IRankService {
	
	List<FestivalDTO> getRankList(FestivalDTO festivalDto) throws Exception;
/*	List<FestivalDTO> getRankList2() throws Exception;

	List<FestivalDTO> getRankList3() throws Exception;

	List<FestivalDTO> getRankList4() throws Exception;
	

*/
	FestivalDTO getBusiRankList(FestivalDTO festivalDto) throws Exception;

}
