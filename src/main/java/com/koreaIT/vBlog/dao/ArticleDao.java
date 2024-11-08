package com.koreaIT.vBlog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.koreaIT.vBlog.vo.Article;

@Mapper
public interface ArticleDao {
	
	@Insert("""
			INSERT INTO article
				SET regDate = NOW()
					, updateDate = NOW()
					, memberId = #{memberId}
					, title = #{title}
					, `body` = #{body}
			""")
	public void writeArticle(int memberId, String title, String body);
	
	@Select("""
			SELECT *
				FROM article
				WHERE id = #{id}
			""")
	public Article getArticleById(int id);
	
	@Update("""
			<script>
				UPDATE article
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
	public void modifyArticle(int id, String title, String body);
	
	@Delete("""
			DELETE FROM article
				WHERE id = #{id}
			""")
	public void deleteArticle(int id);

	@Select("""
			<script>
			SELECT A.*
					, M.nickname AS writerName
					, IFNULL(SUM(R.point), 0) AS `point`
				FROM article AS A
				INNER JOIN `member` AS M
				ON A.memberId = M.id
				LEFT JOIN recommendPoint AS R
				ON R.relTypeCode = 'article'
				AND A.id = R.relId
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
							OR body LIKE CONCAT('%', #{searchKeyword}, '%')
						</otherwise>
					</choose>
				</if>
				GROUP BY A.id
				ORDER BY A.id DESC
				LIMIT #{limitStart}, #{itemsInAPage}
			</script>
			""")
	public List<Article> getArticles(String searchKeywordType, String searchKeyword, int limitStart, int itemsInAPage);

	@Select("""
			SELECT LAST_INSERT_ID();
			""")
	public int getLastInsertId();

	@Select("""
			SELECT A.*
					, M.nickname AS writerName
					, IFNULL(SUM(R.point), 0) AS `point`
				FROM article AS A
				INNER JOIN `member` AS M
				ON A.memberId = M.id
				LEFT JOIN recommendPoint AS R
				ON R.relTypeCode = 'article'
				AND A.id = R.relId
				WHERE A.id = #{id}
				GROUP BY A.id
			""")
	public Article forPrintArticle(int id);

	@Select("""
			<script>
			SELECT COUNT(*)
				FROM article
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
							OR body LIKE CONCAT('%', #{searchKeyword}, '%')
						</otherwise>
					</choose>
				</if>
			</script>
			""")
	public int getArticlesCnt(String searchKeywordType, String searchKeyword);

	@Update("""
			UPDATE article
				SET hitCnt = hitCnt + 1
				WHERE id = #{id}
			""")
	public void increaseHitCnt(int id);
}