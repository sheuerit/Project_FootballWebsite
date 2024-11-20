<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/toastUiEditorLib.jsp" %>

	<script>
		const settings = {
				async: true,
				crossDomain: true,
				url: 'https://api-football-v1.p.rapidapi.com/v3/fixtures?id=' + ${fixtureId } + '&timezone=Asia%2FSeoul',
				method: 'GET',
				headers: {
					'x-rapidapi-key': '3a012c58fdmsh42f7e05c92b7f66p1ed97ejsn1660d3e9d81f',
					'x-rapidapi-host': 'api-football-v1.p.rapidapi.com'
				}
			};
	
		$.ajax(settings).done(function (response) {
			$(".matchReferee").append(response.response[0].fixture.referee);
			
			$(".matchDate").append((response.response[0].fixture.date).substring(0, 10));
			$(".matchTime").append((response.response[0].fixture.date).substring(11, 16));
			
			$(".matchStadium").append(response.response[0].fixture.venue.name);
			$(".matchCity").append(response.response[0].fixture.venue.city);
			
			$(".matchLeagueLogo").append('<img src="' + response.response[0].league.logo + '"/>');
			$(".matchLeagueFlag").append('<img src="' + response.response[0].league.flag + '"/>');
			
			if (response.response[0].fixture.status.short == "1H" || response.response[0].fixture.status.short == "HT" || response.response[0].fixture.status.short == "2H") {
				$(".matchStatus").append('<div class="flex justify-center bg-green-400 rounded-2xl">' + response.response[0].fixture.status.short + '</div>');
			} else {
				$(".matchStatus").append('<div class="flex justify-center bg-slate-200 rounded-2xl">' + response.response[0].fixture.status.short + '</div>');
			}
			
			$(".matchHomeLogo").append('<img src="' + response.response[0].teams.home.logo + '"/>');
			$(".matchAwayLogo").append('<img src="' + response.response[0].teams.away.logo + '"/>');
			
			$(".matchRound").append(response.response[0].league.round);
			
			$(".matchHomeName").append(response.response[0].teams.home.name);
			$(".matchAwayName").append(response.response[0].teams.away.name);
			
			$(".matchHomeScore").append(response.response[0].goals.home);
			$(".matchAwayScore").append(response.response[0].goals.away);
			
			/* var eventsNumInt;
			eventsNumInt = null;
			
			var eventsNumStr;
			eventsNumStr = null;
			
			for (i = 0; i <= 15; i++) {
				eventsNumInt = i;
				eventsNumStr = String(i);
				
				$(".matchEvents" + eventsNumStr + "RegularTime").append(response.response[0].events[eventsNumInt].time.elapsed);
				$(".matchEvents" + eventsNumStr + "ExtraTime").append(response.response[0].events[eventsNumInt].time.extra);
				$(".matchEvents" + eventsNumStr + "Player").append(response.response[0].events[eventsNumInt].player.name);
				$(".matchEvents" + eventsNumStr + "Detail").append(response.response[0].events[eventsNumInt].detail);
				
			} */
			
			$(".matchHomeCoachName").append(response.response[0].lineups[0].coach.name);
			$(".matchHomeCoachPhoto").append('<img src="' + response.response[0].lineups[0].coach.photo + '"/>');
			$(".matchHomeFormation").append(response.response[0].lineups[0].formation);
			
			$(".matchAwayCoachName").append(response.response[0].lineups[1].coach.name);
			$(".matchAwayCoachPhoto").append('<img src="' + response.response[0].lineups[1].coach.photo + '"/>');
			$(".matchAwayFormation").append(response.response[0].lineups[1].formation);
			
			/* $(".matchHomeShotsOnGoalValue").append(response.response[0].statistics[0].statistics[0].value);
			$(".matchHomeTotalShotsValue").append(response.response[0].statistics[0].statistics[2].value);
			$(".matchHomeFoulsValue").append(response.response[0].statistics[0].statistics[6].value);
			$(".matchHomeCornersValue").append(response.response[0].statistics[0].statistics[7].value);
			$(".matchHomeOffsidesValue").append(response.response[0].statistics[0].statistics[8].value);
			$(".matchHomeBallPossessionValue").append(response.response[0].statistics[0].statistics[9].value);
			$(".matchHomeYellowCardsValue").append(response.response[0].statistics[0].statistics[10].value);
			$(".matchHomeRedCardsValue").append(response.response[0].statistics[0].statistics[11].value);
			$(".matchHomeGoalkeeperSavesValue").append(response.response[0].statistics[0].statistics[12].value);
			$(".matchHomePassesPersentValue").append(response.response[0].statistics[0].statistics[15].value);
			$(".matchHomeExpected_goalsValue").append(response.response[0].statistics[0].statistics[16].value);
			
			$(".matchAwayShotsOnGoalValue").append(response.response[0].statistics[1].statistics[0].value);
			$(".matchAwayTotalShotsValue").append(response.response[0].statistics[1].statistics[2].value);
			$(".matchAwayFoulsValue").append(response.response[0].statistics[1].statistics[6].value);
			$(".matchAwayCornersValue").append(response.response[0].statistics[1].statistics[7].value);
			$(".matchAwayOffsidesValue").append(response.response[0].statistics[1].statistics[8].value);
			$(".matchAwayBallPossessionValue").append(response.response[0].statistics[1].statistics[9].value);
			$(".matchAwayYellowCardsValue").append(response.response[0].statistics[1].statistics[10].value);
			$(".matchAwayRedCardsValue").append(response.response[0].statistics[1].statistics[11].value);
			$(".matchAwayGoalkeeperSavesValue").append(response.response[0].statistics[1].statistics[12].value);
			$(".matchAwayPassesPersentValue").append(response.response[0].statistics[1].statistics[15].value);
			$(".matchAwayExpected_goalsValue").append(response.response[0].statistics[1].statistics[16].value); */
			
			var startXINumInt;
			startXINumInt = null;
			
			var startXINumStr;
			startXINumStr = null;
			
			for (i = 0; i < response.response[0].lineups[0].startXI.length; i++) {
				startXINumInt = i;
				startXINumStr = String(i);
				
				$(".matchHomeStartXI" + startXINumStr + "Name").append(response.response[0].lineups[0].startXI[startXINumInt].player.name);
				$(".matchHomeStartXI" + startXINumStr + "Number").append(response.response[0].lineups[0].startXI[startXINumInt].player.number);
				
				$(".matchAwayStartXI" + startXINumStr + "Name").append(response.response[0].lineups[1].startXI[startXINumInt].player.name);
				$(".matchAwayStartXI" + startXINumStr + "Number").append(response.response[0].lineups[1].startXI[startXINumInt].player.number);
			}
			
			var substitutesNumInt;
			substitutesNumInt = null;
			
			var substitutesNumStr;
			substitutesNumStr = null;
			
			for (i = 0; i < response.response[0].lineups[0].substitutes.length; i++) {
				substitutesNumInt = i;
				substitutesNumStr = String(i);
				
				$(".matchHomeSubstitutes" + substitutesNumStr + "Name").append(response.response[0].lineups[0].substitutes[substitutesNumInt].player.name);
				$(".matchHomeSubstitutes" + substitutesNumStr + "Number").append(response.response[0].lineups[0].substitutes[substitutesNumInt].player.number);
				
				$(".matchAwaySubstitutes" + substitutesNumStr + "Name").append(response.response[0].lineups[1].substitutes[substitutesNumInt].player.name);
				$(".matchAwaySubstitutes" + substitutesNumStr + "Number").append(response.response[0].lineups[1].substitutes[substitutesNumInt].player.number);
			}
			
		});
	</script>

	<section class="flex">
		<div class="w-1/5 border-2 border-slate-50 border-r-slate-200">
			<table class="table table-auto">
				<caption class="caption-top mt-2">START11</caption>
				<thead class="text-[8px]">
					<tr>
						<th><div class="flex justify-center">NUM</div></th>
						<th><div class="flex justify-center">NAME</div></th>
					</tr>
				</thead>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="matchHomeStartXI0Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI0Name flex justify-center"></div></td>
					</tr>
				</tbody>	
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">		
						<td><div class="matchHomeStartXI1Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI1Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="matchHomeStartXI2Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI2Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchHomeStartXI3Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI3Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchHomeStartXI4Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI4Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchHomeStartXI5Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI5Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchHomeStartXI6Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI6Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchHomeStartXI7Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI7Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchHomeStartXI8Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI8Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchHomeStartXI9Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI9Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchHomeStartXI10Number flex justify-center"></div></td>
						<td><div class="matchHomeStartXI10Name flex justify-center"></div></td>
					</tr>
				</tbody>
			</table>
			<table class="table table-auto">
				<caption class="caption-top mt-2">SUBSTITUTIONS</caption>
				<thead class="text-[8px]">
					<tr>
						<th><div class="flex justify-center">NUM</div></th>
						<th><div class="flex justify-center">NAME</div></th>
					</tr>
				</thead>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchHomeSubstitutes0Number flex justify-center"></div></td>
						<td><div class="matchHomeSubstitutes0Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchHomeSubstitutes1Number flex justify-center"></div></td>
						<td><div class="matchHomeSubstitutes1Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchHomeSubstitutes2Number flex justify-center"></div></td>
						<td><div class="matchHomeSubstitutes2Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchHomeSubstitutes3Number flex justify-center"></div></td>
						<td><div class="matchHomeSubstitutes3Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchHomeSubstitutes4Number flex justify-center"></div></td>
						<td><div class="matchHomeSubstitutes4Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchHomeSubstitutes5Number flex justify-center"></div></td>
						<td><div class="matchHomeSubstitutes5Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchHomeSubstitutes6Number flex justify-center"></div></td>
						<td><div class="matchHomeSubstitutes6Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchHomeSubstitutes7Number flex justify-center"></div></td>
						<td><div class="matchHomeSubstitutes7Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchHomeSubstitutes8Number flex justify-center"></div></td>
						<td><div class="matchHomeSubstitutes8Name flex justify-center"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="w-1/5">
			<div class="h-72 mt-8 border-2 border-slate-50 border-b-slate-200">
				<div class="matchHomeLogo flex justify-center"></div>
				<div class="matchHomeName flex justify-center mt-2 text-sm"></div>
				<div class="flex justify-center text-[10px]">
					<div class="matchHomeCoachPhoto w-10 h-10 m-2"></div>
					<div class="matchHomeCoachName mx-2 mt-6"></div>
					<div class="matchHomeFormation mx-2 mt-6"></div>
				</div>
				<div class="matchHomeScore flex justify-center text-4xl"></div>
			</div>
			
			<div class="container mx-auto">
				<table class="table table-base">
					<tr>
						<th><div class="matchHomeExpected_goalsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeShotsOnGoalValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeTotalShotsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeCornersValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeBallPossessionValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomePassesPersentValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeGoalkeeperSavesValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeOffsidesValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeFoulsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeYellowCardsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeRedCardsValue flex justify-center"></div></th>
					</tr>
				</table>
			</div>
		</div>	
		
		<div class="w-1/5">
			<div class="h-72 mt-8 border-2 border-slate-50 border-b-slate-200">
				<div class="flex justify-center">
					<div class="matchLeagueLogo w-12"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="matchLeagueFlag w-6 border-2 border-inherit"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="matchDate"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="matchTime"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="matchRound"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<i class="fa-solid fa-ticket m-1"></i><div class="matchStadium"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<i class="fa-solid fa-city m-1"></i><div class="matchCity"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<i class="fa-solid fa-flag m-1"></i><div class="matchReferee"></div>
				</div>
				
				<div class="mt-2 flex justify-center text-[10px]">
					<div class="matchStatus w-12"></div>
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
				<div class="matchAwayLogo flex justify-center"></div>
				<div class="matchAwayName flex justify-center mt-2 text-sm"></div>
				<div class="flex justify-center text-[10px]">
					<div class="matchAwayCoachPhoto w-10 h-10 m-2"></div>
					<div class="matchAwayCoachName mx-2 mt-6"></div>
					<div class="matchAwayFormation mx-2 mt-6"></div>
				</div>
				<div class="matchAwayScore flex justify-center text-4xl"></div>
			</div>
			
			<div class="container mx-auto">
				<table class="table table-base">
					<tr>
						<th><div class="matchAwayExpected_goalsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchAwayShotsOnGoalValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchAwayTotalShotsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchAwayCornersValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchAwayBallPossessionValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchAwayPassesPersentValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchAwayGoalkeeperSavesValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchHomeOffsidesValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchAwayFoulsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchAwayYellowCardsValue flex justify-center"></div></th>
					</tr>
					<tr>
						<th><div class="matchAwayRedCardsValue flex justify-center"></div></th>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="w-1/5 border-2 border-slate-50 border-l-slate-200">
			<table class="table table-auto">
				<caption class="caption-top mt-2">START11</caption>
				<thead class="text-[8px]">
					<tr>
						<th><div class="flex justify-center">NUM</div></th>
						<th><div class="flex justify-center">NAME</div></th>
					</tr>
				</thead>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="matchAwayStartXI0Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI0Name flex justify-center"></div></td>
					</tr>
				</tbody>	
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">		
						<td><div class="matchAwayStartXI1Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI1Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="matchAwayStartXI2Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI2Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchAwayStartXI3Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI3Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchAwayStartXI4Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI4Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchAwayStartXI5Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI5Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchAwayStartXI6Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI6Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchAwayStartXI7Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI7Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchAwayStartXI8Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI8Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchAwayStartXI9Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI9Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">	
						<td><div class="matchAwayStartXI10Number flex justify-center"></div></td>
						<td><div class="matchAwayStartXI10Name flex justify-center"></div></td>
					</tr>
				</tbody>
			</table>
			<table class="table table-auto">
				<caption class="caption-top mt-2">SUBSTITUTIONS</caption>
				<thead class="text-[8px]">
					<tr>
						<th><div class="flex justify-center">NUM</div></th>
						<th><div class="flex justify-center">NAME</div></th>
					</tr>
				</thead>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchAwaySubstitutes0Number flex justify-center"></div></td>
						<td><div class="matchAwaySubstitutes0Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchAwaySubstitutes1Number flex justify-center"></div></td>
						<td><div class="matchAwaySubstitutes1Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchAwaySubstitutes2Number flex justify-center"></div></td>
						<td><div class="matchAwaySubstitutes2Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchAwaySubstitutes3Number flex justify-center"></div></td>
						<td><div class="matchAwaySubstitutes3Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchAwaySubstitutes4Number flex justify-center"></div></td>
						<td><div class="matchAwaySubstitutes4Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchAwaySubstitutes5Number flex justify-center"></div></td>
						<td><div class="matchAwaySubstitutes5Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchAwaySubstitutes6Number flex justify-center"></div></td>
						<td><div class="matchAwaySubstitutes6Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchAwaySubstitutes7Number flex justify-center"></div></td>
						<td><div class="matchAwaySubstitutes7Name flex justify-center"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">	
						<td><div class="matchAwaySubstitutes8Number flex justify-center"></div></td>
						<td><div class="matchAwaySubstitutes8Name flex justify-center"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	
<%@ include file="../common/footer.jsp" %>