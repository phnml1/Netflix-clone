<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 페이지</title>

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

table.form-table th em.red {
	margin-left: 3px;
	color: red;
}

table.form-table td {
    padding: 2px 5px 3px 5px;
}

input.input-normal {
    padding: 2px 4px;
    width: 90%;
}

textarea.textarea-normal {
    resize: none;
    width: 97%;
    height: 400px;
    margin: 3px 0;
    padding: 5px;
}

div.button-area {
	text-align: right;
}

div.button-area button, div.button-area a.button {
	font-size: 13px;
    border: 1px solid #000000;
    border-radius: 3px;
    padding: 3px 7px;
    text-decoration: none;
    color: #000000;
    background: #f9f9f9;
    cursor: pointer;
}

div.button-area button:hover, div.button-area a.button:hover {
    font-weight: bold;
    background: #e7e7e7;
}

</style>

</head>
<body>
<%

String type = (String)session.getAttribute("type");

	if(!(type.equals("admin"))){
	    out.println("<script>alert('관리자만 접근가능합니다.'); history.go(-1);</script>");
	    out.flush();
	    response.flushBuffer();
	    out.close();
	}
%>
	<div class="container">
		<p class="title">Spring boot로 만들어보는 게시판<%=type %></p>
		<form id="add_form" action="/contents/new" method="post" enctype="multipart/form-data">
			<table class="form-table">
				<tr>
					<th>제목<em class="red">*</em></th>
					<td colspan="3">
						<input type="text" class="input-normal" name="title" maxlength="100" placeholder="제목을 입력해주세요.">
					</td>
					<th>감독<em class="red">*</em></th>
					<td>
						<input type="text" class="input-normal" name="director" maxlength="50" placeholder="감독을 입력해주세요.">					
					</td>
					
			<th>연도<em class="red">*</em></th>
					<td>
						<input type="number" class="input-normal" name="year" maxlength="50" placeholder="연도를 입력해주세요.">					
					</td>
				</tr>
				<tr>
					
					
					
					
					</tr>
					<tr rowspan = "4">
					<th>종류</th>
					<td>
			<select name="kind" id="kind">
    <option value="movie">영화</option>
    <option value="series">시리즈</option>
 
  </select>
			</td>
			<th>장르<em class="red">*</em></th>
					<td>
			<select name="genre" id="genre">
    <option value="action">액션</option>
    <option value="comedy">코미디</option>
    <option value="thriler">스릴러</option>
    <option value="horror">공포</option>
    <option value="romance">로맨스</option>
  </select>
			</td>
				
					<th>러닝타임(시리즈는 0으로)<em class="red" value = "0">*</em></th>
					<td>
						<input value = "0" type="number" class="input-normal" name="running" maxlength="50" placeholder="러닝타임을 입력해주세요.">					
					</td>
					<th>포스터</th>
					<td>
						<input type="file" name="contentsFile" />
					</td>
					
				</tr>
				<tr>
						<th>줄거리<em class="red">*</em></th>
					<td colspan = "8" rowspan = "5">
						<textarea cols = "80" rows = "5" class="input-normal" name="summary" maxlength="50" placeholder="줄거리를 입력해주세요." ></textarea>									</td>
				</tr>
				
				
			</table>
			<div class="button-area">
				<button type="submit"  id="btn_regist">게시물 등록</button>
				<a class="button" href="/contents">게시판 목록</a>
			</div>
			
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#btn_regist').on('click', function() {
				var file = $('#add_form')[0].files[0];
				var formData = new FormData();
				
				formData.append("contentsFile", file);
				$.ajax({
					type:"post",
					enctype:'multipart/form-data',
				    url:'/contents/new',
				    data:formData,
				    dataType:'json',
				    processData : false,
				    contentType : false,
				    cache : false,
				    success : function(data){
				    	console.log("success : ", data);
				    },
				    error : function(e){
				    	console.log("error : ", e);
				    }
				});
			});
		});
	</script>
</body>
</html>