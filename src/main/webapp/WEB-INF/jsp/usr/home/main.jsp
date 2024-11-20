<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="MAIN" />

<%@ include file="../common/header.jsp" %>

	<script>
		const settingsLeagues = {
			async : true,
			crossDomain : true,
			url: 'https://api-football-v1.p.rapidapi.com/v3/leagues',		
			method : 'GET',
			headers : {
				'x-rapidapi-key' : '3a012c58fdmsh42f7e05c92b7f66p1ed97ejsn1660d3e9d81f',
				'x-rapidapi-host' : 'api-football-v1.p.rapidapi.com'
			}
		};

		$.ajax(settingsLeagues).done(function(response) {
			$(".uefaChampionsLeagueLogo").append('<img src="' + response.response[17].league.logo + '"/>');
			$(".uefaEuropaLeagueLogo").append('<img src="' + response.response[179].league.logo + '"/>');
			$(".premierLeagueLogo").append('<img src="' + response.response[5].league.logo + '"/>');
			$(".laLigaLogo").append('<img src="' + response.response[10].league.logo + '"/>');
			$(".bundesligaLogo").append('<img src="' + response.response[6].league.logo + '"/>');
			$(".serieALogo").append('<img src="' + response.response[7].league.logo + '"/>');
			$(".ligue1Logo").append('<img src="' + response.response[2].league.logo + '"/>');
			$(".kLeague1Logo").append('<img src="' + response.response[309].league.logo + '"/>');

			// "Fa Cup ENG" >> 113
			// "League Cup" >> 115
			// "Eredivisie" >> 8
			// "kleague2" >> 310
			// "World Cup" >> 13
			// "Euro Championship" >> 1
			// "Asian Games" >> 14
		});
			
		const settingsnews = {
			async: true,
			crossDomain: true,
			url: 'https://top-sports-news.p.rapidapi.com/espn/soccer',
			method: 'GET',
			headers: {
				'x-rapidapi-key': '3a012c58fdmsh42f7e05c92b7f66p1ed97ejsn1660d3e9d81f',
				'x-rapidapi-host': 'top-sports-news.p.rapidapi.com'
			}
		};

		$.ajax(settingsnews).done(function (response) {
			$(".news0").append('<a href="'+ response.top_headlines[0].href +'" target="_blank">'+ response.top_headlines[0].title +'</a>');
			$(".news1").append('<a href="'+ response.top_headlines[1].href +'" target="_blank">'+ response.top_headlines[1].title +'</a>');
			$(".news2").append('<a href="'+ response.top_headlines[2].href +'" target="_blank">'+ response.top_headlines[2].title +'</a>');
			$(".news3").append('<a href="'+ response.top_headlines[3].href +'" target="_blank">'+ response.top_headlines[3].title +'</a>');
			$(".news4").append('<a href="'+ response.top_headlines[4].href +'" target="_blank">'+ response.top_headlines[4].title +'</a>');
			$(".news5").append('<a href="'+ response.top_headlines[5].href +'" target="_blank">'+ response.top_headlines[5].title +'</a>');
			$(".news6").append('<a href="'+ response.top_headlines[6].href +'" target="_blank">'+ response.top_headlines[6].title +'</a>');
			$(".news7").append('<a href="'+ response.top_headlines[7].href +'" target="_blank">'+ response.top_headlines[7].title +'</a>');
		});
	</script>
	
	<section class="flex">
		<div class="w-1/4 flex justify-center border-2 border-slate-50 border-r-slate-200">commercial</div>
		<div class="container mx-auto">
			<div class="flex justify-center ">
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 uefaChampionsLeagueLogo" href="/usr/uefa/uefaChampionsLeague"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 uefaEuropaLeagueLogo" href="/usr/uefa/uefaEuropaLeague"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 premierLeagueLogo" href="/usr/england/premierLeague"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 laLigaLogo" href="/usr/spain/laLiga"></a>
				</div>
			</div>
			<div class="flex justify-center">
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 bundesligaLogo" href="/usr/german/bundesliga"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 serieALogo" href="/usr/italy/serieA"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 ligue1Logo" href="/usr/france/ligue1"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 kLeague1Logo" href="/usr/korea/kLeague1"></a>
				</div>
			</div>
			
			<div class="flex border-2 border-slate-50 border-y-slate-200">
				<div class="w-1/4 flex justify-center border-2 border-slate-100">
					<div class="news0 hover:underline text-sm leading-8"></div>
				</div>
				<div class="w-1/4 flex justify-center border-2 border-slate-100 ">
					<div class="news1 hover:underline text-sm leading-8"></div>
				</div>
				<div class="w-1/4 flex justify-center border-2 border-slate-100 ">
					<div class="news2 hover:underline text-sm leading-8"></div>
				</div>
				<div class="w-1/4 flex justify-center">
					<div class="news3 hover:underline text-sm leading-8"></div>
				</div>
			</div>
			<div class="flex border-2 border-slate-50 border-y-slate-200">
				<div class="w-1/4 flex justify-center border-2 border-slate-100 " >
					<div class="news4 hover:underline text-sm leading-8"></div>
				</div>
				<div class="w-1/4 flex justify-center border-2 border-slate-100 ">
					<div class="news5 hover:underline text-sm leading-8"></div>
				</div>
				<div class="w-1/4 flex justify-center border-2 border-slate-100 ">
					<div class="news6 hover:underline text-sm leading-8"></div>
				</div>
				<div class="w-1/4 flex justify-center">
					<div class="news7 hover:underline text-sm leading-8"></div>
				</div>
			</div>
		</div>
		
		<div class="w-1/4 border-2 border-slate-50 border-l-slate-200">
			<div class="m-2 h-20 bg-slate-800">
				<a href="https://play.coupang.com/" target="_blank"><img class="p-6" src="https://assets.coupangplay.com/images/logo_coupangplay_footer2.webp" alt="" /></a>
			</div>
			<div class="m-2 h-20 bg-slate-800">
				<a href="https://www.spotvnow.co.kr/" target="_blank"><img class="p-7" src="https://cdn.spotvnow.co.kr/dist/asset/now-logo.png?1b0de03b28b974e5d9a35bdc9e3016ad" alt="" /></a>
			</div>
			<div class="m-2 h-20 border-2 border-slate-800">
				<a href="https://www.goal.com/kr/" target="_blank"><img class="w-auto h-full p-2 px-8" src="https://upload.wikimedia.org/wikipedia/en/thumb/5/5f/Goal_Website_Logo.svg/1920px-Goal_Website_Logo.svg.png" alt="" /></a>
			</div>
			<div class="m-2 h-20 border-2 border-slate-800">
				<a href="https://www.kitbag.com/ko/" target="_blank"><img class="w-auto h-full p-2 px-12" src="https://www.kitbag.com/content/assets/__0-596386953475.3036.svg" alt="" /></a>
			</div>
			<div class="m-2 h-20 border-2 border-slate-800">
				<a href="https://fconline.nexon.com/main/index" target="_blank"><img class="w-auto h-full p-2 px-16" src="https://file.nexon.com/NxFile/Download/FileDownloader.aspx?oidFile=5413419214155286064" alt="" /></a>
			</div>
		</div>	
	</section>

	
<%@ include file="../common/footer.jsp" %>