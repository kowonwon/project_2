<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>인덱스</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/member.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.7.1.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('background.jpg'); /* 배경 이미지를 변경하세요 */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 350px;
            width: 100%;
            text-align: center;
        }
        .login-container #logo {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            margin-bottom: 20px;
        }
      /*   .login-container #gIcon {
            width: 24px;
            height: 24px;
            margin-right: 10px;
        } */
        .login-container h2 {
            margin-bottom: 20px;
            font-size: 18px;
        }
        .login-container input[type="password"], 
        .login-container input[type="text"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .login-container button {
            background-color: #e60023;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container button:hover {
            background-color: #d0001f;
        }
        .login-container .divider {
            margin: 20px 0;
            font-size: 14px;
            color: #888;
            position: relative;
        }
        .login-container .divider:before, .login-container .divider:after {
            content: '';
            display: block;
            height: 1px;
            background: #e0e0e0;
            position: absolute;
            width: 40%;
            top: 50%;
        }
        .login-container .divider:before {
            left: 0;
        }
        .login-container .divider:after {
            right: 0;
        }
        .login-container .google-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: white;
            color: #757575;
            border: 1px solid #ccc;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            width: 100%;
            box-sizing: border-box;
            height: 48px; /* 로그인 버튼과 높이 맞추기 위해 설정 */
        }
        .login-container .google-btn img {
            margin-right: 10px;
            width: 24px;
            height: 24px;
        }
        .login-container .line-divider {
            height: 1px;
            background: #e0e0e0;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <img src="resources/images/logo.png" id="logo" alt="logo Image"> <!-- 프로필 이미지를 변경하세요 -->
        <h2>
            <% 
                String message = request.getParameter("message");
                if (message == null || message.isEmpty()) {
                    message = "Show me the money에 오신걸 환영합니다!";
                }
                out.print(message);
            %>
        </h2>
        <form action="login" method="post">
            <input type="text" name="id" placeholder="아이디" required>
            <input type="password" name="pass" placeholder="비밀번호" required>
            <button type="submit">로그인</button>
        </form>
        <div class="divider">또는</div>
        <a href="joinForm" class="google-btn">
            지금 가입하기
        </a>
        <div class="line-divider"></div>
    </div>
</body>
</html>
