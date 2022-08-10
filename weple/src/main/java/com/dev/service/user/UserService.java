package com.dev.service.user;

import java.util.List;

import com.dev.dao.UserDAO;
import com.dev.vo.Addr;
import com.dev.vo.User;

public class UserService {
	private static UserService instance = new UserService();
	UserDAO dao = new UserDAO();
	private UserService() {}
	public static UserService getInstance() {
		return instance;
	}
	//배송지조회
	public List<Addr> addressList(String userId) {
		return dao.getAdrList(userId);
	}
	
	//배송지추가
	public void modifyAddress(Addr vo) {
		dao.updateAddress(vo);
	}
	
	//아이디찾기
	public User findingId(String name) {
		return dao.findId(name);
	}
	  
	//회원가입
	public void addUser(User vo) {
		dao.insertUser(vo);
	}
	

	//id로 유저정보 가져오기
	public User getUserInfo(String id) {
		return dao.searchUser(id);
	}
    
	//회원정보수정
	public void modifyUser(User vo) {
		dao.updateUser(vo);
	}
	
	//회원탈퇴
	public void dropUser(String id, String pw) {
		dao.deleteUser(id, pw);
	}

}
