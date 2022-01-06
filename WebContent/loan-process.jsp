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
<%
	String uname=request.getParameter("uname");
	String loan=request.getParameter("loan");
	String amount=request.getParameter("amount");
	String years=request.getParameter("years");
	 HttpSession httpSession = request.getSession();
	  httpSession.setAttribute("uname", uname);
	  httpSession.setAttribute("loan", loan);
	  httpSession.setAttribute("amount", amount);
	  httpSession.setAttribute("years", years);
      request.getRequestDispatcher("admin-dashborad23.jsp").forward(request, response);	
	
%>
</form>
</body>
</html>