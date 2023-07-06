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
	<div id="chart1" style="width:90%; height:50%; margin: 0 auto; ">
		<canvas id="myChart" style="width:100%; height:100%; "></canvas>
	</div>
	
	<div id="text1" style="width:90%; height:2%; margin: 0 auto; padding-top:2%; padding-bottom:1%; text-align:right;">
	단위:tonCO2eq
	</div>
	
	<div id="chart2" style="width:90%; height:40%; margin: 0 auto; overflow:auto;">
		<table align="center" style="border:1px solid #aaa; border-collapse:collapse; color:#666; width:100%; text-align:center;">
			<tr style="background-color:#BBEEFF;">
				<td>시도별</td>
				<td>탄소배출량</td>
			</tr>
			
			<c:forEach var="sd_inform" items="${sd_inform }">
				<tr>
					<td>${sd_inform.sd_nm }</td>
					<td>${sd_inform.sd_usage }</td>
				</tr>
			</c:forEach>
			
		
		</table>
	</div>
	
	<script type="text/javascript">
		var sd_cnt = ${sd_cnt};
		console.log("sd_cnt:"+sd_cnt);
		
/* 		
 		var sido = [];
		sido = ${sd_nm};
		for(var i = 0; i < sd_cnt; i++){
			console.log("sd_nm_list:"+sido[i]);
		} 
*/
		
		var sd_nm = [
		      <c:forEach items="${sd_nm}" var="return_sd_nm" varStatus="status">
		        '${return_sd_nm}'${not status.last ? ',' : ''}
		      </c:forEach>
		];
		
		for (var i = 0; i < sd_cnt; i++) {
			    console.log(sd_nm[i]);
		}
		
/* 		
  	
 		let sidoData = [];
		sidoData = '${sd_usage}'; 
*/
		var sd_usage = [
    		<c:forEach items="${sd_usage}" var="return_sd_usage" varStatus="status">
      		'${return_sd_usage}'${not status.last ? ',' : ''}
    		</c:forEach>
		];

		for (var i = 0; i < sd_cnt; i++) {
	    console.log(sd_usage[i]);
		}
		
		let backgroundColor = [];
		let borderColor = [];
		
		for(var i = 0; i < sd_cnt; i++){
			backgroundColor.push("rgba(54, 162, 235, 0.2)");
		}
		for(var i = 0; i < sd_cnt; i++){
			borderColor.push("rgba(54, 162, 235, 1)");
		}
		
		const ctx = document.getElementById("myChart").getContext("2d");
		const myChart = new Chart(ctx, {
			type : "bar",
			data : {
				labels : sd_nm,
				datasets : [
						{
							label : "탄소배출량(시도별)",
							data : sd_usage,
							barThickness : 10,
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