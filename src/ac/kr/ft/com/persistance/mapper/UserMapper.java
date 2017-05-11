package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.UserDTO;
import config.Mapper;

@Mapper("UserMapper")
public interface UserMapper {

	List<UserDTO> getUserList() throws Exception;

	UserDTO getUserNo(UserDTO userDto) throws Exception;

	UserDTO getUserDetail(UserDTO userDto) throws Exception;

	int createUserInfo(UserDTO userDto) throws Exception;

	int deleteUserInfo(UserDTO userDto) throws Exception;

	int updateUserInfo(UserDTO userDto) throws Exception;

	UserDTO getLogin(UserDTO loginDto) throws Exception;

	UserDTO getappLogin(UserDTO loginDto) throws Exception;

	UserDTO getIdfind(UserDTO idfindDto) throws Exception;

	UserDTO getpwfind(UserDTO pwfindDto) throws Exception;

	int getpwchange(UserDTO pwchangeDto) throws Exception;

	UserDTO getUserDupInfo(UserDTO checkDto) throws Exception;

	int deleteAllUserInfo(UserDTO allcheckDto) throws Exception;

	List<UserDTO> getBusiList(UserDTO eventDto) throws Exception;

	// 게시판 리스트 크기 가져오기
	UserDTO getBusiListCnt(UserDTO eventDto) throws Exception;

}