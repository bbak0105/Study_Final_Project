package com.itwill.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.dto.Sales;
import com.itwill.service.SalesService;

@Controller
public class SalesController {
	private static final Logger logger = LoggerFactory.getLogger(SalesController.class);

	@Autowired
	private SalesService salesService;
	
	//주간검색
	@RequestMapping(value = "/weekSales", method = RequestMethod.GET)
	public String displayWeek(Model model ) {
		logger.info("selectWeekList 메소드 호출");
		model.addAttribute("weekList", salesService.getWeekList());
		logger.info("selectWeekMax 메소드 호출");
		model.addAttribute("weekMax", salesService.getWeekMax());
		logger.info("selectWeekMin 메소드 호출");
		model.addAttribute("weekMin", salesService.getWeekMin());
		logger.info("selectWeekEntire 메소드 호출");
		model.addAttribute("weekEntire", salesService.getWeekEntire());
		logger.info("selectWeekAvg 메소드 호출");
		model.addAttribute("weekAvg", salesService.getWeekAvg());
		return "sales/weekSales";
	}
	
	//월 검색
	@RequestMapping(value = "/monthSales", method = RequestMethod.GET)
	public String display(Model model) {
		logger.info("selectMonthList 메소드 호출");
		model.addAttribute("monthList", salesService.getMonthList());
		logger.info("selectMonthMax 메소드 호출");
		model.addAttribute("monthMax", salesService.getMonthMax());
		logger.info("selectMonthMin 메소드 호출");
		model.addAttribute("monthMin", salesService.getMonthMin());
		logger.info("selectMonthEntire 메소드 호출");
		model.addAttribute("monthEntire", salesService.getMonthEntire());
		logger.info("selectMonthAvg 메소드 호출");
		model.addAttribute("monthAvg", salesService.getMonthAvg());
		return "sales/monthSales";
	}
	
	//기간 검색
	@RequestMapping(value = "/month_dateList", method = RequestMethod.GET)
	public String getDateList(@ModelAttribute Sales sales, Model model) {
		String realDateST = "";
		String realdDateED ="";
		
		if (sales.getStartDate() == "" || sales.getStartDate() == null) {
			SimpleDateFormat pattern = new SimpleDateFormat("yyyy-MM-dd");
			Date now = new Date();

			realDateST = pattern.format(now);

		} else {

			String[] splitDate = sales.getStartDate().split("/");
			String dd = splitDate[0];
			String mm = splitDate[1];
			String yyyy = splitDate[2];
	
			// StartDate
			realDateST = yyyy + "-" + mm + "-" + dd;
			sales.setStartDate(realDateST);
		
		}

		if(sales.getEndDate() == "" || sales.getEndDate() == null) {
			SimpleDateFormat pattern = new SimpleDateFormat("yyyy-MM-dd");
			Date now = new Date();
			
			realdDateED = pattern.format(now);
		} else {
			
			String[] splitDate2 = sales.getEndDate().split("/");
			String DD = splitDate2[0];
			String MM = splitDate2[1];
			String YYYY = splitDate2[2];
	
			// endDate
			realdDateED = YYYY + "-" + MM + "-" + DD;
			sales.setEndDate(realdDateED);
		
		}
		
		model.addAttribute("termList", salesService.getTermList(sales));
		logger.info("selectBestItem 메소드 호출");
		model.addAttribute("termBest", salesService.getBestItem(sales));
		logger.info("selectWorstIme 메소드 호출");
		model.addAttribute("termWorst", salesService.getWorstIme(sales));
		logger.info("selectTermTotal 메소드 호출");
		model.addAttribute("termTotal", salesService.getTermTotal(sales));
		logger.info("selectTermAvg 메소드 호출");
		model.addAttribute("termAvg", salesService.getTermAvg(sales));
		
		return "sales/daySales";
	}
	
}
