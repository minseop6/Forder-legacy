package com.ms.forder.Domain;

import java.time.LocalDateTime;
import java.util.List;

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
@Table(name="product")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Getter
@Setter
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ono")
	private int ono;
	
	@Column(name="pno")
	private int pno;
	
	@Column(name="otime", updatable=false)
	private LocalDateTime otime;
	
	@Column(name="amount")
	private int amount;
	
	@Column(name="status")
	private int status;
}
