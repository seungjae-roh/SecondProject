<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String phonenum = request.getParameter("phonenum"); 

MemberDAO dao = new MemberDAO(application);
MemberDTO dto = dao.searchMemberDTO(id, name, phonenum);
dao.close();

if (dto.getId() != null) {
	request.setAttribute("pass", dto.getId());
	request.setAttribute("name", dto.getName());
	
	request.getRequestDispatcher("./SearchPw.jsp")
		.forward(request, response);
}
else {
	JSFunction.alertBack("가입되지 않은 회원입니다.", out);
}
%>