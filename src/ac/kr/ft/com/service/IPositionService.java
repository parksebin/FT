package ac.kr.ft.com.service;

import ac.kr.ft.com.dto.PositionDTO;

public interface IPositionService {

	boolean positionUpdate(PositionDTO positionDto) throws Exception;

	PositionDTO getPosition() throws Exception;

}
