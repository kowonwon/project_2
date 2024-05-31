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
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<script src="resources/js/jquery-3.7.1.min.js"></script>
<style>
body {
	font-family: 'Roboto', Arial, sans-serif;
	height: 100vh;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	background: url('resources/images/background2.jpeg') no-repeat center center fixed;
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
	position: relative;
	top: -70px; /* 제목을 더 위로 이동 */
}

.head h1 {
	font-size: 3.5em;
	font-weight: bold;
	font-family: 'Roboto', sans-serif;
	color: #ffd700; /* 금색 */
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); /* 약간의 그림자 효과 */
}

.section {
	margin-bottom: 30px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 300px; /* 고정 높이 설정 */
}

.section:hover video {
	opacity: 1;
}

video {
	opacity: 0.5; 
    transition: opacity 0.1s ease-in-out;
	width: 100%;
	height: 300px; /* 부모 요소 높이에 맞추기 */
	margin-top: 10px;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	object-fit: cover; /* 비디오 내용이 컨테이너를 채우도록 */
}

a {
	text-decoration: none;
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="col-12 head">
					<h1>SHOW ME THE MONEY</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 section"><a href="loginForm">
					<h2>나의 영수증</h2>
					<video class="video" src="resources/videos/record1.mov" loop muted></video>
				</a></div>
				<div class="col-md-6 section"><a href="http://192.168.0.22:8080/springstudy-bbs04/loginForm">
					<h2>경제야 놀자</h2>
					<video class="video" src="resources/videos/record2.mov" loop muted></video>
				</a></div>
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
