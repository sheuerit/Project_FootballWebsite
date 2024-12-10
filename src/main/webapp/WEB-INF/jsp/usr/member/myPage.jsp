<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<%@ include file="../common/header.jsp" %>

	<script>
	    var btn = document.querySelector("#btn");
	    btn.addEventListener("click", function (e) {
	        var vm = this;
	        this.setAttribute("disabled", "disabled");
	
	        setTimeout(function () {
	            vm.removeAttribute("disabled")
	        }, 5000)
	    })
	</script>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<div class="table-box-type">
				<table class="table table-lg">
					<tr>
						<th>번호</th>
						<td>${member.id }</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${member.regDate.substring(2, 16) }</td>
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
						<td>${member.name }</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>${member.nickname }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${member.cellphoneNum }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.email }</td>
					</tr>
					<tr>
						<th>코인</th>
						<td>
							<div class="flex">
								${member.coin } 
								<i class="fa-solid fa-coins ml-1 mt-1"></i>
								<form action="doPresentCheck">
									<button id="btn" class="btn btn-outline btn-sm ml-4"><i class="mr-2 fa-solid fa-circle-check"></i>출석체크</button>
								</form>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div class="btns mt-2">
				<div class="flex justify-between">
					<button class="btn-text-color btn btn-outline btn-sm" onclick="location.href='/usr/home/main'">뒤로가기</button>
					
					<a class="btn-text-color btn btn-outline btn-sm" href="checkPassword?loginId=${member.loginId }">회원정보수정</a>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../common/footer.jsp" %>