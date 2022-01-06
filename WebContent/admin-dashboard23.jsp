<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form>
<h1>Sir your loan response is noted and sent to our admin,He will check and approve with in 5 days</h1>
<%! String uname,loan,amount,years; %>
<%String uname = (String)session.getAttribute("uname");
String loan = (String)session.getAttribute("loan");
String amount = (String)session.getAttribute("amount");
String years = (String)session.getAttribute("years");
%>
<%
	
	 HttpSession httpSession = request.getSession();
	  httpSession.setAttribute("uname", uname);
	  httpSession.setAttribute("loan", loan);
	  httpSession.setAttribute("amount", amount);
	  httpSession.setAttribute("years", years);
    
	
%>
</form>
</body>
</html>