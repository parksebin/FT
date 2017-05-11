package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.UserDTO;
import ac.kr.ft.com.persistance.mapper.AuthMapper;
import ac.kr.ft.com.service.IAuthService;

@Service("AuthService")
public class AuthService implements IAuthService{

	@Resource(name="AuthMapper")
	private AuthMapper authMapper;
	
	@Override
	public List<UserDTO> getAuthList() throws Exception{
		List<UserDTO> list = authMapper.getAuthList();
		return list;
	}

	@Override
	public boolean updateAuthOne(UserDTO userDTO) throws Exception {
		if(authMapper.updateAuthOne(userDTO) != 0){
			return true;
		}else{
			return false;
		}
	}

}
