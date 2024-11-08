<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/header.jsp" %>

	<script>
		const settings = {
			async: true,
			crossDomain: true,
			url: 'https://api-football-v1.p.rapidapi.com/v3/fixtures?league=2&season=2024&timezone=Asia%2FSeoul',
			method: 'GET',
			headers: {
				'x-rapidapi-key': '3a012c58fdmsh42f7e05c92b7f66p1ed97ejsn1660d3e9d81f',
				'x-rapidapi-host': 'api-football-v1.p.rapidapi.com'
			}
		};

		$.ajax(settings).done(function(response) {
			$(".uefaChampionsLeagueLogo").append('<img src="' + response.response[90].league.logo + '"/>');
			
			$(".round1").append(response.response[90].league.round);
			$(".round2").append(response.response[108].league.round);
			$(".round3").append(response.response[126].league.round);
			$(".round4").append(response.response[144].league.round);
			$(".round5").append(response.response[162].league.round);
			$(".round6").append(response.response[180].league.round);
			$(".round7").append(response.response[198].league.round);
			$(".round8").append(response.response[216].league.round);
			
			var numInt;
			numInt = null;

			var numStr;
			numStr = null;

			for ( var i = 90; i <= 233; i++ ) {
			  	numInt = i;
			  	numStr = String(i);
			  
			  	$(".match" + numStr + "Date").append((response.response[numInt].fixture.date).substring(0, 10));
			  	$(".match" + numStr + "Time").append((response.response[numInt].fixture.date).substring(11, 16));
				$(".match" + numStr + "HomeLogo").append('<img src="' + response.response[numInt].teams.home.logo + '"/>');
				$(".match" + numStr + "AwayLogo").append('<img src="' + response.response[numInt].teams.away.logo + '"/>');
				$(".match" + numStr + "HomeScore").append(response.response[numInt].goals.home);
				$(".match" + numStr + "AwayScore").append(response.response[numInt].goals.away);
			}
			
		});
	</script>
	
	<div class="ml-20 mr-20">
		<div class="mt-2 flex justify-center">
			<div class="uefaChampionsLeagueLogo w-24"></div>
		</div>
		
		<section class="mt-8 text-xl">
			<div class="container mx-auto px-3">
				<div class="round1 mb-2 flex justify-center"></div>
				<div>
					<table class="table table-base">
						<thead class="text-base">
							<tr>
								<th>DATE</th>
								<th>TIME</th>
								<th>HOME</th>
								<th>SCORE</th>
								<th>AWAY</th>
							</tr>
						</thead>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match90Date mr-5"></div></td>
								<td><div class="match90Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match90HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match90HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match90AwayScore mt-1 ml-5"></div>
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
								<td><div class="match91Date mr-5"></div></td>
								<td><div class="match91Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match91HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match91HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match91AwayScore mt-1 ml-5"></div>
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
								<td><div class="match92Date mr-5"></div></td>
								<td><div class="match92Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match92HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match92HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match92AwayScore mt-1 ml-5"></div>
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
								<td><div class="match93Date mr-5"></div></td>
								<td><div class="match93Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match93HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match93HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match93AwayScore mt-1 ml-5"></div>
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
								<td><div class="match94Date mr-5"></div></td>
								<td><div class="match94Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match94HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match94HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match94AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match94AwayLogo w-5 h-5 ml-4 mb-3"></div>
									</div>
								</td>
							</tr>
						</tbody>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match95Date mr-5"></div></td>
								<td><div class="match95Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match95HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match95HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match95AwayScore mt-1 ml-5"></div>
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
								<td><div class="match96Date mr-5"></div></td>
								<td><div class="match96Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match96HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match96HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match96AwayScore mt-1 ml-5"></div>
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
								<td><div class="match97Date mr-5"></div></td>
								<td><div class="match97Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match97HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match97HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match97AwayScore mt-1 ml-5"></div>
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
								<td><div class="match98Date mr-5"></div></td>
								<td><div class="match98Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match98HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match98HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match98AwayScore mt-1 ml-5"></div>
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
								<td><div class="match99Date mr-5"></div></td>
								<td><div class="match99Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match99HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match99HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match99AwayScore mt-1 ml-5"></div>
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
								<td><div class="match100Date mr-5"></div></td>
								<td><div class="match100Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match100HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match100HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match100AwayScore mt-1 ml-5"></div>
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
								<td><div class="match101Date mr-5"></div></td>
								<td><div class="match101Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match101HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match101HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match101AwayScore mt-1 ml-5"></div>
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
								<td><div class="match102Date mr-5"></div></td>
								<td><div class="match102Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match102HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match102HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match102AwayScore mt-1 ml-5"></div>
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
								<td><div class="match103Date mr-5"></div></td>
								<td><div class="match103Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match103HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match103HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match103AwayScore mt-1 ml-5"></div>
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
								<td><div class="match104Date mr-5"></div></td>
								<td><div class="match104Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match104HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match104HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match104AwayScore mt-1 ml-5"></div>
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
								<td><div class="match105Date mr-5"></div></td>
								<td><div class="match105Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match105HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match105HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match105AwayScore mt-1 ml-5"></div>
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
								<td><div class="match106Date mr-5"></div></td>
								<td><div class="match106Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match106HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match106HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match106AwayScore mt-1 ml-5"></div>
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
								<td><div class="match107Date mr-5"></div></td>
								<td><div class="match107Time mr-5"></div></td>
								<td>
									<div>
										<div class="match107HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match107HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match107AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match107AwayLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<section class="mt-8 text-xl">
			<div class="container mx-auto px-3">
				<div class="round2 mb-2 flex justify-center"></div>
				<div>
					<table class="table table-base">
						<thead class="text-base">
							<tr>
								<th>DATE</th>
								<th>TIME</th>
								<th>HOME</th>
								<th>SCORE</th>
								<th>AWAY</th>
							</tr>
						</thead>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match108Date mr-5"></div></td>
								<td><div class="match108Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match108HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match108HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match108AwayScore mt-1 ml-5"></div>
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
								<td><div class="match109Date mr-5"></div></td>
								<td><div class="match109Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match109HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match109HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match109AwayScore mt-1 ml-5"></div>
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
								<td><div class="match110Date mr-5"></div></td>
								<td><div class="match110Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match110HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match110HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match110AwayScore mt-1 ml-5"></div>
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
								<td><div class="match111Date mr-5"></div></td>
								<td><div class="match111Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match111HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match111HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match111AwayScore mt-1 ml-5"></div>
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
								<td><div class="match112Date mr-5"></div></td>
								<td><div class="match112Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match112HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match112HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match112AwayScore mt-1 ml-5"></div>
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
								<td><div class="match113Date mr-5"></div></td>
								<td><div class="match113Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match113HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match113HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match113AwayScore mt-1 ml-5"></div>
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
								<td><div class="match114Date mr-5"></div></td>
								<td><div class="match114Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match114HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match114HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match114AwayScore mt-1 ml-5"></div>
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
								<td><div class="match115Date mr-5"></div></td>
								<td><div class="match115Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match115HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match115HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match115AwayScore mt-1 ml-5"></div>
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
								<td><div class="match116Date mr-5"></div></td>
								<td><div class="match116Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match116HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match116HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match116AwayScore mt-1 ml-5"></div>
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
								<td><div class="match117Date mr-5"></div></td>
								<td><div class="match117Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match117HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match117HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match117AwayScore mt-1 ml-5"></div>
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
								<td><div class="match118Date mr-5"></div></td>
								<td><div class="match118Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match118HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match118HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match118AwayScore mt-1 ml-5"></div>
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
								<td><div class="match119Date mr-5"></div></td>
								<td><div class="match119Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match119HomeLogo w-5 h-5 ml-4 mb-3"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match119HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match119AwayScore mt-1 ml-5"></div>
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
								<td><div class="match120Date mr-5"></div></td>
								<td><div class="match120Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match120HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match120HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match120AwayScore mt-1 ml-5"></div>
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
								<td><div class="match121Date mr-5"></div></td>
								<td><div class="match121Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match121HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match121HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match121AwayScore mt-1 ml-5"></div>
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
								<td><div class="match122Date mr-5"></div></td>
								<td><div class="match122Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match122HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match122HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match122AwayScore mt-1 ml-5"></div>
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
								<td><div class="match123Date mr-5"></div></td>
								<td><div class="match123Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match123HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match123HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match123AwayScore mt-1 ml-5"></div>
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
								<td><div class="match124Date mr-5"></div></td>
								<td><div class="match124Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match124HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match124HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match124AwayScore mt-1 ml-5"></div>
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
								<td><div class="match125Date mr-5"></div></td>
								<td><div class="match125Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match125HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match125HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match125AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match125AwayLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<section class="mt-8 text-xl">
			<div class="container mx-auto px-3">
				<div class="round3 mb-2 flex justify-center"></div>
				<div>
					<table class="table table-base">
						<thead class="text-base">
							<tr>
								<th>DATE</th>
								<th>TIME</th>
								<th>HOME</th>
								<th>SCORE</th>
								<th>AWAY</th>
							</tr>
						</thead>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match126Date mr-5"></div></td>
								<td><div class="match126Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match126HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match126HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match126AwayScore mt-1 ml-5"></div>
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
								<td><div class="match127Date mr-5"></div></td>
								<td><div class="match127Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match127HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match127HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match127AwayScore mt-1 ml-5"></div>
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
								<td><div class="match128Date mr-5"></div></td>
								<td><div class="match128Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match128HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match128HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match128AwayScore mt-1 ml-5"></div>
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
								<td><div class="match129Date mr-5"></div></td>
								<td><div class="match129Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match129HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match129HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match129AwayScore mt-1 ml-5"></div>
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
								<td><div class="match130Date mr-5"></div></td>
								<td><div class="match130Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match130HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match130HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match130AwayScore mt-1 ml-5"></div>
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
								<td><div class="match131Date mr-5"></div></td>
								<td><div class="match131Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match131HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match131HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match131AwayScore mt-1 ml-5"></div>
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
								<td><div class="match132Date mr-5"></div></td>
								<td><div class="match132Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match132HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match132HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match132AwayScore mt-1 ml-5"></div>
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
								<td><div class="match133Date mr-5"></div></td>
								<td><div class="match133Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match133HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match133HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match133AwayScore mt-1 ml-5"></div>
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
								<td><div class="match134Date mr-5"></div></td>
								<td><div class="match134Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match134HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match134HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match134AwayScore mt-1 ml-5"></div>
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
								<td><div class="match135Date mr-5"></div></td>
								<td><div class="match135Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match135HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match135HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match135AwayScore mt-1 ml-5"></div>
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
								<td><div class="match136Date mr-5"></div></td>
								<td><div class="match136Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match136HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match136HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match136AwayScore mt-1 ml-5"></div>
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
								<td><div class="match137Date mr-5"></div></td>
								<td><div class="match137Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match137HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match137HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match137AwayScore mt-1 ml-5"></div>
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
								<td><div class="match138Date mr-5"></div></td>
								<td><div class="match138Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match138HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match138HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match138AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match138AwayLogo w-5 h-5 ml-4 mb-3"></div>
									</div>
								</td>
							</tr>
						</tbody>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match139Date mr-5"></div></td>
								<td><div class="match139Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match139HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match139HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match139AwayScore mt-1 ml-5"></div>
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
								<td><div class="match140Date mr-5"></div></td>
								<td><div class="match140Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match140HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match140HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match140AwayScore mt-1 ml-5"></div>
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
								<td><div class="match141Date mr-5"></div></td>
								<td><div class="match141Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match141HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match141HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match141AwayScore mt-1 ml-5"></div>
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
								<td><div class="match142Date mr-5"></div></td>
								<td><div class="match142Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match142HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match142HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match142AwayScore mt-1 ml-5"></div>
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
								<td><div class="match143Date mr-5"></div></td>
								<td><div class="match143Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match143HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match143HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match143AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match143AwayLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<section class="mt-8 text-xl">
			<div class="container mx-auto px-3">
				<div class="round4 mb-2 flex justify-center"></div>
				<div>
					<table class="table table-base">
						<thead class="text-base">
							<tr>
								<th>DATE</th>
								<th>TIME</th>
								<th>HOME</th>
								<th>SCORE</th>
								<th>AWAY</th>
							</tr>
						</thead>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match144Date mr-5"></div></td>
								<td><div class="match144Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match144HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match144HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match144AwayScore mt-1 ml-5"></div>
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
								<td><div class="match145Date mr-5"></div></td>
								<td><div class="match145Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match145HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match145HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match145AwayScore mt-1 ml-5"></div>
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
								<td><div class="match146Date mr-5"></div></td>
								<td><div class="match146Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match146HomeLogo w-5 h-5 ml-4 mb-3"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match146HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match146AwayScore mt-1 ml-5"></div>
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
								<td><div class="match147Date mr-5"></div></td>
								<td><div class="match147Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match147HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match147HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match147AwayScore mt-1 ml-5"></div>
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
								<td><div class="match148Date mr-5"></div></td>
								<td><div class="match148Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match148HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match148HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match148AwayScore mt-1 ml-5"></div>
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
								<td><div class="match149Date mr-5"></div></td>
								<td><div class="match149Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match149HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match149HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match149AwayScore mt-1 ml-5"></div>
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
								<td><div class="match150Date mr-5"></div></td>
								<td><div class="match150Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match150HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match150HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match150AwayScore mt-1 ml-5"></div>
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
								<td><div class="match151Date mr-5"></div></td>
								<td><div class="match151Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match151HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match151HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match151AwayScore mt-1 ml-5"></div>
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
								<td><div class="match152Date mr-5"></div></td>
								<td><div class="match152Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match152HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match152HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match152AwayScore mt-1 ml-5"></div>
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
								<td><div class="match153Date mr-5"></div></td>
								<td><div class="match153Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match153HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match153HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match153AwayScore mt-1 ml-5"></div>
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
								<td><div class="match154Date mr-5"></div></td>
								<td><div class="match154Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match154HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match154HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match154AwayScore mt-1 ml-5"></div>
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
								<td><div class="match155Date mr-5"></div></td>
								<td><div class="match155Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match155HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match155HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match155AwayScore mt-1 ml-5"></div>
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
								<td><div class="match156Date mr-5"></div></td>
								<td><div class="match156Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match156HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match156HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match156AwayScore mt-1 ml-5"></div>
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
								<td><div class="match157Date mr-5"></div></td>
								<td><div class="match157Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match157HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match157HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match157AwayScore mt-1 ml-5"></div>
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
								<td><div class="match158Date mr-5"></div></td>
								<td><div class="match158Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match158HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match158HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match158AwayScore mt-1 ml-5"></div>
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
								<td><div class="match159Date mr-5"></div></td>
								<td><div class="match159Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match159HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match159HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match159AwayScore mt-1 ml-5"></div>
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
								<td><div class="match160Date mr-5"></div></td>
								<td><div class="match160Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match160HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match160HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match160AwayScore mt-1 ml-5"></div>
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
								<td><div class="match161Date mr-5"></div></td>
								<td><div class="match161Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match161HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match161HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match161AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match161AwayLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<section class="mt-8 text-xl">
			<div class="container mx-auto px-3">
				<div class="round5 mb-2 flex justify-center"></div>
				<div>
					<table class="table table-base">
						<thead class="text-base">
							<tr>
								<th>DATE</th>
								<th>TIME</th>
								<th>HOME</th>
								<th>SCORE</th>
								<th>AWAY</th>
							</tr>
						</thead>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match162Date mr-5"></div></td>
								<td><div class="match162Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match162HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match162HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match162AwayScore mt-1 ml-5"></div>
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
								<td><div class="match163Date mr-5"></div></td>
								<td><div class="match163Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match163HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match163HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match163AwayScore mt-1 ml-5"></div>
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
								<td><div class="match164Date mr-5"></div></td>
								<td><div class="match164Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match164HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match164HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match164AwayScore mt-1 ml-5"></div>
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
								<td><div class="match165Date mr-5"></div></td>
								<td><div class="match165Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match165HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match165HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match165AwayScore mt-1 ml-5"></div>
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
								<td><div class="match166Date mr-5"></div></td>
								<td><div class="match166Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match166HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match166HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match166AwayScore mt-1 ml-5"></div>
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
								<td><div class="match167Date mr-5"></div></td>
								<td><div class="match167Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match167HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match167HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match167AwayScore mt-1 ml-5"></div>
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
								<td><div class="match168Date mr-5"></div></td>
								<td><div class="match168Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match168HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match168HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match168AwayScore mt-1 ml-5"></div>
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
								<td><div class="match169Date mr-5"></div></td>
								<td><div class="match169Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match169HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match169HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match169AwayScore mt-1 ml-5"></div>
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
								<td><div class="match170Date mr-5"></div></td>
								<td><div class="match170Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match170HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match170HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match170AwayScore mt-1 ml-5"></div>
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
								<td><div class="match171Date mr-5"></div></td>
								<td><div class="match171Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match171HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match171HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match171AwayScore mt-1 ml-5"></div>
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
								<td><div class="match172Date mr-5"></div></td>
								<td><div class="match172Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match172HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match172HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match172AwayScore mt-1 ml-5"></div>
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
								<td><div class="match173Date mr-5"></div></td>
								<td><div class="match173Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match173HomeLogo w-5 h-5 ml-4 mb-3"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match173HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match173AwayScore mt-1 ml-5"></div>
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
								<td><div class="match174Date mr-5"></div></td>
								<td><div class="match174Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match174HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match174HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match174AwayScore mt-1 ml-5"></div>
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
								<td><div class="match175Date mr-5"></div></td>
								<td><div class="match175Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match175HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match175HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match175AwayScore mt-1 ml-5"></div>
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
								<td><div class="match176Date mr-5"></div></td>
								<td><div class="match176Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match176HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match176HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match176AwayScore mt-1 ml-5"></div>
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
								<td><div class="match177Date mr-5"></div></td>
								<td><div class="match177Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match177HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match177HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match177AwayScore mt-1 ml-5"></div>
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
								<td><div class="match178Date mr-5"></div></td>
								<td><div class="match178Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match178HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match178HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match178AwayScore mt-1 ml-5"></div>
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
								<td><div class="match179Date mr-5"></div></td>
								<td><div class="match179Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match179HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match179HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match179AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match179AwayLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<section class="mt-8 text-xl">
			<div class="container mx-auto px-3">
				<div class="round6 mb-2 flex justify-center"></div>
				<div>
					<table class="table table-base">
						<thead class="text-base">
							<tr>
								<th>DATE</th>
								<th>TIME</th>
								<th>HOME</th>
								<th>SCORE</th>
								<th>AWAY</th>
							</tr>
						</thead>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match180Date mr-5"></div></td>
								<td><div class="match180Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match180HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match180HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match180AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match180AwayLogo w-5 h-5 ml-4 mb-3"></div>
									</div>
								</td>
							</tr>
						</tbody>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match181Date mr-5"></div></td>
								<td><div class="match181Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match181HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match181HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match181AwayScore mt-1 ml-5"></div>
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
								<td><div class="match182Date mr-5"></div></td>
								<td><div class="match182Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match182HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match182HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match182AwayScore mt-1 ml-5"></div>
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
								<td><div class="match183Date mr-5"></div></td>
								<td><div class="match183Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match183HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match183HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match183AwayScore mt-1 ml-5"></div>
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
								<td><div class="match184Date mr-5"></div></td>
								<td><div class="match184Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match184HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match184HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match184AwayScore mt-1 ml-5"></div>
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
								<td><div class="match185Date mr-5"></div></td>
								<td><div class="match185Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match185HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match185HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match185AwayScore mt-1 ml-5"></div>
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
								<td><div class="match186Date mr-5"></div></td>
								<td><div class="match186Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match186HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match186HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match186AwayScore mt-1 ml-5"></div>
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
								<td><div class="match187Date mr-5"></div></td>
								<td><div class="match187Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match187HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match187HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match187AwayScore mt-1 ml-5"></div>
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
								<td><div class="match188Date mr-5"></div></td>
								<td><div class="match188Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match188HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match188HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match188AwayScore mt-1 ml-5"></div>
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
								<td><div class="match189Date mr-5"></div></td>
								<td><div class="match189Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match189HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match189HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match189AwayScore mt-1 ml-5"></div>
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
								<td><div class="match190Date mr-5"></div></td>
								<td><div class="match190Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match190HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match190HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match190AwayScore mt-1 ml-5"></div>
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
								<td><div class="match191Date mr-5"></div></td>
								<td><div class="match191Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match191HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match191HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match191AwayScore mt-1 ml-5"></div>
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
								<td><div class="match192Date mr-5"></div></td>
								<td><div class="match192Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match192HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match192HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match192AwayScore mt-1 ml-5"></div>
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
								<td><div class="match193Date mr-5"></div></td>
								<td><div class="match193Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match193HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match193HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match193AwayScore mt-1 ml-5"></div>
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
								<td><div class="match194Date mr-5"></div></td>
								<td><div class="match194Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match194HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match194HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match194AwayScore mt-1 ml-5"></div>
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
								<td><div class="match195Date mr-5"></div></td>
								<td><div class="match195Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match195HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match195HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match195AwayScore mt-1 ml-5"></div>
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
								<td><div class="match196Date mr-5"></div></td>
								<td><div class="match196Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match196HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match196HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match196AwayScore mt-1 ml-5"></div>
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
								<td><div class="match197Date mr-5"></div></td>
								<td><div class="match197Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match197HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match197HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match197AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match197AwayLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<section class="mt-8 text-xl">
			<div class="container mx-auto px-3">
				<div class="round7 mb-2 flex justify-center"></div>
				<div>
					<table class="table table-base">
						<thead class="text-base">
							<tr>
								<th>DATE</th>
								<th>TIME</th>
								<th>HOME</th>
								<th>SCORE</th>
								<th>AWAY</th>
							</tr>
						</thead>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match198Date mr-5"></div></td>
								<td><div class="match198Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match198HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match198HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match198AwayScore mt-1 ml-5"></div>
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
								<td><div class="match199Date mr-5"></div></td>
								<td><div class="match199Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match199HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match199HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match199AwayScore mt-1 ml-5"></div>
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
								<td><div class="match200Date mr-5"></div></td>
								<td><div class="match200Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match200HomeLogo w-5 h-5 ml-4 mb-3"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match200HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match200AwayScore mt-1 ml-5"></div>
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
								<td><div class="match201Date mr-5"></div></td>
								<td><div class="match201Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match201HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match201HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match201AwayScore mt-1 ml-5"></div>
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
								<td><div class="match202Date mr-5"></div></td>
								<td><div class="match202Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match202HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match202HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match202AwayScore mt-1 ml-5"></div>
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
								<td><div class="match203Date mr-5"></div></td>
								<td><div class="match203Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match203HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match203HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match203AwayScore mt-1 ml-5"></div>
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
								<td><div class="match204Date mr-5"></div></td>
								<td><div class="match204Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match204HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match204HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match204AwayScore mt-1 ml-5"></div>
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
								<td><div class="match205Date mr-5"></div></td>
								<td><div class="match205Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match205HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match205HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match205AwayScore mt-1 ml-5"></div>
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
								<td><div class="match206Date mr-5"></div></td>
								<td><div class="match206Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match206HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match206HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match206AwayScore mt-1 ml-5"></div>
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
								<td><div class="match207Date mr-5"></div></td>
								<td><div class="match207Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match207HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match207HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match207AwayScore mt-1 ml-5"></div>
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
								<td><div class="match208Date mr-5"></div></td>
								<td><div class="match208Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match208HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match208HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match208AwayScore mt-1 ml-5"></div>
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
								<td><div class="match209Date mr-5"></div></td>
								<td><div class="match209Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match209HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match209HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match209AwayScore mt-1 ml-5"></div>
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
								<td><div class="match210Date mr-5"></div></td>
								<td><div class="match210Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match210HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match210HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match210AwayScore mt-1 ml-5"></div>
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
								<td><div class="match211Date mr-5"></div></td>
								<td><div class="match211Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match211HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match211HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match211AwayScore mt-1 ml-5"></div>
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
								<td><div class="match212Date mr-5"></div></td>
								<td><div class="match212Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match212HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match212HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match212AwayScore mt-1 ml-5"></div>
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
								<td><div class="match213Date mr-5"></div></td>
								<td><div class="match213Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match213HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match213HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match213AwayScore mt-1 ml-5"></div>
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
								<td><div class="match214Date mr-5"></div></td>
								<td><div class="match214Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match214HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match214HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match214AwayScore mt-1 ml-5"></div>
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
								<td><div class="match215Date mr-5"></div></td>
								<td><div class="match215Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match215HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match215HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match215AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match215AwayLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<section class="mt-8 text-xl">
			<div class="container mx-auto px-3">
				<div class="round8 mb-2 flex justify-center"></div>
				<div>
					<table class="table table-base">
						<thead class="text-base">
							<tr>
								<th>DATE</th>
								<th>TIME</th>
								<th>HOME</th>
								<th>SCORE</th>
								<th>AWAY</th>
							</tr>
						</thead>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match216Date mr-5"></div></td>
								<td><div class="match216Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match216HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match216HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match216AwayScore mt-1 ml-5"></div>
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
								<td><div class="match217Date mr-5"></div></td>
								<td><div class="match217Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match217HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match217HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match217AwayScore mt-1 ml-5"></div>
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
								<td><div class="match218Date mr-5"></div></td>
								<td><div class="match218Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match218HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match218HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match218AwayScore mt-1 ml-5"></div>
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
								<td><div class="match219Date mr-5"></div></td>
								<td><div class="match219Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match219HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match219HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match219AwayScore mt-1 ml-5"></div>
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
								<td><div class="match220Date mr-5"></div></td>
								<td><div class="match220Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match220HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match220HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match220AwayScore mt-1 ml-5"></div>
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
								<td><div class="match221Date mr-5"></div></td>
								<td><div class="match221Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match221HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match221HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match221AwayScore mt-1 ml-5"></div>
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
								<td><div class="match222Date mr-5"></div></td>
								<td><div class="match222Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match222HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match222HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match222AwayScore mt-1 ml-5"></div>
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
								<td><div class="match223Date mr-5"></div></td>
								<td><div class="match223Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match223HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match223HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match223AwayScore mt-1 ml-5"></div>
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
								<td><div class="match224Date mr-5"></div></td>
								<td><div class="match224Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match224HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match224HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match224AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match224AwayLogo w-5 h-5 ml-4 mb-3"></div>
									</div>
								</td>
							</tr>
						</tbody>
						<tbody class="mt-8 text-xs">
							<tr class="hover">
								<td><div class="match225Date mr-5"></div></td>
								<td><div class="match225Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match225HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match225HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match225AwayScore mt-1 ml-5"></div>
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
								<td><div class="match226Date mr-5"></div></td>
								<td><div class="match226Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match226HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match226HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match226AwayScore mt-1 ml-5"></div>
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
								<td><div class="match227Date mr-5"></div></td>
								<td><div class="match227Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match227HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match227HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match227AwayScore mt-1 ml-5"></div>
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
								<td><div class="match228Date mr-5"></div></td>
								<td><div class="match228Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match228HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match228HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match228AwayScore mt-1 ml-5"></div>
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
								<td><div class="match229Date mr-5"></div></td>
								<td><div class="match229Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match229HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match229HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match229AwayScore mt-1 ml-5"></div>
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
								<td><div class="match230Date mr-5"></div></td>
								<td><div class="match230Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match230HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match230HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match230AwayScore mt-1 ml-5"></div>
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
								<td><div class="match231Date mr-5"></div></td>
								<td><div class="match231Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match231HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match231HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match231AwayScore mt-1 ml-5"></div>
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
								<td><div class="match232Date mr-5"></div></td>
								<td><div class="match232Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match232HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match232HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match232AwayScore mt-1 ml-5"></div>
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
								<td><div class="match233Date mr-5"></div></td>
								<td><div class="match233Time mr-5"></div></td>
								<td>
									<div class="flex">
										<div class="match233HomeLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
								<td class="flex">
									<div class="match233HomeScore mt-1 mr-5"></div>
									<div class="mt-0.5">:</div>
									<div class="match233AwayScore mt-1 ml-5"></div>
								</td>
								<td>
									<div class="flex">
										<div class="match233AwayLogo w-8 h-8 ml-2"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>
<%@ include file="../common/footer.jsp" %>