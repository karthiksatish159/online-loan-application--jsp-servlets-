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

    <div class="wrapper">
        <!-- Navigation -->
        <nav>
            <ul>
                <div class="nav-logo">
                    <li><a href="index.html" class="logo">Western Bank</a></li>
                </div>
                <div class="nav-menu">
                    <li><a href="index.html">Log Out</a></li>
                </div>
            </ul>
            <ul class="toggle">
                <div class="nav-toggle">
                    <ul>
                        <li><a href="index.html">Log Out</a></li>
                    </ul>
                </div>
            </ul>
        </nav>
        <!--userprofile begins here-->
        <div id="main" class="profildiv">
            <div class="one-third center">
                <div>
                    <div id="profile-image" class="center">
                        <img class="photo center" src="https://st2.depositphotos.com/1502311/12020/v/600/depositphotos_120206860-stock-illustration-profile-picture-vector.jpg" alt="user">
                    </div>
                    <div id="name" class="myprofil">
                        
    
      
     		<%! public static String name; %>
     		<%String name = (String)request.getAttribute("uname"); %>
     		<%= name %>
     		
             		
             			
                     
                       
                    </div>
                </div>

            </div>

            <div class="two-thirds">
                <div>
                  

                    <span class="notify"><i class="fas fa-bell icon"></i></span>


                </div>
                <div class="two-thirds">
                    <div>

                        <div class="row userpanel">
                            <div id="apply-loan" class="paneluser activerUserPanel">
                                <div class="form-container loan">
                                    <form action="Loan" method="post" name="f1">
                                    		<div class="input-container">
                                            <i class="fas fa-business-time icon"></i>
                                            <input type="text" class="input-field" placeholder="username"  name="uname">
                                        	</div> 
                                        	<div class="input-container">
                                            <i class="fas fa-wallet icon"></i>
                                           
										<select name="loan" class="input-field" required>
										<option value hidden>Types of loans</option>
										<option value="Home Loan">Home Loan</option>
										<option value="Gold Loan">Gold Loan</option>
										<option value="Auto Loan">Auto Loan</option>
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
                                        <input type="submit" value="login" class="btn-form"  onclick="return checkform('<%=name%>')"></input>
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