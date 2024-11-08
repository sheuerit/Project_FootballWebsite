package com.koreaIT.vBlog.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.koreaIT.vBlog.dao.ArticleDao;
import com.koreaIT.vBlog.vo.Article;

@Service
public class ArticleService {
	
	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
	public void writeArticle(int memberId, String title, String body) {
		articleDao.writeArticle(memberId, title, body);
	}
	
	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}
	
	public void modifyArticle(int id, String title, String body) {
		articleDao.modifyArticle(id, title, body);
	}
	
	public void deleteArticle(int id) {
		articleDao.deleteArticle(id);
	}

	public List<Article> getArticles(String searchKeywordType, String searchKeyword, int limitStart, int itemsInAPage) {
		return articleDao.getArticles(searchKeywordType, searchKeyword, limitStart, itemsInAPage);
	}

	public int getLastInsertId() {
		return articleDao.getLastInsertId();
	}

	public Article forPrintArticle(int id) {
		return articleDao.forPrintArticle(id);
	}

	public int getArticlesCnt(String searchKeywordType, String searchKeyword) {
		return articleDao.getArticlesCnt(searchKeywordType, searchKeyword);
	}

	public void increaseHitCnt(int id) {
		articleDao.increaseHitCnt(id);
	}
}