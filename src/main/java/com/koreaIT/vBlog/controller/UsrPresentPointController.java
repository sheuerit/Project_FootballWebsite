package com.koreaIT.vBlog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.vBlog.service.PresentPointService;
import com.koreaIT.vBlog.util.Util;
import com.koreaIT.vBlog.vo.PresentPoint;
import com.koreaIT.vBlog.vo.ResultData;
import com.koreaIT.vBlog.vo.Rq;

@Controller
public class UsrPresentPointController {

	private PresentPointService presentPointService;
	private Rq rq;

	public UsrPresentPointController(PresentPointService presentPointService, Rq rq) {
		this.presentPointService = presentPointService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/presentPoint/getPresentPoint")
	@ResponseBody
	public ResultData<PresentPoint> getPresentPoint(String relTypeCode) {
		PresentPoint presentPoint = presentPointService.getPresentPoint(rq.getLoginedMemberId(), relTypeCode);
		
		if (presentPoint == null) {
			return ResultData.from("F-1", "출석 기록 없음");
		}
		
		return ResultData.from("S-1", "출석 조회", presentPoint);
	}
	
	@RequestMapping("/usr/presentPoint/doPresentPoint")
	@ResponseBody
	public String insertPoint(String relTypeCode, boolean presentBtn) {
		
		presentPointService.insertPoint(rq.getLoginedMemberId(), relTypeCode);
		
		return Util.jsHistoryBack(Util.f("출석 확인"));
	}
	
}