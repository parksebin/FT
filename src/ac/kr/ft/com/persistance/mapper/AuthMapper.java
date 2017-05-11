package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.UserDTO;
import config.Mapper;

@Mapper("AuthMapper")
public interface AuthMapper {

	List<UserDTO> getAuthList() throws Exception;

	int updateAuthOne(UserDTO userDTO) throws Exception;


}
