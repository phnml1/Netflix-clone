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
<title>Netflix</title>
</head>
<body>
	<div id = "maindetailwrap">
	<div id="headerwrap" class = "headernotscroll">
		<div class='menu-nav'>
  			<a href = "/"><div class="icon" ></a>
  			<img src='/web/images/headericon.png' ></img>
  		</div>
  	</div>
  	
  </div>
  <div id = "detailwrap">
  	<div class = "detailinfowrap">
  	<div class = "detailinfocon">
  		<div class = "detailinfotitle">${content.title }</div>
  		<div class = "detailinfogenre">${content.genre }</div>
  	</div>
  	<div class="detailinfocon">
  		<div class = "detailinfoyear">${content.year }</div>
  		<div class = "detailinforun">${content.running }분</div>
  	</div>
  	<div class = "detailinfodirec">감독: ${content.director }</div>
  		<div class = "detailinfosum">${content.summary }</div>
  		<div class = "detailinfohits">조회수: ${content.hits }</div>
  	</div>
  	
  	<div class = "detailposterwrap">
  	<img width = "100%" src="${content.poster_img_save_path }">
  	</div>
  	</div>
</body>
</html>