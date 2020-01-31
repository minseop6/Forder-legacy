package com.ms.Vo;

import java.util.List;

import com.ms.forder.Domain.Order;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Purchase {

	private List<Order> purchase;
}
