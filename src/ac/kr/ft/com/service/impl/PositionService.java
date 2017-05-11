package ac.kr.ft.com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.PositionDTO;
import ac.kr.ft.com.persistance.mapper.PositionMapper;
import ac.kr.ft.com.service.IPositionService;

@Service("PositionService")
public class PositionService implements IPositionService {

	@Resource(name = "PositionMapper")
	private PositionMapper positionMapper;

	@Override
	public boolean positionUpdate(PositionDTO positionDto) throws Exception{
		if (positionMapper.positionUpdate(positionDto) != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PositionDTO getPosition() throws Exception {
		return positionMapper.getPosition();
	}
}
