package ac.kr.ft.com.persistance.mapper;

import ac.kr.ft.com.dto.PositionDTO;
import config.Mapper;

@Mapper("PositionMapper")
public interface PositionMapper {

	int positionUpdate(PositionDTO positionDto) throws Exception;

	PositionDTO getPosition() throws Exception;

}
