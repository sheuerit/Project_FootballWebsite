<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOOTSCOPE</title>

<link rel="shortcut icon" href="/resource/images/favicon.ico" />

<!-- 데이지UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.6.0/dist/full.min.css" rel="stylesheet" type="text/css" />
<!-- 테일윈드 치트시트 -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer></script>
</head>
<body>
	<div class="h-20 container mx-auto text-2xl flex">
		<div>
			<a class="h-full px-20 flex items-center" href="/">INFO<i class="fa-sharp fa-solid fa-futbol fa-bounce p-1"></i>TBALL</a>
		</div>
		<div class="flex-grow"></div>
		<div>
			<script async src="https://cse.google.com/cse.js?cx=a3314046e33d84fc9"></script>
			<div class="gcse-search"></div>
		</div>
		<ul class="flex">
			<c:if test="${rq.loginedMemberId == 0 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/join">회원가입</a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/login">로그인</a></li>
			</c:if>
			<c:if test="${rq.loginedMemberId != 0 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/myPage">마이 페이지</a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/doLogout">로그아웃</a></li>
			</c:if>
		</ul>
	</div>
	
	<section>
		<div class="container mx-auto">
			<div class="flex justify-center bg-slate-200">
				<ul class="my-2 flex">
					<li class="mx-3 btn btn-outline btn-sm"><a class="h-full px-3 flex items-center" href="/"><i class="mr-2 fas fa-house"></i>홈</a></li>
					<li class="mx-3 btn btn-outline btn-sm"><a class="h-full px-3 flex items-center" href="/usr/notice/list"><i class="mr-2 fas fa-bell"></i>공지사항</a></li>
					<li class="mx-3 btn btn-outline btn-sm"><a class="h-full px-3 flex items-center" href="/usr/article/list"><i class="mr-2 fas fa-clipboard-list"></i>자유게시판</a></li>
					<li class="mx-3 btn btn-outline btn-sm"><a class="h-full px-3 flex items-center" href="/usr/coinShop/list"><i class="mr-2 fas fa-shopping-cart"></i>코인샵</a></li>
					<c:if test="${rq.loginedMemberId != 0 }">
						<li class="mx-3 btn btn-outline btn-sm"><a class="h-full px-3 flex items-center" href="/"><i class="mr-2 fa-solid fa-circle-check"></i>출석체크</a></li>
					</c:if>
				</ul>
			</div>
		</div>	
	</section>
	