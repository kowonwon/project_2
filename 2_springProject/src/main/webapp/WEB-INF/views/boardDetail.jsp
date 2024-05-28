<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row my-5" id="global-content">
	<div class="col">
		<form name="checkForm" id="checkForm">
			<input type="hidden" name="no" id="no" value="${budget.no}">
		</form>
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold"><fmt:formatDate value="${budget.date}" pattern="yy-MM-dd(E)"/>
					${budget.writer}
					<fmt:formatNumber value="${budget.price}" pattern="#,###"/>원
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<fmt:formatNumber value="${budget.price}" pattern="#,###"/>원
				 ${budget.content}
			</div>
		</div>
	</div>
</div>