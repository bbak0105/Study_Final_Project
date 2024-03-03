package com.itwill.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.dto.Member;
import com.itwill.service.MemberService;


//@Controller : Controller Ŭ������ Spring Bean���� ����ϱ� ���� ������̼�
//=> Ŭ���̾�Ʈ ��û�� ���� ó�� ����� �����޾� ���
//@Controller ������̼��� Spring Container�� ���� ó���ǵ��� ����
//=> Bean Configuration File(servlet-context.xml)���� component-scan ������Ʈ�� ���� 
//Controller Ŭ������ @RequestMapping ������̼��� ����Ͽ� ��� ��û ó��
//�޼ҵ��� ��û URL �ּ� �պκп� ���������� ���ԵǴ� ���ڿ� ���� ����
@Controller
public class MemberController {
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   //Service ���� Ŭ������ ��ϵ� Spring Bean�� �ʵ忡 ������ ó���Ͽ� ����
   // => Controller Ŭ������ �޼ҵ忡�� Service ��ü�� �޼ҵ� ȣ��
   @Autowired
   private MemberService memberservice;
   
      
   @RequestMapping(value = "/memberList", method = RequestMethod.GET)
   public String display(Model model) {
      logger.info("memberList �޼ҵ� ȣ��");
      model.addAttribute("memberList", memberservice.getMemberList());
      return "member/memberList";
   }
	@RequestMapping(value="/member_search", method = RequestMethod.GET)
	public String member_search(@ModelAttribute Member member , Model model) {
		
		model.addAttribute("memberList", memberservice.getDynamicMemberList(member));
		return "member/memberList";
	}
   


}