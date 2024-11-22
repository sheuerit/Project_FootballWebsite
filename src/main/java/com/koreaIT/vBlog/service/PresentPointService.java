package com.koreaIT.vBlog.service;

import org.springframework.stereotype.Service;

import com.koreaIT.vBlog.dao.PresentPointDao;
import com.koreaIT.vBlog.vo.PresentPoint;

@Service
public class PresentPointService {
	
	private PresentPointDao presentPointDao;
	
	public PresentPointService(PresentPointDao presentPointDao) {
		this.presentPointDao = presentPointDao;
	}

	public PresentPoint getPresentPoint(int loginedMemberId, String relTypeCode) {
		return presentPointDao.getPresentPoint(loginedMemberId, relTypeCode);
	}
	
	public void insertPoint(int loginedMemberId, String relTypeCode) {
		presentPointDao.insertPoint(loginedMemberId, relTypeCode);
	}

}