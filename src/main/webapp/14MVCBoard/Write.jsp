<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../09BoardPaging/IsLoggedIn.jsp" %>
<%
String id = (String)session.getAttribute("UserId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.id.value == "") {
        alert("아이디를 입력하세요.");
        form.id.focus();
        return false;
    }
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">  
</head>
<body>
<h2> ${ dto.boardTitle } - 글쓰기(Write)</h2>
<!--
파일을 첨부하기 위한 작성폼은 아래 2가지 조건이 지켜져야 한다.
1. 전송방식(method)는 post여야 한다.
2. 인코딩방식(enctype)은 multipart/form-data로 지정해야 한다.
이와 같이 <form>태그를 구성한 후 전송(submit)하면 request객체로는
폼값을 받을 수 없다. cos.jar 확장라이브러리가 제공하는 MultipartRequest
객체를 사용해서 폼값을 받아야 한다.
-->
<div class="container">
	<div class="row">
	<%@ include file="../inc/top.jsp" %>
	</div>
	<form name="writeFrm" method="post" enctype="multipart/form-data" 
			action="../mvcboard/write.do?b_flag=${ param.b_flag }"
	      	onsubmit="return validateForm(this);">
	    
	    <input type="hid-den" name="b_flag" value="${param.b_flag }" />
	    <table border="1" width="90%">
	        <tr>
	            <td>제목</td>
	            <td>
	                <input type="text" name="title" style="width: 90%;"/>
	            </td>
	        </tr>
	        <tr>
	            <td>내용</td>
	            <td>
	                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td>첨부파일</td>
	            <td>
	                <input type="file" name="ofile" style="width: 90%;" />
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <button type="submit">작성 완료</button>
	                <button type="reset">다시 입력</button>
	                <button type="button" onclick="location.href='../mvcboard/list.do?b_flag=${ param.b_flag}';">
	                    목록 보기</button>
	            </td>
	        </tr>
	    </table>
	</form>
</body>
</html>
