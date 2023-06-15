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
    			<h2 class = "login-contents-name">�α���</h2>
    			<form id = "login-form">
    				<input type = "text" placeholder="���̵�" name = "id" class = "logininput"/>
    				<div class="alarm">���̵� �Է����ּ���.</div>
    				<input type = "text" placeholder="��� ��ȣ" name="password" class = "logininput"/>
    				<div class="alarm">��й�ȣ�� �Է����ּ���.</div>
    				<button class = "loginbutton">�α���</button>
    				<div class = "login-joincon">
    				<span>Netlix ȸ���� �ƴϽŰ���?</span><a href = "/join"><span>���� �����ϼ���</span></a>
    				</div>
    			</form>
    		</div>
    </div>
    </div>
   
	</div>
	<script>
	<%-- ����Ű - �α��� ��ư Ŭ�� ó�� --%>
	$('#login-form input').on('keyup',function(e){
		if(e.keyCode == 13){
			e.preventDefault();
			
			if($(this).attr('id')=='pwd_input'){
				$('#btn_login').click();
			}
		}
	});
	$('.loginbutton').on('click', function() { 
		<%-- form validation --%>
		<%-- form validation --%>
		var validTF = true;
		$('#login-form .required').each(function() {
		if ($.trim($(this).val()) == '') {
			alert($(this).attr('title') + ' �׸��� �ʼ����Դϴ�.');
			$(this).siblings('div.alarm').show();
			validTF = false;
			return false;
		} else {
			$(this).siblings('div.alarm').hide();
		}
		});
		if (!validTF) {
			return false;
		}
		<%-- ajax ȣ�� --%>


			//ajaxȣ��
			$.ajax({
				url:'/login',
				type:'POST',
				data: $('#login-form').serialize(),
				success: function (data) {
					var result_cd = data.result_cd;
					if(result_cd == '00'){
						location.href = "/";
					}else{
						var result_msg = data.result_msg;
						alert(result_msg);
					}
					
				},
				error: function(error){
					console.log(error);
				}		
				});
		});
		});

	</script>
</body>
</html>