<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<style>

* {  
  box-sizing: border-box;
}	

main {
  height: 100%;  
}

#demo {
/* 탑 메뉴에 가려진 컨텐츠 보이게하기 */
  padding-top: 100px;
}

#carousel{
   top: 100;
   left: 100;
   min-width: 100%;
   min-height: 500px;
} 
.carousel-indicators{
	z-index: 1;
	data-bs-interval: 10000;
	
}

//////////////////////////////////////////////////////////////////

* {
    margin:0; /*브라우저 내 기본 설정값 초기화*/
    padding: 0;/*브라우저 내 기본 설정값 초기화*/
    box-sizing: border-box;
}
ul, li { /*ul, li의 리스트 스타일 제거*/
    list-style: none;
}
/*슬라이드에 직접 적용되는 스타일*/
[name="slide"] { display: none; } /*클래스 slidebox 내 name="slide"부분 */
.slidebox { 
    max-width: 1000px; 
    width: 50%;
    margin: 0 auto;    
}
.slidebox img { /*자신의 넓이 이상으로 커지지 않도록 함, 반응형 사용 가능*/
    max-width: 100%;
}
.slidebox .slidelist {
    white-space: nowrap;
    font-size:0; /*빈공간을 없애기 위함*/
    overflow: hidden; /*초과해서 이미지가 나올 경우 나오지 않게 함*/
}
.slidebox .slideitem {
    position: relative;
    display: inline-block; /*세로 정렬을 가운데 맞추기 위함*/
    vertical-align: middle;
    width: 100%;
    transition: all 0.9s; /*자연스러운 전환 속성을 위함*/
}
.slidebox .slideitem label {
    position: absolute; /*자율 배치하는 값*/
    z-index: 1; /*기본값 1*/
    top: 50%;
    transform: translateY(-50%); /*가운데 지정*/
    padding: 20px;
    border-radius: 50%; /*둥근 버튼 모양*/
    cursor: pointer; /*마우스가 올라가면 커서가 포인터로 바뀌도록 함*/
}
label.left {
    left: 20px;
    background-color: white;
    background-image:url('images/left-arrow.png');
    background-position: center center;
    background-size: 50%;
    background-repeat: no-repeat;
}
label.right {
    right: 20px;
    background-color: white;
    background-image:url('images/right-arrow.png');
    background-position: center center;
    background-size: 50%;
    background-repeat: no-repeat;
}

[id="slide01"]:checked ~ .slidelist .slideitem {transform:translateX(0); animation:slide01 20s infinite}
[id="slide02"]:checked ~ .slidelist .slideitem {transform:translateX(-100%); animation:slide02 20s infinite}
[id="slide03"]:checked ~ .slidelist .slideitem {transform:translateX(-200%); animation:slide03 20s infinite}
[id="slide04"]:checked ~ .slidelist .slideitem {transform:translateX(-300%); animation:slide04 20s infinite}
 
@keyframes slide01 {
    0% {left: 0%;} /*첫 번째 스크린*/
    25% {left: 0%;} /*두 번째로 위치 이동*/
    48% {left: -100%;} /*두 번째로 위치 이동, 두 번쨰 스크린*/
    50% {left: -100%;}/*세 번째로 위치 이동*/
    73%    {left: -200%;}/*세 번째로 위치 이동, 세 번쨰 스크린*/
    75% {left: -200%;}/*네 번째로 위치 이동, 네 번째 스크린*/
    98% {left: -300%;} /*네 번째 스크린*/
    100% {left:0%} /*첫 번째 스크린 이동*/
}
@keyframes slide02 {
    0% {left: 0%;} /*첫 번째 스크린*/
    23% {left: 0%;}
    25% {left: -100%;} 
    48% {left: -100%;} 
    50% {left: -200%;}
    73%    {left: -200%;}
    100% {left:0%}
}
@keyframes slide03 {
    0% {left: 0%;} /*첫 번째 스크린*/
    23% {left: 0%;}
    25% {left: -100%;} 
    48% {left: -100%;} 
    50% {left: 200%;}
    73%    {left: 200%;}
    100% {left:0%}
}
@keyframes slide04 {
    0% {left: 0%;} /*첫 번째 스크린*/
    23% {left: 0%;}
    25% {left: 300%;} 
    48% {left: 300%;} 
    50% {left: 200%;}
    73%  {left: 200%;}
    100% {left:0%}
}

