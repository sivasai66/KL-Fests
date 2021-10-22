<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*, java.util.Date, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./fest.css" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
      crossorigin="anonymous"
    />
    <title>KLU Fests</title>
  </head>
  <body>
    <header>
      <a href="./main.html" class="logo"
        ><img src="./images/logo2.png" alt="KL Fests"
      /></a>
      <ul class="mynav">
        <li class="li">
          <a href="./main.jsp">Home</a>
        </li>
        <li class="li"><a href="#">Fest Registration</a></li>
        <li class="li"><a href="./team.jsp">Our Team</a></li>
        <% if(session.getAttribute("email") == null) {
        	%>
	        <li class="li" id="login">
	          <a href="./login.jsp">Log in</a>
	        </li>
	        <li class="li" id="signup">
	          <a href="./register.jsp" action="logout">Sign Up</a>
	        </li>
        <%
        response.sendRedirect("login.jsp");
        }
        else {
        	%>
        
        <li class="li" id="account">
          <a href="#"
            >Account
            <span class="border">|</span>
            <i
              onclick="menutoggle()"
              class="fa fa-caret-down fa-lg angle"
              aria-hidden="true"
            ></i>
          </a>
          <div class="account-dropdown" id="">
            <ul>
              <li>
                <a href=""> <i class="fa fa-user"></i> Profile </a>
              </li>
              <li>
                <a href=""> <i class="fa fa-gear"></i> Settings </a>
              </li>
              <li>
                <span onclick="window.location.href='signout'" >
                  <i class="fa fa-sign-out"></i> Sign Out
                </span>
              </li>
            </ul>
          </div>
        </li>
        <% 
              }
              %>
      </ul>
    </header>
    <!-- Fest Registration Form Starts Starts -->
    <section class="loginForm">
      <div class="logBox">
        <h3 class="logTitle">We're Happy To invite You</h3>
        <br />
        <form
          method="post"
          action="registerFest"
          onsubmit="return festValidate()"
          name="log"
          class="logForm"
        >
          <label for="festname">Fest Name<span class="req">*</span></label>
          <select name="festname" id="fest">
          	  <option value="">Select</option>
          	  <%
		          	/*String MySQL_Classname = "com.mysql.jdbc.Driver";
		          	String MySQL_url = "jdbc:mysql://localhost:3306/epproject";
		          	String MySQL_username = "ep";
		          	String MySQL_password = "ep";*/
		          	String Classname = "oracle.jdbc.driver.OracleDriver";
		        	String url = "jdbc:oracle:thin:@localhost:1521:XE";
		        	String username = "ep";
		        	String password = "ep";
          	  		Connection con = null;
	        		Class.forName(Classname);
	        		con = DriverManager.getConnection(url, username, password);
				    PreparedStatement searchstmt = con.prepareStatement("select * from festdetails2");
					ResultSet searchSet = searchstmt.executeQuery();
					while(searchSet.next())
					{
					 %>
					 <option value="<%=searchSet.getString("name")%>"><%=searchSet.getString("name")%></option>
					 <%
					}
					con.close();
				 %>
		  </select>
          <!-- <label for="tokens">Number Of Tokens<span class="req">*</span></label>
          <input
            type="number"
            name="tickets"
            id="tokens"
            placeholder="Number Of Tokens"
            required="required"
          />-->
          
          <label for="mob">Mobile Number<span class="req">*</span></label>
          <input
            type="number"
            name="mob"
            id="mob"
            placeholder="Enter Mobile Number"
            required="required"
          />
          <div class="submitbtn">
            <input type="submit" value="Register" />
          </div>
        </form>
      </div>
    </section>
    <script type="text/javascript">
			
		/* ------------------------------- Menu Toggle Start ------------------------------- */
		
		function menutoggle() {
		  try {
		    const togglemenu = document.querySelector(".account-dropdown");
		    togglemenu.classList.toggle("active");
		  } catch (error) {
		    console.log(error);
		  }
		}
		
		/* ------------------------------- Menu Toggle End ------------------------------- */
		function festValidate() {
			var festname = document.getElementById("fest").value;
			var mob = document.getElementById("mob").value;
			if(festname != "" &&  mob.length == 10) {
				//console.log("yes");
				return true;
			}
			else if(festname == "") {
				alert("Select Fest Name");
			}
			else {
				alert("Enter Valid Mobile Number");
			}
			return false;
		}
		
      </script>
  </body>
</html>
