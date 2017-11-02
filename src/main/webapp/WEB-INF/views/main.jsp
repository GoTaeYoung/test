<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
	list-style: none;
	text-decoration: none;
	text-align: center;
}

#menu {
	width: 600px;
}

#menu li {
	float: left;
	padding: 10px;
	margin: 0 5px; text-align : center;
	width: 20%;
	transition: 0.4s;
	cursor: pointer;
	text-align: center;
}

#menu li:hover {
	background-color: gray;
	color: white;
}
</style>
</head>
<body>
	<h1>${vo.nname}님</h1>
	<div id="menu">
		<li>공지사항</li>
		<li>이벤트</li>
		<li>자유게시판</li>
		<li>마이페이지</li>
	</div>
	${vo.sns }
</body>
</html>