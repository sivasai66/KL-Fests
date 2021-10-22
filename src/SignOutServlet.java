import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/signout")
public class SignOutServlet extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession();
		session.removeAttribute("email");
		session.removeAttribute("role");
        session.removeAttribute("name");
		session.invalidate();
		res.sendRedirect("main.jsp");
	}
}