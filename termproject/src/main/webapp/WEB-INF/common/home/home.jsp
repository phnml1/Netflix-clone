<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link type="text/css" rel="stylesheet" href="/web/css/home.css" />
  <link type = "text/css" rel = "stylesheet" href = "/web/css/Common.css"/>
  <script src="/web/js/index.js"></script>
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
        <div class="buttons">
          <div class="buttonscon">
            <div class='buttonscon2'>
              <div id="langcon">
                <div id = "langearth">
                  <svg width="16" height="16" viewBox = "0 0 16 16" fill="none"
                  xmlns = "https://www.w3.org/2000/svg">
                  <path fill-rule = "evenodd" clip-rule="evenodd" d="M 8 14.5 C 8.23033 14.5 8.84266 14.2743 9.48679 12.986 C 9.76293 12.4337 9.99973 11.7621 10.1748 11 H 5.8252 C 6.00027 11.7621 6.23707 12.4337 6.51321 12.986 C 7.15734 14.2743 7.76967 14.5 8 14.5 Z M 5.57762 9.5 C 5.52716 9.02077 5.5 8.51911 5.5 8 C 5.5 7.48089 5.52716 6.97923 5.57762 6.5 H 10.4224 C 10.4728 6.97923 10.5 7.48089 10.5 8 C 10.5 8.51911 10.4728 9.02077 10.4224 9.5 H 5.57762 Z M 11.7092 11 C 11.4822 12.1217 11.1317 13.117 10.6914 13.9184 C 12.0137 13.3161 13.0987 12.2837 13.7678 11 H 11.7092 Z M 14.3261 9.5 H 11.9298 C 11.9759 9.01412 12 8.51269 12 8 C 12 7.48731 11.9759 6.98588 11.9298 6.5 H 14.3261 C 14.4398 6.98152 14.5 7.48373 14.5 8 C 14.5 8.51627 14.4398 9.01848 14.3261 9.5 Z M 4.0702 9.5 H 1.67393 C 1.56019 9.01848 1.5 8.51627 1.5 8 C 1.5 7.48373 1.56019 6.98152 1.67393 6.5 H 4.0702 C 4.02411 6.98588 4 7.48731 4 8 C 4 8.51269 4.02411 9.01412 4.0702 9.5 Z M 2.23221 11 H 4.29076 C 4.51779 12.1217 4.86832 13.117 5.30864 13.9184 C 3.98635 13.3161 2.90128 12.2837 2.23221 11 Z M 5.8252 5 H 10.1748 C 9.99973 4.23793 9.76293 3.56626 9.48679 3.01397 C 8.84266 1.72571 8.23033 1.5 8 1.5 C 7.76967 1.5 7.15734 1.72571 6.51321 3.01397 C 6.23707 3.56626 6.00027 4.23793 5.8252 5 Z M 11.7092 5 H 13.7678 C 13.0987 3.71627 12.0137 2.68389 10.6914 2.08162 C 11.1317 2.88302 11.4822 3.8783 11.7092 5 Z M 5.30864 2.08162 C 4.86832 2.88302 4.51779 3.8783 4.29076 5 H 2.23221 C 2.90128 3.71628 3.98635 2.68389 5.30864 2.08162 Z M 8 0 C 12.4183 0 16 3.58172 16 8 C 16 12.4183 12.4183 16 8 16 C 3.58172 16 0 12.4183 0 8 C 0 3.58172 3.58172 0 8 0 Z"
                   fill = "currentColor"></path>
                </svg>
                </div>
                <select>
                  <option>한국어</option>
                </select>
              </div>
              <div id="logincon">
              <%
              String id=(String)session.getAttribute("id");
              String type = (String)session.getAttribute("type");
              if (id==null) {
            	    
              %>
              <a href = "/login">
                <div class='button loginbutton'>
                  로그인
                </div>
                </a>
                <%} else { %>
                 <a href = "/logout">
                <div class='button loginbutton'>
                  로그아웃
                </div>
                </a>
                <%} %>
              </div>
            </div>
          </div>

        </div>
      </header>
    </div>
    <div id="beginintrowrap">
      <div class="background">
        <div class="contents">
          <div class="beginword1">
            <h1>
              영화와 시리즈를 무제한으로.
                  <%if(!(type==null)&&type.equals("admin")) {%>
                  <br>(
                  <%= type %>계정)
                  <%} %>
            </h1>
          </div>
          <div class="beginword2">
            다양한 디바이스에서 시청하세요. 언제든 해지하실 수 있습니다.
          </div>
          <div class="beginword3">
            시청할 준비가 되셨나요?
          </div>
          <div class='begininputcon'>
            
            <% if (id==null) { %>
            <a href = "/login">
            <button class="beginbutton">
              시작하기>
            </button>
            </a>
            <%} else { %>
            <a href = "/series">
            <button class="beginbutton">
              시작하기>
            </button>
            </a>
            <%} %>
          </div>
        </div>
        <div class="divider">

        </div>
      </div>
    </div>
    <div id="enjoyintvintrowrap" class="contentswrap" >
      <div class="contents contentswidth" >
        <div class="texts">
          <h2>
            TV로 즐기세요.
          </h2>
          <p>
            스마트 TV, PlayStation, Xbox, Chromecast, Apple TV, 블루레이 플레이어 등 다양한 디바이스에서 시청하세요.
          </p>
        </div>
        <div class="media">
          <img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/tv.png" width="100%" />
          <div class="mediavideo">
            <video autoplay="autoplay" muted="muted" loop>
              <source src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-tv-0819.m4v" type="video/mp4" />
            </video>
          </div>
        </div>
      </div>
      <div class="divider">

      </div>
    </div>
    <div id="watchdeviceintrowrap" class="contentswrap">
      <div class="contents contentswidth">
        <div class="media">
          <img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/device-pile.png" width="100%" />
          <div class="mediavideo">
            <video autoplay="autoplay" muted="muted" loop>
              <source src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-devices.m4v" type="video/mp4" />
            </video>
          </div>
        </div>
        <div class="texts">
          <h2>
            다양한 디바이스에서 시청하세요.
          </h2>
          <p>
            각종 영화와 시리즈를 스마트폰, 태블릿, 노트북, TV에서 무제한으로 스트리밍하세요. 추가 요금이 전혀 없습니다.
          </p>
        </div>
      </div>
      <div class="divider">

      </div>
    </div>
    <div id="makekidsprofileintrowrap" class="contentswrap">
      <div class="contents contentswidth" >
        <div class="texts">
          <h2>
            어린이 전용 프로필을 만들어 보세요.
          </h2>
          <p>
            자기만의 공간에서 좋아하는 캐릭터와 즐기는 신나는 모험. 자녀에게 이 특별한 경험을 선물하세요. 넷플릭스 회원이라면 무료입니다.
          </p>
        </div>
        <div class="media">
          <img src="https://occ-0-993-988.1.nflxso.net/dnm/api/v6/19OhWN2dO19C9txTON9tvTFtefw/AAAABe3Dqef6rg30BxYraI75i97IeQjD0YxUuToAnSA23dl0XQFrjXaFTWIB0HHy4TH_s094NU-9IjLpE_96AvWpTZTAQOR_icyEYcsB.png?r=acf" width="100%" />
        </div>
      </div>
      <div class="divider">

      </div>
    </div>
    <div id="offlinewatchintrowrap" class="contentswrap">
      <div class="contents contentswidth">
        <div class="media">
          <img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/mobile-0819.jpg" width="100%" />
          <div id="wacthintropos">
            <div class="image">
              <img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/boxshot.png" />

            </div>
            <div class="texts">
              <div class="text1">
                기묘한 이야기
              </div>
              <div class="text2">
                저장 중...
              </div>
            </div>
            <div class="downloadlogo">

            </div>
          </div>
        </div>
        <div class="texts">
          <h2>
            즐겨 보는 콘텐츠를 저장해 오프라인으로 시청하세요.
          </h2>
          <p>
            광고 없는 멤버십에서만 이용 가능합니다.
          </p>
        </div>

      </div>
      <div class="divider">

      </div>
    </div>
    <div id="qnaintrowrap">
      <div class="contents">
        <div class="qnawrap">
          <h2 >
            자주 묻는 질문
          </h2>
          <div id="qnacontents" >
            <ul>
              <li>
                <h3 onClick = "dp_menu(1)">
                  <button>
                    <span>넷플릭스에서 어떤 콘텐츠를 시청할 수 있나요?</span>
                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M11 2V11H2V13H11V22H13V13H22V11H13V2H11Z" fill="currentColor"></path>
                    </svg>
                  </button>
                </h3>
                <div id = "qnahiddencontent" class="hideqnahidden">
                </div>
              </li>
                <li>
                  <h3 onClick = "dp_menu(2)">
                    <button>
                      <span>넷플릭스란 무엇인가요?</span>
                      <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M11 2V11H2V13H11V22H13V13H22V11H13V2H11Z" fill="currentColor"></path>
                      </svg>
                    </button>
                  </h3>
                  <div id = "qnahiddencontent" class="hideqnahidden">
                  </div>
                </li>
                <li>
                <h3 onClick = "dp_menu(3)">
                  <button>
                    <span>넷플릭스 요금은 얼마인가요?</span>
                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M11 2V11H2V13H11V22H13V13H22V11H13V2H11Z" fill="currentColor"></path>
                    </svg>
                  </button>
                </h3>
                <div id = "qnahiddencontent" class="hideqnahidden">
                 
                </div>
              </li>
              <li>
                <h3 onClick = "dp_menu(4)">
                  <button>
                    <span>광고형 멤버쉽은 뭐가 다른가요?</span>
                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M11 2V11H2V13H11V22H13V13H22V11H13V2H11Z" fill="currentColor"></path>
                    </svg>
                  </button>
                </h3>
                <div id = "qnahiddencontent" class="hideqnahidden">
             
                </div>
              </li>
              <li>
                <h3 onClick = "dp_menu(5)">
                  <button>
                    <span>어디에서 시청할 수 있나요?</span>
                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M11 2V11H2V13H11V22H13V13H22V11H13V2H11Z" fill="currentColor"></path>
                    </svg>
                  </button>
                </h3>
                <div id = "qnahiddencontent" class="hideqnahidden">
                 
                </div>
              </li>
              <li>
                <h3 onClick = "dp_menu(6)">
                  <button>
                    <span>멤버쉽을 해지하려면 어떻게 하나요?</span>
                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M11 2V11H2V13H11V22H13V13H22V11H13V2H11Z" fill="currentColor"></path>
                    </svg>
                  </button>
                </h3>
                <div id = "qnahiddencontent" class="hideqnahidden">
              
                </div>
              </li>
              <li>
                <h3 onClick = "dp_menu(7)">
                  <button>
                    <span>아이들이 넷플릭스를 봐도 좋을까요?</span>
                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M11 2V11H2V13H11V22H13V13H22V11H13V2H11Z" fill="currentColor"></path>
                    </svg>
                  </button>
                </h3>
                <div id = "qnahiddencontent" class="hideqnahidden">
                
                </div>
              </li>
            </ul>
            <div class = "inputemailwrap">
              <div class = "inputemailinside">
                <form class = "inputemailform">
                  <h3> 시청할 준비가 되셨나요?   </h3>
                    <a href = "/series">
                  <div class = "inputemail">
                   
                  
                    <button class="beginbutton">
                      시작하기>
                    </button>
                   
                  </div>
                   </a>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
