package com.koreaIT.vBlog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.koreaIT.vBlog.vo.Notice;

@Mapper
public interface NoticeDao {
	
	@Insert("""
			INSERT INTO notice
				SET regDate = NOW()
					, updateDate = NOW()
					, memberId = #{memberId}
					, title = #{title}
					, `body` = #{body}
			""")
	public void writeNotice(int memberId, String title, String body);
	
	@Select("""
			SELECT *
				FROM notice
				WHERE id = #{id}
			""")
	public Notice getNoticeById(int id);
	
	@Update("""
			<script>
				UPDATE notice
					SET updateDate = NOW()
						<if test="title != null and title != ''">
							, title = #{title}
						</if>
						<if test="body != null and body != ''">
							, `body` = #{body}
						</if>
					WHERE id = #{id}
			</script>
			""")
	public void modifyNotice(int id, String title, String body);
	
	@Delete("""
			DELETE FROM notice
				WHERE id = #{id}
			""")
	public void deleteNotice(int id);

	@Select("""
			<script>
			SELECT N.*
					, M.nickname AS writerName
					, IFNULL(SUM(R.point), 0) AS `point`
				FROM notice AS N
				INNER JOIN `member` AS M
				ON N.memberId = M.id
				LEFT JOIN recommendPoint AS R
				ON R.relTypeCode = 'notice'
				AND N.id = R.relId
				<if test="searchKeyword != ''">
					<choose>
						<when test="searchKeywordType == 'title'">
							WHERE title LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordType == 'body'">
							WHERE body LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<otherwise>
							WHERE title LIKE CONCAT('%', #{searchKeyword}, '%')
							OR N.body LIKE CONCAT('%', #{searchKeyword}, '%')
						</otherwise>
					</choose>
				</if>
				GROUP BY N.id
				ORDER BY N.id DESC
				LIMIT #{limitStart}, #{itemsInAPage}
			</script>
			""")
	public List<Notice> getNotices(String searchKeywordType, String searchKeyword, int limitStart, int itemsInAPage);

	@Select("""
			SELECT LAST_INSERT_ID();
			""")
	public int getLastInsertId();

	@Select("""
			SELECT N.*
					, M.nickname AS writerName
					, IFNULL(SUM(R.point), 0) AS `point`
				FROM notice AS N
				INNER JOIN `member` AS M
				ON N.memberId = M.id
				LEFT JOIN recommendPoint AS R
				ON R.relTypeCode = 'notice'
				AND N.id = R.relId
				WHERE N.id = #{id}
				GROUP BY N.id
			""")
	public Notice forPrintNotice(int id);

	@Select("""
			<script>
			SELECT COUNT(*)
				FROM notice
				<if test="searchKeyword != ''">
					<choose>
						<when test="searchKeywordType == 'title'">
							WHERE title LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordType == 'body'">
							WHERE `body` LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<otherwise>
							WHERE title LIKE CONCAT('%', #{searchKeyword}, '%')
							OR `body` LIKE CONCAT('%', #{searchKeyword}, '%')
						</otherwise>
					</choose>
				</if>
			</script>
			""")
	public int getNoticesCnt(String searchKeywordType, String searchKeyword);

	@Update("""
			UPDATE notice
				SET hitCnt = hitCnt + 1
				WHERE id = #{id}
			""")
	public void increaseHitCnt(int id);
}