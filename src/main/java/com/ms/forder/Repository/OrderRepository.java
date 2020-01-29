package com.ms.forder.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.forder.Domain.Store;

public interface OrderRepository extends JpaRepository<Store, Integer>{

}
