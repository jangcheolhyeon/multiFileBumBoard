package egovframework.bumilboard.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.bumilboard.sample.dao.LoginDao;

@Service
public class LoginService {
	@Autowired
	LoginDao loginDao;
	
	public int loginCheck(String password) {
		return loginDao.loginCheck(password);
	}
}
