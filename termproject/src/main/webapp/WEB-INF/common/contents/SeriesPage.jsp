<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link type="text/css" rel="stylesheet" href="/web/css/Contents.css" />
    <link type="text/css" rel="stylesheet" href="/web/css/Common.css" />
<style>
.swiper {
  width: 90%;
  height: 200px;
}

</style>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script defer src = "/web/js/main.js"></script> 

  <title>Netflix</title>
</head>
<body>
<%

String id = (String)session.getAttribute("id");

	if(id==null){
	    out.println("<script>alert('로그인을 하세요.');location.href='/login' </script> ");
	    out.flush();
	    response.flushBuffer();
	    out.close();
	    response.sendRedirect("www.naver.com");
	}
%>
<div id = "mainwrap">
	<div id="headerwrap" class = "headernotscroll">
<div class='menu-nav'>
  <div class="icon" >
  <a href = "/">
  <img src='/web/images/headericon.png' ></img>
  </a>
  </div>
  
  <ul class="prinav">
    <a href = "/"><li class="prinavtab" >홈</li></a>
    <a href = "/series"><li class="prinavtab">시리즈</li></a>
    <a href = "/movie"><li class="prinavtab">영화</li></a>
    <%

String type = (String)session.getAttribute("type");

	if((type.equals("admin"))){
	    
	
%>
 <a href = "/contents/form"><li class="prinavtab">등록하기</li></a>
<%} %>
  </ul>
  <div class="endnavbar">
    <div class="endnavelement">
    <div class="searchtab">
      <svg width="24" height="24" viewBox='0 0 24 24'
      xmlns='http://www.w3.org/2000/svg'>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M14 11C14 14.3137 11.3137 17 8 17C4.68629 17 2 14.3137 2 11C2 7.68629 4.68629 5 8 5C11.3137 5 14 7.68629 14 11ZM14.3623 15.8506C12.9006 17.7649 10.5945 19 8 19C3.58172 19 0 15.4183 0 11C0 6.58172 3.58172 3 8 3C12.4183 3 16 6.58172 16 11C16 12.1076 15.7749 13.1626 15.368 14.1218L24.0022 19.1352L22.9979 20.8648L14.3623 15.8506Z"
        fill="currentColor"></path>
      </svg>
    </div>
    </div>
    <div class="endnavelement">
      <div class = "accountmenuitem">
        <div class="accountdropdownbtn">
          <span class="accountimg">
          <img src='https://occ-0-7129-988.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABY20DrC9-11ewwAs6nfEgb1vrORxRPP9IGmlW1WtKuaLIz8VxCx5NryzDK3_ez064IsBGdXjVUT59G5IRuFdqZlCJCneepU.png?r=229'/>
          </span>
          <span class="caret">

          </span>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<div class="billcon">
    <div class="billrow">
    <div class="billboardwrap">
      <div class="billboardimgwrap">
        <img class="billboardimg" src ="http://occ-0-325-988.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABbPUTFo13d_knsWj5Max139hI4mCBgTwUTqDWqMMiWzcpI8AvH2-P_-AsSEk6zPI_Uo_YTbdi4qoZxmBLdCYppY0dW8uhIm05N46.webp?r=2a2"/>
        <div class="billboardgrad">

        </div>
      </div>
      <div class="fillcontainer">
      <a href = "/contents/detail?contents_id=87">
      <div class="billboardinfowrap"
      >
        
          <div class="billboardtitleimg">
            <img src = "https://occ-0-3682-988.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABV4hxDuy2v-2QHVS9HqlVltIIYltnHElKLgKIHdkIxD5eX1im4oiyXNIzEH3psJ50wsYy9JYU1B7Dbx7PmJGI2SsSzkc7wWjchBZKwquL14.webp?r=f59" width = "100%"/>
          </div>
          <div class = "billboardsummary">
          활력과 욕망이 넘치는 이태원. 한 전과자와 친구들이 꿈을 위해 뭉쳤다. 일단 시작은 술집 창업. 불합리한 세상, 막강한 적이 앞길을 막으면? 기를 쓰고 맞서 싸워야지!
          </div>
      </div>
      </a>
    </div>
    <div class="bottomgrad">

    </div>
    </div>
    </div>
   </div>
    <div class = "movie-row">
   <div class = "movie-row__title">
   액션
   </div>
   <div class = "movie-row__carousel">
   <div class="swiper swiper2">
  <div class="swiper-wrapper">
    	 <c:forEach var="content" items="${ContentsList}">
    	<c:if test="${content.genre eq 'action' }">
    	<div class="swiper-slide"><a style ="width:100%; height:100%"href="/contents/detail?contents_id=${content.contentsid}"><img class = "swiperimg" src="${content.posterimgsavepath}" ></a></div>
		</c:if>
	</c:forEach>
    	</div>
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->


  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>
  <div class="swiper-button-prev prevbtn2"></div>
  <div class="swiper-button-next nextbtn2"></div>
  </div>
