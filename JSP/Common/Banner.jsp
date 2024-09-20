<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>슬라이드 배너</title>
    <link rel="stylesheet" href="../../CSS/Banner.css">
</head>
<body>
<div id="SlideAll">
<div class="imageSlider">
    <div class="slides-container">
        <div class="slide">
            <img src="../../IMG/Banner1.gif" alt="Banner 1">
        </div>
        <div class="slide">
            <img src="../../IMG/Banner2.gif" alt="Banner 2">
        </div>
        <div class="slide">
            <img src="../../IMG/Banner3.gif" alt="Banner 3">
        </div>
        <div class="slide">
            <img src="../../IMG/Banner4.gif" alt="Banner 4">
        </div>
    </div>
</div>

<div class="button_container"> 
    <button id="btn1"></button>
    <button id="btn2"></button>
    <button id="btn3"></button>
    <button id="btn4"></button>
</div>  
</div>

<script>
	const button1 = document.querySelector('#btn1');
	const button2 = document.querySelector('#btn2');
	const button3 = document.querySelector('#btn3');
	const button4 = document.querySelector('#btn4');
	button1.style.backgroundColor = 'gray';
    document.addEventListener('DOMContentLoaded', function() {
        const bannerContainer = document.querySelector('.slides-container');

        // 각 버튼에 클릭 이벤트를 추가합니다.
        button1.addEventListener('click', function() {
            bannerContainer.style.transform = 'translateX(0)';
            buttonColor(button1);
        });
        button2.addEventListener('click', function() {
            bannerContainer.style.transform = 'translateX(-100vw)';
            buttonColor(button2);
        });
        button3.addEventListener('click', function() {
            bannerContainer.style.transform = 'translateX(-200vw)';
            buttonColor(button3);
        });
        button4.addEventListener('click', function() {
            bannerContainer.style.transform = 'translateX(-300vw)';
			buttonColor(button4);
        });
    });
    
    function buttonColor(buttonNum) {
    	[button1, button2, button3, button4].forEach(button => {
            button.style.backgroundColor = 'white';
        });
    	
		buttonNum.style.backgroundColor = 'gray';
	}
</script>
</body>
</html>