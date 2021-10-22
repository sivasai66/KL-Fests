<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
      </div>
    </section>
    <script type="text/javascript">
      </script>
  </body>
</html>
