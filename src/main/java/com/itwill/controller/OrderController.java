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
//Controller Ŭ���� : Ŭ���̾�Ʈ�� ��û�� ó���ϱ� ���� ����� �����ϴ� Ŭ����
//=> Service Ŭ������ �޼ҵ带 ȣ���Ͽ� Ŭ���̾�Ʈ�� ��û ó��
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.dto.Order;
import com.itwill.service.OrderService;

//@Controller : Controller Ŭ������ Spring Bean���� ����ϱ� ���� ������̼�
//=> Ŭ���̾�Ʈ ��û�� ���� ó�� ����� �����޾� ���
//@Controller ������̼��� Spring Container�� ���� ó���ǵ��� ����
//=> Bean Configuration File(servlet-context.xml)���� component-scan ������Ʈ�� ���� 
//Controller Ŭ������ @RequestMapping ������̼��� ����Ͽ� ��� ��û ó��
//�޼ҵ��� ��û URL �ּ� �պκп� ���������� ���ԵǴ� ���ڿ� ���� ����
@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	// Service ���� Ŭ������ ��ϵ� Spring Bean�� �ʵ忡 ������ ó���Ͽ� ����
	// => Controller Ŭ������ �޼ҵ忡�� Service ��ü�� �޼ҵ� ȣ��
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
		//logger.info("orderlist �޼ҵ� ȣ��");
		model.addAttribute("orderList", orderService.getOrderList());
		model.addAttribute("productList", orderService.getProductList());
		return "operation/orderList";
	}

	//insert�Ҷ�
	/*
	@RequestMapping(value = "/orderList", method = RequestMethod.POST)
	public String display(@RequestParam(value="order_no") String no, Model model) {
		//model.addAttribute("orderNo", order.getOrderNo());
		logger.info("orderlist �޼ҵ� ȣ��");
		System.out.println("========================" + no);
		model.addAttribute("orderList",orderService.getOrderNoList(no));
		 
		return "operation/orderList"; 
	} */
	/*
	@RequestMapping(value = "/orderList", method = RequestMethod.POST)
	public String display(@ModelAttribute Order order, Model model) {
		//model.addAttribute("orderNo", order.getOrderNo());
		logger.info("orderlist �޼ҵ� ȣ��");
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