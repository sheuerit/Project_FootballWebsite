package com.koreaIT.vBlog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UsrCoinShopController {

	@RequestMapping("/usr/coinShop/list")
	public String coinShopList() {
		
		return "usr/coinShop/list";
	}
	
}