package com.ms.forder.Domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="orders")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Getter
@Setter
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ono")
	private Integer ono;
	
	@Column(name="uno")
	private int uno;
	
	@Column(name="pno")
	private int pno;
	
	@CreationTimestamp
	@Column(name="otime", updatable=false)
	private LocalDateTime otime;
	
	@Column(name="amount")
	private int amount;
	
	@Column(name="alarm")
	private int alarm;
	
	@Column(name="complete")
	private int complete;
	
}

