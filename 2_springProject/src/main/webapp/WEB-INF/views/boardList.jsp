<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">List</h2>
			</div>
		</div>
		<div class="row">
			<div class="col text-end">
				<a href="writeForm" class="btn btn-outline-success">글쓰기</a>
			</div>
		</div>
		<div class="row my-3">
			<div class="col">
				<table class="table table-hover">
					<thead>
						<tr class="table-dark">
							<th>날짜</th>
							<th>ID</th>
							<th>총액</th>
							<th>내역</th>
							<th>평가</th>
						</tr>
					</thead>
					<tbody class="text-secondary">
						<!-- 게시 글이 있는 경우
						-->
						<c:if test="${not empty bList}">
							<c:forEach var="b" items="${bList}">
								<tr>
									<td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark"><fmt:formatDate value="${b.date}" pattern="yy-MM-dd E"/></a></td>
									<td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark">${b.writer}</a></td>
									<td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark"><fmt:formatNumber value="${b.price}" pattern="#,###"/>원</a></td>
									<td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark">${b.content }</a></td>
									<td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark">Good ${b.good} / Bad ${b.bad}</a></td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- 게시 글이 없는 경우
						-->
						<c:if test="${ empty bList }">
							<tr>
								<td colspan="5" class="text-center">
									게시 글이 존재하지 않습니다.
								</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>