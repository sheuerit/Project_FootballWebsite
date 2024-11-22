package com.koreaIT.vBlog.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.koreaIT.vBlog.vo.PresentPoint;

@Mapper
public interface PresentPointDao {
	
	@Select("""
			SELECT *
				FROM presentPoint
				WHERE memberId = #{loginedMemberId}
				AND relTypeCode = #{relTypeCode}
			""")
	public PresentPoint getPresentPoint(int loginedMemberId, String relTypeCode);
	
	@Insert("""
			INSERT INTO presentPoint
				SET memberId = #{loginedMemberId}
					, relTypeCode = #{relTypeCode}
					, `point` = 20
			""")
	public void insertPoint(int loginedMemberId, String relTypeCode);

}