<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: #beb7a4;
  background-image: url('https://cdn.indialends.com/blog/Images/Personal-Loans-from-Public-Banks-vs1200x500.png');
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 20px;
  text-align: center;
  background-color: #f1f1f1;
}
.dialog {
  background-color: #cecece;
  border: 1px solid #000;
  padding: 1%;
  font-family: 'Segoe UI';
  text-align: center;
}
</style>
   
      
</head>
<body>

<%@ include file="header3.html" %>
<h2 style="color:white">Bank Loans</h2>
<p style="color:white">Types of loans</p>

<div class="row">
<form action="gold.jsp" method="post" >

<%! public static String name,k; %>
     		<%String name = (String)session.getAttribute("k"); %>
     		<%k=name; %>
     		<%
     	
     			session.setAttribute("k",k);
    			
     		%>
     		
     		
  <div class="column">

<img src="https://i.pinimg.com/236x/f7/df/9f/f7df9f1d1fae088dc3071bff928317ef--loan-interest-rates-apply-for.jpg" alt="Avatar" style="width:100%">
    <div class="card">
      <h3>Gold Loan</h3>
      <p>
<input type="submit" value="click">
	</p>
   
    </div>
  </div>
</form>
<form action="home.jsp" method="post" >
<%! public static String name1,k1; %>
     		<%String name1 = (String)session.getAttribute("uname"); %>
     		<%k1=name; %>
			<%
     	
     			session.setAttribute("k",k1);
    			
     		%>
  <div class="column">
<img src="https://www.forbes.com/advisor/wp-content/uploads/2020/06/86-scaled-e1590736170494.jpg" alt="Avatar" style="width:100%">
    <div class="card">
      <h3>Home Loan</h3>
      <p><input type="submit" value="click"></p>
    
    </div>
  </div>
 </form>
 <form action="auto.jsp" method="post">
 <%! public static String name2,k2; %>
     		<%String name2 = (String)session.getAttribute("uname"); %>
     		<%k2=name2; %>
			<%
     	
     			session.setAttribute("k",k2);
    			
     		%>
  <div class="column">
<img src="https://images.financialexpress.com/2019/06/car-loan.jpg" alt="Avatar" style="width:100%">
    <div class="card">
      <h3>Auto Loan</h3>
      <p><input type="submit" value="click"></p>
      
    </div>
  </div>
  </form>
 <form action="instruction.jsp" method="post">
  <%! public static String name3,k3; %>
     		<%String name3 = (String)session.getAttribute("uname"); %>
     		<%k3=name3; %>
			<%
     	
     			session.setAttribute("k",k3);
    			
     		%>
  <div class="column">
<img src="https://images.livemint.com/img/2020/06/10/600x338/Loan_1589734291931_1589734292197_1591774840389.jpg" alt="Avatar" style="width:100%">
    <div class="card">
      <h3>Instruction Loan</h3>
      <p><input type="submit" value="click"></p>
      
    </div>
  </div>
 </form>
</div>

</body>
</html>
