<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
html,
body {
	height: 100%;
}

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 800px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

th,
td {
	padding: 15px;
	background-color: rgba(255,255,255,0.2);
	color: #fff;
}

th {
	text-align: left;
}

thead {
	th {
		background-color: #55608f;
	}
}

tbody {
	tr {
		&:hover {
			background-color: rgba(255,255,255,0.3);
		}
	}
	td {
		position: relative;
		&:hover {
			&:before {
				content: "";
				position: absolute;
				left: 0;
				right: 0;
				top: -9999px;
				bottom: -9999px;
				background-color: rgba(255,255,255,0.2);
				z-index: -1;
			}
		}
	}
}
 
</style>
</head>
<body bgcolor="lightblue">
<h2 align="center"><font><strong>Recent transaction History</strong></font></h2>
<div class="container">
<table align="center" cellpadding="5" cellspacing="5" border="1">
<thead>
<tr bgcolor="#A52A2A">
<td><b>username</b></td>
<td><b>Loan</b></td>
<td><b>Amount</b></td>
<td><b>Years</b></td>
</tr>
</thead>
<%
try{ 
Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println(" driver Loaded");
			Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			System.out.println("Connect to database");
			Statement st=conn.createStatement();
			String sql ="SELECT * FROM loan_d";
			ResultSet rs = st.executeQuery(sql);
while(rs.next()){
%>
<tbody>
<tr >

<td><%=rs.getString("uname") %></td>
<td><%=rs.getString("loan") %></td>
<td><%=rs.getString("amount") %></td>
<td><%=rs.getString("years") %></td>

</tr>
</tbody>
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>