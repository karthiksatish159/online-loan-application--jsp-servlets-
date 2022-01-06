<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function checkform1()
{
    		var un,ep;
    		
			 un=f1.uname.value;
      		 ep=f1.pword.value;
      		 
 			 if(un=="")
       		 {
       			window.alert("Please enter username");
   		 		return false;
       		 }
           	 else if(ep=="")
       		 {
       			window.alert("Enter the password")
   		 		return false;
       		 }
           	 else
           	{
        	 
           		 		return true;
           	}
           	 		
           
}
function checkform3()
{
	window.location.href = "forgot1.jsp";
}
</script>
<link rel="stylesheet" type="text/css" href="login3.css">
</head>
<body>
<div class="form">
<form action="Login2servlet" method="post" name="f1">

<div class="login-box">
  <h1>Admin Login</h1>
  <div class="textbox">
    <i class="fas fa-user"></i>
    <input type="text" placeholder="Username" name="uname">
 

  </div>

  <div class="textbox">
    <i class="fas fa-lock"></i>
    <input type="password" placeholder="Password" name="pword">
  </div>
 <input type="submit" class="btn" value="Sign in" onclick="return checkform1()">
 </form>
 <form action="forgot1.jsp" method="post">

 <input type="submit" value="Forgot password ? " >
 </form>
</div>

</body>
</html>