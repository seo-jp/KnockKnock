<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   아이디: <input type="text" id="id" name="user_id"><br>
   비번: <input type="password" id="pwd" name="user_pwd"><br>
   이름: <input type="text" id="name" name="user_name"><br>
   연락처: <input type="text" id="tel" name="user_tel"><br>
   메일: <input type="text" id="email" name="user_email"><br>
   <button type="button" onclick="joinUser()">가입</button>
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
    			var n = parseInt(data.result);
    			if(n<=0){
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
   
   </script>
</body>

</html>
