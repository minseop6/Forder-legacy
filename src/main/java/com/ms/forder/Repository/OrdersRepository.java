package com.ms.forder.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.forder.Domain.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer>{

	List<Orders> findByUno(int uno);
}
