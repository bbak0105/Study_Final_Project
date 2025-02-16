package com.itwill.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.dto.Sales;
import com.itwill.service.SalesService;

//Tiles : 템플릿 사이트를 작성하기 위해 제공되는 프로그램
//=> Tiles 관련 라이브러리를 빌드 처리 후 사용 가능 - pom.xml
//=> 요청처리 메소드에서 반환되는 viewName을 Tiles로 응답 처리하도록 ViewResolver를 변경
//=> Tiles 환경설정 파일 작성 - tiles.xml
@Controller
public class TilesController {
	// 요청 페이지 없이 컨텍스트를 요청한 경우(=contextRoot)
	// => 흔히 Main페이지를 작성할때 사용한다(=메인페이지가 된다)
	// 로그인사용자 접근권한 등 필요한 작업을 작성
	
	@Autowired
	private SalesService salesService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String template(Model model) {
		model.addAttribute("nowMonth", salesService.getNowMonth());
		model.addAttribute("monthMax", salesService.getMonthMax());
		model.addAttribute("monthMin", salesService.getMonthMin());
		model.addAttribute("monthEntire", salesService.getMonthEntire());
		model.addAttribute("monthAvg", salesService.getMonthAvg());
		model.addAttribute("monthBest", salesService.getNowBest());
		model.addAttribute("totalOrder", salesService.getTotalOrder());
		model.addAttribute("totalRelout", salesService.getTotalRelout());
		
		//이번달 매출
		List<Sales> monthSales= salesService.getNowmonthSales();
		double nowMonthSales= monthSales.get(0).getNowmonthSales();
		
		//저번달 매출
		List<Sales> BmonthSales=salesService.getLastmonthSales();
		double lastMonthSaels=BmonthSales.get(0).getLastmonthSales();
		
		//전월 증감률
		double monthInc=(nowMonthSales-lastMonthSaels)/lastMonthSaels*100;
		int monthRealInc= (int) Math.ceil(monthInc);
		
		model.addAttribute("monthInc", monthRealInc);
		
		//이번분기 매출
		List<Sales> bungiSales=salesService.getNowbunSales();
		double nowBungiSales=bungiSales.get(0).getNowbunSales();
		
		//저번분기 매출
		List<Sales> BbungiSales=salesService.getLastbunSales();
		double lastBungiSales=BbungiSales.get(0).getLastbunSales();
		
		//분기 증감률
		double bungiInc=(nowBungiSales-lastBungiSales)/lastBungiSales*100;
		int bungiRealInc= (int) Math.ceil(bungiInc);
		
		model.addAttribute("bungiInc", bungiRealInc);
		
		//이번년도 매출
		List<Sales> yearSales=salesService.getNowyearSales();
		double nowYearSales=yearSales.get(0).getNowyearSales();
		
		//전년도 매출
		List<Sales> lastSales=salesService.getLastyearSales();
		double lastYearSales=lastSales.get(0).getLastyearSales();
		
		//전년 증감률
		double yearInc=(nowYearSales-lastYearSales)/lastYearSales*100;
		int yearRealInc= (int) Math.ceil(yearInc);
		
		model.addAttribute("yearInc", yearRealInc);
		
		return "main/main";
		//return "main_template";
	}

	// 주문관리
	@RequestMapping("/orderList")
	public String tiles1() {
		return "operation/orderList";
	}

	// 배송관리
	@RequestMapping("/deliveryList")
	public String tiles2() {
		return "operation/deliveryList";
	}

	// 상품관리
	@RequestMapping("/productList")
	public String tiles3() {
		return "operation/productList";
	}

	// 운송업체 관리
	@RequestMapping("/transportationList")
	public String tiles4() {
		return "operation/transportationList";
	}

	// 인사관리(휴가신청)
	@RequestMapping("/insertAuthorization")
	public String tiles5() {
		return "authorization/insertAuthorization";
	}

	// 인사관리(사원정보입력)
	@RequestMapping("/insertEmployee")
	public String tiles6() {
		return "humanresource/insertEmployee";
	}

	// 인사관리(급여입력)
	@RequestMapping("/insertSalary")
	public String tiles7() {
		return "humanresource/insertSalary";
	}

	// 회원관리(회원정보 리스트)
	@RequestMapping("/memberList")
	public String tiles8() {
		return "member/memberList";
	}

	// 큰태관리 리스트
	@RequestMapping("/attitudeList")
	public String tiles9() {
		return "humanresource/attitudeList";
	}

	// 사원관리 리스트
	@RequestMapping("/employeeList")
	public String tiles10() {
		return "humanresource/employeeList";
	}

	// 급여상세 리스트
	@RequestMapping("/salarydetailList")
	public String tiles11() {
		return "humanresource/salarydetailList";
	}

	// 급여관리 리스트
	@RequestMapping("/salaryList")
	public String tiles12() {
		return "humanresource/salaryList";
	}

	// 거래처관리 리스트
	@RequestMapping("/client")
	public String tiles13() {
		return "placeorder/client";
	}

	// 발주관리 리스트
	@RequestMapping("/placeorder")
	public String tiles14() {
		return "placeorder/placeorder";
	}

	// 일일매출
	@RequestMapping("/daySales")
	public String tiles15() {
		return "sales/daySales";
	}

	// 주간매출
	@RequestMapping("/weekSales")
	public String tiles16() {
		return "sales/weekSales";
	}

	// 월별매출
	@RequestMapping("/monthSales")
	public String tiles17() {
		return "sales/monthSales";
	}

	// 결제 요청 리스트
	@RequestMapping("/authorList")
	public String tiles18() {
		return "authorization/authorList";
	}

	// 결재 승인내역
	@RequestMapping("/approvalList")
	public String tiles19() {
		return "authorization/approvalList";
	}

	@RequestMapping("/login")
	public String tiles20() {
		return "login/login";
	}

	// 인사관리(사원정보상세)
	@RequestMapping("/viewEmployee")
	public String tiles21() {
		return "humanresource/viewEmployee";
	}

	// 결제괸리(결제상세)
	@RequestMapping("/viewAuthor")
	public String tiles22() {
		return "authorization/viewAuthor";
	}

	// 출퇴근
	@RequestMapping("/goWork")
	public String tiles23() {
		return "humanresource/goWork";
	}

	// 인사관리(발주신청)
	@RequestMapping("/insertAuthorization2")
	public String tiles24() {
		return "authorization/insertAuthorization2";
	}

	// 인사관리(발주신청)
	@RequestMapping("/insertSalaryList")
	public String tiles25() {
		return "humanresource/insertSalaryList";
	}

	// 인사관리(발주신청)
	@RequestMapping("/viewSalary")
	public String tiles26() {
		return "humanresource/viewSalary";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String tiles27() {
		return "login/login";
	}

	// 인사관리(사원정보상세)
	@RequestMapping("/viewEmployee2")
	public String tiles28() {
		return "humanresource/viewEmployee2";
	}

	/*
	 * // 인사관리(발주신청)
	 * 
	 * @RequestMapping("/error") public String tiles27() { return "error/error"; }
	 */
}
