package com.itwill.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.dto.Transport;
import com.itwill.service.ProductService;
import com.itwill.service.TransportService;

@Controller
public class TransportController {
	
	@Autowired
	private TransportService transportService;
	
	@RequestMapping(value="/transportationList", method=RequestMethod.GET)
	public String transport(Model model) {
		model.addAttribute("transportList", transportService.getTransprotList());
		return "operation/transportationList";
	}
	
	@RequestMapping(value="/transport_search", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> transport_search(@ModelAttribute Transport transport) {
		//model.addAttribute("transportList", transportService.getDynamicTransprotList(transport));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tpList", transportService.getDynamicTransprotList(transport));
		return map;
				//"operation/transportationList";
	}
	
	//�ߺ��˻縦 ���� ��û�޼ҵ�	
	@RequestMapping(value="/transport_doubleCheck/{tpNo}", method = RequestMethod.GET)
	@ResponseBody
	public String transport_doubleCheck(@PathVariable String tpNo) {
		Transport tmp = transportService.getTransprotDoubleCheck(tpNo);
		if(tmp == null) {			
			return "success";//�˻��� ����� ���� = ���ߺ�
		}else
			return "fail";
	}
	
	@RequestMapping(value="/transport_insert", method = RequestMethod.POST)
	@ResponseBody
	public String transport_insert(@RequestBody Transport transport) {
		Transport temp = new Transport();
		temp.setTpNo(transport.getTpNo());
		temp.setTpName(transport.getTpName());
		temp.setTpPhone(transport.getTpPhone());
		transportService.addTransport(temp);
		System.out.println(transport.getTpNo());
		return "success";		
	}
	
	//��� ���� �˻��ϴ� �޼ҵ�
	@RequestMapping(value="/transport_all", method = RequestMethod.GET)
	@ResponseBody
	public List<Transport> allList(){
		return transportService.getTransprotList();
	}

	
	/*
	@RequestMapping(value="/transport_doubleCheck", method=RequestMethod.GET)
	public String transport_doubleCheck(@ModelAttribute Transport transport, Model model) {
		Transport temp_tp = transportService.getTransprotDoubleCheck(transport.getTpNo());
		if(temp_tp.getTpNo() != null || temp_tp.getTpNo() != "") {
			model.addAttribute("message", "�̹� �����ϴ� ��۾�ü�ڵ� �Դϴ�. �ٸ� �ڵ带 �Է����ּ���");
		}
		model.addAttribute("message", "��밡���� ��۾�ü�ڵ��Դϴ�.");
		
		return "operation/transportationList";
	}
	*/
	
}