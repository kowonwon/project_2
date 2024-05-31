<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나의 영수증</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/member.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.7.1.min.js"></script>
<script src="resources/js/formcheck.js"></script>
<script src="resources/js/member.js"></script>
<script src="resources/js/reply.js"></script>
</head>
<body>
	<div class="row container">
		<aside class="col-3">
			<%@ include file="template/aside.jsp" %>
		</aside>
		<div class="col-9 mt-5">
			<jsp:include page="${param.body}" />
		</div>
		<%@ include file="template/footer.jsp" %>
	</div>
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- 모달 -->
	<div class="modal fade" id="loginModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
      	<div class="modal-header bg-secondary bg-gradient text-white">
        	<h1 class="modal-title fs-5 fw-bold" id="modalLabel">회원 로그인</h1>
        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      	<form action="login" method="post">
	      	<div class="modal-body">
	      	  <div class="mb-3">
	      	  	<label for="id" class="col-form-label fw-bold">아이디 : </label>
	      	  	<input type="text" class="form-control" id="id" name="id">
	      	  </div>
	      	  <div class="mb-3">
	      	  	<label for="pass" class="col-form-label fw-bold">비밀번호 : </label>
	      	  	<input type="password" class="form-control" id="pass" name="pass">
	      	  </div>
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
	        	<button type="submit" class="btn btn-outline-secondary">로그인</button>
	      	</div>
      	</form>
    	</div>
  	</div>
	</div>
</body>
</html>