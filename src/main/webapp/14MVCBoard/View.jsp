<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">  
</head>
<body>
<!-- 우측 리스트 보면서 폼 완성 -->
<div class="container">
	<div class="row">
	<%@ include file="../inc/top.jsp" %>
	</div>
	<div class="row">
		<div class="col-3">
			<div style="height: 100px; line-height: 100px; margin:10px 0; text-align: center; 
				color:#ffffff; background-color:rgb(133, 133, 133); border-radius:10px; font-size: 1.5em;">
                웹사이트제작
            </div>
            <%@ include file = "../inc/left.jsp" %>
        </div>
        <div class="col-9 pt-3" style="heigth:500px">
			<table class="table table-bordered" width="90%">
				<colgroup>
					<col width="15%"/> <col width="35%"/>
					<col width="15%"/> <col width="*"/>
				</colgroup>
			    <tr>
			        <td>번호</td>
			        <td>${ dto.idx }</td>
			        <td>작성자 아이디</td> 
			        <td>${ dto.id }</td>
			    </tr>
			    <tr>
			        <td>작성일</td>
			        <td>${ dto.postdate }</td>
			        <td>조회수</td>
			        <td>${ dto.visitcount }</td>
			    </tr>
			    <tr>
			        <td>제목</td>
			        <td colspan="3">
			        	${ dto.title }
			        </td>
			    </tr>
			    <tr>
			        <td>내용</td>
			        <td colspan="3" height="100">
			        	${ dto.content }
			        	<c:if test="${ isImage eq true }">
			        		<p>
			        			<img src="../Uploads/${ dto.sfile }" alt="" />
			        		</p>
			        	</c:if>
			        </td> 
			    </tr>
			    <tr>
			        <td>첨부파일</td>
			        <td>
			        <!-- 첨부된 파일이 있는 경우에는 파일명과 다운로드 링크를 출력한다.
			        다운로드가 완료되면 다운로드 횟수를 1 증가시키기 위해 게시물의 일련번호를
			        파라미터로 전달한다. -->
			        	<c:if test="${ not empty dto.ofile }">
			        	${ dto.ofile }
			        	<a href="../mvcboard/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.idx }">
			        	[다운로드]
			        	</a>
			        	</c:if>
			        </td>
			        <td>다운로드수</td>
			        <td>
			        ${ dto.downcount }
			        </td>
			    </tr>
			    <tr>
			    	<td colspan="4" align="center">
			    		<c:if test="${ sessionScope.UserId eq 'admin' || sessionScope.UserId eq dto.getId }">
				    		<button type="button" class="btn btn-success"
				    			onclick="location.href='../mvcboard/edit.do?b_flag=${ dto.b_flag }&idx=${ dto.idx }';">
				    			수정하기
				    		</button>
				    		<button type="button" class="btn btn-danger"
				    			onclick="location.href='../mvcboard/delete.do?b_flag=${ dto.b_flag }&idx=${ dto.idx }';">
				    			삭제하기
				    		</button>
			    		</c:if>
			    		<button type="button" class="btn btn-info" onclick="location.href='../mvcboard/list.do?b_flag=${ dto.b_flag }';">
			    			목록 바로가기
			    		</button>
			    	</td>
			    </tr>
			</table>
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div class="row mb-5 mt-3">
    	<!-- 하단 copyright 부분 인클루드 -->
        <%@ include file = "../inc/bottom.jsp" %>
    </div>
</div>
</body>
</html>
