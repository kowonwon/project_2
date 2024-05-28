$(function() {
	$("#detailUpdate").on("click", function() {
		$("#checkForm").attr("action", "update");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	})
	
	$("#detailDelete").on("click", function() {
		$("#checkForm").attr("action", "delete");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	})
})