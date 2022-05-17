package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.model.page.HomePage;
import com.laptrinhjavaweb.model.response.TurnoverResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {

	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping(value = "/quan-tri/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/home");
		HomePage homePage = new HomePage();
		homePage.setTotalUser(restTemplate.getForObject("/api/user/count", Long.class));
		homePage.setTotalProductSize(restTemplate.getForObject("/api/product/count", Long.class));
		homePage.setTotalOrder(restTemplate.getForObject("/api/orders/count", Long.class));
		Date date = new Date();
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		homePage.setTurnoverResponse(restTemplate.getForObject("/api/orders/turnover/{month}", TurnoverResponse.class, String.valueOf(localDate.getMonthValue())));
		homePage.setTotalTotalOrderByDay(restTemplate.getForObject("/api/orders/total/{day}", Integer.class, String.valueOf(localDate.getDayOfMonth())));
		mav.addObject("homePage",homePage);
		return mav;
	}
}
