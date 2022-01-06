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
 * Servlet implementation class Loan
 */
@WebServlet("/Loan")
public class Loan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loan() {
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
		
		 PrintWriter out = response.getWriter();
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println(" driver Loaded");
			Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			System.out.println("Connect to database");
			Statement st=conn.createStatement();
			Statement st1=conn.createStatement();
			String strQuery = "SELECT COUNT(*) FROM bank_loan where uname='"+uname+"'";
			String sql = "SELECT COUNT(*) FROM loan_d where uname=? and loan=?";
			String sql1="select * from loan_p where uname='"+uname+"' and lona='"+loan+"'";
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1, uname);
			psmt.setString(2,loan);
			ResultSet rs = st.executeQuery(strQuery);
			ResultSet rs2=st1.executeQuery(sql1);
			
			rs2.next();
			rs.next();
			String amount=rs2.getString(3);
			String years=rs2.getString(4);
			System.out.println(amount);
			System.out.println(years);
			String Countrow = rs.getString(1); 	
			System.out.println("fldja");
			 if(Countrow.equals("1"))
			 {
				
				 ResultSet rs1 = psmt.executeQuery();
				 rs1.next();
				 String Countrow1 = rs1.getString(1);
			
				 
				 if(Countrow1.equals("0"))
				 {
					 String sql2="delete from loan_p where uname='"+uname+"' and lona='"+loan+"'";
					 st.executeUpdate("insert into loan_d values('"+uname+"','"+loan+"','"+amount+"','"+years+"')");
					 st1.executeUpdate(sql2);
					 if(loan.charAt(0)=='G')
					 {
						 st.executeUpdate("insert into gold values('"+uname+"','"+amount+"','"+years+"')");
					 }
					 else if(loan.charAt(0)=='H')
					 {
						 st.executeUpdate("insert into home values('"+uname+"','"+amount+"','"+years+"')");
					 }
					 else if(loan.charAt(0)=='A')
					 {
						 st.executeUpdate("insert into auto values('"+uname+"','"+amount+"','"+years+"')");
					 }
					 else if(loan.charAt(0)=='I')
					 {
						 st.executeUpdate("insert into inst values('"+uname+"','"+amount+"','"+years+"')");
					 }
					 RequestDispatcher rd = request.getRequestDispatcher("loan_succuess.html");
					 rd.forward(request, response);
				 }
				 else
				 {
					 out.println("<h1>Sir you already having the loan it is on due after clearing that respected loan you get an opportunity to apply agian this loan sir</h1>");
				 }
				 
			 }
			 else if(Countrow.equals("0"))
			 {
				 RequestDispatcher rd = request.getRequestDispatcher("loan1.html");
				 rd.forward(request, response);
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
