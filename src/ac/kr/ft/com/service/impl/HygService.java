package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.HygDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import ac.kr.ft.com.persistance.mapper.HygMapper;
import ac.kr.ft.com.service.IHygService;

@Service("HygService")
public class HygService implements IHygService {

	@Resource(name="HygMapper")
	private HygMapper hygMapper;
	
	@Override
	public List<HygDTO> getHYGList()throws Exception{
		return hygMapper.getHYGList();
	}


	@Override
	public HygDTO getHYGDetail(HygDTO hygDto)throws Exception {
		return hygMapper.getHYGDetail(hygDto);
	}

	@Override
	public boolean createHYGInfo(HygDTO hygDto)throws Exception {
		int a =hygMapper.createHYGInfo(hygDto);
		if(a != 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteHYGInfo(HygDTO hygDto)throws Exception {
		int a = hygMapper.deleteHYGInfo(hygDto); 
		if(a !=0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateHYGInfo(HygDTO hygDto)throws Exception {
		int a =hygMapper.updateHYGInfo(hygDto);
		if(a != 0){
			return true;
		}
		return false;
	}


	@Override
	public boolean deleteAllCheckList(HygDTO hygDto) throws Exception {
		int a =hygMapper.deleteAllCheckList(hygDto);
		if(a != 0){
			return true;
		}
		return false;
	}
}
