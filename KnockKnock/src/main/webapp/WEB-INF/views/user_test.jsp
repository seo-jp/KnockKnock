<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트용</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
   <div>
   아이디: <input type="text" id="id" name="user_id" oninput ="checkId()"><span id = "chkMsg"></span> <br>
   비번: <input type="password" id="pwd" name="user_pwd"><br>
   이름: <input type="text" id="name" name="user_name"><br>
   연락처: <input type="text" id="tel" name="user_tel"><br>
   메일: <input type="text" id="email" name="user_email"><br>
   <button type="button" onclick="joinUser()">가입</button>
   </div>
   <br>
   
   
   <div>
   <input type="text" id="loginId" name="user_id"><br>
   <input type="text" id="loginPwd" name="user_pwd" ><br>
   <!--<input type="checkbox" id="saveId" >아이디 저장  -->
   <button type="button" onclick="login()">로그인</button>
   </div>
   
   <br>
   <div id="find">
    <p>아이디 찾기</p>
   <input type="text" id="userInfo" name="userInfo">
   <button type="button" onclick="findId()">아이디 찾기</button>
   </div>
   
   <br>
   
   <div>
   <input type="text" id="findId" name="user_id"><br>
   <input type="text" id="findId_email" name="user_email"><br>
   <button type="button" onclick="findPwd()">메일보내기</button>
   </div>
   
   <script>
    function joinUser(){
    	
    	let uid = document.getElementById("id").value;
    	let pwd = document.getElementById("pwd").value;
    	let name = document.getElementById("name").value;
    	let tel = document.getElementById("tel").value;
    	let email = document.getElementById("email").value;
    	
    	let data = {"user_id":uid,"user_pwd":pwd,"user_name":name,
    			    "user_tel":tel,"user_email":email};

    	$.ajax({
    		type: 'post',
    		url: 'join',
    		data: data,
    		dataType: 'json',
    		traditional: true,
    		success: function(data){
    			
    			if(data<=0){
    				alert('회원가입 실패');
    			}else{
    				alert('회원가입 완료');
    			}
    		},
    		error: function(err){
    			alert('error: '+err.status);
    		}    		
    	});
    }
    
    function checkId(){
    	
    	let uid = document.getElementById("id").value;
    	
    	$.ajax({
    		type: 'post',
    		url: 'checkId',
    		data: {user_id:uid},
    		success:function(data){
    			
    			if(data==0){
    				$('#chkMsg').html("사용 가능")
    			}else{
    				$('#chkMsg').html("사용 불가")
    			}
    		},
    		error:function(err){
    			alert('error: '+err.status);
    		}
    	})	
    }
   
    function login(){
    	
    	let uid = document.getElementById("loginId").value;
    	let pwd = document.getElementById("loginPwd").value;
    	//let saveId = document.getElementById("saveId").value;
    	$.ajax({
    		type: 'post',
    		url: 'login',
    		dataType: 'json',
    		data: {user_id:uid, user_pwd:pwd},
    		success:function(data){
    			if(data.msg != null){
    			    alert(data.msg)
    			}else{    				
    			    location.href = <c:url value="/"/>;
    			}
    		},
    		error:function(err){
    			alert('error: '+err.status);
    		}
    	})
    	
    	
    }
    
    
    function findId(){
    	
    	let info = document.getElementById("userInfo").value;
    	
    	$.ajax({
    		type: 'get',
    		url: 'findId',
    		dataType: 'json',
    		data : {userInfo: info},
    		success:function(data){
    			$('#find').text(data.msg);
    		},
    		error:function(err){
    			alert('error: '+err.status);
    		}
    	})
    	
    }
    
/*     function findPwd(){
    	
    	let uid = document.getElementById("findId").value;
    	let email = document.getElementById("findId_email").value;
    	
    	$.ajax({
    		type: 'post',
    		url: 'findPwd',
    		dataType= 'json',
    		data : {user_id:uid, user_email:email},
    		success:function(data){
    			alert("메일을 발송했습니다.");
    		},
    		error:function(err){
    			alert('error: '+err.status);
    		}
    	})
    } */
   </script>
</body>

</html>
