<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/toastUiEditorLib.jsp" %>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3 border-bottom-line pb-8">
			<div>
				<table class="table table-lg">
					<tr>
						<th>번호</th>
						<td>${notice.id }</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${notice.regDate }</td>
					</tr>
					<tr>
						<th>수정일</th>
						<td>${notice.updateDate }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${notice.hitCnt }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${notice.writerName }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${notice.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div class="toast-ui-viewer">
								<script type="text/x-template">${notice.body }</script>
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="mt-2">
				<button class="btn btn-outline btn-sm" onclick="history.back();">뒤로가기</button>
				
				<c:if test="${rq.loginedMemberId == 1 }">
					<a class="btn btn-outline btn-sm" href="modify?id=${notice.id }">수정</a>
					<a class="btn btn-outline btn-sm" href="doDelete?id=${notice.id }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
				</c:if>
			</div>
		</div>
	</section>
	
<%@ include file="../common/footer.jsp" %>