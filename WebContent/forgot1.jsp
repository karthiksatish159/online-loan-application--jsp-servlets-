<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function checkform()
{
    var ep,cp,un;
    	    
			 un=f1.uname.value;
      		 ep=f1.pword.value;
           	 cp=f1.pcword.value;
           	 if(un=="")
           		 {
           		 	window.alert("Enter the username")
           		 	return false;
           		 }
       
           	 else if(ep=="")
       		 {
       			window.alert("Enter the password")
   		 		return false;
       		 }
           	 else if(cp=="")
       		 {
       			window.alert("Enter the confirm password")
   		 		return false;
       		 }
           	 else if(ep!=cp)
       		 {
       			window.alert("Check the confirm password it is mismatch");
   		 		return false;
       		 }
           	 else
           	{
           		 window.alert("login successful");
           		 		return true;
           	}
           	 		
           
}
</script>
<link rel="stylesheet" type="text/css" href="forgot.css">
</head>
<body>
<div class="container">
<header>
				<h1>Update Password</h1>
			</header>
<div class="loginForm">

<form action="Forgot1" method="post" name="f1">
<%
	String uname=request.getParameter("uname");
%>
<%=uname %>
<%
     	
     			session.setAttribute("uname",uname);
    			
%>
<h1 style="color:white">NewPassword:</h1>
<input id="password" class="password" type="password" name="pword" autocomplete="off"><br>
<h1 style="color:white">ConfirmPassword:</h1>
<input id="password" class="password1" type="password" name="pcword"  autocomplete="off"><br>
<input type="submit" value="Click" class="submit" onclick="return checkform()">
</div>
</div>
</form>
</body>
</html>