<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row my-3 text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">회원 정보 입력</h2>
			</div>
		</div>
		<form action="joinResult" name="joinForm" method="post" id="joinForm">
			<input type="hidden" name="isIdCheck" id="isIdCheck" value="false"/>
			<div class="row mt-5 mb-3">
				<div class="col-8 offset-2">
					<label for="nickname" class="form-label">별명 : </label>
					<input type="text" class="form-control" name="nickname" id="nickname">
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8">
					<label for="id" class="form-label">아이디 : </label>
					<input type="text" class="form-control w-10" name="id" id="id">
				</div>
				<div class="col-2">
					<input type="button" class="btn btn-warning" id="btnOverlapId" value="중복확인">
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="pass1" class="form-label">비밀번호 : </label>
					<input type="password" class="form-control" name="pass1" id="pass1">
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="pass2" class="form-label">비밀번호 확인 : </label>
					<input type="password" class="form-control" name="pass2" id="pass2">
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="emailId" class="form-label">이메일 : </label>
					<div class="row">
						<div class="col-md-4">
							<input type="text" class="form-control" name="emailId" id="emailId">
						</div> @
						<div class="col-md-4">
							<input type="text" class="form-control" name="emailDomain" id="emailDomain">
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
					<label for="mobile2" class="form-label">휴대폰 : </label>
					<div class="row">
						<div class="col-md-3">
							<select class="form-select" name="mobile1" id="mobile1">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
						</div>-
						<div class="col-md-4">
							<input type="text" class="form-control" name="mobile2" id="mobile2" maxlength="4">
						</div>-
						<div class="col-md-4">
							<input type="text" class="form-control" name="mobile3" id="mobile3" maxlength="4">
						</div>
					</div>
				</div>
			</div>
			<div class="row mb-3 mt-5">
				<div class="col-8 offset-2">
					<input type="submit" value="가입하기" class="btn btn-primary">
				</div>
			</div>
		</form>
	</div>
</div>