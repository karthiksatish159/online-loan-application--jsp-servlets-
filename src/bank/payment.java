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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class payment
 */
@WebServlet("/payment")
public class payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payment() {
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
		String amount =request.getParameter("amount");
		String lm;
		
		int amt=Integer.parseInt(amount);
		  PrintWriter out = response.getWriter();
		  out.println("<body bgcolor='black'>");
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println(" driver Loaded");
			Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			System.out.println("Connect to database");
			String sql="select * from loan_d where uname=? and loan=?";
			PreparedStatement ps=conn.prepareStatement(sql); 
			Statement st=conn.createStatement();
			ps.setString(1,uname);  
			ps.setString(2,loan);  
			ResultSet rs = ps.executeQuery();
			
			 if(rs.next())
			 {
				
				 lm=rs.getString(3);
				int k=Integer.parseInt(lm);
				int p=k-amt;
				String p1=String.valueOf(p);
					String sql1="update loan_d set amount='"+p+"' where uname='"+uname+"' and loan='"+loan+"'";
					String sql2="delete from loan_d where uname='"+uname+"' and loan='"+loan+"'";
					String sql3="insert into loan_paid values('"+uname+"','"+loan+"','"+"Paid"+"')";
					ResultSet rs1 = st.executeQuery(sql1);
				if(rs1.next() && p>0)
				{
					 HttpSession httpSession = request.getSession();
			            httpSession.setAttribute("p1", p1);
					 
					
			            request.getRequestDispatcher("paysuccess.jsp").forward(request, response);	
				}
				else if(p==0)
				{
					
					ResultSet rs2 = st.executeQuery(sql2);
					if(rs2.next())
					{
						ResultSet rs3 = st.executeQuery(sql3);
						if(rs3.next())
						{	
							out.println("<h1 style='color:yellow'>You succesfully paid your loan</h1><a href='index.html'>Logout</a>");
						}
					}
					
				}
					
				 /*RequestDispatcher rd = request.getRequestDispatcher("p_success.html");
				 rd.forward(request, response);*/
				
			 }
			 else
				{
				 RequestDispatcher rd = request.getRequestDispatcher("l_fail.html");
				 rd.forward(request, response);
					
				}
			
		} 
		
		catch (ClassNotFoundException e) 
		{
			//e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			
			
		}
	
	}

}
