package com.koreaIT.vBlog.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.vBlog.service.ArticleService;
import com.koreaIT.vBlog.service.ReplyService;
import com.koreaIT.vBlog.util.Util;
import com.koreaIT.vBlog.vo.Article;
import com.koreaIT.vBlog.vo.Reply;
import com.koreaIT.vBlog.vo.Rq;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class UsrArticleController {

	private ArticleService articleService;
	private ReplyService replyService;
	private Rq rq;

	public UsrArticleController(ArticleService articleService, ReplyService replyService, Rq rq) {
		this.articleService = articleService;
		this.replyService = replyService;
		this.rq = rq;
	}

	@RequestMapping("/usr/article/write")
	public String write() {
		return "usr/article/write";
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(String title, String body) {

		if (Util.empty(title)) {
			return Util.jsHistoryBack("제목을 입력해주세요");
		}

		if (Util.empty(body)) {
			return Util.jsHistoryBack("내용을 입력해주세요");
		}

		articleService.writeArticle(rq.getLoginedMemberId(), title, body);

		int id = articleService.getLastInsertId();

		return Util.jsReplace(Util.f("%d번 게시물을 생성했습니다", id), Util.f("detail?id=%d", id));
	}

	@RequestMapping("/usr/article/list")
	public String showList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword) {

		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다");
		}

		int articlesCnt = articleService.getArticlesCnt(searchKeywordType, searchKeyword);

		int itemsInAPage = 10;

		int limitStart = (page - 1) * itemsInAPage;

		int pagesCnt = (int) Math.ceil((double) articlesCnt / itemsInAPage);

		List<Article> articles = articleService.getArticles(searchKeywordType, searchKeyword, limitStart, itemsInAPage);

		int from = ((page - 1) / itemsInAPage) * itemsInAPage + 1;
		int end = (((page - 1) / itemsInAPage) + 1) * itemsInAPage;

		if (end > pagesCnt) {
			end = pagesCnt;
		}

		model.addAttribute("articles", articles);
		model.addAttribute("articlesCnt", articlesCnt);
		model.addAttribute("page", page);
		model.addAttribute("pagesCnt", pagesCnt);
		model.addAttribute("from", from);
		model.addAttribute("end", end);
		model.addAttribute("searchKeywordType", searchKeywordType);
		model.addAttribute("searchKeyword", searchKeyword);

		return "usr/article/list";
	}

	@RequestMapping("/usr/article/detail")
	public String showDetail(HttpServletRequest req, HttpServletResponse resp, Model model, int id) {
		
		if (articleService.getArticleById(id) == null) {
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
				articleService.increaseHitCnt(id);
				oldCookie.setValue(oldCookie.getValue() + "_[" + id + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(10);
				resp.addCookie(oldCookie);
			}
		} else {
			articleService.increaseHitCnt(id);
			Cookie newCookie = new Cookie("hitCnt", "[" + id + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(10);
			resp.addCookie(newCookie);
		}
		
		Article article = articleService.forPrintArticle(id);
		
		List<Reply> replies = replyService.getReplies("article", id);
		
		model.addAttribute("article", article);
		model.addAttribute("replies", replies);

		return "usr/article/detail";
	}

	@RequestMapping("/usr/article/modify")
	public String modify(Model model, int id) {

		Article article = articleService.forPrintArticle(id);

		if (article == null) {
			return rq.jsReturnOnView(Util.f("%d번 게시물은 존재하지 않습니다", id));
		}

		if (rq.getLoginedMemberId() != article.getMemberId()) {
			return rq.jsReturnOnView("해당 게시물에 대한 권한이 없습니다");
		}

		model.addAttribute("article", article);

		return "usr/article/modify";
	}

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return Util.jsHistoryBack(Util.f("%d번 게시물은 존재하지 않습니다", id));
		}

		if (article.getMemberId() != rq.getLoginedMemberId()) {
			return Util.jsHistoryBack("해당 게시물에 대한 권한이 없습니다");
		}

		articleService.modifyArticle(id, title, body);

		return Util.jsReplace(Util.f("%d번 게시물을 수정했습니다", id), Util.f("detail?id=%d", id));
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(int id) {

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return Util.jsHistoryBack(Util.f("%d번 게시물은 존재하지 않습니다", id));
		}

		if (article.getMemberId() != rq.getLoginedMemberId()) {
			return Util.jsHistoryBack("해당 게시물에 대한 권한이 없습니다");
		}

		articleService.deleteArticle(id);

		return Util.jsReplace(Util.f("%d번 게시물을 삭제했습니다", id), "list");
	}
}