package bank;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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
 * Servlet implementation class Register1Servlet
 */
@WebServlet("/Register1servlet")
public class Register1servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register1servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String fna = request.getParameter("fna");
		String lna = request.getParameter("lna");
		String uname = request.getParameter("uname");
		String mail= request.getParameter("mail");
		String pword = request.getParameter("pword");
		String pcword = request.getParameter("pcword");
		String ph = request.getParameter("ph");
		String date1 =request.getParameter("date");
		
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println(" driver Loaded");
			Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			System.out.println("Connect to database");
			Statement st=conn.createStatement();
			String strQuery = "SELECT COUNT(*) FROM bank_loan where uname='"+uname+"' or mail='"+mail+"' or ph='"+ph+"'";
			//String sql = "insert into bank_loan values(?,?,?,?,?,?,?)";
			//PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(strQuery);
			/*pstmt.setString(1,f);
			pstmt.setString(2, l);
			pstmt.setString(3, uname);
			pstmt.setString(4, mail);
			pstmt.setString(5, pass);
			pstmt.setString(6, cpass);
			pstmt.setString(7, p);
			int rs1 = pstmt.executeUpdate();*/
			rs.next();
			String Countrow = rs.getString(1); 	
			 if(Countrow.equals("0"))
			 {
				 int i=st.executeUpdate("insert into bank_loan(fna,lna,uname,mail,pword,pcword,ph,date1)values('"+fna+"','"+lna+"','"+uname+"','"+mail+"','"+pword+"','"+pcword+"','"+ph+"','"+date1+"')");
				 RequestDispatcher rd = request.getRequestDispatcher("reg_success.html");
				 rd.forward(request, response);
			 }
			 else
			 {
				 RequestDispatcher rd = request.getRequestDispatcher("r_fail.html");
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
