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
<%@ page import="com.tukorea.common.contents.domain.Contents"%>
<style type="text/css">

div.container {
	width: 1000px;
}

p.title {
	border: 1px solid #000000;
    padding: 20px 10px;
    text-align: center;
    font-weight: bold;
    background: #f9f9f9;
}

table.form-table {
	width: 100%;
    border: 1px solid #000000;
    border-collapse: collapse;
    margin-bottom: 10px;
}

table.form-table th,table.form-table td {
	border: 1px solid #000000;
}

table.form-table th {
	width: 25%;
}

table.form-table td {
    padding: 2px 5px 3px 5px;
}

table.form-table td.long-text {
	white-space: pre-line;
}

div.button-area {
	text-align: right;
}

div.button-area a.button {
	font-size: 13px;
    border: 1px solid #000000;
    border-radius: 3px;
    padding: 3px 7px;
    text-decoration: none;
    color: #000000;
    background: #f9f9f9;
    cursor: pointer;
}

div.button-area a.button:hover {
    font-weight: bold;
    background: #e7e7e7;
}

div.check-wrap {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgb(0,0,0,.5);
    display: none;
}

div.check-wrap div.check-form {
    margin: 140px 20px 20px 20px;
    background: #FFFFFF;
    padding: 30px;
}

</style>
</head>
<body>
	<div id = "maindetailwrap">
	<div id="headerwrap" class = "headernotscroll">
		<div class='menu-nav'>
  			<a href = "/"><div class="icon" >
  			<img src='/web/images/headericon.png' ></img>
  			</a>
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
  		<%
  		Contents content = (Contents)request.getAttribute("content"); 
  		if(!(content.getRunning()==0)){
  		%>
  		<div class = "detailinforun">${content.running }분</div>
<%} %>  		
  	</div>
  	<div class = "detailinfodirec">감독: ${content.director }</div>
  		<div class = "detailinfosum">${content.summary }</div>
  		<div class = "detailinfohits">조회수: ${content.hits }</div>
  	</div>
  	
  	<div class = "detailposterwrap">
  	<img width = "100%" height = "100%" src="${content.posterimgsavepath }">
  	</div>
  	
	<div class="button-area">
	<%

String type = (String)session.getAttribute("type");

	if((type.equals("admin"))){
	    
	
%>
			<a class="button left btn-action" data-action-type="modify" >수정</a>
			<a class="button left btn-action" data-action-type="delete">삭제</a>
			
			<a class = "button" href = "/contents/form">등록하기</a>
		
  	<%} %>
  	<a class="button" onclick="goBack()" >뒤로가기</a>
  	</div>
  	</div>
  	<%-- 비밀번호 확인용 영역 --%>
	<div id="check_wrap" class="check-wrap">
		<form id="action_form" method="post">
			<div class="check-form">
				
				<input type="hidden" id="action_type" class="initialized" value="" />
				
				<table class="form-table">
					<tr>
						<th>비밀번호</th>
						<td>
						<input type="hidden" id="board_seq" name="contentsid" value="${content.contentsid}" />
							<input type="password" id="board_password" class="initialized"placeholder="관리자 계정 비밀번호를 입력해주세요." style="width: 400px;" />
						</td>
					</tr>
				</table>
				<div class="button-area">
					<a class="button" id="btn_check_password">비밀번호 확인</a>
					<a class="button" id="btn_close">닫기</a>
				</div>
			</div>
		</form>
	</div>
	<script>
    function goBack() {
        window.history.back();
    }
</script>
  	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		$('.btn-action').on('click', function() {
			// action type 설정
			$('#action_type').val($(this).data('action-type'));
			
			$('#check_wrap').show();
		});
		
		$('#btn_close').on('click', function() {
			// form 초기화
			$('#check_wrap input.initialized').val('');
			
			// 레이어팝업 영역 hide
			$('#check_wrap').hide();
		});
		$('.form-table input').on('keyup',function(e){
			if(e.keyCode == 13){
				e.preventDefault();
				alert("enter치면 넘어가는건 아직못했습니다")
				
				
			}
		});
		$('#btn_check_password').on('click', function() {
			$.ajax({
				url: '/contents/checkPassword',
				type: 'POST',
				data: {
					contentid : $('#board_seq').val(),
					password : $('#board_password').val()
				},
				success: function (data) {
					if (data == true) {
						// 비밀번호 일치
						var action_type = $('#action_type').val();
						console.log('action_type : ' + action_type);
						
						if (action_type == 'modify') {
							// 수정폼으로 이동
							$('#action_form').attr('action', '/contents/modifyForm');
							$('#action_form').submit();
							
						} else if (action_type == 'delete') {
							// 삭제 진행
							$('#action_form').attr('action', '/contents/delete');
							$('#action_form').submit();
						}
						
					} else {
						// 비밀번호 불일치
						alert('비밀번호가 일치하지 않습니다.');
					}
				},
				error: function(error) {
					console.log(error);
				}
			});
		});
		function enterkey() {
			if (window.event.keyCode == 13) {
				$.ajax({
					url: '/contents/checkPassword',
					type: 'POST',
					data: {
						contentid : $('#board_seq').val(),
						password : $('#board_password').val()
					},
					success: function (data) {
						if (data == true) {
							// 비밀번호 일치
							var action_type = $('#action_type').val();
							console.log('action_type : ' + action_type);
							
							if (action_type == 'modify') {
								// 수정폼으로 이동
								$('#action_form').attr('action', '/contents/modifyForm');
								$('#action_form').submit();
								
							} else if (action_type == 'delete') {
								// 삭제 진행
								$('#action_form').attr('action', '/contents/delete');
								$('#action_form').submit();
							}
							
						} else {
							// 비밀번호 불일치
							alert('비밀번호가 일치하지 않습니다.');
						}
					},
					error: function(error) {
						console.log(error);
					}
				});
		    }
		}
	});
	</script>
</body>
</html>