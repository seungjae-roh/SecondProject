<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">  
 <script>
	function validateForm(form) {
		/* <form> 태그 하위의 각 input 태그에 입력값이 있는지 확인하여 
		만약 빈값이라면 경고창, 포커스 이동, 폼값전송취소 처리를 한다. */
		if (!form.user_id.value) {
			alert("아이디를 입력하세요.");
			form.user_id.focus();
			return false;
		}
		if (form.user_pw.value == "") {
			alert("패스워드를 입력하세요.");
			form.user_pw.focus();
			return false;
		}
	}
	function searchId() {
		 open("./SearchId.jsp",
			        "idSearch",
			        "width=385, height=300, left=1000, top=150, "
			        + "location=no, toolbar=no, menubar=no, "
			        + "scrollbars=yes, resize=no");

	}
	function searchPw() {
		open("./SearchPw.jsp",
		        "PwSearch",
		        "width=385, height=310, left=1000, top=150, "
		        + "location=no, toolbar=no, menubar=no, "
		        + "scrollbars=yes, resize=no");
	}
	</script> 
	
</head>
<body>
 <div class="container mt-5">
   <div class="row">
		<%@ include file="../inc/top.jsp" %>
   </div>
   <div class="row ">
         <div class="col-12 pt-3">
             <h2 style="text-align: center; font-weight: bold ">LOGIN</h2>  
             <div class="container mt-3 d-flex justify-content-center" >
                <form action="LoginProcess.jsp" method="post" name="loginFrm"
                    onsubmit="return validateForm(this);"  >
                  <div class="mb-2 mt-2" >
	                   <input type="text" id="cook" class="form-control"
	                      placeholder="아이디" name="user_id" style="width:300px;">
                  </div >
                  <div class="mb-3">
                  	  <input type="password" class="form-control" 
                      	 placeholder="비밀번호" name="user_pw" style="width:300px;">
                  </div>
                  <div class="mb-5">
	                  <button type="submit" class="btn btn-primary" value="login" style=" width:300px;"
	                   >로그인</button>
	                   <label style="cursor:pointer;"><input type="checkbox" name="cookie_id" tabindex="3">
						아이디 저장하기</label>
	                  <hr />
                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  	<a href="#" onclick="searchId()">아이디 찾기</a> 
                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  	<a href="#" onclick="searchPw()">비밀번호 찾기</a>
				  </div>
                </form>
              </div>
         </div>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div class="row mb-5 mt-3">
    	<!-- 하단 copyright 부분 인클루드 -->
        <%@ include file = "../inc/bottom.jsp" %>
    </div>
</div>
<% 
Cookie[] cookies = request.getCookies();
boolean isCookies = false;
String cookieCheck = "";
for (Cookie c : cookies) {
	String cookieName = c.getName();
	String cookieValue = c.getValue();
	if (cookieName.equals("loginCookie")) {
		isCookies = true;
		cookieCheck = c.getValue();
		break;
	}
}
if (isCookies == true) {
%>
<script>
	document.getElementById("cook").value = "<%= cookieCheck %>";
</script>
<% 	
}
%>
</body>
</html>