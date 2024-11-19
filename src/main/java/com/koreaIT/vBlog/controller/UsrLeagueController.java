package com.koreaIT.vBlog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UsrLeagueController {

	public String fixtureId;
	
	@RequestMapping("/usr/uefa/uefaChampionsLeague")
	public String uefaChampionsLeague() {
		
		return "usr/uefa/uefaChampionsLeague";
	}
	
	@RequestMapping("/usr/uefa/uefaEuropaLeague")
	public String uefaEuropaLeague() {
		
		return "usr/uefa/uefaEuropaLeague";
	}
	
	@RequestMapping("/usr/uefa/uefaMatchDetail")
	public String showUefaMatchDetail(Model model, String id) {
		
		fixtureId = id;
		
		model.addAttribute("fixtureId", fixtureId);
		
		return "usr/uefa/uefaMatchDetail";
	}
	
	@RequestMapping("/usr/england/premierLeague")
	public String premierLeague() {
		
		return "usr/england/premierLeague";
	}
	
	@RequestMapping("/usr/england/premierLeagueMatchDetail")
	public String showPremierLeagueMatchDetail(Model model, String id) {
		
		fixtureId = id;
		
		model.addAttribute("fixtureId", fixtureId);
		
		return "usr/england/premierLeagueMatchDetail";
	}
	
	@RequestMapping("/usr/spain/laLiga")
	public String laLiga() {
		return "usr/spain/laLiga";
	}
	
	@RequestMapping("/usr/spain/laLigaMatchDetail")
	public String showLaLigaMatchDetail(Model model, String id) {
		
		fixtureId = id;
		
		model.addAttribute("fixtureId", fixtureId);
		
		return "usr/spain/laLigaMatchDetail";
	}
	
	@RequestMapping("/usr/german/bundesliga")
	public String bundesliga() {
		return "usr/german/bundesliga";
	}
	
	@RequestMapping("/usr/german/bundesligaMatchDetail")
	public String showBundesligaMatchDetail(Model model, String id) {
		
		fixtureId = id;
		
		model.addAttribute("fixtureId", fixtureId);
		
		return "usr/german/bundesligaMatchDetail";
	}
	
	@RequestMapping("/usr/italy/serieA")
	public String serieA() {
		return "usr/italy/serieA";
	}
	
	@RequestMapping("/usr/italy/serieAMatchDetail")
	public String showSerieAMatchDetail(Model model, String id) {
		
		fixtureId = id;
		
		model.addAttribute("fixtureId", fixtureId);
		
		return "usr/italy/serieAMatchDetail";
	}
	
	@RequestMapping("/usr/france/ligue1")
	public String ligue1() {
		return "usr/france/ligue1";
	}
	
	@RequestMapping("/usr/france/ligue1MatchDetail")
	public String showLigue1MatchDetail(Model model, String id) {
		
		fixtureId = id;
		
		model.addAttribute("fixtureId", fixtureId);
		
		return "usr/france/ligue1MatchDetail";
	}
	
	@RequestMapping("/usr/korea/kLeague1")
	public String kLeague1() {
		return "usr/korea/kLeague1";
	}
	
	@RequestMapping("/usr/korea/kLeague1MatchDetail")
	public String showKLeague1MatchDetail(Model model, String id) {
		
		fixtureId = id;
		
		model.addAttribute("fixtureId", fixtureId);
		
		return "usr/korea/kLeague1MatchDetail";
	}
	
}