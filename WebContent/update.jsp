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
<%
	String uname=request.getParameter("uname");
	String amount=request.getParameter("amount");
	String loan=request.getParameter("loan");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println(" driver Loaded");
	Connection con =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
	System.out.println("Connect to database");
	String sql="update loan_d set amount='"+amount+"' where uname='"+uname+"' and  loan='"+loan+"'";
	PreparedStatement psmt=con.prepareStatement(sql);
	ResultSet rs=psmt.executeQuery();
	if(rs.next())
	{ %>
		<h1>Successfully Updated amount</h1>
		<%
	}
	else
	{%>
		<h1>Unable to Updated amount</h1>
		<% 
	}
%>
</body>
</html>