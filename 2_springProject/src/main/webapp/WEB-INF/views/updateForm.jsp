<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">수정하기</h2>
			</div>
		</div>
		<form name="updateForm" action="updateProcess" id="updateForm"
			class="row g-3 border-primary" method="post">
			<input type="hidden" name="no" value="${budget.no}">
			<div class="row">
				<div class="col-2">
					<label for="writer" class="form-label" id="writer">작성자</label>
					<input type="text" class="form-control" name="writer" value="${budget.writer}" readonly>
				</div>
				<div class="col-2">
				<label for="category" class="form-label">카테고리</label>
					<select class="form-control" name="category">
						<option value="">식비</option>
						<option value="">의류</option>
						<option value="">생필품</option>
						<option value="">취미</option>
						<option value="">경조사</option>
						<option value="">기타</option>
					</select>
				</div>
				<div class="col-3">
					<label for="price" class="form-label">비용</label>
					<input type="number" class="form-control" name="price" id="price" value="${budget.price}">
				</div>
				<div class="col-3">
					<label for="content" class="form-label">내역</label>
					<input type="text" class="form-control" name="content" id="content" value="${budget.content}" >
				</div>
			</div>
			<div class="row my-3">
				<div class="col">
					<label for="evaluation" class="form-label">소감</label>
					<textarea class="form-control" name="evaluation" id="evaluation" rows="2">${budget.evaluation}</textarea>
				</div>
			</div>
			<div class="col-8 offset-md-2 text-center mt-5">
				<input type="submit" value="수정하기" class="btn btn-primary"/>
					&nbsp;&nbsp;<input type="button" value="목록보기"
					onclick="location.href='boardList'" class="btn btn-primary"/>
			</div>
		</form>
		
	</div>
</div>