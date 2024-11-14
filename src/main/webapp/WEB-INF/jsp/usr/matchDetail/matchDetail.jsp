<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/toastUiEditorLib.jsp" %>

	<script>
		const settings = {
				async: true,
				crossDomain: true,
				url: 'https://api-football-v1.p.rapidapi.com/v3/fixtures?id=1208021&timezone=Asia%2FSeoul',
				method: 'GET',
				headers: {
					'x-rapidapi-key': '3a012c58fdmsh42f7e05c92b7f66p1ed97ejsn1660d3e9d81f',
					'x-rapidapi-host': 'api-football-v1.p.rapidapi.com'
				}
			};
	
		$.ajax(settings).done(function (response) {
			$(".match0Referee").append(response.response[0].fixture.referee);
			
			$(".match0Date").append((response.response[0].fixture.date).substring(0, 10));
			$(".match0Time").append((response.response[0].fixture.date).substring(11, 16));
			
			$(".match0Stadium").append(response.response[0].fixture.venue.name);
			$(".match0City").append(response.response[0].fixture.venue.city);
			
			$(".match0LeagueLogo").append('<img src="' + response.response[0].league.logo + '"/>');
			$(".match0LeagueFlag").append('<img src="' + response.response[0].league.flag + '"/>');
			
			if (response.response[0].fixture.status.short == "1H" || response.response[0].fixture.status.short == "HT" || response.response[0].fixture.status.short == "2H") {
				$(".match0Status").append('<div class="flex justify-center bg-green-400 rounded-2xl">' + response.response[0].fixture.status.short + '</div>');
			} else {
				$(".match0Status").append('<div class="flex justify-center bg-slate-200 rounded-2xl">' + response.response[0].fixture.status.short + '</div>');
			}
			
			if (response.response[0].teams.home.id == 40) {
				$(".match0HomeLogo").append('<img src="' + response.response[0].teams.home.logo + '" class="h-8 ml-2"/>');
			} else {
				$(".match0HomeLogo").append('<img src="' + response.response[0].teams.home.logo + '"/>');
			}
			
			if (response.response[0].teams.away.id == 40) {
				$(".match0AwayLogo").append('<img src="' + response.response[0].teams.away.logo + '" class="h-8 ml-2"/>');
			} else {
				$(".match0AwayLogo").append('<img src="' + response.response[0].teams.away.logo + '"/>');
			}
			
			
			$(".match0Round").append(response.response[0].league.round);
			
			$(".match0HomeName").append(response.response[0].teams.home.name);
			$(".match0AwayName").append(response.response[0].teams.away.name);
			
			$(".match0HomeScore").append(response.response[0].goals.home);
			$(".match0AwayScore").append(response.response[0].goals.away);
			
			var eventsNumInt;
			eventsNumInt = null;
			
			var eventsNumStr;
			eventsNumStr = null;
			
			for (i = 0; i <= 15; i++) {
				eventsNumInt = i;
				eventsNumStr = String(i);
				
				$(".match0Events" + eventsNumStr + "RegularTime").append(response.response[0].events[eventsNumInt].time.elapsed);
				$(".match0Events" + eventsNumStr + "ExtraTime").append(response.response[0].events[eventsNumInt].time.extra);
				$(".match0Events" + eventsNumStr + "Player").append(response.response[0].events[eventsNumInt].player.name);
				$(".match0Events" + eventsNumStr + "Detail").append(response.response[0].events[eventsNumInt].detail);
				
			}
			
			$(".match0HomeCoachName").append(response.response[0].lineups[0].coach.name);
			$(".match0HomeCoachPhoto").append('<img src="' + response.response[0].lineups[0].coach.photo + '"/>');
			$(".match0HomeFormation").append(response.response[0].lineups[0].formation);
			
			$(".match0AwayCoachName").append(response.response[0].lineups[1].coach.name);
			$(".match0AwayCoachPhoto").append('<img src="' + response.response[0].lineups[1].coach.photo + '"/>');
			$(".match0AwayFormation").append(response.response[0].lineups[1].formation);
			
			var startXINumInt;
			startXINumInt = null;
			
			var startXINumStr;
			startXINumStr = null;
			
			for (i = 0; i < 11; i++) {
				startXINumInt = i;
				startXINumStr = String(i);
				
				$(".match0HomeStartXI" + startXINumStr + "Name").append(response.response[0].lineups[0].startXI[startXINumInt].player.name);
				$(".match0HomeStartXI" + startXINumStr + "Number").append(response.response[0].lineups[0].startXI[startXINumInt].player.number);
				$(".match0HomeStartXI" + startXINumStr + "Photo").append('<img src="' + response.response[0].players[0].players[startXINumInt].player.photo + '"/>');
				
				$(".match0AwayStartXI" + startXINumStr + "Name").append(response.response[0].lineups[1].startXI[startXINumInt].player.name);
				$(".match0AwayStartXI" + startXINumStr + "Number").append(response.response[0].lineups[1].startXI[startXINumInt].player.number);
				$(".match0AwayStartXI" + startXINumStr + "Photo").append('<img src="' + response.response[0].players[1].players[startXINumInt].player.photo + '"/>');
			}
			
			var substitutesNumInt;
			substitutesNumInt = null;
			
			var substitutesNumStr;
			substitutesNumStr = null;
			
			for (i = 0; i < 9; i++) {
				substitutesNumInt = i;
				substitutesNumStr = String(i);
				
				$(".match0HomeSubstitutes" + substitutesNumStr + "Name").append(response.response[0].lineups[0].substitutes[substitutesNumInt].player.name);
				$(".match0HomeSubstitutes" + substitutesNumStr + "Number").append(response.response[0].lineups[0].substitutes[substitutesNumInt].player.number);
				
				$(".match0AwaySubstitutes" + substitutesNumStr + "Name").append(response.response[0].lineups[1].substitutes[substitutesNumInt].player.name);
				$(".match0AwaySubstitutes" + substitutesNumStr + "Number").append(response.response[0].lineups[1].substitutes[substitutesNumInt].player.number);
			}
			
			var playersNumInt;
			playersNumInt = null;
			
			var playersNumStr;
			playersNumStr = null;
			
			for (i = 0; i < 20; i++) {
				playersNumInt = i;
				playersNumStr = String(i);
				
				$(".match0HomePlayers" + playersNumStr + "Photo").append('<img src="' + response.response[0].players[0].players[playersNumInt].player.photo + '"/>');
				
				$(".match0AwayPlayers" + playersNumStr + "Photo").append('<img src="' + response.response[0].players[1].players[playersNumInt].player.photo + '"/>');
			}
			
			$(".match0HomeShotsOnGoalValue").append(response.response[0].statistics[0].statistics[0].value);
			$(".match0HomeTotalShotsValue").append(response.response[0].statistics[0].statistics[2].value);
			$(".match0HomeFoulsValue").append(response.response[0].statistics[0].statistics[6].value);
			$(".match0HomeCornersValue").append(response.response[0].statistics[0].statistics[7].value);
			$(".match0HomeOffsidesValue").append(response.response[0].statistics[0].statistics[8].value);
			$(".match0HomeBallPossessionValue").append(response.response[0].statistics[0].statistics[9].value);
			$(".match0HomeYellowCardsValue").append(response.response[0].statistics[0].statistics[10].value);
			$(".match0HomeRedCardsValue").append(response.response[0].statistics[0].statistics[11].value);
			$(".match0HomeGoalkeeperSavesValue").append(response.response[0].statistics[0].statistics[12].value);
			$(".match0HomePassesPersentValue").append(response.response[0].statistics[0].statistics[15].value);
			$(".match0HomeExpected_goalsValue").append(response.response[0].statistics[0].statistics[16].value);
			
			$(".match0AwayShotsOnGoalValue").append(response.response[0].statistics[1].statistics[0].value);
			$(".match0AwayTotalShotsValue").append(response.response[0].statistics[1].statistics[2].value);
			$(".match0AwayFoulsValue").append(response.response[0].statistics[1].statistics[6].value);
			$(".match0AwayCornersValue").append(response.response[0].statistics[1].statistics[7].value);
			$(".match0AwayOffsidesValue").append(response.response[0].statistics[1].statistics[8].value);
			$(".match0AwayBallPossessionValue").append(response.response[0].statistics[1].statistics[9].value);
			$(".match0AwayYellowCardsValue").append(response.response[0].statistics[1].statistics[10].value);
			$(".match0AwayRedCardsValue").append(response.response[0].statistics[1].statistics[11].value);
			$(".match0AwayGoalkeeperSavesValue").append(response.response[0].statistics[1].statistics[12].value);
			$(".match0AwayPassesPersentValue").append(response.response[0].statistics[1].statistics[15].value);
			$(".match0AwayExpected_goalsValue").append(response.response[0].statistics[1].statistics[16].value);
			
		});
	</script>

	<section class="flex">
		<div class="w-1/5 border-2 border-slate-50 border-r-slate-200">
			<table class="table table-auto">
				<caption class="caption-top mt-2">START11</caption>
				<thead class="text-[8px]">
					<tr>
						<th><div class="flex justify-center">PLAYER</div></th>
						<th><div class="flex justify-center">NUM</div></th>
						<th><div class="flex justify-center">NAME</div></th>
					</tr>
				</thead>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="match0HomePlayers0Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI0Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI0Name flex justify-center"></div></td>
					</tr>
				</tbody>	
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">		
						<td><div class="match0HomePlayers1Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI1Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI1Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="match0HomePlayers2Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI2Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI2Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0HomePlayers3Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI3Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI3Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0HomePlayers4Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI4Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI4Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0HomePlayers5Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI5Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI5Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0HomePlayers6Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI6Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI6Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0HomePlayers7Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI7Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI7Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0HomePlayers8Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI8Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI8Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0HomePlayers9Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI9Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI9Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0HomePlayers10Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeStartXI10Number flex justify-center"></div></td>
						<td><div class="match0HomeStartXI10Name flex justify-center"></div></td>
					</tr>
				</tbody>
			</table>
			<table class="table table-auto">
				<caption class="caption-top mt-2">SUBSTITUTIONS</caption>
				<thead class="text-[8px]">
					<tr>
						<th><div class="flex justify-center">PLAYER</div></th>
						<th><div class="flex justify-center">NUM</div></th>
						<th><div class="flex justify-center">NAME</div></th>
					</tr>
				</thead>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0HomePlayers11Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes0Number flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes0Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0HomePlayers12Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes1Number flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes1Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0HomePlayers13Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes2Number flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes2Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0HomePlayers14Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes3Number flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes3Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0HomePlayers15Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes4Number flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes4Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0HomePlayers16Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes5Number flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes5Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0HomePlayers17Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes6Number flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes6Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0HomePlayers18Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes7Number flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes7Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0HomePlayers19Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes8Number flex justify-center"></div></td>
						<td><div class="match0HomeSubstitutes8Name flex justify-center"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="w-1/5">
			<div class="h-72 mt-8 border-2 border-slate-50 border-b-slate-200">
				<div class="match0HomeLogo flex justify-center"></div>
				<div class="flex justify-center mt-2 text-[10px]">
					<div class="match0HomeCoachPhoto w-10 h-10 m-2"></div>
					<div class="match0HomeCoachName mx-2 mt-6"></div>
					<div class="match0HomeFormation mx-2 mt-6"></div>
				</div>
				<div class="match0HomeScore flex justify-center mt-2 text-4xl"></div>
			</div>
			
			<div class="container mx-auto">
				<table class="table table-base">
					<tr>
						<th><div class="match0HomeExpected_goalsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeShotsOnGoalValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeTotalShotsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeCornersValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeBallPossessionValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomePassesPersentValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeGoalkeeperSavesValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeOffsidesValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeFoulsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeYellowCardsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeRedCardsValue flex justify-center"></div></th>
					</tr>
				</table>
			</div>
		</div>	
		
		<div class="w-1/5">
			<div class="h-72 mt-8 border-2 border-slate-50 border-b-slate-200">
				<div class="flex justify-center">
					<div class="match0LeagueLogo w-12"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="match0LeagueFlag w-6 border-2 border-inherit"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="match0Date"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="match0Time"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="match0Round"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<i class="fa-solid fa-ticket m-1"></i><div class="match0Stadium"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<i class="fa-solid fa-city m-1"></i><div class="match0City"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<i class="fa-solid fa-flag m-1"></i><div class="match0Referee"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="match0Status w-12"></div>
				</div>
			</div>
			
			<div class="container mx-auto">
				<table class="table table-base">
					<tr>
						<th><div class="flex justify-center">기대 득점</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">유효슈팅</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">슈팅</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">코너킥</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">볼 점유율</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">패스 성공률</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">오프사이드</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">선방</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">파울</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">경고</div></th>
					</tr>
					<tr>
						<th><div class="flex justify-center">퇴장</div></th>
					</tr>
				</table>
			</div>
			
			<div class="mt-4 flex justify-center">
				<button class="btn btn-outline btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
		
		<div class="w-1/5">
			<div class="h-72 mt-8 border-2 border-slate-50 border-b-slate-200">
				<div class="match0AwayLogo flex justify-center"></div>
				<div class="flex justify-center mt-2 text-[10px]">
					<div class="match0AwayCoachPhoto w-10 h-10 m-2"></div>
					<div class="match0AwayCoachName mx-2 mt-6"></div>
					<div class="match0AwayFormation mx-2 mt-6"></div>
				</div>
				<div class="match0AwayScore flex justify-center mt-2 text-4xl"></div>
			</div>
			
			<div class="container mx-auto">
				<table class="table table-base">
					<tr>
						<th><div class="match0AwayExpected_goalsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0AwayShotsOnGoalValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0AwayTotalShotsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0AwayCornersValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0AwayBallPossessionValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0AwayPassesPersentValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0AwayGoalkeeperSavesValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0HomeOffsidesValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0AwayFoulsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0AwayYellowCardsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="match0AwayRedCardsValue flex justify-center"></div></th>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="w-1/5 border-2 border-slate-50 border-l-slate-200">
			<table class="table table-auto">
				<caption class="caption-top mt-2">START11</caption>
				<thead class="text-[8px]">
					<tr>
						<th><div class="flex justify-center">PLAYER</div></th>
						<th><div class="flex justify-center">NUM</div></th>
						<th><div class="flex justify-center">NAME</div></th>
					</tr>
				</thead>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="match0AwayPlayers0Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI0Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI0Name flex justify-center"></div></td>
					</tr>
				</tbody>	
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">		
						<td><div class="match0AwayPlayers1Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI1Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI1Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="match0AwayPlayers2Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI2Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI2Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0AwayPlayers3Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI3Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI3Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0AwayPlayers4Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI4Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI4Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0AwayPlayers5Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI5Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI5Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0AwayPlayers6Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI6Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI6Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0AwayPlayers7Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI7Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI7Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0AwayPlayers8Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI8Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI8Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0AwayPlayers9Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI9Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI9Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="match0AwayPlayers10Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwayStartXI10Number flex justify-center"></div></td>
						<td><div class="match0AwayStartXI10Name flex justify-center"></div></td>
					</tr>
				</tbody>
			</table>
			<table class="table table-auto">
				<caption class="caption-top mt-2">SUBSTITUTIONS</caption>
				<thead class="text-[8px]">
					<tr>
						<th><div class="flex justify-center">PLAYER</div></th>
						<th><div class="flex justify-center">NUM</div></th>
						<th><div class="flex justify-center">NAME</div></th>
					</tr>
				</thead>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0AwayPlayers11Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes0Number flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes0Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0AwayPlayers12Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes1Number flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes1Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0AwayPlayers13Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes2Number flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes2Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0AwayPlayers14Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes3Number flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes3Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0AwayPlayers15Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes4Number flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes4Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0AwayPlayers16Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes5Number flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes5Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0AwayPlayers17Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes6Number flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes6Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0AwayPlayers18Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes7Number flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes7Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="match0AwayPlayers19Photo w-10 h-10 flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes8Number flex justify-center"></div></td>
						<td><div class="match0AwaySubstitutes8Name flex justify-center"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	
<%@ include file="../common/footer.jsp" %>