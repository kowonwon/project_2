<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="resources/js/calendar.js"></script>
<style>
	.calendar {
		width: 100%;
		border-collapse: collapse;
		}
	.calendar th{
		text-align: center;
		font-size: 25px;
	}	
		
	.calendar td{
		border: 1px solid black;
		width: 14%;
		height: 100px;
		vertical-align: top;
		padding: 5px;
	}	git 
</style>

 <table class="calendar">
        <thead>
            <tr>
                <th><input name="preMon" id="preMon" type="button" class="btn btn-outline-secondary" value="<"></th>
                <th colspan="5" class="year_mon fs-1 fw-bold"></th>
                <th><input name="nextMon" id="nextMon" type="button" class="btn btn-outline-secondary" value=">"></th>
            </tr>
            <tr>
                <th style="color:red;">일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>