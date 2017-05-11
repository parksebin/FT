package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.UserDTO;

public interface IAuthService {

	List<UserDTO> getAuthList() throws Exception;

	boolean updateAuthOne(UserDTO userDTO) throws Exception;

}
