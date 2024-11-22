package com.koreaIT.vBlog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.koreaIT.vBlog.vo.Member;

@Mapper
public interface MemberDao {
	
	@Insert("""
			INSERT INTO `member`
				SET regDate = NOW()
					, updateDate = NOW()
					, loginId = #{loginId}
					, loginPw = #{loginPw}
					, `name` = #{name}
					, nickname = #{nickname}
					, cellphoneNum = #{cellphoneNum}
					, email = #{email}
			""")
	public void joinMember(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);
	
	@Select("""
			SELECT *
				FROM `member`
				WHERE id = #{id}
			""")
	public Member getMemberById(int id);

	@Select("""
			SELECT *
				FROM `member`
				WHERE loginId = #{loginId}
			""")
	public Member getMemberByLoginId(String loginId);
	
	@Update("""
			UPDATE `member`
				SET updateDate = NOW()
					, `name` = #{name}
					, nickname = #{nickname}
					, cellphoneNum = #{cellphoneNum}
					, email = #{email}
				WHERE id = #{id}
			""")
	public void doModify(int id, String name, String nickname, String cellphoneNum, String email);

	@Update("""
			UPDATE `member`
				SET updateDate = NOW()
					, loginPw = #{loginPw}
				WHERE id = #{id}
			""")
	public void doPasswordModify(int id, String loginPw);

	@Select("""
			SELECT *
				FROM `member`
				WHERE `name` = #{name}
				AND email = #{email}
				AND cellphoneNum = #{cellphoneNum}
			""")
	public Member getMemberByNameAndEmailAndCell(String name, String email, String cellphoneNum);
	
	@Select("""
			<script>
			SELECT COUNT(*)
				FROM `member`
				WHERE 1 = 1
				<if test="authLevel != 0">
					AND authLevel = #{authLevel}
				</if>
				<if test="searchKeyword != ''">
					<choose>
						<when test="searchKeywordType == 'loginId'">
							AND loginId LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordType == 'name'">
							AND name LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordType == 'nickname'">
							AND nickname LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<otherwise>
							AND (
								loginId LIKE CONCAT('%', #{searchKeyword}, '%')
								OR name LIKE CONCAT('%', #{searchKeyword}, '%')
								OR nickname LIKE CONCAT('%', #{searchKeyword}, '%')
							)
						</otherwise>
					</choose>
				</if>
			</script>
			""")
	public int getMembersCnt(String authLevel, String searchKeywordType, String searchKeyword);

	@Select("""
			<script>
			SELECT *
				FROM `member`
				WHERE 1 = 1
				<if test="authLevel != 0">
					AND authLevel = #{authLevel}
				</if>
				<if test="searchKeyword != ''">
					<choose>
						<when test="searchKeywordType == 'loginId'">
							AND loginId LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordType == 'name'">
							AND name LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordType == 'nickname'">
							AND nickname LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<otherwise>
							AND (
								loginId LIKE CONCAT('%', #{searchKeyword}, '%')
								OR name LIKE CONCAT('%', #{searchKeyword}, '%')
								OR nickname LIKE CONCAT('%', #{searchKeyword}, '%')
							)
						</otherwise>
					</choose>
				</if>
				ORDER BY id DESC
				LIMIT #{limitStart}, #{itemsInAPage}
			</script>
			""")
	public List<Member> getMembers(String authLevel, String searchKeywordType, String searchKeyword, int limitStart,
			int itemsInAPage);

	@Update("""
			<script>
			UPDATE `member`
				<set>
					updateDate = NOW(),
					delStatus = 1,
					delDate = NOW()
				</set>
				WHERE id = #{id}
			</script>
			""")
	public void deleteMember(int id);

	@Update("""
			UPDATE `member`
				SET coin = coin + #{coin}
				WHERE id = #{id}
			""")
	public void doPresentCheck(int id, int coin);

}