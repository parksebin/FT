package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.FestivalDTO;
import ac.kr.ft.com.persistance.mapper.RankMapper;
import ac.kr.ft.com.service.IRankService;

@Service("RankService")
public class RankService implements IRankService {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name="RankMapper")
	private RankMapper rankMapper;
	
	@Override
	public List<FestivalDTO> getRankList(FestivalDTO festivalDto) throws Exception{
		
		log.info("rankservice implements!!!");
		log.info("rankservice implements!!!");
		
		return rankMapper.getRankList(festivalDto);
	}
	
	@Override
	public FestivalDTO getBusiRankList(FestivalDTO festivalDto) throws Exception {
				
		FestivalDTO rDTO = rankMapper.getBusiRankListCnt(festivalDto);
		log.info("rankservice CNTCNTCNTCNTCNTCNTCNTCNTCNT!!!");

		rDTO.seteList(rankMapper.getBusiRankList(festivalDto));
		log.info("rankservice LISTLISTLISTLISTLISTLISTLI!!!");

		
		return rDTO;
	}


/*	@Override
	public List<FestivalDTO> getRankList2() throws Exception{
		return rankMapper.getRankList2();
	}
	
	@Override
	public List<FestivalDTO> getRankList3() throws Exception{
		return rankMapper.getRankList3();
	}
	
	@Override
	public List<FestivalDTO> getRankList4() throws Exception{
		return rankMapper.getRankList4();
	}
/* 

	@Override
	public CtrDTO getJYDetail(CtrDTO ctrDto) {
		return ctrMapper.getJYDetail(ctrDto);
	}

	@Override
	public boolean createJYInfo(CtrDTO ctrDto) {
		int a =ctrMapper.createJYInfo(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteJYInfo(CtrDTO ctrDto) {
		int a = ctrMapper.deleteJYInfo(ctrDto); 
		if(a !=0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateJYInfo(CtrDTO ctrDto) {
		int a =ctrMapper.updateJYInfo(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	} */
}
