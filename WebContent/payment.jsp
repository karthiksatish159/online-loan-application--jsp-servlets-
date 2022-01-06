<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
</script>
<script type="text/javascript">
function checkform(l)
{
		
		var msg=f1.uname.value;
		var mail=f1.mail.value;
		var loan=f1.loan.value;
		var amt=f1.amount.value;
		var card=f1.cardname.value;
		var cardn=f1.cardnumber.value;
		var mn=f1.expmonth.value;
		var yy=f1.expyear.value;
		var cvv=f1.cvv.value;
		if(msg=="")
			{

				window.alert("Enter the username")
				return false;
			}
		else if(msg!=l)
		{
			window.alert("Not valid username")
			return false;
		}
		else if(mail=="")
			{
			window.alert("Enter  Email")
			return false;
			}
		else if(loan=="")
			{
			window.alert("select loan")
			return false;
			}
		else if(amt=="")
			{
			window.alert("Enter the amount ");
			return false;
			}
		else if(card=="")
			{
			window.alert("Please enter the card name sir");
			return false;
			}
		else if(cardn=="")
		{
		window.alert("Please enter the card number sir");
		return false;
		}
		else if(mn=="")
		{
		window.alert("Please enter the month name");
		return false;
		}
		else if(yy=="")
		{
		window.alert("Please enter the year");
		return false;
		}
		else if(cvv=="")
		{
		window.alert("Please enter CVV number");
		return false;
		}
		else
			{
			return true;
			}
		
	
		
}
</script>
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
/* Navbar */
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #04AA6D;
}
</style>



</head>
<body>
     
              <ul>
  <li><a class="active" href="index.html">Home</a></li>
  <li><a class="active" href="loginui.jsp">Back</a></li>
  <li><a class="active" href="about.html">About</a></li>
</ul>
     


<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="payment" method="post" name="f1">
       <%! public static String name,k; %>
     		<%String name = (String)session.getAttribute("uname"); %>
     		<%k=name; %>
     		<%
     	
     			session.setAttribute("k",k);
    			
		%>
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Username Name</label>
            <input type="text" id="fname" name="uname" placeholder="karthik .T">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="mail" placeholder="karthik@example.com">
        <div class="form-group">
<label for="sel1">Select type of Loan</label>
<select name="loan" class="form-control" id="sel1">
<option value hidden>Types Loans</option>
<option>Gold Loan</option>
<option>Home Loan</option>
<option>Auto Loan</option>
<option>Instruction Loan</option>
</select>
</div>
            <label for="city"><i class=" fa fa-inr"></i> Amount</label>
            <input type="number" id="city" name="amount" placeholder="10000">

           
          </div>

          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="WESTERN INSTA CARD">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="August">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2021">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="123">
              </div>
            </div>
          </div>
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Remember
        </label>
        <input type="submit" value="Pay" class="btn"  onclick="return checkform('<%=name%>')">
      </form>
    </div>
  </div>
  
</div>

</body>
</html>
    