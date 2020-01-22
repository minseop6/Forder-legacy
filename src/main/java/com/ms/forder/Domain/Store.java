package com.ms.forder.Domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="store")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Getter
@Setter
public class Store {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="s_no")
	private Integer s_no;
	
	@Column(name="u_no")
	private Integer u_no;
	
	@Column(name="lat")
	private double lat;
	
	@Column(name="lng")
	private double lng;
	
	@Column(name="category")
	private String category;
	
}