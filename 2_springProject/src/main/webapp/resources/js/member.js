$(function() {
	
	$("#id").on("keyup", function() {
		var regExp = /[^A-Za-z0-9]/gi;
		if(regExp.test($(this).val())) {
			alert("영문과 숫자만 입력할 수 있습니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
		
	})
	
	$("#pass1").on("keyup", inputCharReplace);
	$("#pass2").on("keyup", inputCharReplace);
	$("#emailId").on("keyup", inputCharReplace);
	$("#emailDomain").on("keyup", inputEmailDomainReplace);
	
	$("#btnOverlapId").on("click", function() {
		var id = $("#id").val();
		url="overlapIdCheck?id=" + id;
		
		if(id.length == 0) {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(id.length < 3) {
			alert("아이디는 3자 이상 입력해주세요.");
			return false;
		}
		
		window.open(url, "idCheck", "height=200");
	})
	
	$("idCheckForm").on("submit", function() {
		var id = $("#checkId").val();
		if(id.length == 0) {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(id.length < 3) {
			alert("아이디는 3자 이상 입력해주세요.");
			return false;
		}
	})
	
	$("#btnIdCheckClose").on("click", function() {
		var id = $(this).attr("data-id-value");
		opener.document.joinForm.id.value = id;
		opener.document.joinForm.isIdCheck.value = true;
		window.close();
	})
	
	$("#selectDomain").on("change", function() {
		var str = $(this).val();
		if(str == "직접입력") {
			$("#emailDomain").val("");
			$("#emailDomain").prop("readonly", false);
		} else if(str == "네이버") {
			$("#emailDomain").val("naver.com");
			$("#emailDomain").prop("readonly", true);
		} else if(str == "구글") {
			$("#emailDomain").val("gmail.com");
			$("#emailDomain").prop("readonly", true);
		}
	})
	
	$("#joinForm").on("submit", function() {
		return joinFormCheck();
	})
	
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

// 입력값 특수문자 방지 함수
function inputCharReplace() {
	var regExp = /[^A-Za-z0-9]/gi;
	if(regExp.test($(this).val())) {
		alert("영문과 숫자만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}
function inputEmailDomainReplace() {
	var regExp = /[^a-z0-9\.]/gi;
	if(regExp.test($(this).val())) {
		alert("이메일 도메인은 영문, 숫자, 점(.)만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}
// 유효성 검사 함수
function joinFormCheck() {
	var nickname = $("#nickname").val();
	var id = $("#id").val();
	var pass1 = $("#pass1").val();
	var pass2 = $("#pass2").val();
	var emailId = $("#emailId").val();
	var emailDomain = $("#emailDomain").val();
	var mobile2 = $("#mobile2").val();
	var mobile3 = $("#mobile2").val();
	var isIdCheck = $("#isIdCheck").val();
	
	if(nickname.length == 0) {
		alert("별명을 입력해주세요.");
		return false;
		}
	if(id.length == 0) {
		alert("아이디를 입력해주세요.");
		return false;
	}
	if(isIdCheck == 'false') {
		alert("아이디 중복 확인을 해주세요.");
		return false;
	}
	if(pass1.length == 0 || pass2.length == 0) {
		alert("비밀번호와 비밀번호 확인을 입력해주세요.");
		return false;
	}
	if(pass1 != pass2) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		return false;
	}
	if(emailId.length == 0 || emailDomain.length == 0) {
		alert("이메일을 입력해주세요.");
		return false;
	}
	if(mobile2.length == 0 || mobile3.length == 0) {
		alert("휴대폰 번호를 입력해주세요.");
		return false;
	}
}