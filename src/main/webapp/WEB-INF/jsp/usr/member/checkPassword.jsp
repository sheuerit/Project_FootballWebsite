<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- checkPassword.jsp 안에서 jstl 설정, 접두사를 c로 설정 -->

	<c:set var="pageTitle" value="PASSWORD CHECK" />
	<!-- c:set 태그(변수 선언문), <var>변수 pageTitle에 <value>PASSWORD CHECK 저장 -->

	<%@ include file="../common/header.jsp" %>
	<!-- checkPassword.jsp에 head.jsp를 포함시켜서 브라우저에 출력 -->

	<script>
	
		const checkPasswordForm_onSubmit = function(form) {

			form.loginPw.value = form.loginPw.value.trim();
			
			if (form.loginPw.value.length == 0) {
				
				alert('비밀번호를 입력해주세요');
				
				form.loginPw.focus();
				
				return;
			}
			
			form.submit();
		}
	</script>
	
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doCheckPassword" method="post" onsubmit="checkPasswordForm_onSubmit(this); return false;">
			
				<div class="table-box-type">
					<table class="table table-lg">
						<tr>
							<th>아이디</th>
							<td>${loginId }</td>
							
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="input input-bordered input-primary w-9/12" name="loginPw" type="text" placeholder="비밀번호를 입력해주세요" /></td>
						</tr>
						<tr>
							<td class="text-center" colspan="2"><button class="btn-text-color btn btn-wide btn-outline">확인</button></td>
						</tr>
					</table>
				</div>
			</form>
			
			<div class="btns mt-2">
				<button class="btn-text-color btn btn-outline btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>