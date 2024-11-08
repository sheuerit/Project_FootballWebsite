package com.koreaIT.vBlog.service;

import org.springframework.stereotype.Service;

import com.koreaIT.vBlog.dao.RecommendPointDao;
import com.koreaIT.vBlog.vo.RecommendPoint;

@Service
public class RecommendPointService {
	
	private RecommendPointDao recommendPointDao;
	
	public RecommendPointService(RecommendPointDao recommendPointDao) {
		this.recommendPointDao = recommendPointDao;
	}

	public RecommendPoint getRecommendPoint(int loginedMemberId, String relTypeCode, int relId) {
		return recommendPointDao.getRecommendPoint(loginedMemberId, relTypeCode, relId);
	}
	
	public void insertPoint(int loginedMemberId, String relTypeCode, int relId) {
		recommendPointDao.insertPoint(loginedMemberId, relTypeCode, relId);
	}

	public void deletePoint(int loginedMemberId, String relTypeCode, int relId) {
		recommendPointDao.deletePoint(loginedMemberId, relTypeCode, relId);
	}
	
}