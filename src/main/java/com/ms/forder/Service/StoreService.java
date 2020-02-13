package com.ms.forder.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.forder.Domain.Store;
import com.ms.forder.Repository.StoreRepository;

@Service
public class StoreService {

	@Autowired
	StoreRepository storeRepo;
	
	public List<Store> stores() {
		
		return storeRepo.findByStatus(1);
	}
	
	public Store storeInfo(int sno) {
		
		return storeRepo.getOne(sno);
	}
	
	public Store storeInfoByUno(int uno) {
		
		return storeRepo.findByUno(uno);
	}
}
