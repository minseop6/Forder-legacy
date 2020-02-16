package com.ms.forder.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.forder.Domain.Orders;
import com.ms.forder.Domain.Product;

public interface OrdersRepository extends JpaRepository<Orders, Integer>{

	List<Orders> findByUno(int uno);
	List<Orders> findByUnoAndAlarmAndComplete(int uno, int alarm, int complete);
	List<Orders> findBySno(int sno);
}
