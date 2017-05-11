package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.UserDTO;
import ac.kr.ft.com.persistance.mapper.UserMapper;
import ac.kr.ft.com.service.IUserService;
import ac.kr.ft.com.util.CmmUtil;

@Service("UserService")
public class UserService implements IUserService {

	@Resource(name = "UserMapper")
	private UserMapper usermapper;

	@Override
	public List<UserDTO> getUserList() throws Exception {
		return usermapper.getUserList();
		
		
	}

	@Override
	public UserDTO getUserDetail(UserDTO userDto) throws Exception {
		return usermapper.getUserDetail(userDto);
		
		
	}

	@Override
	public boolean createUserInfo(UserDTO userDto) throws Exception {
		
		//회원 번호가져오기
		UserDTO rDTO = usermapper.getUserNo(userDto);
		
		if (rDTO == null){
			rDTO = new UserDTO();
			
		}

		//위에서 받은 회원 번호를 전송할 DTO에 넣기 
		userDto.setUser_no(CmmUtil.nvl(rDTO.getUser_no()));
		
		//회원정보 저장하기
		int a = usermapper.createUserInfo(userDto);
		
		if (a != 0) {
			return true;
			
		}else{
			return false;
			
		}
	}

	@Override
	public boolean deleteUserInfo(UserDTO userDto) throws Exception {
		// TODO Auto-generated method stub
		int a = usermapper.deleteUserInfo(userDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateUserInfo(UserDTO userDto) throws Exception {
		// TODO Auto-generated method stub
		int a = usermapper.updateUserInfo(userDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public UserDTO getLogin(UserDTO loginDto) throws Exception {
		return usermapper.getLogin(loginDto);
	}
	
	@Override
	public UserDTO getappLogin(UserDTO loginDto) throws Exception {
		return usermapper.getappLogin(loginDto);
	}

	@Override
	public UserDTO getIdfind(UserDTO idfindDto) throws Exception {
		return usermapper.getIdfind(idfindDto);
	}

	@Override
	public UserDTO getpwfind(UserDTO pwfindDto) throws Exception {
		return usermapper.getpwfind(pwfindDto);
	}

	@Override
	public boolean getpwchange(UserDTO pwchangeDto) throws Exception {
		if (usermapper.getpwchange(pwchangeDto) != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public UserDTO getUserDupInfo(UserDTO checkDto) throws Exception {
		return usermapper.getUserDupInfo(checkDto);
	}

	@Override
	public boolean deleteAllUserInfo(UserDTO allcheckDto) throws Exception {
		// TODO Auto-generated method stub
		int a = usermapper.deleteAllUserInfo(allcheckDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public UserDTO getbusiUserList(UserDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		UserDTO rDTO = usermapper.getBusiListCnt(pDTO);
		//rDTO.setCnt(usermapper.getBusiListCnt(pDTO));
		System.out.println(rDTO.getCnt());
		rDTO.setrList(usermapper.getBusiList(pDTO));
		
		return rDTO;

	}



}
