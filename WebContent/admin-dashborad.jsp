<%@ page import="java.sql.*,javax.servlet.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="../img/loan.png" sizes="16x16" type="image/png">
    <link href="Astyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body class="admin-body">
<%@ include file="header2.html" %>
    <div class="wrapper wrapper-admin">
        <!-- Navigation -->
     	
        <div class="admin-header">

        </div>
        <div class="admin-content">
            <div class="sidebar">
                <ul class="list">
                    <li data-target="#verify"><i class="fas fa-user-check" class="active"></i>Loan Approval</li>
                    <li data-target="#apply"><i class="fas fa-hand-holding-usd"></i>Loan Paid</li>
                    <li data-target="#current"><i class="fas fa-spinner"></i>Check transactions</li>
                    <li data-target="#singleLoan"><i class="fas fa-hand-holding-usd"></i>View Single Loan</li>
                    <li data-target="#repay"><i class="fas fa-money-bill-wave"></i>Post Loan Repayment</li>
                     <li data-target="#approval"><i class="fas fa-check-double"></i>Bank-info</li>
                </ul>
            </div>
            
            <div class="inner-content">
                <div class="panel active" id="verify">
                    <div class="caption">Users Application</div>
                       <form  action="LoanA.jsp" method="post">
                               			<input type="submit" value="Loan approval">
                            		</form>
                    <div id="table">
                        <div class="header-row row">      
                        </div>
                    </div>
                </div>
              
                <form action="loan3.jsp" method="post">
                <div class="panel" id="apply">
                    <div class="pagination">
                        <div class="caption">Loan Applications</div>
                        <div id="table">
                            <div class="header-row row">
                             <input type="submit" style="background-color:black;color:white;width:250px;height:40px;" value="check Loan paid transations" >
                            </div>   
                        </div>
                    </div>
                </div>
                </form>
                <form action="loan2.jsp" method="post">
                <div class="panel" id="current">
                    <div class="pagination">
                        <div class="caption">
                        <ul class="current-repaid">
                        </ul>
                        </div>
                        <div id="table">
                       <input type="submit" style="background-color:black;color:white;width:150px;height:40px;" value="check transations" >
                        <br>
                        <br>
                        </div>
                    </div>
                </div>
                </form>
                <div class="panel" id="singleLoan">
                    <div class="form-container loan-input">
                        <form class="loan" action="Users.jsp" method="post">
                            <div class="input-container">
                                <i class="fas fa-wallet icon"></i>
                                <input type="text" class="input-field" placeholder="Username" name="uname">
                            </div>
                            <button type="submit" value="login" class="btn-form">View Loan</button>
                        </form>
                    </div>
                    <div class="page">
                        <table class="layout display responsive-table">      
                        </table>
                    </div>
                </div>
                <form>
                <div class="panel" id="approval">
                    <div class="pagination">
                        <div class="pagination-content">
                            <div class="caption">Bank-info</div>
                              
                            
                        </div>
                     
                    </div>
                     
                    <div class="panel" id="repaid">
                        <div class="pagination">
                            <div class="caption">Repaid Loans</div>
                            <div id="table">
                                <div class="header-row row">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 </form>
                <div class="panel" id="repay">
                    <div class="form-container loan">
                        <form action="update.jsp" method="post">
                            <div class="input-container">
                                <i class="fas fa-wallet icon"></i>
                                <input type="text" class="input-field" name="uname" placeholder="Username">
                            </div>
                            <div class="input-container">
                                <i class="fas fa-business-time icon"></i>
                                <input type="numder" class="input-field" name="amount" placeholder="Amount">
                            </div>
                         <div class="input-container">
                                        <i class="fas fa-wallet icon"></i> 
										<select name="loan"  class="input-field" required>
										<option value hidden>Types of loans</option>
										<option value="Home Loan">Home Loan</option>
										<option value="Gold Loan">Gold Loan</option>
										<option value="Auto Loan">Auto Loan</option>
										<option value="Instruction Loan">Instruction Loan</option></select>
                                        </div>
                            <button type="submit" class="btn-form">PAY</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="hover_popup">
                <span class="helper"></span>
                <div>
                    <div class="popupCloseButton">X</div>
                    <section class="content">
                        <div class="compose-box1 compose-container">
                            <div action="" class="boxx">
                                <section id="admin-dashboard-section">
                                    <!-- <section class ="accounts"> -->
                                    <article class="account-details">
                                        <div class="clientloanss">  
                                        </div>
                                    </article>
                                    <!-- </section> -->
                                </section>
                            </div>
                    </section>
                </div>
            </div>
        </div>
        <div class="hover_popup loan_hover_popup">
            <span class="helper"></span>
            <div>
                <div class="popupCloseButton loan_popupCloseButton">X</div>
                <section class="content">
                    <div class="compose-box1 compose-container">
                        <div action="" class="boxx">

                            <section id="admin-dashboard-section">
                                <!-- <section class ="accounts"> -->
                                <article class="account-details">
                                    <h1>Loan Application</h1>
                                    <div class="clientloanss"> 
                                        </article>
                                    </div>
                                </article>
                                <!-- </section> -->
                            </section>
                        </div>
                </section>
            </div>
        </div>
        <div class="hover_popup loanapprove_hover_popup">
                <span class="helper"></span>
                <div>
                    <div class="popupCloseButton loanapprove_popupCloseButton">X</div>
                    <section class="content">
                        <div class="compose-box1 compose-container">
                            <div action="" class="boxx">
                                <section id="admin-dashboard-section">
                                    <!-- <section class ="accounts"> -->
                                    <article class="account-details">
                                        <h1>Loan Approval</h1>
                                        <div class="clientloanss">    
                                        </div>
                                    </article>
                                    <!-- </section> -->
                                </section>
                            </div>
                    </section>
                </div>
          </div>
    </div>
    <footer class="admin-footer">
        <p>Western Bank &copy; 2021</p>
        <script src="script2.js"></script>
    </footer>
    </div>
</body>
</html>