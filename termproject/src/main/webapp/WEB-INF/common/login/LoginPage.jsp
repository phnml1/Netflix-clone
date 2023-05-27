<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <link type="text/css" rel="stylesheet" href="/web/css/login.css" />
  <link type = "text/css" rel = "stylesheet" href = "/web/css/Common.css"/>
<title>Netflix</title>
</head>
<body>
	<div id="mainwrap">
	<div id="headerwrap">
      <header>
      <a href = "/">
        <div class='icon'>
          <img src='/web/images/headericon.png' ></img>
        </div>
        </a>
        
      </header>
    </div>
    <div class = "login-back">
    	<img class = "login-backimg" src = "https://assets.nflxext.com/ffe/siteui/vlv3/ceb3b1eb-2673-4dd9-a6e3-0cd7a5e130ee/d110b57b-6acd-48f7-9626-01e92c747b19/KR-ko-20230522-popsignuptwoweeks-perspective_alpha_website_small.jpg"
    	srcset = "https://assets.nflxext.com/ffe/siteui/vlv3/ceb3b1eb-2673-4dd9-a6e3-0cd7a5e130ee/d110b57b-6acd-48f7-9626-01e92c747b19/KR-ko-20230522-popsignuptwoweeks-perspective_alpha_website_small.jpg 1000w, https://assets.nflxext.com/ffe/siteui/vlv3/ceb3b1eb-2673-4dd9-a6e3-0cd7a5e130ee/d110b57b-6acd-48f7-9626-01e92c747b19/KR-ko-20230522-popsignuptwoweeks-perspective_alpha_website_medium.jpg 1500w, https://assets.nflxext.com/ffe/siteui/vlv3/ceb3b1eb-2673-4dd9-a6e3-0cd7a5e130ee/d110b57b-6acd-48f7-9626-01e92c747b19/KR-ko-20230522-popsignuptwoweeks-perspective_alpha_website_large.jpg 1800w"
    	/>
    	<div class = "login-backgrad">
    	</div>
    	 <div class = "login-box">
    		<div class = "login-contents-box">
    			<h2 class = "login-contents-name">로그인</h2>
    			<form class = "login-form">
    				<input type = "text" placeholder="이메일 주소" class = "logininput"/>
    				<input type = "text" placeholder="비밀 번호" class = "logininput"/>
    				<button class = "loginbutton">로그인</button>
    				<div class = "login-joincon">
    				<span>Netlix 회원이 아니신가요?</span><a href = "/join"><span>지금 가입하세요</span></a>
    				</div>
    			</form>
    		</div>
    </div>
    </div>
   
	</div>
</body>
</html>