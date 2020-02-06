package com.ms.forder.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.forder.Domain.Orders;
import com.ms.forder.Repository.OrdersRepository;

@Service
public class OrdersServices {

	@Autowired
	OrdersRepository ordersRepo;
	
	public void insertOrders(Orders info) {
		
		ordersRepo.saveAndFlush(info);
	}
	
	public List<Orders> userOrders(int uno){
		
		return ordersRepo.findByUno(uno);
	}
}
