package com.koreaIT.vBlog.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.vBlog.service.NoticeService;
import com.koreaIT.vBlog.util.Util;
import com.koreaIT.vBlog.vo.Notice;
import com.koreaIT.vBlog.vo.Rq;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdmNoticeController {

	private NoticeService noticeService;
	private Rq rq;

	public AdmNoticeController(NoticeService noticeService, Rq rq) {
		this.noticeService = noticeService;
		this.rq = rq;
	}

	@RequestMapping("/usr/notice/write")
	public String write() {
		return "usr/notice/write";
	}

	@RequestMapping("/usr/notice/doWrite")
	@ResponseBody
	public String doWrite(String title, String body, int boardId) {

		if (Util.empty(title)) {
			return Util.jsHistoryBack("제목을 입력해주세요");
		}

		if (Util.empty(body)) {
			return Util.jsHistoryBack("내용을 입력해주세요");
		}

		noticeService.writeNotice(rq.getLoginedMemberId(), title, body);

		int id = noticeService.getLastInsertId();

		return Util.jsReplace(Util.f("%d번 게시물을 생성했습니다", id), Util.f("detail?id=%d", id));
	}

	@RequestMapping("/usr/notice/list")
	public String showList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword) {

		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다");
		}

		int noticesCnt = noticeService.getNoticesCnt(searchKeywordType, searchKeyword);

		int itemsInAPage = 10;

		int limitStart = (page - 1) * itemsInAPage;

		int pagesCnt = (int) Math.ceil((double) noticesCnt / itemsInAPage);

		List<Notice> notices = noticeService.getNotices(searchKeywordType, searchKeyword, limitStart, itemsInAPage);

		int from = ((page - 1) / itemsInAPage) * itemsInAPage + 1;
		int end = (((page - 1) / itemsInAPage) + 1) * itemsInAPage;

		if (end > pagesCnt) {
			end = pagesCnt;
		}

		model.addAttribute("notices", notices);
		model.addAttribute("noticesCnt", noticesCnt);
		model.addAttribute("page", page);
		model.addAttribute("pagesCnt", pagesCnt);
		model.addAttribute("from", from);
		model.addAttribute("end", end);
		model.addAttribute("searchKeywordType", searchKeywordType);
		model.addAttribute("searchKeyword", searchKeyword);

		return "usr/notice/list";
	}

	@RequestMapping("/usr/notice/detail")
	public String showDetail(HttpServletRequest req, HttpServletResponse resp, Model model, int id) {
		
		if (noticeService.getNoticeById(id) == null) {
			return rq.jsReturnOnView(Util.f("%d번 게시물은 존재하지 않습니다", id));
		}
		
		Cookie oldCookie = null;
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("hitCnt")) {
					oldCookie = cookie;
				}
			}
		}
		
		if (oldCookie != null) {
			if (oldCookie.getValue().contains("[" + id + "]") == false) {
				noticeService.increaseHitCnt(id);
				oldCookie.setValue(oldCookie.getValue() + "_[" + id + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(10);
				resp.addCookie(oldCookie);
			}
		} else {
			noticeService.increaseHitCnt(id);
			Cookie newCookie = new Cookie("hitCnt", "[" + id + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(10);
			resp.addCookie(newCookie);
		}
		
		Notice notice = noticeService.forPrintNotice(id);
		
		model.addAttribute("notice", notice);

		return "usr/notice/detail";
	}

	@RequestMapping("/usr/notice/modify")
	public String modify(Model model, int id) {

		Notice notice = noticeService.forPrintNotice(id);

		if (notice == null) {
			return rq.jsReturnOnView(Util.f("%d번 게시물은 존재하지 않습니다", id));
		}

		if (rq.getLoginedMemberId() != notice.getMemberId()) {
			return rq.jsReturnOnView("해당 게시물에 대한 권한이 없습니다");
		}

		model.addAttribute("notice", notice);

		return "usr/notice/modify";
	}

	@RequestMapping("/usr/notice/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {

		Notice notice = noticeService.getNoticeById(id);

		if (notice == null) {
			return Util.jsHistoryBack(Util.f("%d번 게시물은 존재하지 않습니다", id));
		}

		if (notice.getMemberId() != rq.getLoginedMemberId()) {
			return Util.jsHistoryBack("해당 게시물에 대한 권한이 없습니다");
		}

		noticeService.modifyNotice(id, title, body);

		return Util.jsReplace(Util.f("%d번 게시물을 수정했습니다", id), Util.f("detail?id=%d", id));
	}

	@RequestMapping("/usr/notice/doDelete")
	@ResponseBody
	public String doDelete(int id) {

		Notice notice = noticeService.getNoticeById(id);

		if (notice == null) {
			return Util.jsHistoryBack(Util.f("%d번 게시물은 존재하지 않습니다", id));
		}

		if (notice.getMemberId() != rq.getLoginedMemberId()) {
			return Util.jsHistoryBack("해당 게시물에 대한 권한이 없습니다");
		}

		noticeService.deleteNotice(id);

		return Util.jsReplace(Util.f("%d번 게시물을 삭제했습니다", id), "list");
	}
}