package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.ScheduleDTO;
import ac.kr.ft.com.persistance.mapper.FestivalMapper;
import ac.kr.ft.com.persistance.mapper.ScheduleMapper;
import ac.kr.ft.com.service.IScheduleService;

@Service("ScheduleService")
public class ScheduleService implements IScheduleService{
	
	@Resource(name="ScheduleMapper")
	private ScheduleMapper scheduleMapper;

	@Override
	public List<ScheduleDTO> getScheduleList(ScheduleDTO scheduleDto) throws Exception{
		return scheduleMapper.getScheduleList(scheduleDto);
	}
	
	@Override
	public boolean scheduleInsert(ScheduleDTO scheduleDto) throws Exception{
		if(scheduleMapper.scheduleInsert(scheduleDto)!=0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public ScheduleDTO getScheduleDetail(ScheduleDTO scheduleDto) throws Exception{
		return scheduleMapper.getScheduleDetail(scheduleDto);
	}

	@Override
	public boolean scheduleDelete(ScheduleDTO scheduleDto) throws Exception{
		if(scheduleMapper.scheduleDelete(scheduleDto)!=0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean scheduleUpdateProc(ScheduleDTO scheduleDto) throws Exception{
		if(scheduleMapper.scheduleUpdateProc(scheduleDto)!=0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<ScheduleDTO> getScheduleDateList(ScheduleDTO scheduleDto) throws Exception {
		return scheduleMapper.getScheduleDateList(scheduleDto);
	}
}
