package bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoanA
 */
@WebServlet("/LoanA")
public class LoanA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoanA() {
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
		 response.setContentType("text/html");  
	      PrintWriter out = response.getWriter();
	      out.println("<head>");
	        out.println("<meta charset=\"utf-8\">");  
	       
	        out.println("<style>");     
	     
	        out.println("table {");       
	        out.println("border-collapse: collapse;");
	        out.println(" width: 100%;");
	        out.println("}");   
	        out.println("th,td {");       
	        out.println("text-align: left;");
	        out.println(" padding: 8px;");
	        out.println("}"); 
	        out.println("tr:nth-child(even) {");       
	        out.println("background-color: #f2f2f2;");
	        out.println("}"); 
	        out.println("th {");       
	        out.println("background-color: #4CAF50;");
	        out.println("color: white;");
	        out.println("}"); 
	       
	        out.println("</style>");  
	        out.println("</head>");
	        out.println("<body bgcolor='lightblue'>");

	        try 
	        {  
	        	Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println(" driver Loaded");
				Connection con =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
				System.out.println("Connect to database");
				PreparedStatement ps=con.prepareStatement("select * from loan_p");  
			 
				out.print("<table width=50% border=1>");  
				out.print("<caption>Result:</caption>"); 
				ResultSet rs=ps.executeQuery(); 
				ResultSetMetaData rsmd=rs.getMetaData();  
				int total=rsmd.getColumnCount();  
				out.print("<tr>");
				for(int i=1;i<=total;i++)  
				{  
				out.print("<th>"+rsmd.getColumnName(i)+"</th>");  
				}  
				out.print("</tr>");
				int c=0;
				
	            while (rs.next()) 
	            {  
	            	out.print("<form action='Loan1.jsp' method='post'>");
	            	out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+" </td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td><input type='submit'></td></tr>");
	            	out.print("</form>");
	            	c++;
	            } 
	            if(c==0)
	            {
	            	out.println("<h1>Username doesnot exit</h1>");
	            }
	            out.println("</table>");  
	           
	        }catch (Exception e2)
	         {
	             e2.printStackTrace();
	         }  
	        
	        finally
	        {
	            out.close();
	        }  
	          
	}

}
