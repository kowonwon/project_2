<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row my-5" id="global-content">
	<div class="col">
		<form class="my-5" id="loginForm" action="login" method="post">
			<h2 class="fw-bold"></h2>
			<fieldset>	
				
				<div id="login">
					<p>
						<label for="userId" class="labelStyle">아이디</label>
						<input type="text" id="userId" name="userId" />
					</p>		
					<p>
						<label for="userPass" class="labelStyle">비밀번호</label>
						<input type="password" id="userPass" name="pass"/>
					</p>
				</div>
				<div>
					<span>비밀번호를 잊으셨나요?</span>
					<input type="submit" value="로그인" id="btnLogin"
						class="btn btn-danger"/>
				</div>
				<div>
					또는
				</div>
				<div>
				
				</div>
			
			</fieldset>
		</form>
	</div>
</div>