<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	<form action="test1" method="post" id="formId">

		ID:<input type="text" name="id" id="id" data-text="아이디"> 
		<input type="button" onclick="click1()" value="중복확인"> <br> <br>

		닉네임:<input type="text" name="nname" id="nname" data-text="닉네임"> <br> <br> 
		
		비밀번호:<input type="password" name="pw" id="pw" data-text="비밀번호"> <br> 
		비밀번호 확인:<input type="password" name="pwCheck" id="pwCheck" data-text="비밀번호 확인">
		<div id="res1">비밀번호를 입력하세요</div> <br> 
		
		이름<input type="text" name="name" id="name" data-text="이름"> <br> <br> 
		
		성별<br> 
		<input type="radio" name="radio1" class="radio1" value="남자" data-text="성별">남자
		<input type="radio" name="radio1" class="radio1" value="여자">여자 <br> <br> 
		
		취미<br> <input type="checkbox" name="cb" class="cb" value="축구" data-text="취미">축구 
		<input type="checkbox" name="cb" class="cb" value="농구">농구 
		<input type="checkbox" name="cb" class="cb" value="배드민턴">배드민턴 
		<input type="checkbox" name="cb" class="cb" value="독서">독서 <br>
		<div id="res2">취미를 1개 이상 선택하세요</div> <br> 
		
		가입경로<br> 
		<input type="radio" name="radio2" class="radio2" value="검색" data-text="가입경로">검색 
		<input type="radio" name="radio2" class="radio2" value="기타">기타 <br> <br> 
		
		SNS<br> 
		<div id="sns">
			<div class='snsDiv'>
				<input type='text' class='snsName'> : 
				<input type='text' class='snsAddr'>
				<input type='button' class='removeSns' value='삭제'>
			</div>	
		</div>
		<input type="button" id="addSns" value="추가"> <br> <br> 
		<input type="hidden" id="goSns" name="sns">
		
		
		<input type="submit" onclick="return click2()" value="회원가입">
	</form>
</body>
<script>
var flag = false;

$('#addSns').click(function() {
	appendElement(this);
});
$(document).on("click", ".removeSns", function() {
		$(this).parent().remove();
});
//----------------------------------------------------------------	
$('#pw').keyup(function() {
	pwCheck($('#pw').val(),$('#pwCheck').val() );
})
//----------------------------------------------------------------
$('#pwCheck').keyup(function() {
	pwCheck($('#pw').val(),$('#pwCheck').val() );
})
//--------------------------------------------------
$('.cb').click(function() {
	checkCheckBox();
});
function checkCheckBox(){
	var element = $('#res2');
	var msg = "";
	var color;
	var cnt = $(".cb:checked").length;
	if (cnt == 0) {
		msg = "<b>1개 이상 선택하세요</b>";
		color = "red";
	} else {
		msg = "<b>" + cnt + "개 선택함</b>";
		color = "green";
	}
	appendMsg(element, msg, color);
}
//---------------------------------
function click1() {
	var id = $("#id").val();
	$.ajax({
		url : '/checkId?id=' + id,
		type : 'get',
		success : function(data) {
			//var ajaxName = decodeURIComponent(data);
			alert(data);
			if (data == "사용 가능") {
				flag = true;
			}
		}
	})
}
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
	//------------------------------------------
	if (flag == false) {
		alert("아이디 중복확인 해주세요");
		return false;
	}
	//-------------------------------------------
	if ($('#pw').val() != $('#pwCheck').val()) {
		alert("비밀번호가 다릅니다");
		return false;
	}
	//----------------------------------------
	
}
function createJsonStrForSns(){
	var jsonOb = new Object();
	var jsonKey="";
	var jsonValue="";
	$(".snsName").each(function(i) {
		jsonKeyValue = $(this).val();
		jsonValue =  $(".snsAddr").eq(i).val();
		if (jsonKey != "" &&  jsonValue!= "") {
			jsonOb[jsonKey] = jsonValue;
		}
	});
	var jsonStr = JSON.stringify(jsonOb);
	$("#goSns").val(jsonStr);
	console.log($("#goSns").val());
}
function appendElement(element){
	var appnedStr=""+
		"<div class='snsDiv'>"+
		"	<input type='text' class='snsName'> : <input type='text' class='snsAddr'> <input type='button' class='removeSns' value='삭제'>"+
		"</div>";
	element.append(appendStr);
}
function appendMsg(element, msg, color){
	element.text("");
	element.css("color",color);
	element.append(msg);
}
function pwCheck(pw,repw){
	if (pw  != repw) {
		appendMsg($('#res1'),"<b>암호가 틀립니다</b>", "red");
	} else {
		appendMsg($('#res1'),"<b>암호가 맞습니다</b>", "green");
	}
}
</script>
</html>

