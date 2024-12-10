<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- passwordModify.jsp 안에서 jstl 설정, 접두사를 c로 설정 -->

	<c:set var="pageTitle" value="PASSWORD MODIFY" />
	<!-- c:set 태그(변수 선언문), <var>변수 pageTitle에 <value>PASSWORD MODIFY 저장 -->

	<%@ include file="../common/header.jsp" %>
	<!-- myPage.jsp에 head.jsp를 포함시켜서 브라우저에 출력 -->

	<script>
	// script 태그
	
		const doPasswordModifyForm_onSubmit = function(form) {
			// 변수 doPasswordModifyForm_onSubmit에 function() 함수 저장
			// 변수 form에 (매개변수)
			// 전달받은(인자) this(form 태그)를 저장

			form.loginPw.value = form.loginPw.value.trim();
			// 변수 form에서 <name>loginPw에 value(입력된 비밀번호)를 trim() 메서드로 공백 제거
			
			form.loginPwChk.value = form.loginPwChk.value.trim();
			
			if (form.loginPw.value.length == 0) {
				// 만약 변수 form에서 <name>loginPw에 value(입력된 비밀번호)의 length(길이)가 0과 같다면
				
				alert('비밀번호를 입력해주세요');
				// alert() 메서드 호출하고 (인자)'이름을 입력해주세요' 전달 (알림창에 문자열 출력)
				
				form.loginPw.focus();
				// 변수 form에서 <name>loginPw에서 focus() 메서드 호출하고 비밀번호로 입력 커서 이동
				
				return;
				// return 해서 함수 종료
			}
			
			if (form.loginPwChk.value.length == 0) {
				alert('비밀번호확인을 입력해주세요');
				form.loginPwChk.focus();
				return;
			}
			
			if (form.loginPw.value != form.loginPwChk.value) {
				// 만약 변수 form에서 <name>loginPw에 value(입력된 비밀번호)와 <name>loginPw에 value(입력된 비밀번호확인)가 같지 않다면
				
				alert('비밀번호가 일치하지 않습니다');
				form.loginPw.focus();
				form.loginPw.value = '';
				form.loginPwChk.value = '';
				return;
			}
			
			form.submit();
			// 변수 form에서 submit() 메서드 호출, <action>"doPasswordModify" 실행 (doPasswordModify() 메서드 호출)
		}
	</script>
	
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doPasswordModify" method="post" onsubmit="doPasswordModifyForm_onSubmit(this); return false;">
			<!-- form 태그 -->
			<!-- <action>doPasswordModify() 메서드 호출하고 (인자)<name>loginPw(수정한 비밀번호), loginPwChk(수정한 비밀번호확인)을 전달 --> 
			<!-- <method>post() 메서드 방식으로 전송 -->
			<!-- <onsubmit>변수 doPasswordModifyForm_onSubmit에 저장된 함수에 this(form 태그) 전달해서 실행, 함수 종료되면 false를 return(취소) -->
			
				<div class="table-box-type">
					<table class="table table-lg">
						<tr>
							<th>새 비밀번호</th>
							<td><input class="input input-bordered input-primary w-9/12" name="loginPw" type="text" placeholder="비밀번호를 입력해주세요" autocomplete="off"/></td>
							<!-- input 태그, <name>loginPw에 수정한 비밀번호 저장, <type>텍스트 입력, <placeholder>안내문구 -->
						</tr>
						<tr>
							<th>새 비밀번호 확인</th>
							<td><input class="input input-bordered input-primary w-9/12" name="loginPwChk" type="text" placeholder="비밀번호 확인을 입력해주세요" autocomplete="off"/></td>
						</tr>
						<tr>
							<td class="text-center" colspan="2"><button class="btn-text-color btn btn-wide btn-outline">변경</button></td>
							<!-- <colspan>가로 2칸을 병합 -->
							<!-- button 태그(<action>doPasswordModify() 메서드 호출), 변경을 브라우저에 출력 -->
							
						</tr>
					</table>
				</div>
			</form>
			
			<div class="btns mt-2">
				<button class="btn-text-color btn btn-outline btn-sm" onclick="history.back();">뒤로가기</button>
				<!-- button 태그, <onclick>history.back() 메서드(직전 기록된 url로 이동) 호출하는 뒤로가기를 브라우저에 출력 -->
			</div>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>