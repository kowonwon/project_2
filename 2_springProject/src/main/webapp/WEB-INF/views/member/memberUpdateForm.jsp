<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row my-3 text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">회원 정보 수정</h2>
			</div>
		</div>
		<form action="memberUpdateResult" name="memberUpdateForm" method="post" id="memberUpdateForm">
			<div class="row mt-5 mb-3">
				<div class="col-8 offset-2">
					<label for="nickname" class="form-label">별명 : </label>
					<input type="text" class="form-control" name="nickname" id="nickname"
						value="${sessionScope.member.nickname}" readonly>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="id" class="form-label">아이디 : </label>
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" name="id" id="id"
									value="${sessionScope.member.id}" readonly>
						</div>
					</div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="oldPass" class="form-label">기존 비밀번호 : </label>
					<div class="row">
						<div class="col-6">
							<input type="password" class="form-control" name="oldPass" id="oldPass">
						</div>
						<div class="col-4">
							<input type="button" class="btn btn-outline-warning" id="btnPassCheck" value="비밀번호 확인">
						</div>
					</div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="pass1" class="form-label">새 비밀번호 : </label>
					<input type="password" class="form-control" name="pass1" id="pass1">
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="pass2" class="form-label">새 비밀번호 확인 : </label>
					<input type="password" class="form-control" name="pass2" id="pass2">
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="emailId" class="form-label">이메일 : </label>
					<div class="row">
						<div class="col-md-4">
							<input type="text" class="form-control" name="emailId" id="emailId"
								value="${sessionScope.member.email.split('@')[0]}">
						</div>@
						<div class="col-md-4">
							<input type="text" class="form-control" name="emailDomain" id="emailDomain"
								value="${sessionScope.member.email.split('@')[1]}">
						</div>
						<div class="col-md-3">
							<select class="form-select" name="selectDomain" id="selectDomain">
								<option>직접입력</option>
								<option>네이버</option>
								<option>구글</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="moblie2" class="form-label">휴대폰 : </label>
					<div class="row">
						<div class="col-md-3">
							<select class="form-select" name="mobile1" id="mobile1">
								<option ${member.mobile.split('-')[0] == 010 ? "selected" : ""}>010</option>
								<option ${member.mobile.split('-')[0] == 011 ? "selected" : ""}>011</option>
								<option ${member.mobile.split('-')[0] == 016 ? "selected" : ""}>016</option>
								<option ${member.mobile.split('-')[0] == 017 ? "selected" : ""}>017</option>
								<option ${member.mobile.split('-')[0] == 018 ? "selected" : ""}>018</option>
								<option ${member.mobile.split('-')[0] == 019 ? "selected" : ""}>019</option>
							</select>
						</div>-
						<div class="col-md-4">
							<input type="text" class="form-control" name="mobile2" id="mobile2" maxlength="4"
								value="${sessionScope.member.mobile.split('-')[1]}">
						</div>-
						<div class="col-md-4">
							<input type="text" class="form-control" name="mobile3" id="mobile3" maxlength="4"
								value="${sessionScope.member.mobile.split('-')[2]}">
						</div>
					</div>
					<div class="row mb-3 mt-5">
						<div class="col-8 offset-2">
							<input type="submit" value="수정하기" class="btn btn-primary">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>