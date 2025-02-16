package com.itwill.service;

import java.util.List;

import com.itwill.dto.Order;
import com.itwill.dto.Product;

public interface OrderService {
	List<Order> getOrderList();
	List<Order> getOrderNoList(String orderNo);
	List<Order> getOrderPersonList(String person);
	List<Order> getOrderProductNameList(String productName);
	List<Order> getOrderDateList(String orderDate);
	
	//��������
	List<Order> getDynamicOrderList(Order order);
	Order getOrderDetail(String orderNo);
	
	List<Product> getProductList();
}
