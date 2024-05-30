<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="resources/js/board.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<style>
.table thead th {
	background-color: rgba(40, 167, 69, 0.5);
}
</style>

<!-- 제목부분 -->
<div class="row bg-success p-2">
	<div class="col">
		<h2 class="fs-2 text-white">월간 리포트</h2>
	</div>
</div>


<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<canvas id="chart1"></canvas>
			</div>
			<div class="col">
				<canvas id="chart2"></canvas>
			</div>
			<div class="col">
				<canvas id="chart3"></canvas>
			</div>
		</div>
	</div>
</div>

<div class="row my-5">
	<div class="col">
		<table class="table table-hover">
			<thead>
				<tr class="table">
					<th>날짜</th>
					<th>ID</th>
					<th>총액</th>
					<th>내역</th>
					<th>평가</th>
				</tr>
			</thead>
			<tbody class="tbody ">
				<!-- 게시 글이 있는 경우
						-->
				<c:if test="${not empty bList}">
					<c:forEach var="b" items="${bList}">
						<tr>
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark"><fmt:formatDate
										value="${b.date}" pattern="yy-MM-dd E" /></a></td>
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark">${b.writer}</a></td>
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark"><fmt:formatNumber
										value="${b.price}" pattern="#,###" />원</a></td>
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark">${b.content }</a></td>
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark">Good ${b.good} / Bad
									${b.bad}</a></td>
						</tr>
					</c:forEach>
				</c:if>
				<!-- 게시 글이 없는 경우
						-->
				<c:if test="${ empty bList }">
					<tr>
						<td colspan="5" class="text-center">게시 글이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
