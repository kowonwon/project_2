<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>인덱스</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.7.1.min.js"></script>
<script src="resources/js/formcheck.js"></script>
</head>
<body>
	<div class="row container">
		<div class="col-3 border border-secondary">
			<%@ include file="template/side.jsp" %>
		</div>
		<div class="col-9">
			<jsp:include page="${param.body}" />
		</div>
		<%@ include file="template/footer.jsp" %>
	</div>
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>