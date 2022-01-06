<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Count Rows JSP</title>
</head>
<body>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
Statement st=con.createStatement();
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String userid=request.getParameter("userid");
String password=request.getParameter("password");
String strQuery = "SELECT COUNT(*) FROM users1 where email='"+email+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1); 
out.println(Countrow);
if(Countrow.equals("0")){
int i=st.executeUpdate("insert into users1(fname,lname,email,userid,password)values('"+fname+"','"+lname+"','"+email+"','"+userid+"','"+password+"')");
}
else{
out.println("User name or Email already exists !");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>