package com.ms.forder.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.forder.Domain.User;
import com.ms.forder.Repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepo;
	
	public boolean login(String id, String pw) {
		
		User user = userRepo.findById(id);
		if(user.getId().equals(id) && user.getPw().equals(pw)) {
			return true;
		} else {
			return false;
		}
	}
}
