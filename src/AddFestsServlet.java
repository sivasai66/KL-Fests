import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addFests")
public class AddFestsServlet extends HttpServlet {
//	String MySQL_Classname = "com.mysql.jdbc.Driver";
//	String MySQL_url = "jdbc:mysql://localhost:3306/epproject";
//	String MySQL_username = "ep";
//	String MySQL_password = "ep";
	
	String Classname = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "ep";
	String password = "ep";
	
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		try {
			Connection con = null;
			Class.forName(Classname);
			con = DriverManager.getConnection(url, username, password);
			/*
			 FestDetails Table:
			 1. Name
			 2. Picture
			 3. Tagline
			 4. Description
			 5. Year			 
			*/
			String insert = "insert into festdetails values(?,?,?,?,?)";
			String select = "select name, tag, description, year from festdetails where name=? and year=?";
			PreparedStatement pstmt = con.prepareStatement(insert);
			PreparedStatement pstmt2 = con.prepareStatement(select);
			
			String name = req.getParameter("name");
			
			String tag = req.getParameter("tagline");
			String desc = req.getParameter("desc");
			
			//---------------------------------------------------
			
			Date d = new Date();
			int year = 1900+d.getYear();
			
			//------------------------------------------------
			
			pstmt.setString(1, name);
//			pstmt.setBlob(2, null);
			pstmt.setString(3, tag);
			pstmt.setString(4, desc);
			pstmt.setInt(5, year);
			
			pstmt2.setString(1, name);
			pstmt2.setInt(2, year);
			
			ResultSet rs = pstmt2.executeQuery();
			if(!rs.next()) {
				int n = pstmt.executeUpdate();
				if(n > 0) {
					RequestDispatcher rd = req.getRequestDispatcher("addfests.jsp");
					rd.include(req, res);
					out.println("<script>alert('Fest Added Successfully')</script>");
	            }
				else {
					RequestDispatcher rd = req.getRequestDispatcher("addfests.jsp");
					rd.include(req, res);
					out.println("<script>alert('Error Adding The Fest Details')</script>");
	            }
			}
            else {
              RequestDispatcher rd = req.getRequestDispatcher("addfests.jsp");
              rd.include(req, res);
              out.println("<script>alert('Fest Already Added')</script>");
            }
		}
		catch(Exception e) {
			out.println(e);
		}
	}
}
