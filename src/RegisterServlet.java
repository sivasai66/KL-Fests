import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
//		String MySQL_Classname = "com.mysql.jdbc.Driver";
//		String MySQL_url = "jdbc:mysql://localhost:3306/epproject";
//		String MySQL_username = "ep";
//		String MySQL_password = "ep";
		
		String Classname = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String username = "ep";
		String password = "ep";
				
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		
		try {
			Connection con = null;
			Class.forName(Classname);
			con = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = con.prepareStatement("insert into users values(?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, pwd);
			int n = pstmt.executeUpdate();
			PrintWriter out = res.getWriter();
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            if(n > 0) {
            	rd.include(req, res);
            	out.println("<script>alert('Registered Succesfully')</script>");
              res.sendRedirect("login.jsp");
            }
            else {
            	rd.include(req, res);
            	out.println("<script>alert('Error In Registration Try Again')</script>");
            }
		}
		catch(Exception e) {
			PrintWriter out = res.getWriter();
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.include(req, res);
        	out.println("<script>alert('Error In Registration Try Again')</script>");
		}
	}
}