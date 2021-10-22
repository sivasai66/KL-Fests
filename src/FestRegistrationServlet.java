import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/registerFest")
public class FestRegistrationServlet extends HttpServlet {
//	String MySQL_Classname = "com.mysql.jdbc.Driver";
//	String MySQL_url = "jdbc:mysql://localhost:3306/epproject";
//	String MySQL_username = "ep";
//	String MySQL_password = "ep";
	
	String Classname = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "ep";
	String password = "ep";
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String festname = req.getParameter("festname");
		HttpSession session=req.getSession();
		String email = (String)session.getAttribute("email");
		String mob = req.getParameter("mob");
		Date d = new Date();
		int year = 1900+d.getYear();
		
		try {
			Connection con = null;
			Class.forName(Classname);
			con = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt1 = con.prepareStatement("insert into festsregistered values(?,?,?,?)");
			PreparedStatement pstmt2 = con.prepareStatement("select * from festsregistered where festname=? and email=? and year=?");
			pstmt1.setString(1, festname);
			pstmt2.setString(1, festname);

			pstmt1.setString(2, email);
			pstmt2.setString(2, email);
			
			pstmt1.setString(3, mob);
			
			pstmt1.setInt(4, year);
			pstmt2.setInt(3, year);
			
			ResultSet rs = pstmt2.executeQuery();
			RequestDispatcher rd = req.getRequestDispatcher("fest.jsp");
			rd.include(req,res);
			PrintWriter out = res.getWriter();
			if(!rs.next()) {
				int n = pstmt1.executeUpdate();
				if(n > 0) {
					out.println("<script>alert('Fest Registered Successfully')</script>");
				}
				else {
					out.println("<script>alert('Fest Registration Failed')</script>");
				}
			}
			else {
				String FestName = festname.substring(0, 1).toUpperCase() + festname.substring(1);
				out.println("<script>alert('Already Registered For "+ FestName +" Fest')</script>");
			}
		}
		catch(Exception e) {
			PrintWriter out = res.getWriter();
			out.println(e);
		}
	}
}
