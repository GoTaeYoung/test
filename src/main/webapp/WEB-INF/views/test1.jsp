<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<h1>환영합니다 "${vo.nname}" 님</h1>
	<form id="form" method="post">
		<input type="hidden" name="id" value="${vo.id }">
		<table style="text-align: center;">
			<tr>
				<td>ID</td>
				<td>${vo.id}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${vo.pw}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${vo.radio1}</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>${vo.cb}</td>
			</tr>
			<tr>
				<td>가입경로</td>
				<td>${vo.radio2}</td>
			</tr>
			<tr>
				<td>SNS</td>
				<td>${vo.sns}</td>
			</tr>
			<tr></tr>
			<tr>
				<td><input type="button" onclick="goMain(1)" value="정보 수정"></td>
				<td><input type="button" onclick="goMain(2)" value="나가기"></td>
			</tr>
		</table>
	</form>
</body>
<script>
	function goMain(i) {
		if (i == 1)
			$('#form').attr('action', 'test2').submit();
		if (i == 2)
			$('#form').attr('action', 'main').submit();
	}
</script>
</html>