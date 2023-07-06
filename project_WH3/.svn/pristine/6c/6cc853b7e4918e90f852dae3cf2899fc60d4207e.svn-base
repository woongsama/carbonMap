<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
// 탄소지도의 시도를 선택했을때, 시군구 호출 함수
var sgg_cnt ='';
function optionChange() {
	
	$('#sgg').empty();
	$('#sgg').append('<option value="" disabled selected hidden>시군구 선택</option>')
	$('#sgg').append('<option value="시군구전체">전체</option>')
	
	
	if($('#sd').val() != '시도전체'){
    var sdData = {
        "sd_nm" : $('#sd').val()
    }
	
	var sd_length = $('#sd').val().length+1;
	
    $.ajax({
        type : "post",
        url : "sgg_list.do",
        data : sdData,
        success : function(result){
        	if(result[1] != null){			// list 가 들어있는 result 의 첫번째값(result[0])에는 주소가 있음, 따라서 두번째값을 확인
        	$.each(result, function(index, item){
        		$('#sgg').append('<option val='+ item.sgg_nm.substring(sd_length) +'>' + item.sgg_nm.substring(sd_length) + '</option>');
        	});
        		sgg_cnt = $('#sgg option').length - 2;
        		console.log("sgg_cnt:"+sgg_cnt);
        	}else{
        	$.each(result, function(index, item){
            	$('#sgg').append('<option val='+ item.sgg_nm +'>' + item.sgg_nm + '</option>');
        	});
        		sgg_cnt = $('#sgg option').length - 2;
    			console.log("sgg_cnt:"+sgg_cnt);
        	}
        	
        }
    })
    
	}
}

// 탄소지도 검색 함수
function position_search(){
	
	var str1 = $('#sd').val();
	var str2 = $('#sgg').val();
	var space = " ";
	
	console.log(str1);
	console.log(str2);
	console.log("sgg_cnt:"+sgg_cnt);
	
	if(!$('#sd').val()){			// 시도가 선택되지 않았을때 (필수)
		alert("시도를 선택해주세요.");
		return false;
	}
	
	if(!$('#legend_type').val()){		// 범례가 선택되지 않았을때 (필수)
		
		alert("범례를 선택해주세요.");
		return false;
		
	}else if($('#sd').val() == '시도전체'){					// 시도가 '시도전체'로 선택되었을때
		
		if($('#legend_type').val()=="Natural breaks"){		// 범례선택값
			$('#c_map').load('position_sd_full.do?legend_type=natural');
		}else{
			$('#c_map').load('position_sd_full.do?legend_type=equal');
		}
		
	}else if($('#sgg').val() && $('#sgg').val() != '시군구전체'){			// 시군구가 선택되고, '시군구전체' 가 아닌 실제 시군구값을 선택했을때
		
		if($('#legend_type').val()=="Natural breaks"){					// 범례선택값
			var legend_type = "natural";
		}else{
			var legend_type = "equal";
		}
	
		if(sgg_cnt == 1){			// 세종시 시군구 이름을 위한 조건문
			var sgg_nm = str1;
		}else{
			var sgg_nm = str2;
		}
		
		var Data = {
			"sd_nm" : str1,
			"sgg_nm" : sgg_nm,
			"legend_type" : legend_type
		}
		
		$.ajax({
			type : "post",
			url : "return_sgg_cd.do",
			data : Data,
			success : function(data){
				$('#c_map').html(data);
			}
		})
	}else if($('#sgg').val() && $('#sgg').val() == '시군구전체'){			// 시군구가 선택되고, '시군구전체'를 선택했을때
		
		if($('#legend_type').val()=="Natural breaks"){					// 범례선택값
			var legend_type = "natural";
		}else{
			var legend_type = "equal";
		}
		
		var Data = {
				"sd_nm" : str1,
				"sgg_count" : sgg_cnt,
				"legend_type" : legend_type
		}
		
		$.ajax({
			type : "post",
			url : "return_sd_cd.do",
			data : Data,
			success : function(data){
				$('#c_map').html(data);
			}
		})
		
	}else{													// 시도만 선택했을때
		
		if($('#legend_type').val()=="Natural breaks"){		// 범례선택값
			var legend_type = "natural";
		}else{
			var legend_type = "equal";
		}
		
		var Data = {
				"sd_nm" : str1,
				"sgg_count" : sgg_cnt,
				"legend_type" : legend_type
		}
		
		$.ajax({
			type : "post",
			url : "return_sd_cd.do",
			data : Data,
			success : function(data){
				$('#c_map').html(data);
			}
		})
		
	}
	
}
</script>
</head>
<body>

	<select id="sd" onChange="optionChange()" style="width:200px; height:20px; margin-top:20px;">
		<option value="" disabled selected hidden>시도 선택</option>
		<option value="시도전체">전체</option>
		<c:forEach var="sd_nm_list" items="${sd_nm_list }">
			<option value="${sd_nm_list.sd_nm }">${sd_nm_list.sd_nm }</option>
		</c:forEach>

	</select>

	<select id="sgg" style="width:200px; height:20px; margin-top:20px;">
		<option value="" disabled selected hidden>시군구 선택</option>
	</select>
	
	<select id="legend_type" style="width:200px; height:20px; margin-top:20px;">
		<option value="" disabled selected hidden>범례유형선택</option>
		<option value="Natural breaks">자연구간(Natural breaks)</option>
		<option value="Equal interval breaks">등간격(Equal interval breaks)</option>
	</select>
	
	<button id="position_search" style="width:200px; height:30px; margin-top:30px;" onClick="position_search()">검색</button>

</body>
</html>