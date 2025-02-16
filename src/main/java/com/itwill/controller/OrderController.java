package com.itwill.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
//Controller 클래스 : 클라이언트의 요청을 처리하기 위한 기능을 제공하는 클래스
//=> Service 클래스의 메소드를 호출하여 클라이언트의 요청 처리
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.dto.Order;
import com.itwill.service.OrderService;

//@Controller : Controller 클래스를 Spring Bean으로 등록하기 위한 어노테이션
//=> 클라이언트 요청에 대한 처리 기능을 제공받아 사용
//@Controller 어노테이션이 Spring Container에 의해 처리되도록 설정
//=> Bean Configuration File(servlet-context.xml)에서 component-scan 엘리먼트로 설정 
//Controller 클래스에 @RequestMapping 어노테이션을 사용하여 모든 요청 처리
//메소드의 요청 URL 주소 앞부분에 공통적으로 포함되는 문자열 설정 가능
@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	// Service 관련 클래스로 등록된 Spring Bean을 필드에 인젝션 처리하여 저장
	// => Controller 클래스의 메소드에서 Service 객체의 메소드 호출
	@Autowired
	private OrderService orderService;
	
/*
	@RequestMapping(value="/orderList")
	@ResponseBody
	public Order showList() {
		return orderService.getOrderList().get(0);
	}
*/
	
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String display(Model model) {
		//logger.info("orderlist 메소드 호출");
		model.addAttribute("orderList", orderService.getOrderList());
		model.addAttribute("productList", orderService.getProductList());
		return "operation/orderList";
	}

	//insert할때
	/*
	@RequestMapping(value = "/orderList", method = RequestMethod.POST)
	public String display(@RequestParam(value="order_no") String no, Model model) {
		//model.addAttribute("orderNo", order.getOrderNo());
		logger.info("orderlist 메소드 호출");
		System.out.println("========================" + no);
		model.addAttribute("orderList",orderService.getOrderNoList(no));
		 
		return "operation/orderList"; 
	} */
	/*
	@RequestMapping(value = "/orderList", method = RequestMethod.POST)
	public String display(@ModelAttribute Order order, Model model) {
		//model.addAttribute("orderNo", order.getOrderNo());
		logger.info("orderlist 메소드 호출");
		System.out.println("========================" + order.getOrderNo());
		
		model.addAttribute("orderList",orderService.getOrderNoList(order.getOrderNo()));		 
		//model.addAttribute("orderList",orderService.getOrderPersonList(order.get);		 
		model.addAttribute("orderList",orderService.getOrderProductNameList(order.getOrderProduct()));		 
		model.addAttribute("orderList",orderService.getOrderDateList(order.getOrderDate()));		 
		return "operation/orderList"; 
	}
	*/
	
	@RequestMapping(value = "/orderList", method = RequestMethod.POST)
	public String display(@ModelAttribute Order order, Model model) {		
		if(order.getOrderDate()!=null || !order.getOrderDate().equals("")) {
			order.setOrderDate(order.getOrderDate().replace('-', '/'));
		}
		model.addAttribute("orderList", orderService.getDynamicOrderList(order));		 
		return "operation/orderList"; 
	}
	
	@RequestMapping(value="/order_detail/{orderNo}",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> detailOrder(@PathVariable String orderNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderDetail",orderService.getOrderDetail(orderNo));
		return map;
	}
}
