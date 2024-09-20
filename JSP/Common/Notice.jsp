<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notice Board</title>
    <link rel="stylesheet" href="../../CSS/Global.css">
    <link rel="stylesheet" href="../../CSS/Notice.css">
</head>
<header>
	<%@ include file="Header.jsp" %>
</header>
<body>
    <div class="notice-board">
        <h2>공지사항</h2>
        <div class="notice-item">
            <h3>특별한 가입 이벤트!</h3>
            <p>2024년 7월 15일부터 7월 31일까지 회원가입 시 적립금 1000 Point가 지급됩니다.</p>
        </div>
        <div class="notice-item">
            <h3>점심시간 변경 알림</h3>
            <p>점심시간이 매주 월요일부터 금요일까지 11:30 AM으로 변경됩니다. 주말은 정상 시간대로 운영됩니다.</p>
        </div>
        <div class="notice-item">
            <h3>고객센터 운영시간 변경</h3>
            <p>고객센터의 운영시간이 매주 토요일과 일요일 오후 1시부터 오후 5시로 변경되었습니다. 감사합니다.</p>
        </div>
        <div class="notice-item">
		    <h3>입점 혜택</h3>
		    <p>2024년 7월 25일부터 7월 31일까지 입점하는 모든 상점의 수수료를 10% 인하하였습니다.</p>
		</div>
    </div>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>