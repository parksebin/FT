package ac.kr.ft.com.service;

import java.util.List;


import ac.kr.ft.com.dto.UserDTO;

public interface IUserService {
	List<UserDTO> getUserList() throws Exception;

	UserDTO getUserDetail(UserDTO userDto) throws Exception;
	
	boolean createUserInfo(UserDTO userDto) throws Exception;

	boolean deleteUserInfo(UserDTO userDto) throws Exception;

	boolean updateUserInfo(UserDTO userDto) throws Exception;

	UserDTO getLogin(UserDTO loginDto) throws Exception;

	UserDTO getappLogin(UserDTO loginDto) throws Exception;
	
	UserDTO getIdfind(UserDTO idfindDto) throws Exception;

	UserDTO getpwfind(UserDTO pwfindDto) throws Exception;

	boolean getpwchange(UserDTO pwchangeDto) throws Exception;
	
	UserDTO getUserDupInfo(UserDTO checkDto) throws Exception;

	boolean deleteAllUserInfo(UserDTO allcheckDto) throws Exception;

	UserDTO getbusiUserList(UserDTO pDTO)  throws Exception;


 
	

	

}
