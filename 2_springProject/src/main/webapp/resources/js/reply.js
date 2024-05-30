$(function() {
	
	$(document).on("click", ".deleteReply", function() {
		$("#global-content > div").append($("#replyForm").slideUp(300));
		$("#replyContent").val("");
		
		var no = $(this).attr("data-no");
		var bbsNo = $("#replyForm input[name=bbsNo]").val();
		var params = "no=" + no + "&bbsNo=" + bbsNo;
		console.log(params);
		
		var result = confirm(no + "번 댓글을 삭제하시겠습니까?");
		if(result) {
			$.ajax({
				url: "replyDelete.ajax",
				type: "post",
				data: params,
				dataType: "json",
				success: function(resData, status, xhr) {
					console.log(resData);
					$("#replyList").empty();
					
					$.each(resData, function(i, v) {
						var date = new Date(v.regDate);
						var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
								+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
								+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
								+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
								+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
						var result =
								'<div class="replyRow row">'
									+'<div class="col-8">'
										+'<div class="row">'
											+'<div class="col">'
												+'<span>' + v.replyWriter + '</span>'
												+'<span class="me-3">'
													+strDate
												+'</span>'
											+'</div>'
										+'</div>'
										+'<div class="row">'
											+'<div class="col">'
												+'<pre>' + v.replyContent + '</pre>'
											+'</div>'
										+'</div>'
									+'</div>'
									+'<div class="col-4">'
										+'<button class="modifyReply btn btn-outline-success btn-sm" data-no="' + v.no + '">'
											+'<i class="bi bi-journal-text">수정</i>'
										+'</button>'
										+'<button class="deleteReply btn btn-outline-warning btn-sm" data-no="' + v.no + '">'
											+'<i class="bi bi-trash">삭제</i>'
										+'</button>'
									+'</div>'
								+'</div>';
						$("#replyList").append(result);
					})
				},
				error: function(error) {
					alert("ajax 실패");
				}
			})
		}
		return false;
	})
	
	$(document).on("click", ".modifyReply", function() {
		console.log($(this).parents(".replyRow"));
		var $replyRow = $(this).parents(".replyRow");
		
		if($("#replyForm").is(":visible")) {
			var $next = $replyRow.next();
			if(! $next.is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}
			setTimeout(function() {
				$("#replyForm").insertAfter($replyRow).slideDown(300);
			}, 300)
		} else {
			$("#replyForm").removeClass("d-none").css("display", "none").insertAfter($replyRow).slideDown(300);
		}
		
		$("#replyForm").find("form").attr({"id": "replyUpdateForm", "data-no": $(this).attr("data-no") });
		$("#replyWriteButton").val("평가수정");
		
		var reply = $(this).parent().prev().find("pre").text();
		$("#replyContent").val($.trim(reply));
	})
	
	$(document).on("submit", "#replyUpdateForm", function(e) {
		e.preventDefault();
		if($("#replyContent").val().length = 0) {
			alert("내용을 입력해주세요.");
			return false;
		}
		$("#replyForm").slideUp(300);
		$("#replyTitle").append($("#replyForm"));
		var params = $(this).serialize() + "&no=" + $(this).attr("data-no");
		console.log(params);
		
		$.ajax({
			url: "replyUpdate.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resData, status, xhr) {
				console.log(resData);
				
				$("#replyList").empty();
				$.each(resData, function(i, v) {
					var date = new Date(v.regDate);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
							+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
							+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
							+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
					var result =
							'<div class="replyRow row">'
								+'<div class="col-8">'
									+'<div class="row">'
										+'<div class="col">'
											+'<span>' + v.replyWriter + '</span>'
											+'<span class="me-3">'
												+strDate
											+'</span>'
										+'</div>'
									+'</div>'
									+'<div class="row">'
										+'<div class="col">'
											+'<pre>' + v.replyContent + '</pre>'
										+'</div>'
									+'</div>'
								+'</div>'
								+'<div class="col-4">'
									+'<button class="modifyReply btn btn-outline-success btn-sm" data-no="' + v.no + '">'
										+'<i class="bi bi-journal-text">수정</i>'
									+'</button>'
									+'<button class="deleteReply btn btn-outline-warning btn-sm" data-no="' + v.no + '">'
										+'<i class="bi bi-trash">삭제</i>'
									+'</button>'
								+'</div>'
							+'</div>';
					$("#replyList").append(result);
				})
				$("#replyForm").slideUp(300);
				$("#replyContent").val("");
			},
			error: function(error) {
				alert("ajax 실패");
			}
		})
		return false;
	})
	
	$("#replyWrite").on("click", function() {
		if($("#replyForm").is(":visible")) {
			var $next = $("#replyTitle").next();
			if(! $next.is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}
			setTimeout(function() {
				$("#replyForm").insertAfter("#replyTitle").slideDown(300);
			}, 300)
		} else {
			$("#replyForm").removeClass("d-none").css("display", "none").insertBefore("#replyTitle").slideDown(300);
		}
		$("#replyForm").find("form").attr("id", "replyWriteForm").removeAttr("data-no");
		$("#replyContent").val("");
		$("#replyWriteButton").val("제출");
	})
	
	$(document).on("submit", "#replyWriteForm", function(e) {
		var params = $(this).serialize();
		console.log(params);
		
		$.ajax({
			url: "replyWrite.ajax",
			data: params,
			type: "post",
			dataType: "json",
			success: function(resData) {
				console.log(resData);
				$("#replyList").empty();
				
				$.each(resData, function(i, v) {
					var date = new Date(v.regDate);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
							+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " "
							+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":"
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + ":"
							+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
					var result =
							'<div class="replyRow row">'
								+'<div class="col-8">'
									+'<div class="row">'
										+'<div class="col">'
											+'<span>' + v.replyWriter + '</span>'
											+'<span class="me-3">'
												+strDate
											+'</span>'
										+'</div>'
									+'</div>'
									+'<div class="row">'
										+'<div class="col">'
											+'<pre>' + v.replyContent + '</pre>'
										+'</div>'
									+'</div>'
								+'</div>'
								+'<div class="col-4">'
									+'<button class="modifyReply btn btn-outline-success btn-sm" data-no="' + v.no + '">'
										+'<i class="bi bi-journal-text">수정</i>'
									+'</button>'
									+'<button class="deleteReply btn btn-outline-warning btn-sm" data-no="' + v.no + '">'
										+'<i class="bi bi-trash">삭제</i>'
									+'</button>'
								+'</div>'
							+'</div>';
					$("#replyList").append(result);
				})
				
				$("#replyForm").slideUp(300).add("#replyContent").val("");
				
			},
			error: function(xhr, status) {
				console.log("error");
			}
		})
		return false;
	})
})