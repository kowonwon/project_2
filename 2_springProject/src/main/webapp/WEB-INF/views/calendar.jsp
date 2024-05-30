<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="resources/js/calendar.js"></script>
<link rel="stylesheet" href="resources/css/calendar.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200..900&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.5/dist/JsBarcode.all.min.js"></script>

<table class="calendar ">
	<thead>
		<tr class="mb-4">
			<th><input name="preMon" id="preMon" type="button"
				class="btn btn-outline-secondary" value="<"></th>
			<th colspan="5" class="year_mon fs-1 fw-bold"></th>
			<th><input name="nextMon" id="nextMon" type="button"
				class="btn btn-outline-secondary" value=">"></th>
		</tr>
		<tr>
			<th class="sunday">일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th class="saturday">토</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="dateModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content bg-light">
		
			<div class="modal-header">
				<div class="row">
					<div class="col">
						<h1 class="modal-title text-center">Dev Team 2</h1>
					</div>
				</div>
				<div class="row ">
					<div class="col ">
						<h5 id="selectedDate"></h5>
					</div>
				</div>
			</div>
			
			<div class="modal-body p-0">
				<table class="w-100">
					<thead>
						<tr>
							<th class="text-start ps-3">description</th>
							<th>id</th>
							<th>price</th>
						</tr>
					</thead>
					<tbody id="modalBody">
					</tbody>
				</table>
			</div>
			
			<div class="modal-footer">
				<div class="row w-100 mb-2">
					<div class="col text-start fs-4 fw-bold">
						<span>TOTAL</span>
					</div>
					<div class="col text-end fs-4 fw-bold">
						<span id="totalSpending"></span>
					</div>
				</div>
				<div class="row w-100">
					<div class="col text-center">
 						<canvas id="barcode" class="bg-light"></canvas>		
 					</div>
				</div>
			</div>

		</div>
	</div>
</div>
