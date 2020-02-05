package com.ms.forder.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.forder.Domain.Orders;
import com.ms.forder.Repository.OrdersRepository;

@Service
public class OrderServices {

	@Autowired
	OrdersRepository orderRepo;
	
	public void insertOrder(Orders info) {
		
		orderRepo.saveAndFlush(info);
	}
	
//	public List<Order> alarmOrder(){
//		
//	}
}
