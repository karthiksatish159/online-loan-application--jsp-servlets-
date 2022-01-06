<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
<script type="text/javascript">
function count(n)
{
	if(n>100)
		{
			return true;
		}
	else
		{
			return false;
		}
}
function checkform(l)
{
	
	var msg = document.forms["f1"]["uname"].value;
	var am =document.forms["f1"]["amount"].value
	var yy =document.forms["f1"]["years"].value
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
		
		else if(am=="")
			{
			window.alert("Please enter amount")
			return false;
			}
		else if(yy=="")
			{
				window.alert("Please the no of years")
				return false;
			}
		else if(count(yy))
			{
			window.alert("No of years must be 0 to 100")
			return false;
			}
}
</script>
    <title>User Dashboard</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="‪C:\Users\ACER\OneDrive\Desktop\quickcreditapp\UI\img\images.jpg" sizes="16x16" ">
    <link href="Astyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
<%@ include file="header6.html" %>
    
        <!--userprofile begins here-->
        <div id="main" class="profildiv">
            <div class="one-third center">
                <div>
                    <div id="profile-image" class="center">
                        <img class="photo center" src="https://st2.depositphotos.com/1502311/12020/v/600/depositphotos_120206860-stock-illustration-profile-picture-vector.jpg" alt="user">
                    </div>
                    <div id="name" class="myprofil">
                        
    
      <%! public static String name; %>
     		<%String name = (String)session.getAttribute("k"); %>
     		<h2>Username:</h2><h3>
     		<%= name %>
     		</h3>
     		
    		<%
     		try{
     		Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println(" driver Loaded");
			Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			System.out.println("Connect to database");
			Statement st=conn.createStatement();
			String sql ="SELECT * FROM bank_loan where uname='"+name+"'";
			ResultSet rs = st.executeQuery(sql);
			while(rs.next())
			{
				%>
				
		
				
			<h2>mailid:</h2><h3><%=rs.getString("mail") %></h3>
			<h2>phonenumber:</h2><h3><%=rs.getString("ph") %></h3>
			
		<% 
		}

} catch (Exception e) {
e.printStackTrace();
}
%>          		
             			
                     
                       
                    </div>
                </div>

            </div>

            <div class="two-thirds">
                <div>
                  

                   <a href="instinfo.html"> <span class="notify"><i class="fas fa-bell icon"></i></span></a>


                </div>
                <div class="two-thirds">
                    <div>

                        <div class="row userpanel">
                            <div id="apply-loan" class="paneluser activerUserPanel">
                                <div class="form-container loan">
                                    <form action="LoanP" method="post" name="f1">
                                    		<div class="input-container">
                                            <i class="fas fa-business-time icon"></i>
                                            <input type="text" class="input-field" placeholder="username"  name="uname">
                                        	</div> 
                                        	<div class="input-container">
                                            <i class="fas fa-wallet icon"></i>
                                           
										<select name="loan" class="input-field" required>
										
							
										<option value="Instruction Loan">Instruction Loan</option>
										</select>
                                        </div>
                                         <div class="input-container">
                                            <i class="fas fa-wallet icon"></i>
                                            <input type="number" class="input-field" placeholder="Amount" name="amount">
                                        </div>
                                        <div class="input-container">
                                            <i class="fas fa-business-time icon"></i>
                                            <input type="number" class="input-field" placeholder="years" name="years">
                                        </div>
                                        <input type="submit" value="apply loan" class="btn-form"  onclick="return checkform('<%=name%>')"></input>
                                    </form>
                                </div>
                            </div>
                            
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <!-- userprofile panel ends here-->

        <footer>
            <p>Western union Bank &copy; 2021</p>
            <script src="script2.js"></script>
        </footer>
    </div>
</body>

</html>