<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html><meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./admin.css" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
      crossorigin="anonymous"
    />
    <title>KLU Fests</title>
  </head>
  <body>
  <% if(session.getAttribute("email") != null) {
	  response.sendRedirect("main.jsp");
  }
        	%>
    <header>
      <a href="./main.jsp" class="logo"
        ><img src="./images/logo2.png" alt="KL Fests"
      /></a>
      <ul class="mynav">
        <li class="li">
          <a href="./main.jsp">Home</a>
        </li>
        <li class="li"><a href="./fest.jsp">Fest Registration</a></li>
        <li class="li"><a href="./team.jsp">Our Team</a></li>
        <li class="li" id="login">
          <a href="./login.jsp">Log in</a>
        </li>
        <li class="li" id="signup">
          <a href="./register.jsp">Sign Up</a>
        </li>
      </ul>
    </header>
    <!-- Login Form Starts -->
    <section class="loginForm">
      <div class="logBox">
        <h3 class="logTitle">Good To See You Again Admin</h3>
        <br />
        <form
          action="adminLogin"
          method="post"
          onsubmit="return loginValidate()"
          name="log"
          class="logForm"
        >
          <label for="email">Email Address</label>
          <input
            type="text"
            name="email"
            placeholder="Email Address"
            required="required"
          />
          <label for="pwd">Password</label>
          <input
            type="password"
            name="pwd"
            placeholder="Password"
            required="required"
          />
          <div class="content">
            <div class="links">
              <p class="forgotpwd">
                <a href="./forgot.jsp"
                  ><span>Forgot My Password</span></a
                >
              </p>
            </div>
            <div class="submitbtn">
              <input style="cursor: pointer;" type="submit" value="login" />
            </div>
          </div>
        </form>
      </div>
    </section>
    <script type="text/javascript">
    	function loginValidate() {
    		var email = document.log.email.value;
    		var pwd = document.log.pwd.value;
    		if(email == "") {
    			alert("Email cannot Be Empty");
    			document.log.email.focus();
    			return false;
    		}
    		if(pwd == "") {
    			alert("Password cannot Be Empty");
    			document.log.pwd.focus();
    			return false;
    		}
    		return true;
    	}
    </script>
  </body>
</html>