<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- modify.jsp 안에서 jstl 설정, 접두사를 c로 설정 -->

	<c:set var="pageTitle" value="MEMBER MODIFY" />
	<!-- c:set 태그(변수 선언문), <var>변수 pageTitle에 <value>MEMBER MODIFY 저장 -->

	<%@ include file="../common/header.jsp" %>
	<!-- modify.jsp에 head.jsp를 포함시켜서 브라우저에 출력 -->

	<script>
	// script 태그
	
		const memberModifyForm_onSubmit = function(form) {
			// 변수 memberModifyForm_onSubmit에 function() 함수 저장
			// 변수 form에 (매개변수)
			// 전달받은(인자) this(form 태그)를 저장

			form.name.value = form.name.value.trim();
			// 변수 form에서 <name>name에 value(입력된 이름)를 trim() 메서드로 공백 제거
			
			form.nickname.value = form.nickname.value.trim();
			form.cellphoneNum.value = form.cellphoneNum.value.trim();
			form.email.value = form.email.value.trim();
			
			if (form.name.value.length == 0) {
				// 만약 변수 form에서 <name>name에 value(입력된 이름)의 length(길이)가 0과 같다면
				
				alert('이름을 입력해주세요');
				// alert() 메서드 호출하고 (인자)'이름을 입력해주세요' 전달 (알림창에 문자열 출력)
				
				form.name.focus();
				// 변수 form에서 <name>name에서 focus() 메서드 호출하고 이름으로 입력 커서 이동
				
				return;
				// return 해서 함수 종료
			}
			
			if (form.nickname.value.length == 0) {
				alert('닉네임을 입력해주세요');
				form.nickname.focus();
				return;
			}
			
			if (form.cellphoneNum.value.length == 0) {
				alert('전화번호를 입력해주세요');
				form.cellphoneNum.focus();
				return;
			}
			
			if (form.email.value.length == 0) {
				alert('이메일을 입력해주세요');
				form.email.focus();
				return;
			}
			
			form.submit();
			// 변수 form에서 submit() 메서드 호출, <action>"doModify" 실행 (doModify() 메서드 호출)
		}
	</script>
	
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doModify" method="post" onsubmit="memberModifyForm_onSubmit(this); return false;">
			<!-- form 태그 -->
			<!-- <action>doModify() 메서드 호출하고 (인자)<name>name(수정한 이름), nickname(수정한 닉네임), cellphoneNum(수정한 전화번호), email(수정한 이메일)을 전달 --> 
			<!-- <method>post() 메서드 방식으로 전송 -->
			<!-- <onsubmit>변수 memberModifyForm_onSubmit에 저장된 함수에 this(form 태그) 전달해서 실행, 함수 종료되면 false를 return(취소) -->
			
				<div class="table-box-type">
					<table class="table table-lg">
						<tr>
							<th>번호</th>
							<td>${member.id }</td>
							<!-- {EL, doCheckPassword() 메서드에서 전달받은 member(key)에서 변수 id }(회원 번호)를 브라우저에 출력 -->
							
						</tr>
						<tr>
							<th>가입일</th>
							<td>${member.regDate.substring(2, 16) }</td>
							<!-- {EL, doCheckPassword() 메서드에서 전달받은 member(key)에서 변수 regDate(날짜, 시간)에서 substring() 메서드 호출하고(배열로 만듬) 
							(인자)2, 16을 전달해서(2번 index부터 16번 index까지) return된 날짜, 시간 }을 브라우저에 출력 -->
							
						</tr>
						<tr>
							<th>정보 수정일</th>
							<td>${member.updateDate.substring(2, 16) }</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${member.loginId }</td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input class="input input-bordered input-primary w-9/12" name="name" type="text" value="${member.name }" placeholder="이름을 입력해주세요" /></td>
							<!-- input 태그, <name>name에 , <type>텍스트 입력, <value>{EL, doCheckPassword() 메서드에서 전달받은 member(key)에서 변수 name }(회원 이름)을 저장 <placeholder>안내문구 -->
							
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input class="input input-bordered input-primary w-9/12" name="nickname" type="text" value="${member.nickname }" placeholder="닉네임을 입력해주세요" /></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input class="input input-bordered input-primary w-9/12" name="cellphoneNum" type="text" value="${member.cellphoneNum }" placeholder="전화번호를 입력해주세요" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input class="input input-bordered input-primary w-9/12" name="email" type="text" value="${member.email }" placeholder="이메일을 입력해주세요" /></td>
						</tr>
						<tr>
							<td class="text-center" colspan="2"><button class="btn-text-color btn btn-wide btn-outline">수정</button></td>
							<!-- <colspan>가로 2칸을 병합 -->
							<!-- button 태그(<action>doModify() 메서드 호출), 수정을 브라우저에 출력 -->
							
						</tr>
					</table>
				</div>
			</form>
			<div class="btns mt-2">
				<div class="flex justify-between">
					<button class="btn-text-color btn btn-outline btn-sm" onclick="history.back();">뒤로가기</button>
					<!-- button 태그, <onclick>history.back() 메서드(직전 기록된 url로 이동) 호출하는 뒤로가기를 브라우저에 출력 -->
					
					<a class="btn-text-color btn btn-outline btn-sm" href="passwordModify">비밀번호변경</a>
					<!-- button 태그, <href>passwordModify() 메서드를 호출하는 비밀번호변경을 브라우저에 출력 -->
					
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>