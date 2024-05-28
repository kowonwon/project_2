$(function() {
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
			success: function(regData) {
				console.log(resData);
				$("#replyList").empty();
				
				$.each(resData, function(i, v) {
					var date = new Data(v.regDate);
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
									+'<button class="modifyReply btn btn-outline-success btn-sm" data-no="${r.no}">'
										+'<i class="bi bi-journal-text">수정</i>'
									+'</button>'
									+'<button class="deleteReply btn btn-outline-warning btn-sm" data-no="${r.no}">'
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