</div>
  <div class = "movie-row">
   <div class = "movie-row__title">
   로맨스
   </div>
   <div class = "movie-row__carousel">
   <div class="swiper swiper1">
  <div class="swiper-wrapper">
  <c:forEach var="content" items="${ContentsList}">
    	<c:if test="${content.genre eq 'romance' }">
    	<div class="swiper-slide"><a style ="width:100%; height:100%"href="/contents/detail?contents_id=${content.contentsid}"><img class = "swiperimg" src="${content.posterimgsavepath}" ></a></div>
		</c:if>
	</c:forEach>
		
  
  </div>
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->


  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>
  <div class="swiper-button-prev prevbtn1"></div>
  <div class="swiper-button-next nextbtn1"></div>
  </div>
</div>

 <div class = "movie-row">
   <div class = "movie-row__title">
   스릴러
   </div>
   <div class = "movie-row__carousel">
   <div class="swiper swiper3">
    	
    	 <div class="swiper-wrapper">
    	 <c:forEach var="content" items="${ContentsList}">
    	<c:if test="${content.genre eq 'thriler' }">
    	<div class="swiper-slide"><a style ="width:100%; height:100%"href="/contents/detail?contents_id=${content.contentsid}"><img class = "swiperimg" src="${content.posterimgsavepath}" ></a></div>
		</c:if>
	</c:forEach>
    	</div>
    	
  </div>
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->


  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>
  <div class="swiper-button-prev prevbtn3"></div>
  <div class="swiper-button-next nextbtn3"></div>
  </div>
  <div class = "movie-row">
   <div class = "movie-row__title">
   코미디
   </div>
   <div class = "movie-row__carousel">
   <div class="swiper swiper3">
    	
    	 <div class="swiper-wrapper">
    	 <c:forEach var="content" items="${ContentsList}">
    	<c:if test="${content.genre eq 'comedy' }">
    	<div class="swiper-slide"><a style ="width:100%; height:100%"href="/contents/detail?contents_id=${content.contentsid}"><img class = "swiperimg" src="${content.posterimgsavepath}" ></a></div>
		</c:if>
	</c:forEach>
    	</div>
    	
  </div>
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->


  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>
  <div class="swiper-button-prev prevbtn3"></div>
  <div class="swiper-button-next nextbtn3"></div>
  </div>
  <div class = "movie-row">
   <div class = "movie-row__title">
	호러
   </div>
   <div class = "movie-row__carousel">
   <div class="swiper swiper3">
    	
    	 <div class="swiper-wrapper">
    	 <c:forEach var="content" items="${ContentsList}">
    	<c:if test="${content.genre eq 'horror' }">
    	<div class="swiper-slide"><a style ="width:100%; height:100%"href="/contents/detail?contents_id=${content.contentsid}"><img class = "swiperimg" src="${content.posterimgsavepath}" ></a></div>
		</c:if>
	</c:forEach>
    	</div>
    	
  </div>
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->


  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>
  <div class="swiper-button-prev prevbtn3"></div>
  <div class="swiper-button-next nextbtn3"></div>
  </div>
</div>


</body>