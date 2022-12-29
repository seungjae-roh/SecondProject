<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link
	   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	   rel="stylesheet"
	   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	   crossorigin="anonymous">
	<script
	   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	   crossorigin="anonymous"></script>
	<link rel="stylesheet"
	   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <style>
        *{font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: 12px;margin: 0px auto;}
        form{margin-top: 20px;}
        input, select, button {border: 1px solid #afafaf;}
        input.userInput{padding:3px 2px;}
        select.userSelect{padding:2px 0;}
        .c_imp{color: red;}
        .userTable{border: none; border-collapse: collapse; width: 670px;}
        .userTable td{padding:10px; border: 1px solid #b9babb;}
        .userTable td.userTit{background-color: #E4E6E9; font-weight: bold;}
        .btn_search{background-color: #3d3d3d; color: #ffffff; width: 70px; height: 23px; padding:1px 0 2px;}
        .btn_search:hover{background-color: #6d6d6d;}        
        .btn_submit{width:120px;height:28px;font-weight:bold;cursor:pointer;background-color: #E70E16;color:white;font-size: 14px;}
        .btn_cancel{width:120px;height:28px;font-weight:bold;cursor:pointer;background-color: #464646;color:white;font-size: 14px;}
        .w20{width:20px;} .w30{width:30px;} .w40{width:40px;} .w50{width:50px;} .w100{width:100px;} 
        .w300{width:300px;} .w510{width:510px;} .w410{width:410px;} 
        #id_loading{position:absolute;top:530px;z-index:10;width:100%;text-align:center;display:block;}
    </style>
    <script>
        /* 
        수행과제
        1. 폼값 전송시 빈값이 있는지 체크한다. 만약 빈값이 있는
        경우에는 전송할 수 없다.
        2. 아이디를 입력한 상태에서 중복확인 버튼을 눌러 팝업창으로
        아이디를 전송한다.
        3. 성별, 이메일 수신, SMS수신 라디오 버튼도 한가지를 선택해야
        폼값을 전송할 수 있다.
        4. 비밀번호의 경우 2개가 일치해야만 폼값을 전송할 수 있다.
        5. 필수사항인 항목만 체크하세요.
        6. 이메일의 도메인 입력시 셀렉트박스에서 선택한 도메인을
        입력하세요...단, 직접입력을 선택한 경우에만 입력할 수 있도록
        하고 그 외에는 readonly속성을 추가합니다. 
        */
        var formValidate = function(frm) {

            //form에서 this를 통해 전달한 dom과 동일하다.
            // var frm = document.forms[0];
            //아이디 입력값 검증
            if (frm.id.value == '') {
                alert("아이디를 입력하세요.");
                frm.id.focus();
                return false;
            }
            //패스워드 2개중 하나라도 입력하지 않은 경우
            if (!frm.pass1.value || !frm.pass2.value) {
                alert("패스워드를 입력하세요.");
                if (frm.pass1.value == '')
                	frm.pass1.focus();
                else
                	frm.pass2.focus();
                return false;
            }
            //비밀번호 2개가 일치하지 않는 경우
            if (frm.pass1.value != frm.pass2.value) {
                alert("입력한 비밀번호가 일치하지 않습니다.");
                frm.pass1.value = "";
                frm.pass2.value = "";
                frm.pass1.focus();
                return false;
            }
            //이름 검증
            if (frm.name.value == '') {
                alert("이름을 입력하세요.");
                frm.name.focus();
                return false;
            }
           
            //이메일 주소부분
            if (frm.email.value == '') {
                alert("이메일을 입력하세요.");
                frm.email.focus();
                return false;
            }
            //이메일 도메인 부분
            if (frm.domain.value == '') {
                alert("도메인을 입력하세요.");
                frm.eDomain.focus();
                return false;
            }
          	//휴대폰 번호 부분
            if (frm.phonenum.value == '') {
                alert("휴대폰번호를 입력하세요.");
                frm.phonenum.focus();
                return false;
            }
            
            for (var i = 0; i < frm.email_domain.length; i++) {
                var chooseDomain = document.getElementsByName("email_domain");
                console.log(chooseDomain);
                if (frm.email_domain[i].value == chooseDomain) {
                    email2 = frm.email_domain[i].value;
                }
            }
        }
        function inputEmail(frm){
            var eDomain = frm.eDomain.value;
            if(eDomain==''){//--선택-- 부분을 선택했을때
                frm.domain.value = '';
            }
            else if(eDomain=='직접입력'){//'직접입력'을 선택했을때
                frm.domain.readOnly = false;//사용자가 입력해야 하므로 readonly속성을 해제한다. 
                frm.domain.value = '';
                frm.domain.focus();
            }
            else{//도메인을 선택했을때
                frm.domain.value = eDomain;//선택한 도메인을 입력한다. 
                frm.domain.readOnly = true;//입력된 값을 수정할 수 없도록 readonly속성을 활성화한다. 
            }
        } 
        function openModal() {
        	 var usrId = document.getElementById("user_id").value;
             if (usrId == '') {
                alert("아이디를 입력하고 누르삼");
             }
             else {

                window.open("./id_overapping.jsp?usrId=" + usrId, "idover",
                      "width=400px, height=400px");
             }
          }
        }
    </script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<!-- 상단 네비게이션 인클루드 -->
			<%@ include file="../inc/top.jsp" %>
		</div>
		<div class="row">
			<div class="col-3">
			<%@ include file="../inc/left.jsp" %>
			</div>
			<div class="col-9 pt-3  d-flex justify-content-center">
				<div>
				    <form name="myform" action="../mvcboard/regist.do" method="POST" onsubmit="return formValidate(this);">
				        <table class="userTable">
				            <colgroup>
				                <col width="130px" />
				                <col width="540px" />
				            </colgroup>
				            <tr>
				                <td class="userTit"><span class="c_imp">*</span> 아이디</td>
				                <td class="userVal">
				                    <input type="text" name="id" value="" maxlength="15" class="userInput"
				                        style="width:120px;" />                    
				                    <button type="button" class="btn_search" onClick="openModal();">중복확인</button>
				                    <span style="margin-left:10px;"></span>
				                    <span style="color:#888888;">+ 4~15자, 첫 영문자, 영문자와 숫자 조합</span>
				                </td>
				            </tr>
				            <tr>
				                <td class="userTit"><span class="c_imp">*</span> 비밀번호</td>
				                <td class="userVal">
				                    <input type="password" name="pass1" value="" style="width:100px;" class="userInput"
				                        maxlength="25" />
				                </td>
				            </tr>
				            <tr>
				                <td class="userTit"><span class="c_imp">*</span> 비밀번호 확인</td>
				                <td class="userVal">
				                    <input type="password" name="pass2" value="" style="width:100px;" class="userInput"
				                        maxlength="25" />
				                    <span style="margin:0 0 0 3px;color:#888888;">(확인을 위해 다시 입력해 주세요.)</span>
				                </td>
				            </tr>
				            <tr>
				                <td class="userTit"><span class="c_imp">*</span> 이름</td>
				                <td class="userVal">
				                    <input type="text" name="name" value="" style="width:120px;" class="userInput" maxlength="10" />
				                </td>
				            </tr>
				            <tr>
				                <td class="userTit"><span class="c_imp">*</span> 이메일</td>
				                <td class="userVal">
				                    <input type="text" name="email" value="" class="userInput w100" />
				                    <span style="font-size:16px;">＠</span>
				                    <input type="text" name="domain" value="" class="userInput w100" readonly/>
				                    <select name="eDomain" onchange="inputEmail(this.form);" class="userSelect w100">
				                        <option value=""selected> -- 선택 -- </option>
				                        <option value="naver.com">naver.com</option>
				                        <option value="nate.com">nate.com</option>
				                        <option value="gmail.com">gmail.com</option>
				                        <option value="daum.net">daum.net</option>
				                        <option value="hanmail.net">hanmail.net</option>
				                        <option value="직접입력">직접입력</option>
				                    </select>
				                </td>
				            </tr>
				            <tr>
				                <td class="userTit"><span class="c_imp">*</span> 휴대전화</td>
				                <td class="userVal">
				                    <input type="text" name="phonenum" value="" class="userInput w120" maxlength="11" />
				                    <span style="margin:0 0 0 3px;color:#888888;">※ 하이픈을 제거하고 입력하세요.</span>
				                </td>
				            </tr>
				        </table>
				        <table style="width:670px; margin-top:20px;">
				            <tr>
				                <td align="center">                    
				                    <input type="submit" value="완료" class="btn_submit" />
				                    &nbsp;&nbsp;
				                    <input type="reset" value="새로쓰기" class="btn_cancel" />
				                </td>
				            </tr>
				        </table>       
				    </form>
				</div>
			</div>
		</div>
		 <%@ include file="../inc/bottom.jsp"%>
    </div>
</body>
</html>