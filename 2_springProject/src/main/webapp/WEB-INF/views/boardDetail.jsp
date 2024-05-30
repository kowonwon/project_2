<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.evaluation {
		width: 25vw;
		background-color: beige;
	}
</style>
<div class="row my-5" id="global-content">
	<div class="col-6 border border-secondary border-end-0">
		<form name="checkForm" id="checkForm">
			<input type="hidden" name="no" id="no" value="${budget.no}">
		</form>
		<div class="row text-center bg-info-subtle">
			<div class="col mt-3 mb-2">
				<h2 class="fs-3 fw-bold"><fmt:formatDate value="${budget.date}" pattern="yy-MM-dd(E)"/>
					${budget.writer}
					<c:forEach var="b" items="${budgetList}">
						<c:set var="total" value="${total + b.price}" />
					</c:forEach>
					<fmt:formatNumber value="${total}" pattern="#,###"/>원
				</h2>
			</div>
		</div>
		<c:if test="${not empty budgetList}">
			<c:forEach var="b" items="${budgetList}" >
				<div class="row my-3 fs-5">
					<div class="col text-center">
						${b.content} <fmt:formatNumber value="${b.price}" pattern="#,###"/>원
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty budgetList}">
			<div class="row">
				<div class="col">
					budgetList가 비었습니다.
				</div>
			</div>
		</c:if>
		<div class="row justify-content-center">
			<div class="col-10 text-center">
				<div class="evaluation fs-5 py-3 my-3">
					<p class="fw-bold">자기평가</p>
					<c:if test="${not empty budgetList}">
						<c:forEach var="b" items="${budgetList}" >
							<p>#${b.evaluation}</p>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row my-3">
			<div class="col text-center">
				<input type="button" class="btn btn-outline-success btn-sm" id="detailUpdate" value="수정하기" >
				&nbsp;&nbsp;
				<input type="button" class="btn btn-outline-warning btn-sm" id="detailDelete" value="삭제하기" >
					&nbsp;&nbsp;
				<input type="button" class="btn btn-outline-success btn-sm" value="목록보기" 
					onclick="location.href='boardList'">
			</div>
		</div>
	</div>
	<!-- 댓글 -->
	<div class="col-6 border border-secondary">
		<div class="row bg-info-subtle" id="replyTitle">
			<div class="col text-center mt-3 mb-2 fs-3">
				<h3 class="fw-bold">평가</h3>
			</div>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end my-3">
		  <button id="replyWrite" class="btn btn-outline-success me-md-2" type="button">평가하기</button>
		</div>
		<c:if test="${not empty replyList}">
			<div class="row mb-3">
				<div class="col" id="replyList">
					<c:forEach var="r" items="${replyList}" >
						<div class="replyRow row">
							<div class="col-8">
								<div class="row">
									<div class="col fs-5">
										<span>${r.replyWriter}</span>
										<span class="me-3">
											<fmt:formatDate value="${r.regDate}" pattern="yy-MM-dd HH:mm:ss" />
										</span>
									</div>
								</div>
								<div class="row">
									<div class="col fs-6">
										<p>${r.replyContent}</p>
									</div>
								</div>
							</div>
							<div class="col-4">
								<button class="modifyReply btn btn-outline-success btn-sm" data-no="${r.no}">
									<i class="bi bi-journal-text">수정</i>
								</button>
								<button class="deleteReply btn btn-outline-warning btn-sm" data-no="${r.no}">
									<i class="bi bi-trash">삭제</i>
								</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		<c:if test="${empty replyList}">
			<div class="row mb-5" id="replyList">
				<div class="col text-center">
					<div>평가가 없습니다.</div>
				</div>
			</div>
		</c:if>
		<!-- 댓글쓰기 폼 -->
		<div class="row my-3 d-none" id="replyForm">
			<div class="col">
				<form name="replyWriteForm" id="replyWriteForm">
					<input type="hidden" name="bbsNo" value="${budget.no}"/>
					<input type="hidden" name="replyWriter" value="${sessionScope.member.id}" />
					<div class="row bg-light my-3 p-3 border">
						<div class="col">
							<div class="row my-3">
								<div class="col-12">
									<textarea name="replyContent" id="replyContent" class="form-control" rows="4"></textarea>
								</div>
								<div class="col-md">
									<input type="submit" value="제출" class="btn btn-outline-success h-100 w-100" id="replyWriteButton">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>