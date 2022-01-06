<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function checkform2()
{
	window.location.href = "index.html"
}
</script>
</head>
<body background="https://i.pinimg.com/originals/54/34/c2/5434c2a82c14d398801d7fed387fb286.jpg">
 <%! public static String name,k; %>
     		<%String name = (String)session.getAttribute("p1"); %>
     		<%k=name; %>
     		
     		<h1 style="color:yellow"><%out.println("Payment is successfully done"); %></h1>
     		
     		<h1 style="color:yellow"><%out.println("Reamining balance to pay the loan is"+" "+k); %></h1>
     		<input type="button" value="LogOut" onclick="return checkform2()">
     		<%
     	
     			session.setAttribute("k",k);
    			
     		%>
</body>
</html>