</style>
</head>
<body>

<main>
<div class="container">
    <div class="row" style="align:center;">
        <nav class="navbar navbar-expand-sm bg-dark navbar-secondary d-flex justify-content-centered"
        	style="height:120px">
        <!-- Brand/logo -->
	        <a class="navbar-brand" href="../mvcboard/default.do" style="width: 150px" >
	            <img src="../images/header.jpg" height="120px">
	        </a>
	        <div class="navbar-nav ms-auto py-0">
		        <div class="nav-item dropdown">
		        	<a href="../mvcboard/list.do?b_flag=freeboard" class="nav-link nav-item active"
		        		style="color:#ffffff">
						GO TO COMMUNITY HUB</a>
		        </div>
		    </div>
		</nav>
    </div>
	<div class="game_page_ game" style="align:center; width:1300px; height:400px; background-image: url('https://cdn.akamai.steamstatic.com/steam/apps/227300/page_bg_generated_v6b.jpg?t=1668166019');" data-miniprofile-appid=227300>
		<div class="slidebox">
		    <input type="radio" name="slide" id="slide01" checked>
		    <input type="radio" name="slide" id="slide02">
		    <input type="radio" name="slide" id="slide03">
		    <input type="radio" name="slide" id="slide04">
		    <ul class="slidelist">
		        <li class="slideitem">
		            <div>
		                <label for="slide04" class="left"></label>
		                <label for="slide02" class="right"></label>
		                <iframe width="690px" height="400px" src="https://www.youtube.com/embed/YLhHBCk5JeE" title="Euro Truck Simulator 2: 1.46 Update Changelog Video" frameborder="0" allow="accelerometer; autoplay; mute=1; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
		            </div>
		        </li>
		        <li class="slideitem">
		            <div>
		                <label for="slide01" class="left"></label>
		                <label for="slide03" class="right"></label>
		                <iframe width="690px" height="400px" src="https://www.youtube.com/embed/cMSEm-dbTCQ" title="American Truck Simulator - Texas DLC Video Trailer" frameborder="0" allow="accelerometer; autoplay; mute=1; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>>
		            </div>
		        </li>
		        <li class="slideitem">
		            <div>
		                <label for="slide02" class="left"></label>
		                <label for="slide04" class="right"></label>
		                <iframe width="690px" height="400px" src="https://www.youtube.com/embed/Pd47uVSL4qg" title="Euro Truck Simulator 2 - Feldbinder Trailer Pack" frameborder="0" allow="accelerometer; autoplay; mute=1; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
		            </div>
		        </li>
		        <li class="slideitem">
		            <div>
		                <label for="slide03" class="left"></label>
		                <label for="slide01" class="right"></label>
		                <iframe width="675" height="400px" src="https://www.youtube.com/embed/QCTD97EIUcM" title="World of Trucks - Destination Hannover Event Video Trailer" frameborder="0" allow="accelerometer; autoplay; mute=1; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		            </div>
		        </li>
		    </ul>  
		</div>
	</div>
	<div>
		<div>
			<span style="font-size:25px">공지사항</span>
			<c:choose>
					<c:when test="${ empty boardLists }">
					        <tr>
					            <td colspan="5" align="center">
					                등록된 게시물이 없습니다
					            </td>
					        </tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ boardLists }" var="row" varStatus="loop" end="5">
							<table class="table table-bordered">
								<tr>
						            <th width="10%" style="text-align:center">번호</th>
						            <th width="*">제목</th>
						            <th width="15%" style="text-align:center">작성자</th>
						            <th width="10%" style="text-align:center">조회수</th>
						            <th width="15%" style="text-align:center">작성일</th>
						        </tr>
						        <tr align="center">
						            <td>
						            	${ map.totalCount - (((map.pageNum-1) * map.pageSize)
						            		+ loop.index)}
						            </td>
						            <td align="left"> 
						                <a href="../mvcboard/view.do?b_flag=notice&idx=${ row.idx }">
						                	${ row.title }</a> 
						            </td>
						            <td align="center">${ row.id }</td>
						            <td align="center">${ row.visitcount }</td>
						            <td align="center">${ row.postdate }</td>
						        </tr>
						     </table>
						 </c:forEach>
					</c:otherwise>
				</c:choose>
		</div>
	</div>
</div>
</main>
</body>
</html>