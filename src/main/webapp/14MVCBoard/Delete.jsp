<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../09BoardPaging/IsLoggedIn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<h2>파일첨부형 게시판 - 파일삭제</h2>
<form name="writeFrm" method="post"
	action="../mvcboard/delete.do?b_flag= ${ param.b_flag } &idx= ${ param.idx } ">
     <!-- 
     ※ hidden박스를 사용하는 경우 웹브라우저에는 숨김처리 되기 때문에 값이
     제대로 입력되었는지 화면으로 확인할 수 없다. 따라서 개발자모드를 사용하거나
     type을 디버깅용으로 잠깐 수정한 후 값이 제대로 입력되었는지 반드시
     확인해야 한다.
      -->	
    <input type="hidden" name="idx" value="${ param.idx }" />
    <table border="1" width="90%">
        <tr>
            <td colspan="2" align="center">
                <button type="submit">삭제하기</button>
                <button type="button" onclick="location.href='../mvcboard/list.do?b_flag=${ param.b_flag }';">
                    돌아가기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
