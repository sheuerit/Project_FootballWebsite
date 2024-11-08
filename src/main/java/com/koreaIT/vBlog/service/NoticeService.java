package com.koreaIT.vBlog.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.koreaIT.vBlog.dao.NoticeDao;
import com.koreaIT.vBlog.vo.Notice;

@Service
public class NoticeService {
	
	private NoticeDao noticeDao;
	
	public NoticeService(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	
	public void writeNotice(int memberId, String title, String body) {
		noticeDao.writeNotice(memberId, title, body);
	}
	
	public Notice getNoticeById(int id) {
		return noticeDao.getNoticeById(id);
	}
	
	public void modifyNotice(int id, String title, String body) {
		noticeDao.modifyNotice(id, title, body);
	}
	
	public void deleteNotice(int id) {
		noticeDao.deleteNotice(id);
	}

	public List<Notice> getNotices(String searchKeywordType, String searchKeyword, int limitStart, int itemsInAPage) {
		return noticeDao.getNotices(searchKeywordType, searchKeyword, limitStart, itemsInAPage);
	}

	public int getLastInsertId() {
		return noticeDao.getLastInsertId();
	}

	public Notice forPrintNotice(int id) {
		return noticeDao.forPrintNotice(id);
	}

	public int getNoticesCnt(String searchKeywordType, String searchKeyword) {
		return noticeDao.getNoticesCnt(searchKeywordType, searchKeyword);
	}

	public void increaseHitCnt(int id) {
		noticeDao.increaseHitCnt(id);
	}
}