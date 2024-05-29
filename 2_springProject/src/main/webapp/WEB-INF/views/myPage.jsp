<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
<script src="resources/js/writeForm.js"></script>
<script type="text/javascript">
    // 세션에서 nickname 값을 가져와서 JavaScript 변수로 설정합니다.
    <%= "var nickname = '" + session.getAttribute("nickname") + "';" %>
</script>
<div class="row">
	<div class="col">
		<div id="controlPanel">
			<input type="checkbox" id="selectAll"> 모두 선택
			<button id="addForm">추가</button>
			<button id="deleteSelected">삭제</button>
		</div>
		<div class="formContainer">
			<form class="submitForm" method="post">
				<input type="hidden" name="writer" value="${nickname}" /> <input
					type="checkbox" class="formCheckbox"> <select
					name="category" class="consume-tag">
					<option value="" disabled selected>소비태그</option>
					<option value="식비">식비</option>
					<option value="쇼핑">쇼핑</option>
					<option value="펀의점&마트">편의점&마트</option>
					<option value="교통비">교통비</option>
					<option value="보험&세금">보험&세금</option>
					<option value="주거&통신">주거&통신</option>
					<option value="기타">기타</option>
				</select> 
				<input type="text" name="content" placeholder="소비내역"> 
				<input	type="text" name="price" placeholder="가격"> 
				<select
					name="payment" class="payment">
					<option value="" disabled selected>결제수단</option>
					<option value="현금">현금</option>
					<option value="신용카드">신용카드</option>
					<option value="체크카드">체크카드</option>
					<option value="모바일결제">모바일 결제</option>
					<option value="계좌이체">계좌이체</option>
				</select> 
				<input type="date" name="date">
				<input type="submit"
					class="submitOne btn btn-primary"> 
				<input type="reset"
					class="resetBtn btn btn-danger">
			</form>
		</div>
		<button id="submitAll">한 번에 보내기</button>
	</div>
</div>


<div class="row">
	<div class="col">
		<h2>${nickname }님의소비 활동</h2>
	</div>
</div>

<div class="row">
	<div class="col">
		<table class="table table-hover">
			<thead>
				<tr class="table-dark">
					<th>날짜</th>
					<th>소비태그</th>
					<th>내용</th>
					<th>가격(원)</th>
					<th>결제수단</th>
				</tr>
			</thead>
			<tbody class="text-secondary" id="myList">
				<!-- 게시 글이 있는 경우 -->
				<c:if test="${not empty myList}">
					<c:forEach var="b" items="${myList}">
						<tr>
							<input type="hidden" name="writer" value="${b.writer}" />
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark"><fmt:formatDate
										value="${b.date}" pattern="yy-MM-dd E" /></a></td>
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark">${b.category}</a></td>
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark"><fmt:formatNumber
										value="${b.price}" pattern="#,###" /></a></td>
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark">${b.content }</a></td>
							<td><a href="boardDetail?no=${b.no}"
								class="text-decoration-none link-dark"></a>${b.payment }</td>
							<td>
								<i class="bi bi-pencil-square updateList" data-no="${b.no }"></i>
								<i class="bi bi-x-octagon deleteList" data-no="${b.no }"></i>
							</td>	
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