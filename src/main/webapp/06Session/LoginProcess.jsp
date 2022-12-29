<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인 폼에서 입력한 아이디, 패스워드를 받는다. 
String userId = request.getParameter("user_id"); 
String userPwd = request.getParameter("user_pw");
String cookieId = request.getParameter("cookie_id");
System.out.println(userId + " = " + userPwd + " = " + cookieId);

if (cookieId == null){}
else if (cookieId.equals("on")) {
	Cookie cookie = new Cookie("loginCookie", userId);
	response.addCookie(cookie);
}

//위 정보를 통해 DAO객체를 생성하고 이때 오라클에 연결된다. 
MemberDAO dao = new MemberDAO(application);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close();

if (memberDTO.getId() != null) {
    session.setAttribute("UserId", memberDTO.getId()); 
    session.setAttribute("UserPwd", memberDTO.getPass());
    response.sendRedirect("../mvcboard/list.do?b_flag=freeboard");
}
else {
    request.setAttribute("LoginErrMsg", "아이디 또는 비밀번호를 잘못 입력했습니다..");
	//그리고 로그인 페이지로 '포워드'한다.
    request.getRequestDispatcher("LoginForm.jsp")
		.forward(request, response);
}
%>



