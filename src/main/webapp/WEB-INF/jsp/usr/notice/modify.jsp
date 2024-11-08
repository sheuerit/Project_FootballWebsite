<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/toastUiEditorLib.jsp" %>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doModify" method="post" onsubmit="submitForm(this); return false;">
				<input name="id" type="hidden" value="${notice.id }" />
				<input name="body" type="hidden"/>
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
							<th>작성자</th>
							<td>${notice.writerName }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input class="input input-bordered input-info w-9/12" name="title" type="text" value="${notice.title }" placeholder="제목을 입력해주세요" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<div class="toast-ui-editor">
									<script type="text/x-template">${notice.body }</script>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center" colspan="2"><button class="btn btn-wide btn-outline btn-sm">수정</button></td>
						</tr>
					</table>
				</div>
			</form>
			
			<div class="mt-2">
				<button class="btn btn-outline btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
	
<%@ include file="../common/footer.jsp" %>