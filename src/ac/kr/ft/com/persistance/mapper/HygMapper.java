package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import javax.xml.soap.Detail;

import ac.kr.ft.com.dto.HygDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import config.Mapper;
//기존 ICtrDao와 같음

@Mapper("HygMapper")
public interface HygMapper {
//	@Autowired
//	private SqlSessionTctrlate sqlSession;
//	private final String NS = "ac.kr.ft.com.persistance.sqlmap.ComSqlMap.";
	
	List<HygDTO> getHYGList();

	HygDTO getHYGDetail(HygDTO hygDto);

	int createHYGInfo(HygDTO hygDto);

	int deleteHYGInfo(HygDTO hygDto);

	int updateHYGInfo(HygDTO hygDto);

	int deleteAllCheckList(HygDTO hygDto);

}

