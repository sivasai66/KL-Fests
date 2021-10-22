import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/adminLogin")
public class LoginAdminServlet extends HttpServlet {
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
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		
		try {
			Connection con = null;
			Class.forName(Classname);
			con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement pstmt = con.prepareStatement("select * from admins where email=? and password=?");
			
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			
			HttpSession session = req.getSession();
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
              session.setAttribute("email", email);
              session.setAttribute("role", "admin");
              session.setAttribute("name", rs.getString(1));
              res.sendRedirect("main.jsp");
            }
            else {
              res.sendRedirect("admin.jsp");
            }
		}
		catch(Exception e) {
			res.sendRedirect("admin.jsp");
		}
	}
}