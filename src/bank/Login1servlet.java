package bank;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
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
 * Servlet implementation class Login1Servlet
 */
@WebServlet("/Login1servlet")
public class Login1servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login1servlet() {
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
		String pword = request.getParameter("pword");
		 PrintWriter out = response.getWriter(); 
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println(" driver Loaded");
			Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			System.out.println("Connect to database");
			Statement st=conn.createStatement();
			String sql = "select * from bank_loan where uname = ? and pword = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,uname);
			pstmt.setString(2, pword);
			
			ResultSet rs = pstmt.executeQuery();
			 if(rs.next())
			 {
				 int i=st.executeUpdate("insert into login_l(uname,pword)values('"+uname+"','"+pword+"')");
				 HttpSession httpSession = request.getSession();
		            httpSession.setAttribute("uname", uname);
				 
				
		            request.getRequestDispatcher("loginui.jsp").forward(request, response);			 
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
			e.printStackTrace();
		}
	}

}

