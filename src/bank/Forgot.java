package bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Forgot
 */
@WebServlet("/Forgot")
public class Forgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forgot() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pword");
		
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println(" driver Loaded");
			Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			System.out.println("Connect to database");
			String sql = "update bank_loan set pword=? where uname=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(2,uname);
			pstmt.setString(1, pass);
			
			ResultSet rs = pstmt.executeQuery();
			 if(rs.next())
			 {
				 RequestDispatcher rd = request.getRequestDispatcher("p_success.html");
				 rd.forward(request, response);
			 }
			 else
			 {
				 
				 RequestDispatcher rd = request.getRequestDispatcher("l_fail.html");
				 rd.forward(request, response);
			 }
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			RequestDispatcher rd = request.getRequestDispatcher("l_fail.html");
			 rd.forward(request, response);
			
		}
	
	}

}
