<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/member.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.7.1.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	height: 100vh;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	background: url('resources/images/background.jpg') no-repeat center center fixed;
	background-size: cover;
}

.container::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.5); /* 검은색 필터, 투명도 0.5 */
	z-index: 1;
}

.content {
	position: relative;
	z-index: 2;
	width: 100%;
	max-width: 1200px;
	color: #fff;
}

.head {
	text-align: center;
	margin-bottom: 30px;
}

.section {
	margin-bottom: 30px;
	text-align: center;
}

.section:hover video {
	opacity: 1;
}

video {
	opacity: 0.3; 
    transition: opacity 0.3s ease-in-out;
	width: 100%;
	margin-top: 10px;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
a{
	text-decoration:none;
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-12 head">
					<h1>Show me the money</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 section">
					<h2><a href="loginForm">나의 영수증</a></h2>
					<video class="video" src="resources/videos/record1.mov" loop muted></video>
				</div>
				<div class="col-md-6 section">
					<h2>경제야 놀자</h2>
					<video class="video" src="resources/videos/record2.mov" loop muted></video>
				</div>
			</div>
		</div>
	</div>
<script>
$(document).ready(function(){
	$('.section').hover(function(){
		$(this).find('video').get(0).play();
	}, function(){
		$(this).find('video').get(0).pause();
		$(this).find('video').get(0).currentTime = 0;
	});
	
	
});
</script>
</body>
</html>
