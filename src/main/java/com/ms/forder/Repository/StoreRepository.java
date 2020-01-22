package com.ms.forder.Repository;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ms.forder.Domain.Store;

public interface StoreRepository extends JpaRepository<Store, Integer>{

}
