<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

table {
  border-spacing: 1;
  border-collapse: collapse;
  background: white;
  border-radius: 6px;
  overflow: hidden;
  max-width: 800px;
  width: 100%;
  margin: 0 auto;
  position: relative;
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
table * {
  position: relative;
}
table td, table th {
  padding-left: 8px;
}
table thead tr {
  height: 60px;
  background: #FFED86;
  font-size: 16px;
}
table tbody tr {
  height: 48px;
  border-bottom: 1px solid #E3F1D5;
}
table tbody tr:last-child {
  border: 0;
}
table td, table th {
  text-align: left;
}
table td.l, table th.l {
  text-align: right;
}
table td.c, table th.c {
  text-align: center;
}
table td.r, table th.r {
  text-align: center;
}

@media screen and (max-width: 35.5em) {
  table {
    display: block;
  }
  table > *, table tr, table td, table th {
    display: block;
  }
  table thead {
    display: none;
  }
  table tbody tr {
    height: auto;
    padding: 8px 0;
  }
  table tbody tr td {
    padding-left: 45%;
    margin-bottom: 12px;
  }
  table tbody tr td:last-child {
    margin-bottom: 0;
  }
  table tbody tr td:before {
    position: absolute;
    font-weight: 700;
    width: 40%;
    left: 10px;
    top: 0;
  }
  table tbody tr td:nth-child(1):before {
    content: "Code";
  }
  table tbody tr td:nth-child(2):before {
    content: "Stock";
  }
  table tbody tr td:nth-child(3):before {
    content: "Cap";
  }
  table tbody tr td:nth-child(4):before {
    content: "Inch";
  }
  table tbody tr td:nth-child(5):before {
    content: "Box Type";
  }
}
body {
  background: #9BC86A;
  font: 400 14px 'Calibri','Arial';
  padding: 20px;
}

blockquote {
  color: white;
  text-align: center;
}

</style>
</head>
<body>

<table>
<thead>
<tr>
    <th>Username</th>
    <th>loan</th>
    <th>amount</th>
    <th>years</th>
   
    
</tr>
</thead>
<%
	String uname=request.getParameter("uname");
   try 
   {  
   	Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println(" driver Loaded");
		Connection con =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
		System.out.println("Connect to database");
		PreparedStatement ps=con.prepareStatement("select * from loan_d where uname=?"); 
		ps.setString(1, uname);
	 %>
		
		<caption><%=uname %> Loans:</caption>
		<%
		ResultSet rs=ps.executeQuery();  
		%>
	
		<%
			int c=0;
		
       	while (rs.next()) 
      	 {  %>
   <tbody>   
  <tr>
<td><input type="text" name="uname" value="<%=rs.getString(1)%>"></td>
<td><input type="text" name="loan" value="<%=rs.getString(2)%>"></td>
<td><input type="text" name="amount" value="<%=rs.getString(3)%>"></td>
<td><input type="text" name="years" value="<%=rs.getString(4)%>"></td>
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
</body>
</html>