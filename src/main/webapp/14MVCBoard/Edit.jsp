<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../09BoardPaging/IsLoggedIn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
	<script type="text/javascript">
	//유효성 검사
	function validateForm(form) { 
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
</head>
<body>
<h2>${ param.b_flag } - 수정하기(Edit)</h2>
<form name="writeFrm" method="post" enctype="multipart/form-data" 
		action="../mvcboard/edit.do?b_flag=${ dto.b_flag }" onsubmit="return validateForm(this);">
	<input type="hidden" name="idx" value="${ dto.idx }" />
	<input type="hidden" name="b_flag" value="${ dto.b_flag }" />
	<input type="hidden" name="prevOfile" value="${ dto.ofile }" />
	<input type="hidden" name="prevSfile" value="${ dto.sfile }" />
	
    <table border="1" width="90%">
        <tr>
            <td>작성자의 아이디</td>
            <td>
                <input type="text" name="id" 
                	style="width: 150px;" value="${ dto.id }" />
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title"
                	style="width: 90%;" value="${ dto.title }" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;">${ dto.content }</textarea>
            </td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td>
                <input type="file" name="ofile"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">RESET</button>
                <button type="button" onclick="location.href='../mvcboard/list.do?b_flag=${ dto.b_flag}';">
                    목록 바로가기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
