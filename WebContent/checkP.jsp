<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body  {
  background-image: url("https://image.shutterstock.com/image-photo/woman-putting-money-into-piggy-260nw-1571171296.jpg");
  background-color: #cccccc;
}
</style>
<%@ include file="header5.html" %>
<body>
<%! public static String name,k; %>
	<%String name = (String)session.getAttribute("uname"); %>
	<%k=name; %>
	<%

		session.setAttribute("k",k);
	%>
	<% String loan=request.getParameter("loan"); %>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println(" driver Loaded");
	Connection con =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
	System.out.println("Connect to database");
	Statement st=con.createStatement();
	String stra = "SELECT COUNT(*) FROM loan_d where uname='"+name+"' and loan='"+loan+"' ";
	String strp = "SELECT COUNT(*) FROM loan_p where uname='"+name+"' and lona='"+loan+"' ";
	PreparedStatement pstmt = con.prepareStatement(strp);
	ResultSet r=st.executeQuery(stra);
	r.next();
	String Countrow = r.getString(1); 
	ResultSet r1=pstmt.executeQuery();
	r1.next();
	String Countrow1 = r1.getString(1); 
	if(Countrow.equals("1"))
	{%>
		<h1>SuccessfullyApplied</h1>
	<%
	}
	else if(Countrow1.equals("1"))
	{%>
		<h1>Loan is on pending</h1>
	<% 
	}
	else
	{%>
	<h1>You are not applieded loan or may chance of rejected</h1>
	<%
	}
	%>
	
</body>
</html>