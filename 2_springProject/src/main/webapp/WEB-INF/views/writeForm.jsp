<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="resources/js/writeForm.js"></script>
<div class="row">
	<div class="col">
		<div id="controlPanel">
        	<input type="checkbox" id="selectAll"> 모두 선택
        	<button id="addForm">추가</button>
        	<button id="deleteSelected">삭제</button>
    	</div>
    	<div class="formContainer">
		<form class="submitForm " method="post">
			<input type="hidden" name="id" value="이현학"/> 
			<input type="checkbox" class="formCheckbox"> <select
				name="consume-tag" class="consume-tag">
				<option value="" disabled selected>소비태그</option>
				<option value="food">식비</option>
				<option value="shopping">쇼핑</option>
				<option value="store">편의점&마트</option>
				<option value="transportation">교통비</option>
				<option value="tax">보험&세금</option>
				<option value="housing">주거&통신</option>
				<option value="etc">기타</option>
			</select> 
			
			<input type="text" name="price" placeholder="가격"> 
			
			<select
				name="paymentMethod" class="paymentMethod">
				<option value="" disabled selected>결제수단</option>
				<option value="cash">현금</option>
				<option value="credit-card">신용카드</option>
				<option value="debit-card">체크카드</option>
				<option value="mobile-pay">모바일 결제</option>
				<option value="bank-transfer">계좌이체</option>
			</select> 
			
			<input type="date" name="date">
			
			<input type="submit" class="submitOne btn btn-primary">
			<input type="reset"  class="resetBtn btn btn-danger">
			
		</form>
		</div>
		<button id="submit-all">한 번에 보내기</button>
	</div>
</div>

<div class="row">
	<div class="col">
		<h2>${myList.writer }님의 소비 활동</h2>
	</div>
</div>
