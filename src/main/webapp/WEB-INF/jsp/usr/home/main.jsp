<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="MAIN" />

<%@ include file="../common/header.jsp" %>

	<script>
		const settings = {
			async : true,
			crossDomain : true,
			url: 'https://api-football-v1.p.rapidapi.com/v3/leagues',		
			method : 'GET',
			headers : {
				'x-rapidapi-key' : '3a012c58fdmsh42f7e05c92b7f66p1ed97ejsn1660d3e9d81f',
				'x-rapidapi-host' : 'api-football-v1.p.rapidapi.com'
			}
		};

		$.ajax(settings).done(function(response) {
			$(".uefaChampionsLeagueLogo").append('<img src="' + response.response[17].league.logo + '"/>');
			$(".uefaEuropaLeagueLogo").append('<img src="' + response.response[179].league.logo + '"/>');
			$(".premierLeagueLogo").append('<img src="' + response.response[5].league.logo + '"/>');
			$(".laLigaLogo").append('<img src="' + response.response[10].league.logo + '"/>');
			$(".bundesligaLogo").append('<img src="' + response.response[6].league.logo + '"/>');
			$(".serieALogo").append('<img src="' + response.response[7].league.logo + '"/>');
			$(".ligue1Logo").append('<img src="' + response.response[2].league.logo + '"/>');
			$(".kLeague1Logo").append('<img src="' + response.response[309].league.logo + '"/>');
		});
			// "Fa Cup ENG" >> 113
			// "League Cup" >> 115
			// "Eredivisie" >> 8
			// "kleague2" >> 310
			// "World Cup" >> 13
			// "Euro Championship" >> 1
			// "Asian Games" >> 14
	</script>
	
	<section class="flex">
		<div class="w-1/4 flex justify-center border-2 border-slate-50 border-r-slate-200">commercial</div>
		<div class="container mx-auto">
			<div class="flex justify-center ">
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 uefaChampionsLeagueLogo" href="/usr/league/uefaChampionsLeague"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 uefaEuropaLeagueLogo" href="/usr/league/uefaEuropaLeague"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 premierLeagueLogo" href="/usr/league/premierLeague"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 laLigaLogo" href="/usr/league/laLiga"></a>
				</div>
			</div>
			<div class="flex justify-center">
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 bundesligaLogo" href="/usr/league/bundesliga"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 serieALogo" href="/usr/league/serieA"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 ligue1Logo" href="/usr/league/ligue1"></a>
				</div>
				<div class="w-1/4 m-6 flex justify-center hover:border-4 border-slate-200 rounded-2xl">
					<a class="my-5 kLeague1Logo" href="/usr/league/kLeague1"></a>
				</div>
			</div>
			<div class="flex border-2 border-slate-50 border-y-slate-200">
				<div class="w-1/4 flex justify-center border-2 border-slate-50 border-r-slate-200">news</div>
				<div class="w-1/4 flex justify-center border-2 border-slate-50 border-r-slate-200">news</div>
				<div class="w-1/4 flex justify-center border-2 border-slate-50 border-r-slate-200">news</div>
				<div class="w-1/4 flex justify-center">news</div>
			</div>
		</div>
		
		<div class="w-1/4 flex justify-center border-2 border-slate-50 border-l-slate-200">link</div>	
	</section>

	
<%@ include file="../common/footer.jsp" %>