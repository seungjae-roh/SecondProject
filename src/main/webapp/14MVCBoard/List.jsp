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
<div class="container">
    <div class="row">
        <%@ include file = "../inc/top.jsp" %>
    </div>
    <div class="row">
        <div class="col-3">
            <div style="height: 100px; line-height: 100px; margin:10px 0; text-align: center; 
				color:#ffffff; background-color:rgb(133, 133, 133); border-radius:10px; font-size: 1.5em;">
                유로 트럭 시뮬레이터 2
            </div>
           	<%@ include file = "../inc/left.jsp" %>
        </div>
        <div class="col-9 pt-3" style="height:500px">
    		<h2>${ map.b_flag } - 현재페이지 : ${ map.pageNum }</h2>
    
			    <!-- 검색 -->
		    <form method="get">  
			    <table border="1" width="100%">
				    <tr>
				        <td align="center">
				        	<input type="hidden" name="b_flag" value="${ param.b_flag }"/>
				            <select name="searchField"> 
				                <option value="title">제목</option> 
				                <option value="content">내용</option>
				            </select>
				            <input type="text" name="searchWord" />
				            <input type="submit" value="검색하기" />
				        </td>
				    </tr>   
				</table>
				<table class="table table-bordered" width="90%">
		        <tr>
		            <th width="10%" style="text-align:center">번호</th>
		            <th width="*">제목</th>
		            <th width="15%" style="text-align:center">작성자</th>
		            <th width="10%" style="text-align:center">조회수</th>
		            <th width="15%" style="text-align:center">작성일</th>
		            <th width="8%" style="text-align:center">첨부</th>
		        </tr>
				<c:choose>
					<c:when test="${ empty boardLists }">
					        <tr>
					            <td colspan="5" align="center">
					                등록된 게시물이 없습니다
					            </td>
					        </tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ boardLists }" var="row" varStatus="loop">
					        <tr align="center">
					            <td>
					            	${ map.totalCount - (((map.pageNum-1) * map.pageSize)
					            		+ loop.index)}
					            </td>
					            <td align="left"> 
					                <a href="../mvcboard/view.do?b_flag=${ row.b_flag }&idx=${ row.idx }">
					                	${ row.title }</a> 
					            </td>
					            <td align="center">${ row.id }</td>
					            <td align="center">${ row.visitcount }</td>
					            <td align="center">${ row.postdate }</td>
					            <td>
					            <c:if test="${ not empty row.ofile }">
					            	<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx}">
					            	[Down]</a>
					            </c:if>
					            </td>
					        </tr>
						 </c:forEach>
					</c:otherwise>
				</c:choose>
		    </table>
		    </form>
		</div>
		<div class="row">
		    <table border="1" width="90%">
		        <tr align="center" class= "width:100">
		        	<td>
		        		${ map.pagingImg }
		        	</td>
		            <c:if test="${not empty sessionScope.UserId }">
		               <c:choose>
		                  <c:when test="${sessionScope.UserId eq 'admin' }">
		                  <!-- 로그인 아이디가 admin(관리자)일 경우 -->
		                         <button type="button" class="btn btn-primary"
		                     onclick="location.href='../mvcboard/write.do?b_flag=${ map.b_flag }';">글쓰기</button>
		                  </c:when>
		                  <c:otherwise>
		                  <!-- 관리자가 아닌 일반회원들일 경우 공지사항은 예외처리 -->
		                     <c:if test="${param.b_flag ne 'notice' }">
		                            <button type="button" class="btn btn-primary"
		                        onclick="location.href='../mvcboard/write.do?b_flag=${ map.b_flag }';">글쓰기</button>
		                     </c:if>
		                  </c:otherwise>
		               </c:choose>
            		</c:if>
		        </tr>
		    </table>
		</div>
	</div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div class="row mb-5 mt-3">
        <%@ include file = "../inc/bottom.jsp" %>
    </div>
</div>
</body>
</html>