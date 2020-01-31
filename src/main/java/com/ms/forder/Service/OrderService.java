package com.ms.forder.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.forder.Repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	OrderRepository OrderRepo;
}
