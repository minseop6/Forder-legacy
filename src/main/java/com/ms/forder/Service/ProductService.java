package com.ms.forder.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.forder.Domain.Product;
import com.ms.forder.Repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	ProductRepository productRepo;
	
	public Product product(int pno) {
		
		return productRepo.getOne(pno);
	}
	
	public List<Product> storeAllProduct(int sno) {
		
		return productRepo.findBysno(sno);
	}
	
	public List<Product> storeProduct(int sno){
		
		return productRepo.findBysnoAndStatus(sno, 1);
	}
	
	public void addProduct(Product product) {
		
		productRepo.save(product);
	}
}
