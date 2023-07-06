<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>

</style>
</head>
<body>
<input type='file' id='myFileInput' style="display:none; onchange="updateButtonLabel(this)">
<button id='fileuploadButton' onclick="$('#myFileInput').click()" style="width:200px; height:30px; margin-top:20px;">txt 파일 업로드</button>

<button id='sendFile' style="width:200px; height:40px; margin-top:20px; background-color: hsl(197, 100%, 51%); color:white; outline: none; border: none;">파일 업로드</button>

<script>
$(document).ready(function() {
      $('#myFileInput').on('change', function() {
        updateButtonLabel(this);
      });

      $('#sendFile').on('click', function() {
          var geoFile = $('#myFileInput').prop('files')[0];

          if (geoFile) {
            var formData = new FormData();
            formData.append('file', geoFile);

            $.ajax({
              url: 'uploadfile.do',  // 컨트롤러 URL로 변경해야 합니다.
              type: 'POST',
              data: formData,
              processData: false,
              contentType: false,
              dataType: 'text',
              charset: 'UTF-8',
              success: function(response) {
                // 파일 전송 성공 후의 동작
                alert("파일이 업로드 되었습니다.");
                console.log(response);
              },
              error: function(xhr, status, error) {
                // 파일 전송 실패 후의 동작
                alert(error);
              }
            });
          }else{
              alert("파일을 선택해주세요.");
              return false;
          }
        });


    });    // document.ready end

    function updateButtonLabel(input) {
      var fileName = input.files[0].name;
      $('#fileuploadButton').text(fileName);
    }


</script>
</body>
</html>