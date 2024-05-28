<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="resources/js/reply.js"></script>
<div class="row my-5" id="global-content">
	<div class="col-6 border border-secondary">
		<form name="checkForm" id="checkForm">
			<input type="hidden" name="no" id="no" value="${budget.no}">
		</form>
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold"><fmt:formatDate value="${budget.date}" pattern="yy-MM-dd(E)"/>
					${budget.writer}
					<fmt:formatNumber value="${budget.price}" pattern="#,###"/>원
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<fmt:formatNumber value="${budget.price}" pattern="#,###"/>원
				 ${budget.content}
			</div>
		</div>
		<div class="row my-3">
			<div class="col text-center">
				<input type="button" class="btn btn-outline-primary" id="detailUpdate" value="수정하기" >
				&nbsp;&nbsp;
				<input type="button" class="btn btn-outline-primary" id="detailDelete" value="삭제하기" >
					&nbsp;&nbsp;
				<input type="button" class="btn btn-outline-primary" value="목록보기" 
					onclick="location.href='boardList'">
			</div>
		</div>
	</div>
	<!-- 댓글 -->
	<div class="col-6 border border-secondary">
		<div class="row" id="replyTitle">
			<div class="col text-center mt-3">
				<h3>평가</h3>
			</div>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
		  <button id="replyWrite" class="btn btn-outline-primary me-md-2" type="button">평가하기</button>
		</div>
		<c:if test="${not empty replyList}">
			<div class="row mb-3">
				<div class="col" id="replyList">
					<c:forEach var="r" items="${replyList}" >
						<div class="replyRow row">
							<div class="col-8">
								<div class="row">
									<div class="col">
										<span>${r.replyWriter}</span>
										<span class="me-3">
											<fmt:formatDate value="${r.regDate}" pattern="yy-MM-dd HH:mm:ss" />
										</span>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<pre>${r.replyContent}</pre>
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
					<input type="hidden" name="bbsNo" value="${ budget.no }"/>
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