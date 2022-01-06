<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function check()
{
		var l=f1.loan.value;
		if(l=="")
			{
				window.alert("Please enter your loan type")
				return false;
			}
		else
			{
				true;
			}
}
</script>
<style>
body  {
  background-image: url("https://image.shutterstock.com/image-photo/woman-putting-money-into-piggy-260nw-1571171296.jpg");
  background-color: #cccccc;
}
</style>
</head>
<body>
<%@ include file="header3.html" %>
<form action="checkP.jsp" method="post" name="f1">
	<%! public static String name,k; %>
	<%String name = (String)session.getAttribute("uname"); %>
	<%k=name; %>
	<%

		session.setAttribute("k",k);
	%>
	<h1><%=name %> please type your loan type in below box sir</h1>
	<center><select name="loan" class="form-control required" required>
			<option value hidden>Types of loans</option>
			<option value="Home Loan">Home Loan</option>
			<option value="Gold Loan">Gold Loan</option>
			<option value="Auto Loan">Auto Loan</option>
			<option value="Instruction Loan">Instruction Loan</option></select>
<br><br>
	<input type="submit" value="check status" onclick="return check()"></center>
</form>
</body>
</html>