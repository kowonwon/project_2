<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="resources/js/writeForm.js"></script>
<script type="text/javascript">
	// 세션에서 nickname 값을 가져와서 JavaScript 변수로 설정합니다.
<%="var nickname = '" + session.getAttribute("nickname") + "';"%>
	
</script>
<style>
.formCheckbox {
	width: 1.25rem;
	height: 1.25rem;
	margin-top: 0.375rem;
	/* Aligns the checkbox vertically with the select box */
}
 .table thead th{
	background-color: rgba(173, 216, 230, 0.5);
}
</style>

<!-- 제목부분 -->
<div class="row bg-info p-2">
	<div class="col">
		<h2 class="fs-2 text-white">${nickname }님의 지출내역</h2>
	</div>
</div>

<!-- 컨트롤 패널 -->
<div class="row my-3">
	<div class="col">
		<div id="controlPanel">
			<div
				class="form-check form-switch d-flex align-items-center justify-content-between">
				<div class="d-flex align-items-center">
					<input class="form-check-input" type="checkbox" role="switch"
						id="selectAll"> <span id="deleteSelected"
						class="ps-3 fs-5">❌ 선택 삭제</span>
				</div>
				<i class="bi bi-plus-circle text-end fs-5" id="addForm">추가</i>
			</div>
		</div>
	</div>
</div>

<!-- 제출 폼 컨테이너 -->
<div class="row mt-3">
	<div class="col">
		<div class="formContainer border border-secondary-subtle rounded">

			<form class="submitForm p-3" method="post">
				<!-- 수정 삭제를 위한 히든 인풋 -->
				<input type="hidden" name="writer" value="${nickname}" />
				<div class="row mb-2">
					<div class="col-auto m-0 p-0 ms-1">
						<input type="checkbox" class="formCheckbox me-1">
					</div>

					<div class="col ">
						<div class="row mb-2">
							<div class="col-3 d-flex align-items-center">
								<select name="category" class="form-select consume-tag">
									<option value="" disabled selected>소비태그</option>
									<option value="식비">식비</option>
									<option value="쇼핑">쇼핑</option>
									<option value="펀의점&마트">편의점&마트</option>
									<option value="교통비">교통비</option>
									<option value="보험&세금">보험&세금</option>
									<option value="주거&통신">주거&통신</option>
									<option value="기타">기타</option>
								</select>
							</div>
							<div class="col">
								<input type="text" name="content" class="form-control"
									placeholder="소비내역">
							</div>
						</div>

						<div class="row mb-2">
							<div class="col-3">
								<select name="payment" class="form-select payment">
									<option value="" disabled selected>결제수단</option>
									<option value="현금">현금</option>
									<option value="신용카드">신용카드</option>
									<option value="체크카드">체크카드</option>
									<option value="모바일결제">모바일 결제</option>
									<option value="계좌이체">계좌이체</option>
								</select>
							</div>
							<div class="col">
								<input type="text" name="price" class="form-control"
									placeholder="가격(원)">
							</div>
						</div>

						<div class="row mb-2 ">
							<div class="col">
								<input type="date" name="date" class="form-control">
							</div>
						</div>

						<div class="row mb-2 justify-content-center ">
							<div class="col-6">
								<input type="submit" class="submitOne btn btn-primary w-100"
									value="제출하기">
							</div>
							<div class="col-6">
								<input type="reset" class="resetBtn btn btn-warning w-100"
									value="취소하기">
							</div>
						</div>

					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="row my-2">
	<div class="col">
		<button id="submitAll" class="btn btn-secondary btn-lg">모두 제출</button>
	</div>
</div>





<div class="row">
	<div class="col">
		<table class="table table-hover">
			<thead>
				<tr class="thead">
					<th class="col-2">날짜</th>
					<th class="col-2">소비태그</th>
					<th class="col-2">가격(원)</th>
					<th class="col-3">내용</th>
					<th class="col-2">결제수단</th>
					<th class="col-1"></th>
				</tr>
			</thead>
			<tbody class="text-secondary" id="myList">
				<!-- 게시 글이 있는 경우 -->
				<c:if test="${not empty myList}">
					<c:forEach var="b" items="${myList}">
						<tr>
							<input type="hidden" name="writer" value="${b.writer}" />
							<td class="col-2"><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark"><fmt:formatDate
										value="${b.date}" pattern="yy-MM-dd" /></a></td>
							<td class="col-2"><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark">${b.category}</a></td>
							<td class="col-2"><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark">${b.price }</a></td>
							<td class="col-3"><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark">${b.content }</a></td>
							<td class="col-2"><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark"></a>${b.payment }</td>
							<td class="col-1"><i class="bi bi-pencil-square updateList"
								data-no="${b.no }"></i> <i class="bi bi-x-octagon deleteList"
								data-no="${b.no }"></i></td>
						</tr>
					</c:forEach>
				</c:if>
				<!-- 게시 글이 없는 경우 -->
				<c:if test="${ empty myList }">
					<tr>
						<td colspan="5" class="text-center">게시 글이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</div>