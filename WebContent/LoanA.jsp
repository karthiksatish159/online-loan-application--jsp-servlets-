<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}
body{
    font-family: Helvetica;
    -webkit-font-smoothing: antialiased;
    background: rgba( 71, 147, 227, 1);
}
h2{
    text-align: center;
    font-size: 18px;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: white;
    padding: 30px 0;
}

/* Table Styles */

.table-wrapper{
    margin: 10px 70px 70px;
    box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
}
caption {
    text-align: left;
    margin-bottom: 5px;
    text-transform: lowercase;
    font-size: 160%;
    padding: 5px;
    letter-spacing: 10px;
    font-weight: bold;
}
.fl-table {
    border-radius: 5px;
    font-size: 12px;
    font-weight: normal;
    border: none;
    border-collapse: collapse;
    width: 100%;
    max-width: 100%;
    white-space: nowrap;
    background-color: white;
}

.fl-table td, .fl-table th {
    text-align: center;
    padding: 8px;
}

.fl-table td {
    border-right: 1px solid #f8f8f8;
    font-size: 12px;
}

.fl-table thead th {
    color: #ffffff;
    background: #4FC3A1;
}


.fl-table thead th:nth-child(odd) {
    color: #ffffff;
    background: #324960;
}

.fl-table tr:nth-child(even) {
    background: #F8F8F8;
}

/* Responsive */

@media (max-width: 767px) {
    .fl-table {
        display: block;
        width: 100%;
    }
    .table-wrapper:before{
        content: "Scroll horizontally >";
        display: block;
        text-align: right;
        font-size: 11px;
        color: white;
        padding: 0 0 10px;
    }
    .fl-table thead, .fl-table tbody, .fl-table thead th {
        display: block;
    }
    .fl-table thead th:last-child{
        border-bottom: none;
    }
    .fl-table thead {
        float: left;
    }
    .fl-table tbody {
        width: auto;
        position: relative;
        overflow-x: auto;
    }
    .fl-table td, .fl-table th {
        padding: 20px .625em .625em .625em;
        height: 60px;
        vertical-align: middle;
        box-sizing: border-box;
        overflow-x: hidden;
        overflow-y: auto;
        width: 120px;
        font-size: 13px;
        text-overflow: ellipsis;
    }
    .fl-table thead th {
        text-align: left;
        border-bottom: 1px solid #f7f7f9;
    }
    .fl-table tbody tr {
        display: table-cell;
    }
    .fl-table tbody tr:nth-child(odd) {
        background: none;
    }
    .fl-table tr:nth-child(even) {
        background: transparent;
    }
    .fl-table tr td:nth-child(odd) {
        background: #F8F8F8;
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tr td:nth-child(even) {
        border-right: 1px solid #E6E4E4;
    }
    .fl-table tbody td {
        display: block;
        text-align: center;
    }
}

</style>
</head>
<body>
<%@ include file="header4.html" %>
<form NAME="actionForm" action="Loan" method="post">
<div class="table-wrapper">
<table class="fl-table">
<thead>
<tr>
    <th>Username</th>
    <th>loan</th>
    <th>amount</th>
    <th>years</th>
    <th>Checking</th>
    
</tr>
</thead>
<%
   try 
   {  
   	Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println(" driver Loaded");
		Connection con =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
		System.out.println("Connect to database");
		PreparedStatement ps=con.prepareStatement("select * from loan_p");  
	 %>
		
		<caption>Pending Loans:</caption>
		<%
		ResultSet rs=ps.executeQuery(); 
		ResultSetMetaData rsmd=rs.getMetaData();  
		int total=rsmd.getColumnCount();  
		%>
	
		<%
			int c=0;
		
       	while (rs.next()) 
      	 {  %>
   <tbody>   
  <tr class="active-row">
<td><input type="text" name="uname" value="<%=rs.getString("uname")%>"></td>
<td><input type="text" name="loan" value="<%=rs.getString("lona")%>"></td>
<td><input type="text" name="amount" value="<%=rs.getInt("amount")%>"></td>
<td><input type="text" name="years" value="<%=rs.getString("years")%>"></td>
<td><input type="submit" name="Submit" value="Approve" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
</tr>
</tbody>
<% 
       	c++;
       } 
       if(c==0)
       {%>
       		<caption>No pending Loans</caption>
       	<% 
       }%>
       
   <% 
   }catch (Exception e2)
    {
        //e2.printStackTrace();
    }  
   
   finally
   {
       out.close();
   }  
%>
</table>
</div>
</form>
</body>
</html>