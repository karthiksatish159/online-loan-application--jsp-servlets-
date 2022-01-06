package bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoanP
 */
@WebServlet("/LoanP")
public class LoanP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoanP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String uname = request.getParameter("uname");
		String loan = request.getParameter("loan");
		String amount = request.getParameter("amount");
		String years = request.getParameter("years");
		System.out.println(uname+" "+loan+" "+amount);
		 PrintWriter out = response.getWriter();
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println(" driver Loaded");
			Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			System.out.println("Connect to database");
			Statement st=conn.createStatement();
			Statement st1=conn.createStatement();
			Statement st2=conn.createStatement();
			String strQuery = "SELECT COUNT(*) FROM bank_loan where uname='"+uname+"'";
			String strQuery1 = "SELECT COUNT(*) FROM loan_p where uname='"+uname+"' and lona='"+loan+"'";
			String strQuery2 = "SELECT COUNT(*) FROM loan_d where uname='"+uname+"' and loan='"+loan+"'";
			String sql = "insert into loan_p values('"+uname+"','"+loan+"','"+amount+"','"+years+"','"+"pending"+"')";
			
			PreparedStatement psmt=conn.prepareStatement(sql);
			
			ResultSet rs = st.executeQuery(strQuery);
			
			ResultSet rs2 = st1.executeQuery(strQuery1);
			ResultSet rs3 = st2.executeQuery(strQuery2);
			rs.next();
			rs2.next();
			rs3.next();
			String Countrow = rs.getString(1); 	
			String Countrow1 = rs2.getString(1); 
			String Countrow2 = rs3.getString(1);
			System.out.println(Countrow+" "+Countrow1+" "+Countrow2);
			System.out.println("Out");
			 if(Countrow.equals("1") && Countrow2.equals("0") && Countrow1.equals("0") )
			 {
				 System.out.println("in");
				 
				 int rs1 = psmt.executeUpdate();
				 
				 if(rs1>0)
				 {
					 System.out.println("into");
					 out.println("<h1>Sir your loan request is sent to manager he will check and approve the loan until you can check the status sir</h1><a href='index.html'>Logout</a>");
				 }
				 
				
			 }
			 else if(Countrow.equals("0"))
			 {
				 RequestDispatcher rd = request.getRequestDispatcher("loan1.html");
				 rd.forward(request, response);
			 }
			 else if(Countrow2.equals("0"))
			 {
				 out.println("<h1>Sir you already having the loan it is on due after clearing that respected loan you get an opportunity to apply agian this loan sir</h1><br><br><a href='index.html'>Logout</a>");
			 }
			 else if(Countrow1.equals("0"))
			 {
				 out.println("<h1>Sir you already having the loan pending sir after checking the admin if it is rejiected then agian you can sir</h1><br><br><a href='index.html'>Logout</a>");
			 }
			 else
			 {
				 RequestDispatcher rd = request.getRequestDispatcher("loan_fail.html");
				 rd.forward(request, response);
			 }
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}

}
