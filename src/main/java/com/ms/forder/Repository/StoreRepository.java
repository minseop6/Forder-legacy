package com.ms.forder.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.forder.Domain.Store;

public interface StoreRepository extends JpaRepository<Store, Integer>{

	Store findByUno(int uno);
	List<Store> findByStatus(int status);
}
