<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>부트스트랩 차트그리기</title>
<!-- 차트 링크(저장된 파일로 직접접근) -->
<script src="<%=request.getContextPath()%>/js/chartMin.js" />
<style>
table, tr, td{
	border:1px solid #aaa;
	border-collapse:collapse;
	color: #666;
}
</style>
</head>
<body>
	<div id="chart1" style="width:90%; height:50%; margin: 0 auto; overflow:auto;">
		<canvas id="myChart" style="width:100%;"></canvas>
	</div>
	
 	<div id="text1" style="width:90%; height:2%; margin: 0 auto; padding-top:2%; padding-bottom:1%; text-align:right;">
	단위:tonCO2eq
	</div>
	
	<div id="chart2" style="width:90%; height:40%; margin: 0 auto; overflow:auto;">
		<table align="center" style="width:100%; text-align:center;">
			<tr style="background-color:#BBEEFF;">
				<td>시군구별</td>
				<td>탄소배출량</td>
			</tr>
			
			<c:forEach var="sgg_inform" items="${sgg_inform }">
				<tr>
					<td>${sgg_inform.sgg_nm }</td>
					<td>${sgg_inform.sgg_usage }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script type="text/javascript">
		var sgg_cnt = ${sgg_cnt};
		console.log("sgg_cnt:"+sgg_cnt);
		
		if(sgg_cnt >= 5){
			$("#myChart").css("height", "250%");
		}else{
			$("#myChart").css("height", "50%");
		}
	
		var sgg_nm = [
		      <c:forEach items="${sgg_inform}" var="return_sgg_nm" varStatus="status">
		        '${return_sgg_nm.sgg_nm}'${not status.last ? ',' : ''}
		      </c:forEach>
		];
		
		for (var i = 0; i < sgg_cnt; i++) {
			    console.log(sd_nm[i]);
		}
		
		var sgg_usage = [
    		<c:forEach items="${sgg_usage}" var="return_sgg_usage" varStatus="status">
      			'${return_sgg_usage}'${not status.last ? ',' : ''}
    		</c:forEach>
		];

		for (var i = 0; i < sgg_cnt; i++) {
	    console.log(sgg_usage[i]);
		}
		
		let backgroundColor = [];
		let borderColor = [];
		
		for(var i = 0; i < sgg_cnt; i++){
			backgroundColor.push("rgba(54, 162, 235, 0.2)");
		}
		for(var i = 0; i < sgg_cnt; i++){
			borderColor.push("rgba(54, 162, 235, 1)");
		}
		
		const ctx = document.getElementById("myChart").getContext("2d");
		const myChart = new Chart(ctx, {
			type : "bar",
			data : {
				labels : sgg_nm,
				datasets : [
						{
							label : "탄소배출량(시군구별)",
							data : sgg_usage,
							barPercentage: 0.5,
							backgroundColor : backgroundColor,
							borderColor : borderColor,
							borderWidth : 1,
						}, ],
			},
			options : {
				indexAxis : 'y',
				scales : {
					y : {
						beginAtZero : true,
					},
				},
			},
		});
	</script>
</body>
</html>