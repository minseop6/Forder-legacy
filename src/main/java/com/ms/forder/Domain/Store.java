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
	@Column(name="sno")
	private Integer sno;
	
	@Column(name="uno", updatable=false)
	private Integer uno;
	
	@Column(name="name")
	private String name;
	
	@Column(name="lat", updatable=false)
	private double lat;
	
	@Column(name="lng", updatable=false)
	private double lng;
	
	@Column(name="category")
	private String category;
	
	@Column(name="status", columnDefinition = "integer default 1")
	private Integer status;
}
