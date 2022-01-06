<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE  html>
<html lang="en">

<head>
    <title>redirect</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="../img/loan.png" sizes="16x16" type="image/png">
    <link href="Astyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body >
<%@ include file="header2.html" %>
    <div class="form-container signin redirect">
        <form action="user.jsp" method="post">
        <%! public static String name,k; %>
     		<%String name = (String)session.getAttribute("uname"); %>
     		<%k=name; %>
     		<%
     	
     			session.setAttribute("k",k);
    			
     		%>
     		<br><br>
            <input type="submit" style="background-color:white;color:black;width:150px;height:40px;" value="Apply  loan" ><br><br>
        </form>
        <form action="payment.jsp">
         <input type="submit" style="background-color:white;color:black;width:150px;height:40px;" value="pay loan" ><br><br>
        </form>
        <form action="check.jsp">
         <input type="submit" style="background-color:white;color:black;width:150px;height:40px;" value="CheckStatus" ><br><br>
        </form>
        
    </div>
    <footer>
        <p>Western bank &copy; 2021</p>
    </footer>
    </div>

    <body>

    </body>

</html>