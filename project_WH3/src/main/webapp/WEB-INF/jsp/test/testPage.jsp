<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function click_main(){
	location.href="main.do";
}

function click_position(){
	console.log("click_position 함수 진입");
	$("#position").css("background-color", "#D6DCE5");
}
</script>
<style>
.fullscreen{
	width: 1500px;
	height: 1000px;
	border: 1px solid black;
}
.c_map{
	width: 80%;
	height: 100%;
	border: 1px solid black;
	border-top:none;
	border-right:none;
	border-bottom:none;
	box-sizing:border-box;
	float:right;
}

.left-bar{
	width:20%;
	height:100%;
	border: 1px solid black;
	border-top:none;
	border-left:none;
	border-right:none;
	border-bottom:none;
	box-sizing:border-box;
	float:left;
}
.left-top{
	display: flex;
    justify-content: center;
    align-items: center;
	width:100%;
	height:10%;
	border: 1px solid black;
	border-top:none;
	border-left:none;
	border-right:none;
	box-sizing:border-box;
	text-align: center;
	font-size:22px;
}
.left-left{
	width:30%;
	height:90%;
	border: 1px solid black;
	border-top:none;
	border-left:none;
	border-bottom:none;
	box-sizing:border-box;
	float: left;
}
.left-right{
	text-align: center;
	width:70%;
	height:90%;
	border: 1px solid black;
	border-top:none;
	border-left:none;
	border-right:none;
	border-bottom:none;
	box-sizing:border-box;
	float: right;
}
.left-button{
	width:100%;
	height:10%;
	border: 1px solid black;
	border-top:none;
	border-left:none;
	border-right:none;
	box-sizing:border-box;
}
 img{
 	width:100%;
 	height:70%;
}

.button-text {
    display: inline-block;
}
</style>
</head>
<body>

<p2>테스트페이지</p2><br><br><br>
<button onClick="click_main()">메인페이지로 이동</button><br><br><br><br>


<div style="width:100px; height:100px">
	<button id="position" style="width:100%; height:100%;" onClick="click_position()">
		<img src="<%=request.getContextPath() %>/images/position2.png" alt="이미지"/>
		<span class="button-text">탄소 지도</span>
	</button>
</div>
</body>
</html>