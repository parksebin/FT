package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.ScheduleDTO;

public interface IScheduleService {

	boolean scheduleInsert(ScheduleDTO scheduleDto) throws Exception;

	List<ScheduleDTO> getScheduleList(ScheduleDTO scheduleDto) throws Exception;

	ScheduleDTO getScheduleDetail(ScheduleDTO scheduleDto) throws Exception;

	boolean scheduleDelete(ScheduleDTO scheduleDto) throws Exception;

	boolean scheduleUpdateProc(ScheduleDTO scheduleDto) throws Exception;

	List<ScheduleDTO> getScheduleDateList(ScheduleDTO scheduleDto) throws Exception;

}
