<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
</head>
<body>
<div class="container">
    <div class="row">
    	<!-- 상단 네비게이션 인클루드  -->
        <%@ include file = "../inc/top.jsp" %>
    </div>
    <div class="row">
	    <h2 style="text-align:center">오시는 길</h2>
   		<hr />
   		<br />
        <div class="col d-flex justify-content-center">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.39223896312!2d126.98227256542366!3d37.569380431722735!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e8cf2cf5f5%3A0x8304726aa55cd56d!2z642U7KGw7J2ASVTslYTsubTrjbDrr7jtlZnsm5Ag7KKF6rCB7KCQ!5e0!3m2!1sko!2skr!4v1672220518996!5m2!1sko!2skr"
				width="600" height="450" style="border:0; align-content: center;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>    		
		</div>
	</div>
		<br />
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div class="row mb-5 mt-3">
    	<!-- 하단 copyright 부분 인클루드 -->
        <%@ include file = "../inc/bottom.jsp" %>
    </div>
</div>
</body>
</html>