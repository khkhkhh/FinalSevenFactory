package com.koreait.sevenfactory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SevenFactoryController {
	
	// 단순 홈페이지 이동

	@RequestMapping("hotelInfo")
	public String goHotelInfo() {
		return "hotelInfo";
	}
	@RequestMapping("reservation")
	public String goReservation() {
		return "reservation/bookableList";
	}
	@RequestMapping("findReservationNumber")
	public String gofindReservationNumber() {
		return "reservation/findReservationNumber";
	}

	
}
