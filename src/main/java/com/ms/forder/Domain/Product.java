package com.ms.forder.Domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="product")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Getter
@Setter
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="pno")
	private Integer pno;
	
	@Column(name="sno")
	private Integer sno;
	
	@Column(name="pname")
	private String pname;
	
	@Column(name="price")
	private Integer price;
	
	@Column(name="image")
	private String image;
	
	@Column(name="stack")
	private Integer stack;
	
	@Column(name="status")
	private Integer status;
	
	@OneToMany(mappedBy="product")
	private List<Orders> orders = new ArrayList<Orders>();
}
