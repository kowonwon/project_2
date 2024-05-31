<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<style>
/* 아래 처럼 .aside *  하시면 제어 가능 */
aside{
	margin:0;
	padding:0;
}


.aside a {
	text-decoration: none;
	color: inherit;
}

.aside .logout {
	font-style: italic;
	text-decoration: underline;
	align-self: center;
}

div.banner1{
	margin-top : 20px;
	width: 320px;
	height: 100px;

}

div.banner1:hover{
	filter : brightness(70%);
}


div.banner2{
	margin-top : 20px;
	width: 320px;
	height: 100px;
}

div.banner2:hover{
	filter : brightness(70%);
}

.rounded {
	margin-top : 10px;
	width: 300px;
	height: 200px;

}

div.ment {

	margin-top : 10px;
	margin-bottom : 15px;
}

div.banners{
	
	margin-top : 5px;
	margin-bottom : 40px;
	width : 320px;

}

img.logoImg{
	width: 200px;
}

img.bannerImg{

	width: 300px;
	height: 100px;
}

.btn-outline-success{
	border-color:#EBD9B4;
}

.btn-outline-success:hover{
	background-color:#F9EFDB;
	color : green;
}
</style>

<aside class="aside">
	<!--profile-->
	<div class="row text-center">
		<div class="col">
			<img class="logoImg" src="resources/images/logo.png">
		</div>
	</div>
	<div class="row" >
		<div class="col" >
			<!-- 기본 이미지  -->
			<div>
 				 <img src="https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_640.jpg" class="rounded" alt="...">
			</div>
			
			<c:if test="${empty sessionScope.isLogin }" >
			<div class="ment text-center">
			 로그인을 해주세요.
			 </div>
			 </c:if>
			 
			<c:if test="${ sessionScope.isLogin }" >
			<div class="ment text-center">
				<b>${ sessionScope.member.nickname }</b>님, 안녕하세요!
			</div>
			</c:if>
			
			<p class="d-flex justify-content-between align-itmes-center">
			<c:if test="${ sessionScope.isLogin }" >
				<a href="memberUpdateForm" class="btn btn-outline-success btn-sm">정보 수정</a>
			</c:if>
			
			<c:if test="${empty sessionScope.isLogin }" >
				<a class="btn btn-outline-success btn-sm" href="loginForm" style="width:300px;">
				  로그인
				</a>
			</c:if>
			<c:if test="${sessionScope.isLogin }" >
				<a href="logout" class="btn btn-outline-success btn-sm">로그아웃</a>
			</c:if>
			</p>
			


			<!-- 
			<p class="d-flex justify-content-between align-itmes-center">
				<input type="button" class="btn btn-danger ms-auto" value="회원 정보 수정"
					onclick="location.href='updateMemberForm'" />
				<a href="loginForm" class="logout">로그아웃</a>
			</p> -->

		</div>
	</div>
	<!-- end profile -->

	<!--category -->
	<!-- 각자 본인 사이트에 맞게 수정 -->
	<div class="banners">
	<div class="row">
		<div class="col">
			<div class="banner2">
			<a href="boardList">
				<img class="bannerImg" alt="" src="resources/images/list.png">
			</a>
			</div>
		</div>
	</div>
	<!-- category end -->

	<!-- 배너2-->
	<div class="row">
		<div class="col">
			<div class="banner2">
			<a href="calendar">
				<img class="bannerImg" alt="" src="resources/images/calendar.png">
			</a>
			</div>
		</div>
	</div>

	<!-- 배너3 -->
	<div class="row">
		<div class="col">
			<div class="banner1">
			<a href="myPage">
				<img class="bannerImg" alt="" src="resources/images/receipt.png">
			</a>
			</div>
		</div>
	</div>
	<!-- 배너4 -->
	<div class="row">
		<div class="col">
			<div class="banner2">
			<a href="http://192.168.0.22:8080/springstudy-bbs04/loginForm">
				<img class="bannerImg" alt="" src="resources/images/economy.png">
			</a>
			</div>
		</div>
	</div>
	</div>
</aside>
