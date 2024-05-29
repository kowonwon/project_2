<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col text-end pe-5 text-primary">
		<c:if test="${sessionScope.isLogin}" >
			<div>안녕하세요 ${sessionScope.member.nickname}님</div>
		</c:if>
	</div>
</div>
<div class="row text-center">
	<div class="col">
		<c:if test="${not sessionScope.isLogin}">
			<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#loginModal">
			  로그인
			</button>
		</c:if>
		<c:if test="${sessionScope.isLogin}">
			<a class="btn btn-outline-secondary" href="logout">로그아웃</a>
		</c:if>
	</div>
</div>
<div class="row text-center">
	<div class="col">
		<c:if test="${not sessionScope.isLogin}">
			<a class="btn btn-outline-secondary" href="#">회원가입</a>
		</c:if>
		<c:if test="${sessionScope.isLogin}">
			<a class="btn btn-outline-secondary" href="#">정보수정</a>
		</c:if>
	</div>
</div>