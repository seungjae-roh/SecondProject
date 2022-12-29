<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table width="100%"> 
    <tr>
        <td align="center">
        <!-- 로그인 여부에 따른 메뉴 변화 -->
        <% if (session.getAttribute("UserId") == null) { %>
            <a href="../06Session/LoginForm.jsp">
            	<i class="bi bi-box-arrow-in-right font-size:1.5em">
            	</i>로그인</a>
            <a href="../14MVCBoard/Regist.jsp">
            	<i class="bi bi-person-plus-fill font-size:1.5em" >
            	</i>회원가입</a>
        <% } else { %>
            <a href="../06Session/Logout.jsp">
            	<i class="bi bi-box-arrow-right font-size:1.5em">
            	</i>로그아웃</a>
            <a href="../14MVCBoard/Update.jsp">
            	<i class="bi bi-person-lines-fill font-size:1.5em">
            	</i>회원정보수정</a>
        <% } %>
        </td>
    </tr>
</table>
