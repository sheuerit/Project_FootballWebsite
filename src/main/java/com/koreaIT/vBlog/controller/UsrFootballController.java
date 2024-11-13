package com.koreaIT.vBlog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrFootballController {

	@RequestMapping("/usr/league/uefaChampionsLeague")
	public String uefaChampionsLeague() {
		return "usr/league/uefaChampionsLeague";
	}
	
	@RequestMapping("/usr/league/uefaEuropaLeague")
	public String uefaEuropaLeague() {
		return "usr/league/uefaEuropaLeague";
	}
	
	@RequestMapping("/usr/league/premierLeague")
	public String premierLeague() {
		return "usr/league/premierLeague";
	}
	
	@RequestMapping("/usr/league/laLiga")
	public String laLiga() {
		return "usr/league/laLiga";
	}
	
	@RequestMapping("/usr/league/bundesliga")
	public String bundesliga() {
		return "usr/league/bundesliga";
	}
	
	@RequestMapping("/usr/league/serieA")
	public String serieA() {
		return "usr/league/serieA";
	}
	
	@RequestMapping("/usr/league/ligue1")
	public String ligue1() {
		return "usr/league/ligue1";
	}
	
	@RequestMapping("/usr/league/kLeague1")
	public String kLeague1() {
		return "usr/league/kLeague1";
	}
}