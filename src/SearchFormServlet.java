import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchFormServlet extends HttpServlet {
//	String MySQL_Classname = "com.mysql.jdbc.Driver";
//	String MySQL_url = "jdbc:mysql://localhost:3306/epproject";
//	String MySQL_username = "ep";
//	String MySQL_password = "ep";
	
	String Classname = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "ep";
	String password = "ep";
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String searchElement = req.getParameter("search");
		
		try {
			Connection con = null;
			Class.forName(Classname);
			con = DriverManager.getConnection(url, username, password);
			Date d = new Date();
			int year = 1900+d.getYear();
			PreparedStatement pstmt = con.prepareStatement("select * from festdetails where name=? and year=?");
			pstmt.setString(1, searchElement);
			pstmt.setInt(2, year);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				out.println("<h1>Fest name: " + rs.getString(1)+"</h1><br>");
				out.println("<h1>FestDescription: "+ rs.getString(2)+"</h1><br>");
				out.println("<h1>Fest Year: "+ rs.getString(3)+"</h1><br>");
			}
			else {
				RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
				out.println("<script>alert('No Fests With Festname: "+searchElement+"')</script>");
				rd.include(req, res);
			}
			
		}
		catch(Exception e) {
			res.sendRedirect("main.jsp");
		}
	}
}
