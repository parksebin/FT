package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.ScheduleDTO;
import config.Mapper;

@Mapper("ScheduleMapper")
public interface ScheduleMapper {

	List<ScheduleDTO> getScheduleList(ScheduleDTO scheduleDto) throws Exception;
	
	int scheduleInsert(ScheduleDTO scheduleDto) throws Exception;

	ScheduleDTO getScheduleDetail(ScheduleDTO scheduleDto) throws Exception;

	int scheduleDelete(ScheduleDTO scheduleDto) throws Exception;

	int scheduleUpdateProc(ScheduleDTO scheduleDto) throws Exception;

	List<ScheduleDTO> getScheduleDateList(ScheduleDTO scheduleDto) throws Exception;

}
