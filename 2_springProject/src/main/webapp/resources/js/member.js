$(function() {
	$("#login").submit(function() {
		var id = $("#id").val();
		var pass = $("#pass").val();
		
		if(id.length <= 0) {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}
		if(pass.length <= 0) {
			alert('비밀번호를 입력해주세요.');
			$("#pass").focust();
			return false;
		}
	})
})