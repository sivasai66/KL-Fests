<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Fests</title>
</head>
<body>

</body>
</html><meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./addfests.css" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
      crossorigin="anonymous"
    />
    <title>KLU Fests</title>
  </head>
  <body>
  <% if(session.getAttribute("email") == null) {
	  response.sendRedirect("login.jsp");
  }
  else if(session.getAttribute("role") != "admin") {
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
        <li class="li" id="AddFests">
			<a href="#">Add Fests</a>
		</li>
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
        
      </ul>
    </header>
    <!-- Login Form Starts -->
    <section class="loginForm">
      <div class="logBox">
        <h3 class="logTitle">Come Let's Add The Fest</h3>
        <br />
        <form
          action="addFests"
          onsubmit="return festValidate()"
          method="post"
          name="log"
          class="logForm"
        >
          <label for="email">Fest Name</label>
          <input
            type="text"
            name="name"
            placeholder="Fest Name"
            required="required"
          />
          <label for="pwd">Fest Image</label>
          <input
            type="file"
            name="logo"
            required="required"
          />
          <label for="tagline">Fest Tagline</label>
          <input
            type="text"
            name="tagline"
            placeholder="Enter The Small Tagline"
            required="required"
          />
          <label for="desc">Fest Description</label>
          <textarea
            type="text"
            name="desc"
            placeholder="Description"
            required="required"
          ></textarea>
          <div class="content">
            <div class="submitbtn">
              <input type="submit" value="Add Fests" />
            </div>
          </div>
        </form>
      </div>
    </section>
    <script type="text/javascript">
    	
    </script>
  </body>
</html>