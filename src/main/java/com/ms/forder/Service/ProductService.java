package com.ms.forder.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ms.forder.Domain.Product;
import com.ms.forder.Repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	ProductRepository productRepo;
	
	public List<Product> storeProduct(int sno){
		
		return productRepo.findBysno(sno);
	}
}
