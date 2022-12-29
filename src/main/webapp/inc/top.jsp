<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-12">
    <!-- 
	.bg-primary, .bg-success, .bg-info, .bg-warning, .bg-danger, .bg-secondary, 
	.bg-dark, .bg-light
	-->
    <nav class="navbar navbar-expand-sm bg-dark navbar-secondary"
    	style="height:120px">
        <!-- Brand/logo -->
        <a class="navbar-brand" href="../mvcboard/default.do" style="width: 150px" >
            <img src="../images/header.jpg" height="120px">
        </a>

        <!-- Links -->
        <div class="navbar-nav ms-auto py-0">
	        <div class="nav-item dropdown">
	        	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
					ABOUT</a>
				<div class="dropdown-menu m-0">
		        	<a href="../mvcboard/list.do?b_flag=notice" class="nav-item nav-link active">
					공지사항</a>
		        	<a href="../14MVCBoard/Location.jsp" class="nav-item nav-link active">
					오시는 길</a>
				</div>
	        </div>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
					게시판</a>
				<div class="dropdown-menu m-0">
					<a href="../mvcboard/list.do?b_flag=review" class="dropdown-item">
						리뷰</a>
					<a href="../mvcboard/list.do?b_flag=freeboard" class="dropdown-item">
						자유게시판</a>
				</div>
			</div>
		<a href="../mvcboard/list.do?b_flag=fileboard" class="nav-item nav-link active">
			자료실</a>				
		</div>

        

        <% if (session.getAttribute("UserId") == null) { %>
		<a href="../14MVCBoard/Regist.jsp" class="nav-item nav-link">회원가입</a>                    
		<a href="../06Session/LoginForm.jsp" class="nav-item nav-link">로그인</a>                    
		<% } else { %>
		<a href="../mvcboard/update.do?id=<%= session.getAttribute("UserId") %>&pass=<%= session.getAttribute("UserPwd") %>" class="nav-item nav-link">회원정보수정</a>
		<a href="../06Session/Logout.jsp" class="nav-item nav-link">로그아웃</a>
		<% } %> 
    </nav>
</div>