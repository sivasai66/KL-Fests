<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./register.css" />
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
          <a href="#">Sign Up</a>
        </li>
      </ul>
    </header>
    <!-- Registration Form Starts -->
    <section class="loginForm">
      <div class="logBox">
        <h3 class="logTitle">We're Happy To invite You</h3>
        <br />
        <form
          method="post"
          action="register"
          onsubmit="return signupValidate()"
          name="log"
          class="logForm"
        >
          <label for="email">Name<span class="req">*</span></label>
          <input
            type="text"
            name="name"
            placeholder="Name"
            required="required"
          />
          <label for="email">Email Address<span class="req">*</span></label>
          <input
            type="text"
            name="email"
            placeholder="Email Address"
            required="required"
          />
          <label for="pwd">Password<span class="req">*</span></label>
          <input
            type="password"
            name="pwd"
            placeholder="Password"
            required="required"
          />
          <label for="cnfrmpwd"
            >Confirm Password<span class="req">*</span></label
          >
          <input
            type="password"
            name="cnfrmpwd"
            placeholder="Confirm Password"
            required="required"
          />
          <div class="submitbtn">
            <input type="submit" value="Register" />
          </div>
        </form>
      </div>
    </section>
    <script type="text/javascript">
    function signupValidate() {
    	var email = document.log.email.value;
    	var pwd = document.log.pwd.value;
    	var cnfrmpwd = document.log.cnfrmpwd.value;
    	if(email === pwd) {
    		alert("Password Should not Be Same As Email Buddy");
    		document.log.pwd.value = "";
    		document.log.cnfrmpwd.value = "";
    		document.log.pwd.focus();
    		return false;
    	}
    	if(pwd !== cnfrmpwd) {
    		alert("Passwords Doesn't Match Buddy");
    		document.log.pwd.value = "";
    		document.log.cnfrmpwd.value = "";
    		document.log.pwd.focus();
    		return false;
    	}
    	return true;
    }
    </script>
  </body>
</html>
