package com.ms.forder.Domain;

import java.time.LocalDateTime;

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
@Table(name="review")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Getter
@Setter
public class Review {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="uno")
	private int uno;
	
	@Column(name="sno")
	private int sno;
	
	@Column(name="content")
	private int content;
	
	@Column(name="image")
	private int image;
	
	@Column(name="rtime", updatable=false)
	private int rtime;
}
