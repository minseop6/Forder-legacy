package com.ms.forder.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.forder.Domain.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	List<Product> findBysnoAndStatus(int sno, int state);
	List<Product> findBysno(int sno);
}
