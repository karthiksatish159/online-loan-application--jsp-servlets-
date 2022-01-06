<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<form action="Loan" method="post">
<h1>For conformation type the username and Loan type</h1>
Username:<input type="text" name="uname"><br><br>
Loan: <input type="text" name="loan">
<input type="submit" value="verified">
</form>
</body>
</html>