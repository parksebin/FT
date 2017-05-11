package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.FestivalDTO;
import ac.kr.ft.com.persistance.mapper.FestivalMapper;
import ac.kr.ft.com.service.IFestivalService;

@Service("FestivalService")
public class FestivalService implements IFestivalService{
	
	@Resource(name="FestivalMapper")
	private FestivalMapper festivalMapper;
	
	@Override
	public List<FestivalDTO> getFestList() throws Exception {
		return festivalMapper.getFestList(); 
	} 
	 
	@Override 
	public boolean createfestInfo(FestivalDTO festivalDTO) throws Exception{
		int a =festivalMapper.createfestInfo(festivalDTO);
		if(a != 0){
			return true;
		} 
		return false;
	}
	@Override
	public FestivalDTO getfestDetail(FestivalDTO festivalDTO) throws Exception{
		return festivalMapper.getfestDetail(festivalDTO);
	}
	@Override
	public boolean festupdateform(FestivalDTO festivalDTO) throws Exception{
		int a =festivalMapper.festupdateform(festivalDTO);
		if(a != 0){
			return true;
		}
		return false;
		}
	@Override
	public boolean deletefestInfo(FestivalDTO festivalDTO) throws Exception{
		int a =festivalMapper.deletefestInfo(festivalDTO);
		if(a != 0){
			return true;
		}
		return false;
	
	
	
	
	}

	@Override
	public FestivalDTO getBusiListAjax(FestivalDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		FestivalDTO rList = festivalMapper.getBusiList(pDTO);
		rList.seteList(festivalMapper.getBusiListAjax(pDTO));
		
		return rList;
	}

	@Override
	public FestivalDTO getbusiFestDetail(FestivalDTO festivalDTO) throws Exception {
		
		return festivalMapper.getbusiFestDetail(festivalDTO);
	}
}