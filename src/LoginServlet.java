import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
//	String MySQL_Classname = "com.mysql.jdbc.Driver";
//	String MySQL_url = "jdbc:mysql://localhost:3306/epproject";
//	String MySQL_username = "root";
//	String MySQL_password = "abhinav";
	
	String Classname = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "ep";
	String password = "ep";
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		try {
			Connection con = null;
			Class.forName(Classname);
			con = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = con.prepareStatement("select * from users where email=? and  password=?");
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			HttpSession session=req.getSession();
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
              session.setAttribute("email", email);
              session.setAttribute("role", "user");
              session.setAttribute("name", rs.getString(1));
              con.close();
              res.sendRedirect("main.jsp");
            }
            else {
            	con.close();
              res.sendRedirect("login.jsp");
            }
		}
		catch(Exception e) {
			res.sendRedirect("login.jsp");
		}
	}
}