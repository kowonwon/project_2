<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
/* 아래 처럼 .aside *  하시면 제어 가능 */
.aside_prof{
	background-color: #e0e0e0;
}

.bi bi-person-standing{
	font-size:1000rem;
	width:100px;
	height:100px;
}

.aside{
	background-color: #e0e0e0;
	margin:0;
	padding-top:30;
	height: 100vh;
}

.aside .a {
	text-decoration: none;
	color: inherit;
}

.aside .logout {
	font-style: italic;
	font-color: 
	align-self: center;
}
</style>
<aside class="aside_prof mb-5" style="border:1px solid;">
	<!--profile-->
	<div class="row pb-3">
		<div class="col-5 p-0" style="text-align:center;">
			<!-- 기본 이미지  -->
			<img src="https://toppng.com/uploads/preview/and-blank-effect-transparent-11546868080xgtiz6hxid.png" style="width:100px; height:100px;">
		</div>
		<div class="col-7 p-0 mt-3">
			<p class="text-center"><b>?님,</b><br/> 반갑습니다!</p>
		</div>
		</div>
		<div class="row">
			<div class="col">
				<p class="d-flex align-items-center justify-content-around">
				 <input type="button" class="btn btn-danger" value="로그 아웃" />
				 <input type="button"
					class="btn btn-warning" value="회원 정보 수정"
					onclick="location.href='updateMemberForm'" />
			</p>
		</div>
	</div>
</aside>
	<!-- end profile -->

	
	
	<!--category -->
	<!-- 각자 본인 사이트에 맞게 수정 -->
<aside class="aside justify-content-between">
	<div class="row">
		<div class="col">
			<p>전체보기</p>
		</div>
	</div>
	<!-- category end -->

	<!-- popular & recent -->
	<div class="row">
		<div class="col">
			<p>최신글</p>
		</div>
	</div>
	<!-- 최신 댓글  -->
	<div class="row">
		<div class="col">
			<p>최신 댓글</p>
		</div>
	</div>
	<!-- 방문자 수 체크-->
	<div class="row">
		<div class="col">
			<p>전체 방문자수</p>
		</div>
	</div>
</aside>
