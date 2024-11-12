<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/header.jsp" %>

	<script>
		const settings1 = {
			async: true,
			crossDomain: true,
			url: 'https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=2024&timezone=Asia%2FSeoul',
			method: 'GET',
			headers: {
				'x-rapidapi-key': '3a012c58fdmsh42f7e05c92b7f66p1ed97ejsn1660d3e9d81f',
				'x-rapidapi-host': 'api-football-v1.p.rapidapi.com'
			}
		};

		$.ajax(settings1).done(function(response) {
			$(".premierLeagueLogo").append('<img src="' + response.response[0].league.logo + '"/>');
			$(".premierLeagueFlag").append('<img src="' + response.response[0].league.flag + '"/>');
			
			var matchNumInt;
			matchNumInt = null;

			var matchNumStr;
			matchNumStr = null;

			for ( var i = 0; i <= 379; i++ ) {
				matchNumInt = i;
			  	matchNumStr = String(i);
			  
				$(".match" + matchNumStr + "Date").append((response.response[matchNumInt].fixture.date).substring(0, 10));
				$(".match" + matchNumStr + "Time").append((response.response[matchNumInt].fixture.date).substring(11, 16));
				$(".match" + matchNumStr + "Round").append(response.response[matchNumInt].league.round);
				
				if (response.response[matchNumStr].fixture.status.short == "1H" || response.response[matchNumStr].fixture.status.short == "HT" || response.response[matchNumStr].fixture.status.short == "2H") {
					$(".match" + matchNumStr + "Status").append('<div class="flex justify-center bg-green-400 rounded-2xl">' + response.response[matchNumStr].fixture.status.short + '</div>');
				} else {
					$(".match" + matchNumStr + "Status").append('<div class="flex justify-center bg-slate-200 rounded-2xl">' + response.response[matchNumStr].fixture.status.short + '</div>');
				}
				
				if (response.response[matchNumInt].teams.home.id == 40) {
					$(".match" + matchNumStr + "HomeLogo").append('<img src="' + response.response[matchNumInt].teams.home.logo + '" class="h-8 ml-2"/>');
				} else {
					$(".match" + matchNumStr + "HomeLogo").append('<img src="' + response.response[matchNumInt].teams.home.logo + '"/>');
				}
				
				if (response.response[matchNumInt].teams.away.id == 40) {
					$(".match" + matchNumStr + "AwayLogo").append('<img src="' + response.response[matchNumInt].teams.away.logo + '" class="h-8 ml-2"/>');
				} else {
					$(".match" + matchNumStr + "AwayLogo").append('<img src="' + response.response[matchNumInt].teams.away.logo + '"/>');
				}
				
				$(".match" + matchNumStr + "HomeScore").append(response.response[matchNumInt].goals.home);
				$(".match" + matchNumStr + "AwayScore").append(response.response[matchNumInt].goals.away);
				
			}
			
		});
		
		const settings2 = {
				async: true,
				crossDomain: true,
				url: 'https://api-football-v1.p.rapidapi.com/v3/standings?league=39&season=2024',
				method: 'GET',
				headers: {
					'x-rapidapi-key': '3a012c58fdmsh42f7e05c92b7f66p1ed97ejsn1660d3e9d81f',
					'x-rapidapi-host': 'api-football-v1.p.rapidapi.com'
				}
			};

			$.ajax(settings2).done(function (response) {
				for ( var i = 0; i <= 20; i++ ) {
				  	numInt = i;
				  	numStr = String(i);
				  
				  	$(".rank" + numStr).append(response.response[0].league.standings[0][numInt].rank);
				  	
				  	if (response.response[0].league.standings[0][numInt].team.id == 40) {
				  		$(".clubLogo" + numStr).append('<img src="' + response.response[0].league.standings[0][numInt].team.logo + '" class="h-7 ml-1"/>');
				  	} else {
					  	$(".clubLogo" + numStr).append('<img src="' + response.response[0].league.standings[0][numInt].team.logo + '"/>');
				  	}
				  	
				  	$(".match" + numStr).append(response.response[0].league.standings[0][numInt].all.played);
				  	$(".win" + numStr).append(response.response[0].league.standings[0][numInt].all.win);
				  	$(".draw" + numStr).append(response.response[0].league.standings[0][numInt].all.draw);
				  	$(".lose" + numStr).append(response.response[0].league.standings[0][numInt].all.lose);
				  	$(".point" + numStr).append(response.response[0].league.standings[0][numInt].points);
				}
				
			});
	</script>
	
	<section class="flex">
		<div class="w-1/4 flex justify-center border-2 border-slate-50 border-r-slate-200">commercial</div>
		
		<div class="container mx-auto">
			<div class="mt-2 flex justify-center">
				<div class="premierLeagueLogo w-24"></div>
			</div>
			
			<div class="mt-2 flex justify-center">
				<div class="premierLeagueFlag w-6 border-2 border-inherit"></div>
			</div>
			
			<div class="mt-8 text-sm">
				<div class="container mx-auto px-3">
					<div>
						<table class="table table-auto">
							<thead class="text-sm">
								<tr>
									<th>DATE</th>
									<th>TIME</th>
									<th>ROUND</th>
									<th><div class="flex justify-center text-red-400 bg-slate-800 rounded-sm"><i class="fas fa-broadcast-tower mt-1 mr-1" style="color: #ff7a7a;"></i>LIVE</div></th>
									<th>HOME</th>
									<th>SCORE</th>
									<th>AWAY</th>
								</tr>
							</thead>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match0Date mr-5 text-[10px]"></div></td>
									<td><div class="match0Time mr-5 text-[10px]"></div></td>
									<td><div class="match0Round text-[8px]"></div></td>
									<td><div class="match0Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match0HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match0HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match0AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match0AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match1Date mr-5 text-[10px]"></div></td>
									<td><div class="match1Time mr-5 text-[10px]"></div></td>
									<td><div class="match1Round text-[8px]"></div></td>
									<td><div class="match1Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match1HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match1HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match1AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match1AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match2Date mr-5 text-[10px]"></div></td>
									<td><div class="match2Time mr-5 text-[10px]"></div></td>
									<td><div class="match2Round text-[8px]"></div></td>
									<td><div class="match2Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match2HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match2HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match2AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match2AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match3Date mr-5 text-[10px]"></div></td>
									<td><div class="match3Time mr-5 text-[10px]"></div></td>
									<td><div class="match3Round text-[8px]"></div></td>
									<td><div class="match3Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match3HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match3HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match3AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match3AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match4Date mr-5 text-[10px]"></div></td>
									<td><div class="match4Time mr-5 text-[10px]"></div></td>
									<td><div class="match4Round text-[8px]"></div></td>
									<td><div class="match4Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match4HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match4HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match4AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match4AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match5Date mr-5 text-[10px]"></div></td>
									<td><div class="match5Time mr-5 text-[10px]"></div></td>
									<td><div class="match5Round text-[8px]"></div></td>
									<td><div class="match5Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match5HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match5HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match5AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match5AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match6Date mr-5 text-[10px]"></div></td>
									<td><div class="match6Time mr-5 text-[10px]"></div></td>
									<td><div class="match6Round text-[8px]"></div></td>
									<td><div class="match6Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match6HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match6HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match6AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match6AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match7Date mr-5 text-[10px]"></div></td>
									<td><div class="match7Time mr-5 text-[10px]"></div></td>
									<td><div class="match7Round text-[8px]"></div></td>
									<td><div class="match7Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match7HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match7HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match7AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match7AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match8Date mr-5 text-[10px]"></div></td>
									<td><div class="match8Time mr-5 text-[10px]"></div></td>
									<td><div class="match8Round text-[8px]"></div></td>
									<td><div class="match8Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match8HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match8HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match9AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match8AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match9Date mr-5 text-[10px]"></div></td>
									<td><div class="match9Time mr-5 text-[10px]"></div></td>
									<td><div class="match9Round text-[8px]"></div></td>
									<td><div class="match9Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match9HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match9HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match9AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match9AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match10Date mr-5 text-[10px]"></div></td>
									<td><div class="match10Time mr-5 text-[10px]"></div></td>
									<td><div class="match10Round text-[8px]"></div></td>
									<td><div class="match10Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match10HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match10HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match10AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match10AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match11Date mr-5 text-[10px]"></div></td>
									<td><div class="match11Time mr-5 text-[10px]"></div></td>
									<td><div class="match11Round text-[8px]"></div></td>
									<td><div class="match11Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match11HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match11HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match11AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match11AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match12Date mr-5 text-[10px]"></div></td>
									<td><div class="match12Time mr-5 text-[10px]"></div></td>
									<td><div class="match12Round text-[8px]"></div></td>
									<td><div class="match12Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match12HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match12HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match12AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match12AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match13Date mr-5 text-[10px]"></div></td>
									<td><div class="match13Time mr-5 text-[10px]"></div></td>
									<td><div class="match13Round text-[8px]"></div></td>
									<td><div class="match13Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match13HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match13HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match13AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match13AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match14Date mr-5 text-[10px]"></div></td>
									<td><div class="match14Time mr-5 text-[10px]"></div></td>
									<td><div class="match14Round text-[8px]"></div></td>
									<td><div class="match14Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match14HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match14HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match14AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match14AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match15Date mr-5 text-[10px]"></div></td>
									<td><div class="match15Time mr-5 text-[10px]"></div></td>
									<td><div class="match15Round text-[8px]"></div></td>
									<td><div class="match15Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match15HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match15HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match15AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match15AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match16Date mr-5 text-[10px]"></div></td>
									<td><div class="match16Time mr-5 text-[10px]"></div></td>
									<td><div class="match16Round text-[8px]"></div></td>
									<td><div class="match16Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match16HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match16HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match16AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match16AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match17Date mr-5 text-[10px]"></div></td>
									<td><div class="match17Time mr-5 text-[10px]"></div></td>
									<td><div class="match17Round text-[8px]"></div></td>
									<td><div class="match17Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match17HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match17HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match17AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match17AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match18Date mr-5 text-[10px]"></div></td>
									<td><div class="match18Time mr-5 text-[10px]"></div></td>
									<td><div class="match18Round text-[8px]"></div></td>
									<td><div class="match18Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match18HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match18HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match18AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match18AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match19Date mr-5 text-[10px]"></div></td>
									<td><div class="match19Time mr-5 text-[10px]"></div></td>
									<td><div class="match19Round text-[8px]"></div></td>
									<td><div class="match19Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match19HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match19HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match19AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match19AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match20Date mr-5 text-[10px]"></div></td>
									<td><div class="match20Time mr-5 text-[10px]"></div></td>
									<td><div class="match20Round text-[8px]"></div></td>
									<td><div class="match20Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match20HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match20HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match20AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match20AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match21Date mr-5 text-[10px]"></div></td>
									<td><div class="match21Time mr-5 text-[10px]"></div></td>
									<td><div class="match21Round text-[8px]"></div></td>
									<td><div class="match21Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match21HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match21HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match21AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match21AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match22Date mr-5 text-[10px]"></div></td>
									<td><div class="match22Time mr-5 text-[10px]"></div></td>
									<td><div class="match22Round text-[8px]"></div></td>
									<td><div class="match22Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match22HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match22HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match22AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match22AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match23Date mr-5 text-[10px]"></div></td>
									<td><div class="match23Time mr-5 text-[10px]"></div></td>
									<td><div class="match23Round text-[8px]"></div></td>
									<td><div class="match23Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match23HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match23HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match23AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match23AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match24Date mr-5 text-[10px]"></div></td>
									<td><div class="match24Time mr-5 text-[10px]"></div></td>
									<td><div class="match24Round text-[8px]"></div></td>
									<td><div class="match24Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match24HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match24HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match24AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match24AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match25Date mr-5 text-[10px]"></div></td>
									<td><div class="match25Time mr-5 text-[10px]"></div></td>
									<td><div class="match25Round text-[8px]"></div></td>
									<td><div class="match25Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match25HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match25HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match25AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match25AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match26Date mr-5 text-[10px]"></div></td>
									<td><div class="match26Time mr-5 text-[10px]"></div></td>
									<td><div class="match26Round text-[8px]"></div></td>
									<td><div class="match26Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match26HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match26HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match26AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match26AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match27Date mr-5 text-[10px]"></div></td>
									<td><div class="match27Time mr-5 text-[10px]"></div></td>
									<td><div class="match27Round text-[8px]"></div></td>
									<td><div class="match27Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match27HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match27HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match27AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match27AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match28Date mr-5 text-[10px]"></div></td>
									<td><div class="match28Time mr-5 text-[10px]"></div></td>
									<td><div class="match28Round text-[8px]"></div></td>
									<td><div class="match28Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match28HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match28HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match28AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match28AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match29Date mr-5 text-[10px]"></div></td>
									<td><div class="match29Time mr-5 text-[10px]"></div></td>
									<td><div class="match29Round text-[8px]"></div></td>
									<td><div class="match29Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match29HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match29HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match29AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match29AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match30Date mr-5 text-[10px]"></div></td>
									<td><div class="match30Time mr-5 text-[10px]"></div></td>
									<td><div class="match30Round text-[8px]"></div></td>
									<td><div class="match30Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match30HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match30HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match30AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match30AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match31Date mr-5 text-[10px]"></div></td>
									<td><div class="match31Time mr-5 text-[10px]"></div></td>
									<td><div class="match31Round text-[8px]"></div></td>
									<td><div class="match31Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match31HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match31HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match31AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match31AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match32Date mr-5 text-[10px]"></div></td>
									<td><div class="match32Time mr-5 text-[10px]"></div></td>
									<td><div class="match32Round text-[8px]"></div></td>
									<td><div class="match32Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match32HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match32HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match32AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match32AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match33Date mr-5 text-[10px]"></div></td>
									<td><div class="match33Time mr-5 text-[10px]"></div></td>
									<td><div class="match33Round text-[8px]"></div></td>
									<td><div class="match33Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match33HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match33HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match33AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match33AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match34Date mr-5 text-[10px]"></div></td>
									<td><div class="match34Time mr-5 text-[10px]"></div></td>
									<td><div class="match34Round text-[8px]"></div></td>
									<td><div class="match34Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match34HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match34HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match34AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match34AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match35Date mr-5 text-[10px]"></div></td>
									<td><div class="match35Time mr-5 text-[10px]"></div></td>
									<td><div class="match35Round text-[8px]"></div></td>
									<td><div class="match35Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match35HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match35HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match35AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match35AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match36Date mr-5 text-[10px]"></div></td>
									<td><div class="match36Time mr-5 text-[10px]"></div></td>
									<td><div class="match36Round text-[8px]"></div></td>
									<td><div class="match36Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match36HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match36HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match36AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match36AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match37Date mr-5 text-[10px]"></div></td>
									<td><div class="match37Time mr-5 text-[10px]"></div></td>
									<td><div class="match37Round text-[8px]"></div></td>
									<td><div class="match37Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match37HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match37HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match37AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match37AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match38Date mr-5 text-[10px]"></div></td>
									<td><div class="match38Time mr-5 text-[10px]"></div></td>
									<td><div class="match38Round text-[8px]"></div></td>
									<td><div class="match38Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match38HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match38HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match38AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match38AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match39Date mr-5 text-[10px]"></div></td>
									<td><div class="match39Time mr-5 text-[10px]"></div></td>
									<td><div class="match39Round text-[8px]"></div></td>
									<td><div class="match39Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match39HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match39HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match39AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match39AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match40Date mr-5 text-[10px]"></div></td>
									<td><div class="match40Time mr-5 text-[10px]"></div></td>
									<td><div class="match40Round text-[8px]"></div></td>
									<td><div class="match40Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match40HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match40HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match40AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match40AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match41Date mr-5 text-[10px]"></div></td>
									<td><div class="match41Time mr-5 text-[10px]"></div></td>
									<td><div class="match41Round text-[8px]"></div></td>
									<td><div class="match41Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match41HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match41HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match41AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match41AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match42Date mr-5 text-[10px]"></div></td>
									<td><div class="match42Time mr-5 text-[10px]"></div></td>
									<td><div class="match42Round text-[8px]"></div></td>
									<td><div class="match42Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match42HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match42HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match42AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match42AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match43Date mr-5 text-[10px]"></div></td>
									<td><div class="match43Time mr-5 text-[10px]"></div></td>
									<td><div class="match43Round text-[8px]"></div></td>
									<td><div class="match43Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match43HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match43HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match43AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match43AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match44Date mr-5 text-[10px]"></div></td>
									<td><div class="match44Time mr-5 text-[10px]"></div></td>
									<td><div class="match44Round text-[8px]"></div></td>
									<td><div class="match44Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match44HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match44HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match44AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match44AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match45Date mr-5 text-[10px]"></div></td>
									<td><div class="match45Time mr-5 text-[10px]"></div></td>
									<td><div class="match45Round text-[8px]"></div></td>
									<td><div class="match45Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match45HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match45HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match45AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match45AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match46Date mr-5 text-[10px]"></div></td>
									<td><div class="match46Time mr-5 text-[10px]"></div></td>
									<td><div class="match46Round text-[8px]"></div></td>
									<td><div class="match46Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match46HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match46HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match46AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match46AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match47Date mr-5 text-[10px]"></div></td>
									<td><div class="match47Time mr-5 text-[10px]"></div></td>
									<td><div class="match47Round text-[8px]"></div></td>
									<td><div class="match47Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match47HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match47HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match47AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match47AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match48Date mr-5 text-[10px]"></div></td>
									<td><div class="match48Time mr-5 text-[10px]"></div></td>
									<td><div class="match48Round text-[8px]"></div></td>
									<td><div class="match48Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match48HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match48HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match48AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match48AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match49Date mr-5 text-[10px]"></div></td>
									<td><div class="match49Time mr-5 text-[10px]"></div></td>
									<td><div class="match49Round text-[8px]"></div></td>
									<td><div class="match49Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match49HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match49HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match49AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match49AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match50Date mr-5 text-[10px]"></div></td>
									<td><div class="match50Time mr-5 text-[10px]"></div></td>
									<td><div class="match50Round text-[8px]"></div></td>
									<td><div class="match50Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match50HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match50HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match50AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match50AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match51Date mr-5 text-[10px]"></div></td>
									<td><div class="match51Time mr-5 text-[10px]"></div></td>
									<td><div class="match51Round text-[8px]"></div></td>
									<td><div class="match51Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match51HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match51HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match51AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match51AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match52Date mr-5 text-[10px]"></div></td>
									<td><div class="match52Time mr-5 text-[10px]"></div></td>
									<td><div class="match52Round text-[8px]"></div></td>
									<td><div class="match52Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match52HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match52HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match52AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match52AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match53Date mr-5 text-[10px]"></div></td>
									<td><div class="match53Time mr-5 text-[10px]"></div></td>
									<td><div class="match53Round text-[8px]"></div></td>
									<td><div class="match53Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match53HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match53HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match53AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match53AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match54Date mr-5 text-[10px]"></div></td>
									<td><div class="match54Time mr-5 text-[10px]"></div></td>
									<td><div class="match54Round text-[8px]"></div></td>
									<td><div class="match54Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match54HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match54HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match54AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match54AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match55Date mr-5 text-[10px]"></div></td>
									<td><div class="match55Time mr-5 text-[10px]"></div></td>
									<td><div class="match55Round text-[8px]"></div></td>
									<td><div class="match55Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match55HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match55HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match55AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match55AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match56Date mr-5 text-[10px]"></div></td>
									<td><div class="match56Time mr-5 text-[10px]"></div></td>
									<td><div class="match56Round text-[8px]"></div></td>
									<td><div class="match56Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match56HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match56HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match56AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match56AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match57Date mr-5 text-[10px]"></div></td>
									<td><div class="match57Time mr-5 text-[10px]"></div></td>
									<td><div class="match57Round text-[8px]"></div></td>
									<td><div class="match57Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match57HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match57HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match57AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match57AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match58Date mr-5 text-[10px]"></div></td>
									<td><div class="match58Time mr-5 text-[10px]"></div></td>
									<td><div class="match58Round text-[8px]"></div></td>
									<td><div class="match58Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match58HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match58HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match58AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match58AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match59Date mr-5 text-[10px]"></div></td>
									<td><div class="match59Time mr-5 text-[10px]"></div></td>
									<td><div class="match59Round text-[8px]"></div></td>
									<td><div class="match59Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match59HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match59HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match59AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match59AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match60Date mr-5 text-[10px]"></div></td>
									<td><div class="match60Time mr-5 text-[10px]"></div></td>
									<td><div class="match60Round text-[8px]"></div></td>
									<td><div class="match60Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match60HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match60HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match60AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match60AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match61Date mr-5 text-[10px]"></div></td>
									<td><div class="match61Time mr-5 text-[10px]"></div></td>
									<td><div class="match61Round text-[8px]"></div></td>
									<td><div class="match61Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match61HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match61HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match61AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match61AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match62Date mr-5 text-[10px]"></div></td>
									<td><div class="match62Time mr-5 text-[10px]"></div></td>
									<td><div class="match62Round text-[8px]"></div></td>
									<td><div class="match62Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match62HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match62HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match62AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match62AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match63Date mr-5 text-[10px]"></div></td>
									<td><div class="match63Time mr-5 text-[10px]"></div></td>
									<td><div class="match63Round text-[8px]"></div></td>
									<td><div class="match63Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match63HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match63HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match63AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match63AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match64Date mr-5 text-[10px]"></div></td>
									<td><div class="match64Time mr-5 text-[10px]"></div></td>
									<td><div class="match64Round text-[8px]"></div></td>
									<td><div class="match64Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match64HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match64HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match64AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match64AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match65Date mr-5 text-[10px]"></div></td>
									<td><div class="match65Time mr-5 text-[10px]"></div></td>
									<td><div class="match65Round text-[8px]"></div></td>
									<td><div class="match65Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match65HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match65HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match65AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match65AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match66Date mr-5 text-[10px]"></div></td>
									<td><div class="match66Time mr-5 text-[10px]"></div></td>
									<td><div class="match66Round text-[8px]"></div></td>
									<td><div class="match66Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match66HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match66HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match66AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match66AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match67Date mr-5 text-[10px]"></div></td>
									<td><div class="match67Time mr-5 text-[10px]"></div></td>
									<td><div class="match67Round text-[8px]"></div></td>
									<td><div class="match67Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match67HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match67HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match67AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match67AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match68Date mr-5 text-[10px]"></div></td>
									<td><div class="match68Time mr-5 text-[10px]"></div></td>
									<td><div class="match68Round text-[8px]"></div></td>
									<td><div class="match68Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match68HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match68HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match68AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match68AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match69Date mr-5 text-[10px]"></div></td>
									<td><div class="match69Time mr-5 text-[10px]"></div></td>
									<td><div class="match69Round text-[8px]"></div></td>
									<td><div class="match69Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match69HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match69HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match69AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match69AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match70Date mr-5 text-[10px]"></div></td>
									<td><div class="match70Time mr-5 text-[10px]"></div></td>
									<td><div class="match70Round text-[8px]"></div></td>
									<td><div class="match70Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match70HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match70HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match70AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match70AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match71Date mr-5 text-[10px]"></div></td>
									<td><div class="match71Time mr-5 text-[10px]"></div></td>
									<td><div class="match71Round text-[8px]"></div></td>
									<td><div class="match71Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match71HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match71HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match71AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match71AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match72Date mr-5 text-[10px]"></div></td>
									<td><div class="match72Time mr-5 text-[10px]"></div></td>
									<td><div class="match72Round text-[8px]"></div></td>
									<td><div class="match72Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match72HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match72HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match72AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match72AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match73Date mr-5 text-[10px]"></div></td>
									<td><div class="match73Time mr-5 text-[10px]"></div></td>
									<td><div class="match73Round text-[8px]"></div></td>
									<td><div class="match73Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match73HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match73HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match73AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match73AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match74Date mr-5 text-[10px]"></div></td>
									<td><div class="match74Time mr-5 text-[10px]"></div></td>
									<td><div class="match74Round text-[8px]"></div></td>
									<td><div class="match74Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match74HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match74HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match74AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match74AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match75Date mr-5 text-[10px]"></div></td>
									<td><div class="match75Time mr-5 text-[10px]"></div></td>
									<td><div class="match75Round text-[8px]"></div></td>
									<td><div class="match75Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match75HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match75HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match75AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match75AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match76Date mr-5 text-[10px]"></div></td>
									<td><div class="match76Time mr-5 text-[10px]"></div></td>
									<td><div class="match76Round text-[8px]"></div></td>
									<td><div class="match76Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match76HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match76HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match76AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match76AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match77Date mr-5 text-[10px]"></div></td>
									<td><div class="match77Time mr-5 text-[10px]"></div></td>
									<td><div class="match77Round text-[8px]"></div></td>
									<td><div class="match77Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match77HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match77HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match77AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match77AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match78Date mr-5 text-[10px]"></div></td>
									<td><div class="match78Time mr-5 text-[10px]"></div></td>
									<td><div class="match78Round text-[8px]"></div></td>
									<td><div class="match78Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match78HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match78HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match78AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match78AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match79Date mr-5 text-[10px]"></div></td>
									<td><div class="match79Time mr-5 text-[10px]"></div></td>
									<td><div class="match79Round text-[8px]"></div></td>
									<td><div class="match79Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match79HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match79HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match79AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match79AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match80Date mr-5 text-[10px]"></div></td>
									<td><div class="match80Time mr-5 text-[10px]"></div></td>
									<td><div class="match80Round text-[8px]"></div></td>
									<td><div class="match80Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match80HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match80HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match80AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match80AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match81Date mr-5 text-[10px]"></div></td>
									<td><div class="match81Time mr-5 text-[10px]"></div></td>
									<td><div class="match81Round text-[8px]"></div></td>
									<td><div class="match81Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match81HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match81HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match81AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match81AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match82Date mr-5 text-[10px]"></div></td>
									<td><div class="match82Time mr-5 text-[10px]"></div></td>
									<td><div class="match82Round text-[8px]"></div></td>
									<td><div class="match82Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match82HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match82HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match82AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match82AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match83Date mr-5 text-[10px]"></div></td>
									<td><div class="match83Time mr-5 text-[10px]"></div></td>
									<td><div class="match83Round text-[8px]"></div></td>
									<td><div class="match83Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match83HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match83HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match83AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match83AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match84Date mr-5 text-[10px]"></div></td>
									<td><div class="match84Time mr-5 text-[10px]"></div></td>
									<td><div class="match84Round text-[8px]"></div></td>
									<td><div class="match84Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match84HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match84HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match84AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match84AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match85Date mr-5 text-[10px]"></div></td>
									<td><div class="match85Time mr-5 text-[10px]"></div></td>
									<td><div class="match85Round text-[8px]"></div></td>
									<td><div class="match85Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match85HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match85HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match85AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match85AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match86Date mr-5 text-[10px]"></div></td>
									<td><div class="match86Time mr-5 text-[10px]"></div></td>
									<td><div class="match86Round text-[8px]"></div></td>
									<td><div class="match86Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match86HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match86HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match86AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match86AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match87Date mr-5 text-[10px]"></div></td>
									<td><div class="match87Time mr-5 text-[10px]"></div></td>
									<td><div class="match87Round text-[8px]"></div></td>
									<td><div class="match87Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match87HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match87HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match87AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match87AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match88Date mr-5 text-[10px]"></div></td>
									<td><div class="match88Time mr-5 text-[10px]"></div></td>
									<td><div class="match88Round text-[8px]"></div></td>
									<td><div class="match88Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match88HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match88HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match88AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match88AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match89Date mr-5 text-[10px]"></div></td>
									<td><div class="match89Time mr-5 text-[10px]"></div></td>
									<td><div class="match89Round text-[8px]"></div></td>
									<td><div class="match89Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match89HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match89HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match89AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match89AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match90Date mr-5 text-[10px]"></div></td>
									<td><div class="match90Time mr-5 text-[10px]"></div></td>
									<td><div class="match90Round text-[8px]"></div></td>
									<td><div class="match90Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match90HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match90HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match90AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match90AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match91Date mr-5 text-[10px]"></div></td>
									<td><div class="match91Time mr-5 text-[10px]"></div></td>
									<td><div class="match91Round text-[8px]"></div></td>
									<td><div class="match91Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match91HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match91HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match91AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match91AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match92Date mr-5 text-[10px]"></div></td>
									<td><div class="match92Time mr-5 text-[10px]"></div></td>
									<td><div class="match92Round text-[8px]"></div></td>
									<td><div class="match92Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match92HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match92HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match92AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match92AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match93Date mr-5 text-[10px]"></div></td>
									<td><div class="match93Time mr-5 text-[10px]"></div></td>
									<td><div class="match93Round text-[8px]"></div></td>
									<td><div class="match93Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match93HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match93HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match93AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match93AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match94Date mr-5 text-[10px]"></div></td>
									<td><div class="match94Time mr-5 text-[10px]"></div></td>
									<td><div class="match94Round text-[8px]"></div></td>
									<td><div class="match94Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match94HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match94HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match94AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match94AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match95Date mr-5 text-[10px]"></div></td>
									<td><div class="match95Time mr-5 text-[10px]"></div></td>
									<td><div class="match95Round text-[8px]"></div></td>
									<td><div class="match95Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match95HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match95HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match95AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match95AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match96Date mr-5 text-[10px]"></div></td>
									<td><div class="match96Time mr-5 text-[10px]"></div></td>
									<td><div class="match96Round text-[8px]"></div></td>
									<td><div class="match96Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match96HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match96HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match96AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match96AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match97Date mr-5 text-[10px]"></div></td>
									<td><div class="match97Time mr-5 text-[10px]"></div></td>
									<td><div class="match97Round text-[8px]"></div></td>
									<td><div class="match97Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match97HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match97HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match97AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match97AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match98Date mr-5 text-[10px]"></div></td>
									<td><div class="match98Time mr-5 text-[10px]"></div></td>
									<td><div class="match98Round text-[8px]"></div></td>
									<td><div class="match98Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match98HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match98HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match98AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match98AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match99Date mr-5 text-[10px]"></div></td>
									<td><div class="match99Time mr-5 text-[10px]"></div></td>
									<td><div class="match99Round text-[8px]"></div></td>
									<td><div class="match99Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match99HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match99HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match99AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match99AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match100Date mr-5 text-[10px]"></div></td>
									<td><div class="match100Time mr-5 text-[10px]"></div></td>
									<td><div class="match100Round text-[8px]"></div></td>
									<td><div class="match100Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match100HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match100HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match100AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match100AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match101Date mr-5 text-[10px]"></div></td>
									<td><div class="match101Time mr-5 text-[10px]"></div></td>
									<td><div class="match101Round text-[8px]"></div></td>
									<td><div class="match101Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match101HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match101HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match101AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match101AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match102Date mr-5 text-[10px]"></div></td>
									<td><div class="match102Time mr-5 text-[10px]"></div></td>
									<td><div class="match102Round text-[8px]"></div></td>
									<td><div class="match102Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match102HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match102HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match102AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match102AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match103Date mr-5 text-[10px]"></div></td>
									<td><div class="match103Time mr-5 text-[10px]"></div></td>
									<td><div class="match103Round text-[8px]"></div></td>
									<td><div class="match103Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match103HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match103HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match103AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match103AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match104Date mr-5 text-[10px]"></div></td>
									<td><div class="match104Time mr-5 text-[10px]"></div></td>
									<td><div class="match104Round text-[8px]"></div></td>
									<td><div class="match104Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match104HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match104HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match104AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match104AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match105Date mr-5 text-[10px]"></div></td>
									<td><div class="match105Time mr-5 text-[10px]"></div></td>
									<td><div class="match105Round text-[8px]"></div></td>
									<td><div class="match105Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match105HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match105HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match105AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match105AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match106Date mr-5 text-[10px]"></div></td>
									<td><div class="match106Time mr-5 text-[10px]"></div></td>
									<td><div class="match106Round text-[8px]"></div></td>
									<td><div class="match106Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match106HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match106HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match106AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match106AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match107Date mr-5 text-[10px]"></div></td>
									<td><div class="match107Time mr-5 text-[10px]"></div></td>
									<td><div class="match107Round text-[8px]"></div></td>
									<td><div class="match107Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match107HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match107HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match107AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match107AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match108Date mr-5 text-[10px]"></div></td>
									<td><div class="match108Time mr-5 text-[10px]"></div></td>
									<td><div class="match108Round text-[8px]"></div></td>
									<td><div class="match108Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match108HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match108HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match108AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match108AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match109Date mr-5 text-[10px]"></div></td>
									<td><div class="match109Time mr-5 text-[10px]"></div></td>
									<td><div class="match109Round text-[8px]"></div></td>
									<td><div class="match109Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match109HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match109HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match109AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match109AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match110Date mr-5 text-[10px]"></div></td>
									<td><div class="match110Time mr-5 text-[10px]"></div></td>
									<td><div class="match110Round text-[8px]"></div></td>
									<td><div class="match110Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match110HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match110HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match110AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match110AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match111Date mr-5 text-[10px]"></div></td>
									<td><div class="match111Time mr-5 text-[10px]"></div></td>
									<td><div class="match111Round text-[8px]"></div></td>
									<td><div class="match111Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match111HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match111HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match111AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match111AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match112Date mr-5 text-[10px]"></div></td>
									<td><div class="match112Time mr-5 text-[10px]"></div></td>
									<td><div class="match112Round text-[8px]"></div></td>
									<td><div class="match112Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match112HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match112HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match112AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match112AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match113Date mr-5 text-[10px]"></div></td>
									<td><div class="match113Time mr-5 text-[10px]"></div></td>
									<td><div class="match113Round text-[8px]"></div></td>
									<td><div class="match113Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match113HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match113HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match113AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match113AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match114Date mr-5 text-[10px]"></div></td>
									<td><div class="match114Time mr-5 text-[10px]"></div></td>
									<td><div class="match114Round text-[8px]"></div></td>
									<td><div class="match114Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match114HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match114HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match114AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match114AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match115Date mr-5 text-[10px]"></div></td>
									<td><div class="match115Time mr-5 text-[10px]"></div></td>
									<td><div class="match115Round text-[8px]"></div></td>
									<td><div class="match115Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match115HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match115HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match115AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match115AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match116Date mr-5 text-[10px]"></div></td>
									<td><div class="match116Time mr-5 text-[10px]"></div></td>
									<td><div class="match116Round text-[8px]"></div></td>
									<td><div class="match116Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match116HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match116HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match116AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match116AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match117Date mr-5 text-[10px]"></div></td>
									<td><div class="match117Time mr-5 text-[10px]"></div></td>
									<td><div class="match117Round text-[8px]"></div></td>
									<td><div class="match117Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match117HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match117HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match117AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match117AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match118Date mr-5 text-[10px]"></div></td>
									<td><div class="match118Time mr-5 text-[10px]"></div></td>
									<td><div class="match118Round text-[8px]"></div></td>
									<td><div class="match118Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match118HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match118HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match118AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match118AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match119Date mr-5 text-[10px]"></div></td>
									<td><div class="match119Time mr-5 text-[10px]"></div></td>
									<td><div class="match119Round text-[8px]"></div></td>
									<td><div class="match119Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match119HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match119HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match119AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match119AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match120Date mr-5 text-[10px]"></div></td>
									<td><div class="match120Time mr-5 text-[10px]"></div></td>
									<td><div class="match120Round text-[8px]"></div></td>
									<td><div class="match120Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match120HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match120HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match120AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match120AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match121Date mr-5 text-[10px]"></div></td>
									<td><div class="match121Time mr-5 text-[10px]"></div></td>
									<td><div class="match121Round text-[8px]"></div></td>
									<td><div class="match121Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match121HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match121HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match121AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match121AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match122Date mr-5 text-[10px]"></div></td>
									<td><div class="match122Time mr-5 text-[10px]"></div></td>
									<td><div class="match122Round text-[8px]"></div></td>
									<td><div class="match122Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match122HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match122HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match122AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match122AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match123Date mr-5 text-[10px]"></div></td>
									<td><div class="match123Time mr-5 text-[10px]"></div></td>
									<td><div class="match123Round text-[8px]"></div></td>
									<td><div class="match123Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match123HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match123HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match123AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match123AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match124Date mr-5 text-[10px]"></div></td>
									<td><div class="match124Time mr-5 text-[10px]"></div></td>
									<td><div class="match124Round text-[8px]"></div></td>
									<td><div class="match124Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match124HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match124HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match124AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match124AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match125Date mr-5 text-[10px]"></div></td>
									<td><div class="match125Time mr-5 text-[10px]"></div></td>
									<td><div class="match125Round text-[8px]"></div></td>
									<td><div class="match125Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match125HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match125HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match125AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match125AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match126Date mr-5 text-[10px]"></div></td>
									<td><div class="match126Time mr-5 text-[10px]"></div></td>
									<td><div class="match126Round text-[8px]"></div></td>
									<td><div class="match126Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match126HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match126HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match126AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match126AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match127Date mr-5 text-[10px]"></div></td>
									<td><div class="match127Time mr-5 text-[10px]"></div></td>
									<td><div class="match127Round text-[8px]"></div></td>
									<td><div class="match127Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match127HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match127HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match127AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match127AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match128Date mr-5 text-[10px]"></div></td>
									<td><div class="match128Time mr-5 text-[10px]"></div></td>
									<td><div class="match128Round text-[8px]"></div></td>
									<td><div class="match128Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match128HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match128HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match128AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match128AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match129Date mr-5 text-[10px]"></div></td>
									<td><div class="match129Time mr-5 text-[10px]"></div></td>
									<td><div class="match129Round text-[8px]"></div></td>
									<td><div class="match129Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match129HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match129HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match129AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match129AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match130Date mr-5 text-[10px]"></div></td>
									<td><div class="match130Time mr-5 text-[10px]"></div></td>
									<td><div class="match130Round text-[8px]"></div></td>
									<td><div class="match130Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match130HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match130HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match130AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match130AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match131Date mr-5 text-[10px]"></div></td>
									<td><div class="match131Time mr-5 text-[10px]"></div></td>
									<td><div class="match131Round text-[8px]"></div></td>
									<td><div class="match131Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match131HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match131HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match131AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match131AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match132Date mr-5 text-[10px]"></div></td>
									<td><div class="match132Time mr-5 text-[10px]"></div></td>
									<td><div class="match132Round text-[8px]"></div></td>
									<td><div class="match132Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match132HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match132HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match132AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match132AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match133Date mr-5 text-[10px]"></div></td>
									<td><div class="match133Time mr-5 text-[10px]"></div></td>
									<td><div class="match133Round text-[8px]"></div></td>
									<td><div class="match133Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match133HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match133HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match133AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match133AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match134Date mr-5 text-[10px]"></div></td>
									<td><div class="match134Time mr-5 text-[10px]"></div></td>
									<td><div class="match134Round text-[8px]"></div></td>
									<td><div class="match134Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match134HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match134HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match134AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match134AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match135Date mr-5 text-[10px]"></div></td>
									<td><div class="match135Time mr-5 text-[10px]"></div></td>
									<td><div class="match135Round text-[8px]"></div></td>
									<td><div class="match135Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match135HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match135HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match135AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match135AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match136Date mr-5 text-[10px]"></div></td>
									<td><div class="match136Time mr-5 text-[10px]"></div></td>
									<td><div class="match136Round text-[8px]"></div></td>
									<td><div class="match136Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match136HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match136HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match136AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match136AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match137Date mr-5 text-[10px]"></div></td>
									<td><div class="match137Time mr-5 text-[10px]"></div></td>
									<td><div class="match137Round text-[8px]"></div></td>
									<td><div class="match137Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match137HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match137HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match137AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match137AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match138Date mr-5 text-[10px]"></div></td>
									<td><div class="match138Time mr-5 text-[10px]"></div></td>
									<td><div class="match138Round text-[8px]"></div></td>
									<td><div class="match138Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match138HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match138HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match138AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match138AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match139Date mr-5 text-[10px]"></div></td>
									<td><div class="match139Time mr-5 text-[10px]"></div></td>
									<td><div class="match139Round text-[8px]"></div></td>
									<td><div class="match139Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match139HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match139HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match139AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match139AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match140Date mr-5 text-[10px]"></div></td>
									<td><div class="match140Time mr-5 text-[10px]"></div></td>
									<td><div class="match140Round text-[8px]"></div></td>
									<td><div class="match140Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match140HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match140HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match140AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match140AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match141Date mr-5 text-[10px]"></div></td>
									<td><div class="match141Time mr-5 text-[10px]"></div></td>
									<td><div class="match141Round text-[8px]"></div></td>
									<td><div class="match141Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match141HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match141HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match141AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match141AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match142Date mr-5 text-[10px]"></div></td>
									<td><div class="match142Time mr-5 text-[10px]"></div></td>
									<td><div class="match142Round text-[8px]"></div></td>
									<td><div class="match142Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match142HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match142HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match142AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match142AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match143Date mr-5 text-[10px]"></div></td>
									<td><div class="match143Time mr-5 text-[10px]"></div></td>
									<td><div class="match143Round text-[8px]"></div></td>
									<td><div class="match143Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match143HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match143HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match143AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match143AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match144Date mr-5 text-[10px]"></div></td>
									<td><div class="match144Time mr-5 text-[10px]"></div></td>
									<td><div class="match144Round text-[8px]"></div></td>
									<td><div class="match144Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match144HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match144HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match144AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match144AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match145Date mr-5 text-[10px]"></div></td>
									<td><div class="match145Time mr-5 text-[10px]"></div></td>
									<td><div class="match145Round text-[8px]"></div></td>
									<td><div class="match145Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match145HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match145HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match145AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match145AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match146Date mr-5 text-[10px]"></div></td>
									<td><div class="match146Time mr-5 text-[10px]"></div></td>
									<td><div class="match146Round text-[8px]"></div></td>
									<td><div class="match146Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match146HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match146HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match146AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match146AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match147Date mr-5 text-[10px]"></div></td>
									<td><div class="match147Time mr-5 text-[10px]"></div></td>
									<td><div class="match147Round text-[8px]"></div></td>
									<td><div class="match147Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match147HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match147HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match147AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match147AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match148Date mr-5 text-[10px]"></div></td>
									<td><div class="match148Time mr-5 text-[10px]"></div></td>
									<td><div class="match148Round text-[8px]"></div></td>
									<td><div class="match148Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match148HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match148HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match148AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match148AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match149Date mr-5 text-[10px]"></div></td>
									<td><div class="match149Time mr-5 text-[10px]"></div></td>
									<td><div class="match149Round text-[8px]"></div></td>
									<td><div class="match149Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match149HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match149HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match149AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match149AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match150Date mr-5 text-[10px]"></div></td>
									<td><div class="match150Time mr-5 text-[10px]"></div></td>
									<td><div class="match150Round text-[8px]"></div></td>
									<td><div class="match150Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match150HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match150HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match150AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match150AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match151Date mr-5 text-[10px]"></div></td>
									<td><div class="match151Time mr-5 text-[10px]"></div></td>
									<td><div class="match151Round text-[8px]"></div></td>
									<td><div class="match151Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match151HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match151HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match151AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match151AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match152Date mr-5 text-[10px]"></div></td>
									<td><div class="match152Time mr-5 text-[10px]"></div></td>
									<td><div class="match152Round text-[8px]"></div></td>
									<td><div class="match152Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match152HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match152HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match152AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match152AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match153Date mr-5 text-[10px]"></div></td>
									<td><div class="match153Time mr-5 text-[10px]"></div></td>
									<td><div class="match153Round text-[8px]"></div></td>
									<td><div class="match153Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match153HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match153HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match153AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match153AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match154Date mr-5 text-[10px]"></div></td>
									<td><div class="match154Time mr-5 text-[10px]"></div></td>
									<td><div class="match154Round text-[8px]"></div></td>
									<td><div class="match154Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match154HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match154HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match154AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match154AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match155Date mr-5 text-[10px]"></div></td>
									<td><div class="match155Time mr-5 text-[10px]"></div></td>
									<td><div class="match155Round text-[8px]"></div></td>
									<td><div class="match155Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match155HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match155HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match155AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match155AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match156Date mr-5 text-[10px]"></div></td>
									<td><div class="match156Time mr-5 text-[10px]"></div></td>
									<td><div class="match156Round text-[8px]"></div></td>
									<td><div class="match156Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match156HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match156HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match156AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match156AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match157Date mr-5 text-[10px]"></div></td>
									<td><div class="match157Time mr-5 text-[10px]"></div></td>
									<td><div class="match157Round text-[8px]"></div></td>
									<td><div class="match157Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match157HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match157HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match157AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match157AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match158Date mr-5 text-[10px]"></div></td>
									<td><div class="match158Time mr-5 text-[10px]"></div></td>
									<td><div class="match158Round text-[8px]"></div></td>
									<td><div class="match158Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match158HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match158HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match158AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match158AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match159Date mr-5 text-[10px]"></div></td>
									<td><div class="match159Time mr-5 text-[10px]"></div></td>
									<td><div class="match159Round text-[8px]"></div></td>
									<td><div class="match159Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match159HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match159HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match159AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match159AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match160Date mr-5 text-[10px]"></div></td>
									<td><div class="match160Time mr-5 text-[10px]"></div></td>
									<td><div class="match160Round text-[8px]"></div></td>
									<td><div class="match160Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match160HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match160HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match160AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match160AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match161Date mr-5 text-[10px]"></div></td>
									<td><div class="match161Time mr-5 text-[10px]"></div></td>
									<td><div class="match161Round text-[8px]"></div></td>
									<td><div class="match161Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match161HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match161HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match161AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match161AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match162Date mr-5 text-[10px]"></div></td>
									<td><div class="match162Time mr-5 text-[10px]"></div></td>
									<td><div class="match162Round text-[8px]"></div></td>
									<td><div class="match162Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match162HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match162HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match162AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match162AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match163Date mr-5 text-[10px]"></div></td>
									<td><div class="match163Time mr-5 text-[10px]"></div></td>
									<td><div class="match163Round text-[8px]"></div></td>
									<td><div class="match163Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match163HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match163HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match163AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match163AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match164Date mr-5 text-[10px]"></div></td>
									<td><div class="match164Time mr-5 text-[10px]"></div></td>
									<td><div class="match164Round text-[8px]"></div></td>
									<td><div class="match164Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match164HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match164HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match164AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match164AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match165Date mr-5 text-[10px]"></div></td>
									<td><div class="match165Time mr-5 text-[10px]"></div></td>
									<td><div class="match165Round text-[8px]"></div></td>
									<td><div class="match165Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match165HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match165HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match165AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match165AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match166Date mr-5 text-[10px]"></div></td>
									<td><div class="match166Time mr-5 text-[10px]"></div></td>
									<td><div class="match166Round text-[8px]"></div></td>
									<td><div class="match166Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match166HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match166HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match166AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match166AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match167Date mr-5 text-[10px]"></div></td>
									<td><div class="match167Time mr-5 text-[10px]"></div></td>
									<td><div class="match167Round text-[8px]"></div></td>
									<td><div class="match167Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match167HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match167HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match167AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match167AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match168Date mr-5 text-[10px]"></div></td>
									<td><div class="match168Time mr-5 text-[10px]"></div></td>
									<td><div class="match168Round text-[8px]"></div></td>
									<td><div class="match168Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match168HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match168HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match168AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match168AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match169Date mr-5 text-[10px]"></div></td>
									<td><div class="match169Time mr-5 text-[10px]"></div></td>
									<td><div class="match169Round text-[8px]"></div></td>
									<td><div class="match169Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match169HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match169HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match169AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match169AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match170Date mr-5 text-[10px]"></div></td>
									<td><div class="match170Time mr-5 text-[10px]"></div></td>
									<td><div class="match170Round text-[8px]"></div></td>
									<td><div class="match170Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match170HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match170HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match170AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match170AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match171Date mr-5 text-[10px]"></div></td>
									<td><div class="match171Time mr-5 text-[10px]"></div></td>
									<td><div class="match171Round text-[8px]"></div></td>
									<td><div class="match171Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match171HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match171HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match171AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match171AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match172Date mr-5 text-[10px]"></div></td>
									<td><div class="match172Time mr-5 text-[10px]"></div></td>
									<td><div class="match172Round text-[8px]"></div></td>
									<td><div class="match172Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match172HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match172HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match172AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match172AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match173Date mr-5 text-[10px]"></div></td>
									<td><div class="match173Time mr-5 text-[10px]"></div></td>
									<td><div class="match173Round text-[8px]"></div></td>
									<td><div class="match173Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match173HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match173HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match173AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match173AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match174Date mr-5 text-[10px]"></div></td>
									<td><div class="match174Time mr-5 text-[10px]"></div></td>
									<td><div class="match174Round text-[8px]"></div></td>
									<td><div class="match174Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match174HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match174HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match174AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match174AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match175Date mr-5 text-[10px]"></div></td>
									<td><div class="match175Time mr-5 text-[10px]"></div></td>
									<td><div class="match175Round text-[8px]"></div></td>
									<td><div class="match175Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match175HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match175HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match175AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match175AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match176Date mr-5 text-[10px]"></div></td>
									<td><div class="match176Time mr-5 text-[10px]"></div></td>
									<td><div class="match176Round text-[8px]"></div></td>
									<td><div class="match176Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match176HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match176HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match176AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match176AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match177Date mr-5 text-[10px]"></div></td>
									<td><div class="match177Time mr-5 text-[10px]"></div></td>
									<td><div class="match177Round text-[8px]"></div></td>
									<td><div class="match177Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match177HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match177HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match177AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match177AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match178Date mr-5 text-[10px]"></div></td>
									<td><div class="match178Time mr-5 text-[10px]"></div></td>
									<td><div class="match178Round text-[8px]"></div></td>
									<td><div class="match178Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match178HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match178HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match178AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match178AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match179Date mr-5 text-[10px]"></div></td>
									<td><div class="match179Time mr-5 text-[10px]"></div></td>
									<td><div class="match179Round text-[8px]"></div></td>
									<td><div class="match179Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match179HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match179HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match179AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match179AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match180Date mr-5 text-[10px]"></div></td>
									<td><div class="match180Time mr-5 text-[10px]"></div></td>
									<td><div class="match180Round text-[8px]"></div></td>
									<td><div class="match180Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match180HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match180HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match180AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match180AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match181Date mr-5 text-[10px]"></div></td>
									<td><div class="match181Time mr-5 text-[10px]"></div></td>
									<td><div class="match181Round text-[8px]"></div></td>
									<td><div class="match181Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match181HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match181HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match181AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match181AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match182Date mr-5 text-[10px]"></div></td>
									<td><div class="match182Time mr-5 text-[10px]"></div></td>
									<td><div class="match182Round text-[8px]"></div></td>
									<td><div class="match182Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match182HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match182HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match182AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match182AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match183Date mr-5 text-[10px]"></div></td>
									<td><div class="match183Time mr-5 text-[10px]"></div></td>
									<td><div class="match183Round text-[8px]"></div></td>
									<td><div class="match183Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match183HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match183HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match183AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match183AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match184Date mr-5 text-[10px]"></div></td>
									<td><div class="match184Time mr-5 text-[10px]"></div></td>
									<td><div class="match184Round text-[8px]"></div></td>
									<td><div class="match184Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match184HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match184HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match184AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match184AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match185Date mr-5 text-[10px]"></div></td>
									<td><div class="match185Time mr-5 text-[10px]"></div></td>
									<td><div class="match185Round text-[8px]"></div></td>
									<td><div class="match185Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match185HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match185HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match185AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match185AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match186Date mr-5 text-[10px]"></div></td>
									<td><div class="match186Time mr-5 text-[10px]"></div></td>
									<td><div class="match186Round text-[8px]"></div></td>
									<td><div class="match186Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match186HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match186HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match186AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match186AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match187Date mr-5 text-[10px]"></div></td>
									<td><div class="match187Time mr-5 text-[10px]"></div></td>
									<td><div class="match187Round text-[8px]"></div></td>
									<td><div class="match187Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match187HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match187HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match187AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match187AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match188Date mr-5 text-[10px]"></div></td>
									<td><div class="match188Time mr-5 text-[10px]"></div></td>
									<td><div class="match188Round text-[8px]"></div></td>
									<td><div class="match188Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match188HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match188HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match188AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match188AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match189Date mr-5 text-[10px]"></div></td>
									<td><div class="match189Time mr-5 text-[10px]"></div></td>
									<td><div class="match189Round text-[8px]"></div></td>
									<td><div class="match189Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match189HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match189HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match189AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match189AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match190Date mr-5 text-[10px]"></div></td>
									<td><div class="match190Time mr-5 text-[10px]"></div></td>
									<td><div class="match190Round text-[8px]"></div></td>
									<td><div class="match190Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match190HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match190HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match190AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match190AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match191Date mr-5 text-[10px]"></div></td>
									<td><div class="match191Time mr-5 text-[10px]"></div></td>
									<td><div class="match191Round text-[8px]"></div></td>
									<td><div class="match191Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match191HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match191HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match191AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match191AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match192Date mr-5 text-[10px]"></div></td>
									<td><div class="match192Time mr-5 text-[10px]"></div></td>
									<td><div class="match192Round text-[8px]"></div></td>
									<td><div class="match192Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match192HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match192HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match192AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match192AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match193Date mr-5 text-[10px]"></div></td>
									<td><div class="match193Time mr-5 text-[10px]"></div></td>
									<td><div class="match193Round text-[8px]"></div></td>
									<td><div class="match193Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match193HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match193HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match193AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match193AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match194Date mr-5 text-[10px]"></div></td>
									<td><div class="match194Time mr-5 text-[10px]"></div></td>
									<td><div class="match194Round text-[8px]"></div></td>
									<td><div class="match194Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match194HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match194HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match194AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match194AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match195Date mr-5 text-[10px]"></div></td>
									<td><div class="match195Time mr-5 text-[10px]"></div></td>
									<td><div class="match195Round text-[8px]"></div></td>
									<td><div class="match195Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match195HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match195HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match195AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match195AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match196Date mr-5 text-[10px]"></div></td>
									<td><div class="match196Time mr-5 text-[10px]"></div></td>
									<td><div class="match196Round text-[8px]"></div></td>
									<td><div class="match196Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match196HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match196HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match196AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match196AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match197Date mr-5 text-[10px]"></div></td>
									<td><div class="match197Time mr-5 text-[10px]"></div></td>
									<td><div class="match197Round text-[8px]"></div></td>
									<td><div class="match197Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match197HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match197HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match197AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match197AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match198Date mr-5 text-[10px]"></div></td>
									<td><div class="match198Time mr-5 text-[10px]"></div></td>
									<td><div class="match198Round text-[8px]"></div></td>
									<td><div class="match198Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match198HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match198HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match198AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match198AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match199Date mr-5 text-[10px]"></div></td>
									<td><div class="match199Time mr-5 text-[10px]"></div></td>
									<td><div class="match199Round text-[8px]"></div></td>
									<td><div class="match199Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match199HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match199HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match199AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match199AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match200Date mr-5 text-[10px]"></div></td>
									<td><div class="match200Time mr-5 text-[10px]"></div></td>
									<td><div class="match200Round text-[8px]"></div></td>
									<td><div class="match200Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match200HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match200HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match200AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match200AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match201Date mr-5 text-[10px]"></div></td>
									<td><div class="match201Time mr-5 text-[10px]"></div></td>
									<td><div class="match201Round text-[8px]"></div></td>
									<td><div class="match201Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match201HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match201HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match201AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match201AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match202Date mr-5 text-[10px]"></div></td>
									<td><div class="match202Time mr-5 text-[10px]"></div></td>
									<td><div class="match202Round text-[8px]"></div></td>
									<td><div class="match202Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match202HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match202HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match202AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match202AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match203Date mr-5 text-[10px]"></div></td>
									<td><div class="match203Time mr-5 text-[10px]"></div></td>
									<td><div class="match203Round text-[8px]"></div></td>
									<td><div class="match203Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match203HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match203HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match203AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match203AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match204Date mr-5 text-[10px]"></div></td>
									<td><div class="match204Time mr-5 text-[10px]"></div></td>
									<td><div class="match204Round text-[8px]"></div></td>
									<td><div class="match204Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match204HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match204HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match204AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match204AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match205Date mr-5 text-[10px]"></div></td>
									<td><div class="match205Time mr-5 text-[10px]"></div></td>
									<td><div class="match205Round text-[8px]"></div></td>
									<td><div class="match205Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match205HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match205HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match205AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match205AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match206Date mr-5 text-[10px]"></div></td>
									<td><div class="match206Time mr-5 text-[10px]"></div></td>
									<td><div class="match206Round text-[8px]"></div></td>
									<td><div class="match206Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match206HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match206HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match206AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match206AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match207Date mr-5 text-[10px]"></div></td>
									<td><div class="match207Time mr-5 text-[10px]"></div></td>
									<td><div class="match207Round text-[8px]"></div></td>
									<td><div class="match207Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match207HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match207HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match207AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match207AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match208Date mr-5 text-[10px]"></div></td>
									<td><div class="match208Time mr-5 text-[10px]"></div></td>
									<td><div class="match208Round text-[8px]"></div></td>
									<td><div class="match208Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match208HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match208HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match208AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match208AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match209Date mr-5 text-[10px]"></div></td>
									<td><div class="match209Time mr-5 text-[10px]"></div></td>
									<td><div class="match209Round text-[8px]"></div></td>
									<td><div class="match209Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match209HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match209HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match209AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match209AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match210Date mr-5 text-[10px]"></div></td>
									<td><div class="match210Time mr-5 text-[10px]"></div></td>
									<td><div class="match210Round text-[8px]"></div></td>
									<td><div class="match210Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match210HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match210HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match210AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match210AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match211Date mr-5 text-[10px]"></div></td>
									<td><div class="match211Time mr-5 text-[10px]"></div></td>
									<td><div class="match211Round text-[8px]"></div></td>
									<td><div class="match211Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match211HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match211HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match211AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match211AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match212Date mr-5 text-[10px]"></div></td>
									<td><div class="match212Time mr-5 text-[10px]"></div></td>
									<td><div class="match212Round text-[8px]"></div></td>
									<td><div class="match212Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match212HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match212HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match212AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match212AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match213Date mr-5 text-[10px]"></div></td>
									<td><div class="match213Time mr-5 text-[10px]"></div></td>
									<td><div class="match213Round text-[8px]"></div></td>
									<td><div class="match213Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match213HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match213HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match213AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match213AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match214Date mr-5 text-[10px]"></div></td>
									<td><div class="match214Time mr-5 text-[10px]"></div></td>
									<td><div class="match214Round text-[8px]"></div></td>
									<td><div class="match214Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match214HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match214HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match214AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match214AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match215Date mr-5 text-[10px]"></div></td>
									<td><div class="match215Time mr-5 text-[10px]"></div></td>
									<td><div class="match215Round text-[8px]"></div></td>
									<td><div class="match215Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match215HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match215HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match215AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match215AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match216Date mr-5 text-[10px]"></div></td>
									<td><div class="match216Time mr-5 text-[10px]"></div></td>
									<td><div class="match216Round text-[8px]"></div></td>
									<td><div class="match216Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match216HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match216HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match216AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match216AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match217Date mr-5 text-[10px]"></div></td>
									<td><div class="match217Time mr-5 text-[10px]"></div></td>
									<td><div class="match217Round text-[8px]"></div></td>
									<td><div class="match217Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match217HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match217HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match217AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match217AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match218Date mr-5 text-[10px]"></div></td>
									<td><div class="match218Time mr-5 text-[10px]"></div></td>
									<td><div class="match218Round text-[8px]"></div></td>
									<td><div class="match218Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match218HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match218HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match218AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match218AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match219Date mr-5 text-[10px]"></div></td>
									<td><div class="match219Time mr-5 text-[10px]"></div></td>
									<td><div class="match219Round text-[8px]"></div></td>
									<td><div class="match219Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match219HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match219HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match219AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match219AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match220Date mr-5 text-[10px]"></div></td>
									<td><div class="match220Time mr-5 text-[10px]"></div></td>
									<td><div class="match220Round text-[8px]"></div></td>
									<td><div class="match220Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match220HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match220HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match220AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match220AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match221Date mr-5 text-[10px]"></div></td>
									<td><div class="match221Time mr-5 text-[10px]"></div></td>
									<td><div class="match221Round text-[8px]"></div></td>
									<td><div class="match221Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match221HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match221HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match221AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match221AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match222Date mr-5 text-[10px]"></div></td>
									<td><div class="match222Time mr-5 text-[10px]"></div></td>
									<td><div class="match222Round text-[8px]"></div></td>
									<td><div class="match222Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match222HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match222HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match222AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match222AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match223Date mr-5 text-[10px]"></div></td>
									<td><div class="match223Time mr-5 text-[10px]"></div></td>
									<td><div class="match223Round text-[8px]"></div></td>
									<td><div class="match223Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match223HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match223HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match223AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match223AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match224Date mr-5 text-[10px]"></div></td>
									<td><div class="match224Time mr-5 text-[10px]"></div></td>
									<td><div class="match224Round text-[8px]"></div></td>
									<td><div class="match224Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match224HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match224HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match224AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match224AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match225Date mr-5 text-[10px]"></div></td>
									<td><div class="match225Time mr-5 text-[10px]"></div></td>
									<td><div class="match225Round text-[8px]"></div></td>
									<td><div class="match225Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match225HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match225HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match225AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match225AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match226Date mr-5 text-[10px]"></div></td>
									<td><div class="match226Time mr-5 text-[10px]"></div></td>
									<td><div class="match226Round text-[8px]"></div></td>
									<td><div class="match226Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match226HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match226HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match226AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match226AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match227Date mr-5 text-[10px]"></div></td>
									<td><div class="match227Time mr-5 text-[10px]"></div></td>
									<td><div class="match227Round text-[8px]"></div></td>
									<td><div class="match227Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match227HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match227HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match227AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match227AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match228Date mr-5 text-[10px]"></div></td>
									<td><div class="match228Time mr-5 text-[10px]"></div></td>
									<td><div class="match228Round text-[8px]"></div></td>
									<td><div class="match228Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match228HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match228HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match228AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match228AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match229Date mr-5 text-[10px]"></div></td>
									<td><div class="match229Time mr-5 text-[10px]"></div></td>
									<td><div class="match229Round text-[8px]"></div></td>
									<td><div class="match229Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match229HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match229HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match229AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match229AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match230Date mr-5 text-[10px]"></div></td>
									<td><div class="match230Time mr-5 text-[10px]"></div></td>
									<td><div class="match230Round text-[8px]"></div></td>
									<td><div class="match230Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match230HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match230HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match230AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match230AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match231Date mr-5 text-[10px]"></div></td>
									<td><div class="match231Time mr-5 text-[10px]"></div></td>
									<td><div class="match231Round text-[8px]"></div></td>
									<td><div class="match231Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match231HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match231HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match231AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match231AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match232Date mr-5 text-[10px]"></div></td>
									<td><div class="match232Time mr-5 text-[10px]"></div></td>
									<td><div class="match232Round text-[8px]"></div></td>
									<td><div class="match232Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match232HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match232HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match232AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match232AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match233Date mr-5 text-[10px]"></div></td>
									<td><div class="match233Time mr-5 text-[10px]"></div></td>
									<td><div class="match233Round text-[8px]"></div></td>
									<td><div class="match233Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match233HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match233HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match233AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match233AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match234Date mr-5 text-[10px]"></div></td>
									<td><div class="match234Time mr-5 text-[10px]"></div></td>
									<td><div class="match234Round text-[8px]"></div></td>
									<td><div class="match234Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match234HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match234HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match234AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match234AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match235Date mr-5 text-[10px]"></div></td>
									<td><div class="match235Time mr-5 text-[10px]"></div></td>
									<td><div class="match235Round text-[8px]"></div></td>
									<td><div class="match235Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match235HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match235HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match235AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match235AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match236Date mr-5 text-[10px]"></div></td>
									<td><div class="match236Time mr-5 text-[10px]"></div></td>
									<td><div class="match236Round text-[8px]"></div></td>
									<td><div class="match236Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match236HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match236HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match236AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match236AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match237Date mr-5 text-[10px]"></div></td>
									<td><div class="match237Time mr-5 text-[10px]"></div></td>
									<td><div class="match237Round text-[8px]"></div></td>
									<td><div class="match237Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match237HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match237HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match237AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match237AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match238Date mr-5 text-[10px]"></div></td>
									<td><div class="match238Time mr-5 text-[10px]"></div></td>
									<td><div class="match238Round text-[8px]"></div></td>
									<td><div class="match238Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match238HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match238HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match238AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match238AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match239Date mr-5 text-[10px]"></div></td>
									<td><div class="match239Time mr-5 text-[10px]"></div></td>
									<td><div class="match239Round text-[8px]"></div></td>
									<td><div class="match239Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match239HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match239HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match239AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match239AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match240Date mr-5 text-[10px]"></div></td>
									<td><div class="match240Time mr-5 text-[10px]"></div></td>
									<td><div class="match240Round text-[8px]"></div></td>
									<td><div class="match240Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match240HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match240HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match240AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match240AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match241Date mr-5 text-[10px]"></div></td>
									<td><div class="match241Time mr-5 text-[10px]"></div></td>
									<td><div class="match241Round text-[8px]"></div></td>
									<td><div class="match241Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match241HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match241HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match241AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match241AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match242Date mr-5 text-[10px]"></div></td>
									<td><div class="match242Time mr-5 text-[10px]"></div></td>
									<td><div class="match242Round text-[8px]"></div></td>
									<td><div class="match242Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match242HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match242HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match242AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match242AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match243Date mr-5 text-[10px]"></div></td>
									<td><div class="match243Time mr-5 text-[10px]"></div></td>
									<td><div class="match243Round text-[8px]"></div></td>
									<td><div class="match243Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match243HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match243HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match243AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match243AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match244Date mr-5 text-[10px]"></div></td>
									<td><div class="match244Time mr-5 text-[10px]"></div></td>
									<td><div class="match244Round text-[8px]"></div></td>
									<td><div class="match244Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match244HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match244HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match244AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match244AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match245Date mr-5 text-[10px]"></div></td>
									<td><div class="match245Time mr-5 text-[10px]"></div></td>
									<td><div class="match245Round text-[8px]"></div></td>
									<td><div class="match245Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match245HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match245HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match245AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match245AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match246Date mr-5 text-[10px]"></div></td>
									<td><div class="match246Time mr-5 text-[10px]"></div></td>
									<td><div class="match246Round text-[8px]"></div></td>
									<td><div class="match246Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match246HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match246HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match246AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match246AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match247Date mr-5 text-[10px]"></div></td>
									<td><div class="match247Time mr-5 text-[10px]"></div></td>
									<td><div class="match247Round text-[8px]"></div></td>
									<td><div class="match247Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match247HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match247HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match247AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match247AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match248Date mr-5 text-[10px]"></div></td>
									<td><div class="match248Time mr-5 text-[10px]"></div></td>
									<td><div class="match248Round text-[8px]"></div></td>
									<td><div class="match248Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match248HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match248HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match248AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match248AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match249Date mr-5 text-[10px]"></div></td>
									<td><div class="match249Time mr-5 text-[10px]"></div></td>
									<td><div class="match249Round text-[8px]"></div></td>
									<td><div class="match249Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match249HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match249HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match249AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match249AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match250Date mr-5 text-[10px]"></div></td>
									<td><div class="match250Time mr-5 text-[10px]"></div></td>
									<td><div class="match250Round text-[8px]"></div></td>
									<td><div class="match250Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match250HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match250HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match250AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match250AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match251Date mr-5 text-[10px]"></div></td>
									<td><div class="match251Time mr-5 text-[10px]"></div></td>
									<td><div class="match251Round text-[8px]"></div></td>
									<td><div class="match251Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match251HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match251HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match251AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match251AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match252Date mr-5 text-[10px]"></div></td>
									<td><div class="match252Time mr-5 text-[10px]"></div></td>
									<td><div class="match252Round text-[8px]"></div></td>
									<td><div class="match252Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match252HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match252HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match252AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match252AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match253Date mr-5 text-[10px]"></div></td>
									<td><div class="match253Time mr-5 text-[10px]"></div></td>
									<td><div class="match253Round text-[8px]"></div></td>
									<td><div class="match253Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match253HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match253HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match253AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match253AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match254Date mr-5 text-[10px]"></div></td>
									<td><div class="match254Time mr-5 text-[10px]"></div></td>
									<td><div class="match254Round text-[8px]"></div></td>
									<td><div class="match254Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match254HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match254HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match254AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match254AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match255Date mr-5 text-[10px]"></div></td>
									<td><div class="match255Time mr-5 text-[10px]"></div></td>
									<td><div class="match255Round text-[8px]"></div></td>
									<td><div class="match255Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match255HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match255HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match255AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match255AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match256Date mr-5 text-[10px]"></div></td>
									<td><div class="match256Time mr-5 text-[10px]"></div></td>
									<td><div class="match256Round text-[8px]"></div></td>
									<td><div class="match256Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match256HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match256HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match256AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match256AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match257Date mr-5 text-[10px]"></div></td>
									<td><div class="match257Time mr-5 text-[10px]"></div></td>
									<td><div class="match257Round text-[8px]"></div></td>
									<td><div class="match257Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match257HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match257HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match257AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match257AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match258Date mr-5 text-[10px]"></div></td>
									<td><div class="match258Time mr-5 text-[10px]"></div></td>
									<td><div class="match258Round text-[8px]"></div></td>
									<td><div class="match258Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match258HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match258HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match258AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match258AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match259Date mr-5 text-[10px]"></div></td>
									<td><div class="match259Time mr-5 text-[10px]"></div></td>
									<td><div class="match259Round text-[8px]"></div></td>
									<td><div class="match259Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match259HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match259HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match259AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match259AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match260Date mr-5 text-[10px]"></div></td>
									<td><div class="match260Time mr-5 text-[10px]"></div></td>
									<td><div class="match260Round text-[8px]"></div></td>
									<td><div class="match260Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match260HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match260HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match260AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match260AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match261Date mr-5 text-[10px]"></div></td>
									<td><div class="match261Time mr-5 text-[10px]"></div></td>
									<td><div class="match261Round text-[8px]"></div></td>
									<td><div class="match261Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match261HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match261HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match261AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match261AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match262Date mr-5 text-[10px]"></div></td>
									<td><div class="match262Time mr-5 text-[10px]"></div></td>
									<td><div class="match262Round text-[8px]"></div></td>
									<td><div class="match262Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match262HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match262HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match262AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match262AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match263Date mr-5 text-[10px]"></div></td>
									<td><div class="match263Time mr-5 text-[10px]"></div></td>
									<td><div class="match263Round text-[8px]"></div></td>
									<td><div class="match263Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match263HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match263HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match263AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match263AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match264Date mr-5 text-[10px]"></div></td>
									<td><div class="match264Time mr-5 text-[10px]"></div></td>
									<td><div class="match264Round text-[8px]"></div></td>
									<td><div class="match264Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match264HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match264HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match264AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match264AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match265Date mr-5 text-[10px]"></div></td>
									<td><div class="match265Time mr-5 text-[10px]"></div></td>
									<td><div class="match265Round text-[8px]"></div></td>
									<td><div class="match265Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match265HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match265HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match265AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match265AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match266Date mr-5 text-[10px]"></div></td>
									<td><div class="match266Time mr-5 text-[10px]"></div></td>
									<td><div class="match266Round text-[8px]"></div></td>
									<td><div class="match266Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match266HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match266HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match266AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match266AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match267Date mr-5 text-[10px]"></div></td>
									<td><div class="match267Time mr-5 text-[10px]"></div></td>
									<td><div class="match267Round text-[8px]"></div></td>
									<td><div class="match267Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match267HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match267HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match267AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match267AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match268Date mr-5 text-[10px]"></div></td>
									<td><div class="match268Time mr-5 text-[10px]"></div></td>
									<td><div class="match268Round text-[8px]"></div></td>
									<td><div class="match268Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match268HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match268HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match268AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match268AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match269Date mr-5 text-[10px]"></div></td>
									<td><div class="match269Time mr-5 text-[10px]"></div></td>
									<td><div class="match269Round text-[8px]"></div></td>
									<td><div class="match269Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match269HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match269HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match269AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match269AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match270Date mr-5 text-[10px]"></div></td>
									<td><div class="match270Time mr-5 text-[10px]"></div></td>
									<td><div class="match270Round text-[8px]"></div></td>
									<td><div class="match270Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match270HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match270HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match270AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match270AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match271Date mr-5 text-[10px]"></div></td>
									<td><div class="match271Time mr-5 text-[10px]"></div></td>
									<td><div class="match271Round text-[8px]"></div></td>
									<td><div class="match271Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match271HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match271HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match271AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match271AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match272Date mr-5 text-[10px]"></div></td>
									<td><div class="match272Time mr-5 text-[10px]"></div></td>
									<td><div class="match272Round text-[8px]"></div></td>
									<td><div class="match272Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match272HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match272HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match272AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match272AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match273Date mr-5 text-[10px]"></div></td>
									<td><div class="match273Time mr-5 text-[10px]"></div></td>
									<td><div class="match273Round text-[8px]"></div></td>
									<td><div class="match273Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match273HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match273HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match273AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match273AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match274Date mr-5 text-[10px]"></div></td>
									<td><div class="match274Time mr-5 text-[10px]"></div></td>
									<td><div class="match274Round text-[8px]"></div></td>
									<td><div class="match274Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match274HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match274HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match274AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match274AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match275Date mr-5 text-[10px]"></div></td>
									<td><div class="match275Time mr-5 text-[10px]"></div></td>
									<td><div class="match275Round text-[8px]"></div></td>
									<td><div class="match275Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match275HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match275HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match275AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match275AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match276Date mr-5 text-[10px]"></div></td>
									<td><div class="match276Time mr-5 text-[10px]"></div></td>
									<td><div class="match276Round text-[8px]"></div></td>
									<td><div class="match276Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match276HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match276HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match276AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match276AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match277Date mr-5 text-[10px]"></div></td>
									<td><div class="match277Time mr-5 text-[10px]"></div></td>
									<td><div class="match277Round text-[8px]"></div></td>
									<td><div class="match277Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match277HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match277HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match277AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match277AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match278Date mr-5 text-[10px]"></div></td>
									<td><div class="match278Time mr-5 text-[10px]"></div></td>
									<td><div class="match278Round text-[8px]"></div></td>
									<td><div class="match278Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match278HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match278HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match278AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match278AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match279Date mr-5 text-[10px]"></div></td>
									<td><div class="match279Time mr-5 text-[10px]"></div></td>
									<td><div class="match279Round text-[8px]"></div></td>
									<td><div class="match279Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match279HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match279HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match279AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match279AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match280Date mr-5 text-[10px]"></div></td>
									<td><div class="match280Time mr-5 text-[10px]"></div></td>
									<td><div class="match280Round text-[8px]"></div></td>
									<td><div class="match280Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match280HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match280HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match280AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match280AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match281Date mr-5 text-[10px]"></div></td>
									<td><div class="match281Time mr-5 text-[10px]"></div></td>
									<td><div class="match281Round text-[8px]"></div></td>
									<td><div class="match281Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match281HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match281HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match281AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match281AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match282Date mr-5 text-[10px]"></div></td>
									<td><div class="match282Time mr-5 text-[10px]"></div></td>
									<td><div class="match282Round text-[8px]"></div></td>
									<td><div class="match282Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match282HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match282HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match282AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match282AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match283Date mr-5 text-[10px]"></div></td>
									<td><div class="match283Time mr-5 text-[10px]"></div></td>
									<td><div class="match283Round text-[8px]"></div></td>
									<td><div class="match283Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match283HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match283HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match283AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match283AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match284Date mr-5 text-[10px]"></div></td>
									<td><div class="match284Time mr-5 text-[10px]"></div></td>
									<td><div class="match284Round text-[8px]"></div></td>
									<td><div class="match284Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match284HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match284HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match284AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match284AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match285Date mr-5 text-[10px]"></div></td>
									<td><div class="match285Time mr-5 text-[10px]"></div></td>
									<td><div class="match285Round text-[8px]"></div></td>
									<td><div class="match285Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match285HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match285HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match285AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match285AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match286Date mr-5 text-[10px]"></div></td>
									<td><div class="match286Time mr-5 text-[10px]"></div></td>
									<td><div class="match286Round text-[8px]"></div></td>
									<td><div class="match286Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match286HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match286HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match286AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match286AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match287Date mr-5 text-[10px]"></div></td>
									<td><div class="match287Time mr-5 text-[10px]"></div></td>
									<td><div class="match287Round text-[8px]"></div></td>
									<td><div class="match287Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match287HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match287HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match287AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match287AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match288Date mr-5 text-[10px]"></div></td>
									<td><div class="match288Time mr-5 text-[10px]"></div></td>
									<td><div class="match288Round text-[8px]"></div></td>
									<td><div class="match288Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match288HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match288HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match288AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match288AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match289Date mr-5 text-[10px]"></div></td>
									<td><div class="match289Time mr-5 text-[10px]"></div></td>
									<td><div class="match289Round text-[8px]"></div></td>
									<td><div class="match289Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match289HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match289HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match289AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match289AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match290Date mr-5 text-[10px]"></div></td>
									<td><div class="match290Time mr-5 text-[10px]"></div></td>
									<td><div class="match290Round text-[8px]"></div></td>
									<td><div class="match290Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match290HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match290HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match290AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match290AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match291Date mr-5 text-[10px]"></div></td>
									<td><div class="match291Time mr-5 text-[10px]"></div></td>
									<td><div class="match291Round text-[8px]"></div></td>
									<td><div class="match291Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match291HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match291HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match291AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match291AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match292Date mr-5 text-[10px]"></div></td>
									<td><div class="match292Time mr-5 text-[10px]"></div></td>
									<td><div class="match292Round text-[8px]"></div></td>
									<td><div class="match292Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match292HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match292HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match292AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match292AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match293Date mr-5 text-[10px]"></div></td>
									<td><div class="match293Time mr-5 text-[10px]"></div></td>
									<td><div class="match293Round text-[8px]"></div></td>
									<td><div class="match293Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match293HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match293HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match293AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match293AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match294Date mr-5 text-[10px]"></div></td>
									<td><div class="match294Time mr-5 text-[10px]"></div></td>
									<td><div class="match294Round text-[8px]"></div></td>
									<td><div class="match294Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match294HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match294HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match294AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match294AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match295Date mr-5 text-[10px]"></div></td>
									<td><div class="match295Time mr-5 text-[10px]"></div></td>
									<td><div class="match295Round text-[8px]"></div></td>
									<td><div class="match295Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match295HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match295HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match295AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match295AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match296Date mr-5 text-[10px]"></div></td>
									<td><div class="match296Time mr-5 text-[10px]"></div></td>
									<td><div class="match296Round text-[8px]"></div></td>
									<td><div class="match296Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match296HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match296HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match296AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match296AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match297Date mr-5 text-[10px]"></div></td>
									<td><div class="match297Time mr-5 text-[10px]"></div></td>
									<td><div class="match297Round text-[8px]"></div></td>
									<td><div class="match297Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match297HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match297HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match297AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match297AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match298Date mr-5 text-[10px]"></div></td>
									<td><div class="match298Time mr-5 text-[10px]"></div></td>
									<td><div class="match298Round text-[8px]"></div></td>
									<td><div class="match298Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match298HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match298HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match298AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match298AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match299Date mr-5 text-[10px]"></div></td>
									<td><div class="match299Time mr-5 text-[10px]"></div></td>
									<td><div class="match299Round text-[8px]"></div></td>
									<td><div class="match299Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match299HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match299HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match299AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match299AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match300Date mr-5 text-[10px]"></div></td>
									<td><div class="match300Time mr-5 text-[10px]"></div></td>
									<td><div class="match300Round text-[8px]"></div></td>
									<td><div class="match300Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match300HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match300HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match300AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match300AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match301Date mr-5 text-[10px]"></div></td>
									<td><div class="match301Time mr-5 text-[10px]"></div></td>
									<td><div class="match301Round text-[8px]"></div></td>
									<td><div class="match301Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match301HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match301HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match301AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match301AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match302Date mr-5 text-[10px]"></div></td>
									<td><div class="match302Time mr-5 text-[10px]"></div></td>
									<td><div class="match302Round text-[8px]"></div></td>
									<td><div class="match302Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match302HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match302HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match302AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match302AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match303Date mr-5 text-[10px]"></div></td>
									<td><div class="match303Time mr-5 text-[10px]"></div></td>
									<td><div class="match303Round text-[8px]"></div></td>
									<td><div class="match303Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match303HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match303HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match303AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match303AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match304Date mr-5 text-[10px]"></div></td>
									<td><div class="match304Time mr-5 text-[10px]"></div></td>
									<td><div class="match304Round text-[8px]"></div></td>
									<td><div class="match304Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match304HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match304HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match304AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match304AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match305Date mr-5 text-[10px]"></div></td>
									<td><div class="match305Time mr-5 text-[10px]"></div></td>
									<td><div class="match305Round text-[8px]"></div></td>
									<td><div class="match305Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match305HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match305HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match305AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match305AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match306Date mr-5 text-[10px]"></div></td>
									<td><div class="match306Time mr-5 text-[10px]"></div></td>
									<td><div class="match306Round text-[8px]"></div></td>
									<td><div class="match306Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match306HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match306HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match306AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match306AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match307Date mr-5 text-[10px]"></div></td>
									<td><div class="match307Time mr-5 text-[10px]"></div></td>
									<td><div class="match307Round text-[8px]"></div></td>
									<td><div class="match307Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match307HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match307HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match307AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match307AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match308Date mr-5 text-[10px]"></div></td>
									<td><div class="match308Time mr-5 text-[10px]"></div></td>
									<td><div class="match308Round text-[8px]"></div></td>
									<td><div class="match308Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match308HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match308HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match308AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match308AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match309Date mr-5 text-[10px]"></div></td>
									<td><div class="match309Time mr-5 text-[10px]"></div></td>
									<td><div class="match309Round text-[8px]"></div></td>
									<td><div class="match309Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match309HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match309HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match309AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match309AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match310Date mr-5 text-[10px]"></div></td>
									<td><div class="match310Time mr-5 text-[10px]"></div></td>
									<td><div class="match310Round text-[8px]"></div></td>
									<td><div class="match310Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match310HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match310HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match310AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match310AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match311Date mr-5 text-[10px]"></div></td>
									<td><div class="match311Time mr-5 text-[10px]"></div></td>
									<td><div class="match311Round text-[8px]"></div></td>
									<td><div class="match311Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match311HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match311HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match311AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match311AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match312Date mr-5 text-[10px]"></div></td>
									<td><div class="match312Time mr-5 text-[10px]"></div></td>
									<td><div class="match312Round text-[8px]"></div></td>
									<td><div class="match312Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match312HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match312HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match312AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match312AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match313Date mr-5 text-[10px]"></div></td>
									<td><div class="match313Time mr-5 text-[10px]"></div></td>
									<td><div class="match313Round text-[8px]"></div></td>
									<td><div class="match313Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match313HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match313HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match313AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match313AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match314Date mr-5 text-[10px]"></div></td>
									<td><div class="match314Time mr-5 text-[10px]"></div></td>
									<td><div class="match314Round text-[8px]"></div></td>
									<td><div class="match314Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match314HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match314HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match314AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match314AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match315Date mr-5 text-[10px]"></div></td>
									<td><div class="match315Time mr-5 text-[10px]"></div></td>
									<td><div class="match315Round text-[8px]"></div></td>
									<td><div class="match315Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match315HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match315HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match315AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match315AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match316Date mr-5 text-[10px]"></div></td>
									<td><div class="match316Time mr-5 text-[10px]"></div></td>
									<td><div class="match316Round text-[8px]"></div></td>
									<td><div class="match316Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match316HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match316HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match316AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match316AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match317Date mr-5 text-[10px]"></div></td>
									<td><div class="match317Time mr-5 text-[10px]"></div></td>
									<td><div class="match317Round text-[8px]"></div></td>
									<td><div class="match317Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match317HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match317HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match317AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match317AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match318Date mr-5 text-[10px]"></div></td>
									<td><div class="match318Time mr-5 text-[10px]"></div></td>
									<td><div class="match318Round text-[8px]"></div></td>
									<td><div class="match318Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match318HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match318HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match318AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match318AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match319Date mr-5 text-[10px]"></div></td>
									<td><div class="match319Time mr-5 text-[10px]"></div></td>
									<td><div class="match319Round text-[8px]"></div></td>
									<td><div class="match319Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match319HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match319HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match319AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match319AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match320Date mr-5 text-[10px]"></div></td>
									<td><div class="match320Time mr-5 text-[10px]"></div></td>
									<td><div class="match320Round text-[8px]"></div></td>
									<td><div class="match320Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match320HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match320HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match320AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match320AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match321Date mr-5 text-[10px]"></div></td>
									<td><div class="match321Time mr-5 text-[10px]"></div></td>
									<td><div class="match321Round text-[8px]"></div></td>
									<td><div class="match321Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match321HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match321HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match321AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match321AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match322Date mr-5 text-[10px]"></div></td>
									<td><div class="match322Time mr-5 text-[10px]"></div></td>
									<td><div class="match322Round text-[8px]"></div></td>
									<td><div class="match322Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match322HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match322HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match322AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match322AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match323Date mr-5 text-[10px]"></div></td>
									<td><div class="match323Time mr-5 text-[10px]"></div></td>
									<td><div class="match323Round text-[8px]"></div></td>
									<td><div class="match323Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match323HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match323HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match323AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match323AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match324Date mr-5 text-[10px]"></div></td>
									<td><div class="match324Time mr-5 text-[10px]"></div></td>
									<td><div class="match324Round text-[8px]"></div></td>
									<td><div class="match324Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match324HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match324HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match324AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match324AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match325Date mr-5 text-[10px]"></div></td>
									<td><div class="match325Time mr-5 text-[10px]"></div></td>
									<td><div class="match325Round text-[8px]"></div></td>
									<td><div class="match325Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match325HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match325HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match325AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match325AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match326Date mr-5 text-[10px]"></div></td>
									<td><div class="match326Time mr-5 text-[10px]"></div></td>
									<td><div class="match326Round text-[8px]"></div></td>
									<td><div class="match326Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match326HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match326HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match326AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match326AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match327Date mr-5 text-[10px]"></div></td>
									<td><div class="match327Time mr-5 text-[10px]"></div></td>
									<td><div class="match327Round text-[8px]"></div></td>
									<td><div class="match327Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match327HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match327HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match327AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match327AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match328Date mr-5 text-[10px]"></div></td>
									<td><div class="match328Time mr-5 text-[10px]"></div></td>
									<td><div class="match328Round text-[8px]"></div></td>
									<td><div class="match328Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match328HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match328HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match328AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match328AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match329Date mr-5 text-[10px]"></div></td>
									<td><div class="match329Time mr-5 text-[10px]"></div></td>
									<td><div class="match329Round text-[8px]"></div></td>
									<td><div class="match329Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match329HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match329HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match329AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match329AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match330Date mr-5 text-[10px]"></div></td>
									<td><div class="match330Time mr-5 text-[10px]"></div></td>
									<td><div class="match330Round text-[8px]"></div></td>
									<td><div class="match330Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match330HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match330HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match330AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match330AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match331Date mr-5 text-[10px]"></div></td>
									<td><div class="match331Time mr-5 text-[10px]"></div></td>
									<td><div class="match331Round text-[8px]"></div></td>
									<td><div class="match331Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match331HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match331HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match331AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match331AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match332Date mr-5 text-[10px]"></div></td>
									<td><div class="match332Time mr-5 text-[10px]"></div></td>
									<td><div class="match332Round text-[8px]"></div></td>
									<td><div class="match332Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match332HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match332HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match332AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match332AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match333Date mr-5 text-[10px]"></div></td>
									<td><div class="match333Time mr-5 text-[10px]"></div></td>
									<td><div class="match333Round text-[8px]"></div></td>
									<td><div class="match333Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match333HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match333HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match333AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match333AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match334Date mr-5 text-[10px]"></div></td>
									<td><div class="match334Time mr-5 text-[10px]"></div></td>
									<td><div class="match334Round text-[8px]"></div></td>
									<td><div class="match334Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match334HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match334HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match334AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match334AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match335Date mr-5 text-[10px]"></div></td>
									<td><div class="match335Time mr-5 text-[10px]"></div></td>
									<td><div class="match335Round text-[8px]"></div></td>
									<td><div class="match335Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match335HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match335HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match335AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match335AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match336Date mr-5 text-[10px]"></div></td>
									<td><div class="match336Time mr-5 text-[10px]"></div></td>
									<td><div class="match336Round text-[8px]"></div></td>
									<td><div class="match336Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match336HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match336HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match336AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match336AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match337Date mr-5 text-[10px]"></div></td>
									<td><div class="match337Time mr-5 text-[10px]"></div></td>
									<td><div class="match337Round text-[8px]"></div></td>
									<td><div class="match337Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match337HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match337HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match337AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match337AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match338Date mr-5 text-[10px]"></div></td>
									<td><div class="match338Time mr-5 text-[10px]"></div></td>
									<td><div class="match338Round text-[8px]"></div></td>
									<td><div class="match338Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match338HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match338HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match338AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match338AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match339Date mr-5 text-[10px]"></div></td>
									<td><div class="match339Time mr-5 text-[10px]"></div></td>
									<td><div class="match339Round text-[8px]"></div></td>
									<td><div class="match339Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match339HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match339HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match339AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match339AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match340Date mr-5 text-[10px]"></div></td>
									<td><div class="match340Time mr-5 text-[10px]"></div></td>
									<td><div class="match340Round text-[8px]"></div></td>
									<td><div class="match340Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match340HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match340HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match340AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match340AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match341Date mr-5 text-[10px]"></div></td>
									<td><div class="match341Time mr-5 text-[10px]"></div></td>
									<td><div class="match341Round text-[8px]"></div></td>
									<td><div class="match341Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match341HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match341HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match341AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match341AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match342Date mr-5 text-[10px]"></div></td>
									<td><div class="match342Time mr-5 text-[10px]"></div></td>
									<td><div class="match342Round text-[8px]"></div></td>
									<td><div class="match342Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match342HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match342HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match342AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match342AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match343Date mr-5 text-[10px]"></div></td>
									<td><div class="match343Time mr-5 text-[10px]"></div></td>
									<td><div class="match343Round text-[8px]"></div></td>
									<td><div class="match343Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match343HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match343HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match343AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match343AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match344Date mr-5 text-[10px]"></div></td>
									<td><div class="match344Time mr-5 text-[10px]"></div></td>
									<td><div class="match344Round text-[8px]"></div></td>
									<td><div class="match344Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match344HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match344HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match344AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match344AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match345Date mr-5 text-[10px]"></div></td>
									<td><div class="match345Time mr-5 text-[10px]"></div></td>
									<td><div class="match345Round text-[8px]"></div></td>
									<td><div class="match345Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match345HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match345HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match345AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match345AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match346Date mr-5 text-[10px]"></div></td>
									<td><div class="match346Time mr-5 text-[10px]"></div></td>
									<td><div class="match346Round text-[8px]"></div></td>
									<td><div class="match346Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match346HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match346HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match346AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match346AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match347Date mr-5 text-[10px]"></div></td>
									<td><div class="match347Time mr-5 text-[10px]"></div></td>
									<td><div class="match347Round text-[8px]"></div></td>
									<td><div class="match347Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match347HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match347HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match347AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match347AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match348Date mr-5 text-[10px]"></div></td>
									<td><div class="match348Time mr-5 text-[10px]"></div></td>
									<td><div class="match348Round text-[8px]"></div></td>
									<td><div class="match348Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match348HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match348HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match348AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match348AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match349Date mr-5 text-[10px]"></div></td>
									<td><div class="match349Time mr-5 text-[10px]"></div></td>
									<td><div class="match349Round text-[8px]"></div></td>
									<td><div class="match349Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match349HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match349HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match349AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match349AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match350Date mr-5 text-[10px]"></div></td>
									<td><div class="match350Time mr-5 text-[10px]"></div></td>
									<td><div class="match350Round text-[8px]"></div></td>
									<td><div class="match350Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match350HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match350HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match350AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match350AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match351Date mr-5 text-[10px]"></div></td>
									<td><div class="match351Time mr-5 text-[10px]"></div></td>
									<td><div class="match351Round text-[8px]"></div></td>
									<td><div class="match351Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match351HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match351HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match351AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match351AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match352Date mr-5 text-[10px]"></div></td>
									<td><div class="match352Time mr-5 text-[10px]"></div></td>
									<td><div class="match352Round text-[8px]"></div></td>
									<td><div class="match352Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match352HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match352HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match352AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match352AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match353Date mr-5 text-[10px]"></div></td>
									<td><div class="match353Time mr-5 text-[10px]"></div></td>
									<td><div class="match353Round text-[8px]"></div></td>
									<td><div class="match353Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match353HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match353HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match353AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match353AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match354Date mr-5 text-[10px]"></div></td>
									<td><div class="match354Time mr-5 text-[10px]"></div></td>
									<td><div class="match354Round text-[8px]"></div></td>
									<td><div class="match354Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match354HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match354HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match354AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match354AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match355Date mr-5 text-[10px]"></div></td>
									<td><div class="match355Time mr-5 text-[10px]"></div></td>
									<td><div class="match355Round text-[8px]"></div></td>
									<td><div class="match355Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match355HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match355HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match355AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match355AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match356Date mr-5 text-[10px]"></div></td>
									<td><div class="match356Time mr-5 text-[10px]"></div></td>
									<td><div class="match356Round text-[8px]"></div></td>
									<td><div class="match356Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match356HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match356HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match356AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match356AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match357Date mr-5 text-[10px]"></div></td>
									<td><div class="match357Time mr-5 text-[10px]"></div></td>
									<td><div class="match357Round text-[8px]"></div></td>
									<td><div class="match357Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match357HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match357HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match357AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match357AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match358Date mr-5 text-[10px]"></div></td>
									<td><div class="match358Time mr-5 text-[10px]"></div></td>
									<td><div class="match358Round text-[8px]"></div></td>
									<td><div class="match358Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match358HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match358HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match358AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match358AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match359Date mr-5 text-[10px]"></div></td>
									<td><div class="match359Time mr-5 text-[10px]"></div></td>
									<td><div class="match359Round text-[8px]"></div></td>
									<td><div class="match359Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match359HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match359HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match359AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match359AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match360Date mr-5 text-[10px]"></div></td>
									<td><div class="match360Time mr-5 text-[10px]"></div></td>
									<td><div class="match360Round text-[8px]"></div></td>
									<td><div class="match360Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match360HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match360HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match360AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match360AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match361Date mr-5 text-[10px]"></div></td>
									<td><div class="match361Time mr-5 text-[10px]"></div></td>
									<td><div class="match361Round text-[8px]"></div></td>
									<td><div class="match361Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match361HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match361HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match361AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match361AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match362Date mr-5 text-[10px]"></div></td>
									<td><div class="match362Time mr-5 text-[10px]"></div></td>
									<td><div class="match362Round text-[8px]"></div></td>
									<td><div class="match362Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match362HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match362HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match362AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match362AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match363Date mr-5 text-[10px]"></div></td>
									<td><div class="match363Time mr-5 text-[10px]"></div></td>
									<td><div class="match363Round text-[8px]"></div></td>
									<td><div class="match363Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match363HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match363HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match363AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match363AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match364Date mr-5 text-[10px]"></div></td>
									<td><div class="match364Time mr-5 text-[10px]"></div></td>
									<td><div class="match364Round text-[8px]"></div></td>
									<td><div class="match364Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match364HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match364HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match364AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match364AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match365Date mr-5 text-[10px]"></div></td>
									<td><div class="match365Time mr-5 text-[10px]"></div></td>
									<td><div class="match365Round text-[8px]"></div></td>
									<td><div class="match365Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match365HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match365HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match365AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match365AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match366Date mr-5 text-[10px]"></div></td>
									<td><div class="match366Time mr-5 text-[10px]"></div></td>
									<td><div class="match366Round text-[8px]"></div></td>
									<td><div class="match366Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match366HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match366HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match366AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match366AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match367Date mr-5 text-[10px]"></div></td>
									<td><div class="match367Time mr-5 text-[10px]"></div></td>
									<td><div class="match367Round text-[8px]"></div></td>
									<td><div class="match367Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match367HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match367HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match367AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match367AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match368Date mr-5 text-[10px]"></div></td>
									<td><div class="match368Time mr-5 text-[10px]"></div></td>
									<td><div class="match368Round text-[8px]"></div></td>
									<td><div class="match368Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match368HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match368HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match368AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match368AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match369Date mr-5 text-[10px]"></div></td>
									<td><div class="match369Time mr-5 text-[10px]"></div></td>
									<td><div class="match369Round text-[8px]"></div></td>
									<td><div class="match369Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match369HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match369HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match369AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match369AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match370Date mr-5 text-[10px]"></div></td>
									<td><div class="match370Time mr-5 text-[10px]"></div></td>
									<td><div class="match370Round text-[8px]"></div></td>
									<td><div class="match370Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match370HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match370HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match370AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match370AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match371Date mr-5 text-[10px]"></div></td>
									<td><div class="match371Time mr-5 text-[10px]"></div></td>
									<td><div class="match371Round text-[8px]"></div></td>
									<td><div class="match371Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match371HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match371HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match371AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match371AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match372Date mr-5 text-[10px]"></div></td>
									<td><div class="match372Time mr-5 text-[10px]"></div></td>
									<td><div class="match372Round text-[8px]"></div></td>
									<td><div class="match372Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match372HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match372HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match372AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match372AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match373Date mr-5 text-[10px]"></div></td>
									<td><div class="match373Time mr-5 text-[10px]"></div></td>
									<td><div class="match373Round text-[8px]"></div></td>
									<td><div class="match373Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match373HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match373HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match373AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match373AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match374Date mr-5 text-[10px]"></div></td>
									<td><div class="match374Time mr-5 text-[10px]"></div></td>
									<td><div class="match374Round text-[8px]"></div></td>
									<td><div class="match374Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match374HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match374HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match374AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match374AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match375Date mr-5 text-[10px]"></div></td>
									<td><div class="match375Time mr-5 text-[10px]"></div></td>
									<td><div class="match375Round text-[8px]"></div></td>
									<td><div class="match375Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match375HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match375HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match375AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match375AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match376Date mr-5 text-[10px]"></div></td>
									<td><div class="match376Time mr-5 text-[10px]"></div></td>
									<td><div class="match376Round text-[8px]"></div></td>
									<td><div class="match376Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match376HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match376HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match376AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match376AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match377Date mr-5 text-[10px]"></div></td>
									<td><div class="match377Time mr-5 text-[10px]"></div></td>
									<td><div class="match377Round text-[8px]"></div></td>
									<td><div class="match377Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match377HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match377HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match377AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match377AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match378Date mr-5 text-[10px]"></div></td>
									<td><div class="match378Time mr-5 text-[10px]"></div></td>
									<td><div class="match378Round text-[8px]"></div></td>
									<td><div class="match378Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match378HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match378HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match378AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match378AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
							<tbody class="mt-8 text-xs">
								<tr class="hover">
									<td><div class="match379Date mr-5 text-[10px]"></div></td>
									<td><div class="match379Time mr-5 text-[10px]"></div></td>
									<td><div class="match379Round text-[8px]"></div></td>
									<td><div class="match379Status flex justify-center bg-slate-200 rounded-2xl"></div></td>
									<td>
										<div class="flex">
											<div class="match379HomeLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
									<td class="flex">
										<div class="match379HomeScore mt-1 mr-5 text-[10px]"></div>
										<div class="mt-0.5">:</div>
										<div class="match379AwayScore mt-1 ml-5 text-[10px]"></div>
									</td>
									<td>
										<div class="flex">
											<div class="match379AwayLogo w-8 h-8 ml-2"></div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
			
		<div class="w-2/5 border-2 border-slate-50 border-l-slate-200">
			<table class="table table-auto">
				<caption class="caption-top mt-2">Regular Season</caption>
				<thead class="text-[8px]">
					<tr>
						<th>RANK</th>
						<th>CLUB</th>
						<th>MATCH</th>
						<th>WIN</th>
						<th>DRAW</th>
						<th>LOSE</th>
						<th>POINT</th>
					</tr>
				</thead>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="rank0 ml-3"></div></td>
						<td><div class="clubLogo0"></div></td>
						<td><div class="match0 ml-3"></div></td>
						<td><div class="win0 ml-1"></div></td>
						<td><div class="draw0 ml-3"></div></td>
						<td><div class="lose0 ml-2"></div></td>
						<td><div class="point0 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="rank1 ml-3"></div></td>
						<td><div class="clubLogo1"></div></td>
						<td><div class="match1 ml-3"></div></td>
						<td><div class="win1 ml-1"></div></td>
						<td><div class="draw1 ml-3"></div></td>
						<td><div class="lose1 ml-2"></div></td>
						<td><div class="point1 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="rank2 ml-3"></div></td>
						<td><div class="clubLogo2"></div></td>
						<td><div class="match2 ml-3"></div></td>
						<td><div class="win2 ml-1"></div></td>
						<td><div class="draw2 ml-3"></div></td>
						<td><div class="lose2 ml-2"></div></td>
						<td><div class="point2 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-blue-100">
						<td><div class="rank3 ml-3"></div></td>
						<td><div class="clubLogo3"></div></td>
						<td><div class="match3 ml-3"></div></td>
						<td><div class="win3 ml-1"></div></td>
						<td><div class="draw3 ml-3"></div></td>
						<td><div class="lose3 ml-2"></div></td>
						<td><div class="point3 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-orange-100">
						<td><div class="rank4 ml-3"></div></td>
						<td><div class="clubLogo4"></div></td>
						<td><div class="match4 ml-3"></div></td>
						<td><div class="win4 ml-1"></div></td>
						<td><div class="draw4 ml-3"></div></td>
						<td><div class="lose4 ml-2"></div></td>
						<td><div class="point4 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank5 ml-3"></div></td>
						<td><div class="clubLogo5"></div></td>
						<td><div class="match5 ml-3"></div></td>
						<td><div class="win5 ml-1"></div></td>
						<td><div class="draw5 ml-3"></div></td>
						<td><div class="lose5 ml-2"></div></td>
						<td><div class="point5 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank6 ml-3"></div></td>
						<td><div class="clubLogo6"></div></td>
						<td><div class="match6 ml-3"></div></td>
						<td><div class="win6 ml-1"></div></td>
						<td><div class="draw6 ml-3"></div></td>
						<td><div class="lose6 ml-2"></div></td>
						<td><div class="point6 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank7 ml-3"></div></td>
						<td><div class="clubLogo7"></div></td>
						<td><div class="match7 ml-3"></div></td>
						<td><div class="win7 ml-1"></div></td>
						<td><div class="draw7 ml-3"></div></td>
						<td><div class="lose7 ml-2"></div></td>
						<td><div class="point7 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank8 ml-3"></div></td>
						<td><div class="clubLogo8"></div></td>
						<td><div class="match8 ml-3"></div></td>
						<td><div class="win8 ml-1"></div></td>
						<td><div class="draw8 ml-3"></div></td>
						<td><div class="lose8 ml-2"></div></td>
						<td><div class="point8 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank9 ml-3"></div></td>
						<td><div class="clubLogo9"></div></td>
						<td><div class="match9 ml-3"></div></td>
						<td><div class="win9 ml-1"></div></td>
						<td><div class="draw9 ml-3"></div></td>
						<td><div class="lose9 ml-2"></div></td>
						<td><div class="point9 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank10 ml-3"></div></td>
						<td><div class="clubLogo10"></div></td>
						<td><div class="match10 ml-3"></div></td>
						<td><div class="win10 ml-1"></div></td>
						<td><div class="draw10 ml-3"></div></td>
						<td><div class="lose10 ml-2"></div></td>
						<td><div class="point10 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank11 ml-3"></div></td>
						<td><div class="clubLogo11"></div></td>
						<td><div class="match11 ml-3"></div></td>
						<td><div class="win11 ml-1"></div></td>
						<td><div class="draw11 ml-3"></div></td>
						<td><div class="lose11 ml-2"></div></td>
						<td><div class="point11 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank12 ml-3"></div></td>
						<td><div class="clubLogo12"></div></td>
						<td><div class="match12 ml-3"></div></td>
						<td><div class="win12 ml-1"></div></td>
						<td><div class="draw12 ml-3"></div></td>
						<td><div class="lose12 ml-2"></div></td>
						<td><div class="point12 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank13 ml-3"></div></td>
						<td><div class="clubLogo13"></div></td>
						<td><div class="match13 ml-3"></div></td>
						<td><div class="win13 ml-1"></div></td>
						<td><div class="draw13 ml-3"></div></td>
						<td><div class="lose13 ml-2"></div></td>
						<td><div class="point13 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank14 ml-3"></div></td>
						<td><div class="clubLogo14"></div></td>
						<td><div class="match14 ml-3"></div></td>
						<td><div class="win14 ml-1"></div></td>
						<td><div class="draw14 ml-3"></div></td>
						<td><div class="lose14 ml-2"></div></td>
						<td><div class="point14 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank15 ml-3"></div></td>
						<td><div class="clubLogo15"></div></td>
						<td><div class="match15 ml-3"></div></td>
						<td><div class="win15 ml-1"></div></td>
						<td><div class="draw15 ml-3"></div></td>
						<td><div class="lose15 ml-2"></div></td>
						<td><div class="point15 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr>
						<td><div class="rank16 ml-3"></div></td>
						<td><div class="clubLogo16"></div></td>
						<td><div class="match16 ml-3"></div></td>
						<td><div class="win16 ml-1"></div></td>
						<td><div class="draw16 ml-3"></div></td>
						<td><div class="lose16 ml-2"></div></td>
						<td><div class="point16 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">
						<td><div class="rank17 ml-3"></div></td>
						<td><div class="clubLogo17"></div></td>
						<td><div class="match17 ml-3"></div></td>
						<td><div class="win17 ml-1"></div></td>
						<td><div class="draw17 ml-3"></div></td>
						<td><div class="lose17 ml-2"></div></td>
						<td><div class="point17 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">
						<td><div class="rank18 ml-3"></div></td>
						<td><div class="clubLogo18"></div></td>
						<td><div class="match18 ml-3"></div></td>
						<td><div class="win18 ml-1"></div></td>
						<td><div class="draw18 ml-3"></div></td>
						<td><div class="lose18 ml-2"></div></td>
						<td><div class="point18 ml-2"></div></td>
					</tr>
				</tbody>
				<tbody class="mt-8 text-[10px]">
					<tr class="bg-red-100">
						<td><div class="rank19 ml-3"></div></td>
						<td><div class="clubLogo19"></div></td>
						<td><div class="match19 ml-3"></div></td>
						<td><div class="win19 ml-1"></div></td>
						<td><div class="draw19 ml-3"></div></td>
						<td><div class="lose19 ml-2"></div></td>
						<td><div class="point19 ml-2"></div></td>
					</tr>
				</tbody>
			</table>
		</div>	
	</section>
	
<%@ include file="../common/footer.jsp" %>