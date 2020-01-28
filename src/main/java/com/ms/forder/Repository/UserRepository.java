package com.ms.forder.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.forder.Domain.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	User findById(String id);
	
}
