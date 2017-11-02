<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
input[type=text].snsName {
	text-align: center;
}

input[type=text].snsAddr {
	text-align: center;
}
</style>
</head>
<body>
	<form action="test1" method="post">

		ID:<input type="text" name="id" id="id" data-text="아이디" value="${vo.id}" readonly> <br> <br> 
		
		닉네임:<input type="text" name="nname" id="nname" data-text="닉네임" value="${vo.nname}"> <br> <br> 
		
		비밀번호:<input type="password" name="pw" id="pw" data-text="비밀번호" value="${vo.pw}"><br>
		비밀번호 확인:<input type="password" name="pwCheck" id="pwCheck" data-text="비밀번호 확인" value="${vo.pw}">
		<div id="res1"></div> <br>
		
		이름<input type="text" name="name" id="name" data-text="이름" value="${vo.name}"> <br> <br> 
		
		성별<br>
		<input type="radio" name="radio1" class="radio1" value="남자" data-text="성별">남자
		<input type="radio" name="radio1" class="radio1" value="여자">여자 <br> <br> 
		
		취미<br>
		<input type="checkbox" name="cb" class="cb" value="축구" data-text="취미">축구
		<input type="checkbox" name="cb" class="cb" value="농구">농구 
		<input type="checkbox" name="cb" class="cb" value="배드민턴">배드민턴 
		<input type="checkbox" name="cb" class="cb" value="독서">독서<br>
		<div id="res2"></div> <br> 
		
		가입경로<br> 
		<input type="radio" name="radio2" class="radio2" value="검색" data-text="가입경로">검색 
		<input type="radio" name="radio2" class="radio2" value="기타">기타 <br> <br> 
		
		<div id="sns">
			<div class='snsDiv'>
				<input type='text' class='snsName'> : 
				<input type='text' class='snsAddr'>
				<input type='button' class='removeSns' value='삭제'>
			</div>	
		</div>
		<input type="button" id="addSns" value="추가"><br> <br>
		<input type="hidden" id="goSns" name="sns">
		
		<input type="submit" onclick="return click2()" value="정보수정"> 
		
		<input type="hidden" id="hRadio1" value="${vo.radio1}"> 
		<input type="hidden" id="hRadio2" value="${vo.radio2}"> 
		<input type="hidden" id="hCb" value="${vo.cb}"> 
		<input type="hidden" id="hSns" value="${vo.sns}">
		<input type="text" value="${vo.sns}">
	</form>
</body>
<script>
	var radio1 = $("#hRadio1").val()
	var radio2 = $("#hRadio2").val()
	//var json = JSON.parse($("#hSns").val());
	var json = $("#hSns").val();
	var snsNum = 0;
	
	$('#addSns').click(function() {
		$('#sns').append("<div class='snsDiv'><input type='text' class='snsName'> : <input type='text' class='snsAddr'> <input type='button' class='removeSns' value='삭제'></div>");
	})
// 	$(document).on("click", ".removeSns", function() {
// 			$(this).parent().remove();
// 	})
	//---------------------------------
	$(function() {
		var cb = $("#hCb").val()
		cb = cb.replace(']', '');
		cb = cb.replace('[', '');
		cb = cb.replace(/ /g, '');
		var cbArray = cb.split(',');

		$(".cb").each(function() {
			for (var i = 0; i < cbArray.length; i++)
				if ($(this).val() == cbArray[i])
					$(this).attr('checked', true);
		});
		$('.radio1').each(function() {
			if ($(this).val() == radio1) {
				$(this).attr('checked', true);
			}
		});
		$('.radio2').each(function() {
			if ($(this).val() == radio2) {
				$(this).attr('checked', true);
			}
		});
		// 		$.each(json, function(key, value){
		// 			$(".snsName").eq(snsNum).val(key);
		// 			$(".snsAddr").eq(snsNum).val(value);
		// 			$('#sns').append("<input type='text' class='snsName'> : <input type='text' class='snsAddr'><br>");
		// 			snsNum += 1;
		// 		});
		json = json.replace('{', '');
		json = json.replace('}', '');
		json = json.replace(/\"/g,'');
		json = json.replace(/:/g, ',');
		jsonArray = json.split(',');
		alert(json);
		for(var i = 0; i <= jsonArray.length; i++){
			if(i % 2 == 0)
				$(".snsName").eq(snsNum).val(jsonArray[i]);
			if(i % 2 == 1) {
				$(".snsAddr").eq(snsNum).val(jsonArray[i]);
				snsNum += 1;
				$('#sns').append("<div class='snsDiv'><input type='text' class='snsName'> : <input type='text' class='snsAddr'> <input type='button' class='removeSns' value='삭제'></div>");
			}
		}
	})
	//----------------------------------------------------------------	
	$('#pw').keyup(function() {
		if ($('#pw').val() != $('#pwCheck').val()) {
			$('#res1').text('');
			$('#res1').html("<b>암호가 틀립니다</b>").css("color", "red");
		} else {
			$('#res1').text('');
			$('#res1').html("<b>암호가 맞습니다</b>").css("color", "green");
		}
	})
	//----------------------------------------------------------------
	$('#pwCheck').keyup(function() {
		if ($('#pw').val() != $('#pwCheck').val()) {
			$('#res1').text('');
			$('#res1').html("<b>암호가 틀립니다</b>").css("color", "red");
		} else {
			$('#res1').text('');
			$('#res1').html("<b>암호가 맞습니다</b>").css("color", "green");
		}
	})
	//--------------------------------------------------
	$('.cb').click(function() {
		var cnt = $(".cb:checked").length;
		if (cnt == 0) {
			$('#res2').text('');
			$('#res2').html("<b>1개 이상 선택하세요</b>").css("color", "red");
		} else {
			$('#res2').text('');
			$('#res2').html("<b>" + cnt + "개 선택함</b>").css("color", "green");
		}
	})
	//--------------------------------------------
	function click2() {
		var array = [ "#id", "#nname", "#pw", "#pwCheck", "#name", ".radio1",
				".cb", ".radio2" ];

		for (var i = 0; i < array.length; i++) {
			if ($(array[i]).val() == "" && i < 5) {
				alert($(array[i]).data("text") + " 입력하세요");
				$(array[i]).focus();
				return false;
				break;
			} else if ($(array[i] + ":checked").length < 1 && 4 < i) {
				alert($(array[i]).first().data("text") + " 체크");
				$(array[i]).first().focus();
				return false;
				break;
			}
		}
		//-------------------------------------------
		if ($('#pw').val() != $('#pwCheck').val()) {
			alert("비밀번호가 다릅니다");
			return false;
		}
		//-------------------------------------------
		var ob = new Object();
		$(".snsName").each(function(i) {
			if ($(this).val() != "" && $(".snsAddr").eq(i).val() != "") {
				ob[$(this).val()] = $(".snsAddr").eq(i).val();
			}
		})

		var obStr = JSON.stringify(ob);
		$("#goSns").val(obStr);
	}
</script>
</html>