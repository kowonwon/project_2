<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인</title>
    <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources/css/member.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script src="resources/js/jquery-3.7.1.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('resources/images/background.jpg');
            background-size: cover;
        }
        .container {
            width: 100%;
            height: 100%;
           
            position: relative;
        }
        .container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5); /* 검은색 필터, 투명도 0.5 */
            z-index: 1;
        }
        .content {
            position: relative;
            z-index: 2;
            width: 100%;
            max-width: 1200px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }
        .content .head {
            flex: 1;
            text-align: center;
        }
        .content .login-section {
            flex: 1;
            max-width: 500px;
            padding: 20px;
            border-radius: 12px;
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
            <div class="head">
                <h1>멘트 들어갈 자리 <br>
                대충 두줄 채우기</h1>
            </div>
            <div class="login-section">
                <jsp:include page="loginForm.jsp" />
            </div>
        </div>
    </div>
</body>
</html>
