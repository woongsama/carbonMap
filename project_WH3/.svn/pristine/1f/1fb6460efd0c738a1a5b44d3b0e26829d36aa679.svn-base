<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계 선택</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function statistics_search(){
	var sd_nm = $('#sd').val();
	$('#c_map').load('statistics_search_sd.do?sd_nm='+sd_nm);
}
</script>
</head>
<body>
	<select id="sd" onChange="optionChange()" style="width:200px; height:20px; margin-top:20px;">
		<option value="" disabled selected hidden>시도 선택</option>
		<c:forEach var="sd_nm_list" items="${sd_nm_list }">
			<option value="${sd_nm_list.sd_nm }">${sd_nm_list.sd_nm }</option>
		</c:forEach>
	</select>
	
	<button id="position_search" style="width:200px; height:30px; margin-top:30px;" onClick="statistics_search()">검색</button>
</body>
</html>