package com.ms.forder.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.forder.Domain.User;
import com.ms.forder.Repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepo;
	
	public User user(String id) {
		
		return userRepo.findById(id);
	}
	
	public User user(int uno) {
		
		return userRepo.getOne(uno);
	}
	
	public boolean login(String id, String pw) {
		
		User user = userRepo.findById(id);
		if(user.getId().equals(id) && user.getPw().equals(pw)) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<User> allUser(){
		
		return userRepo.findAll();
	}
	
	public void signup(User user) {
		
		userRepo.save(user);
	}
}
