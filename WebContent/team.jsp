<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*, java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./team.css" />
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
      <a href="./main.jsp" class="logo"
        ><img src="./images/logo2.png" alt="KL Fests"
      /></a>
      <ul class="mynav">
        <li class="li">
          <a href="./main.jsp">Home</a>
        </li>
        <li class="li"><a href="./fest.jsp">Fest Registration</a></li>
        <li><a href="./contact.jsp">Contact Us</a></li>
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
    <section class="body">
      <div class="team-details">
        <div class="container">
          <div class="card">
            <div class="content">
              <div class="imgBx">
                <img src="./images/member1.jpeg" alt="" />
              </div>
              <div class="contentBx">
                <h3>
                  Siva Sai Yarlagadda<br /><span>Front-End Designer</span>
                </h3>
              </div>
            </div>
            <ul class="sci">
              <li style="--i: 1">
                <a
                  href="https://www.facebook.com/sivasai.yarlagadda.96/"
                  target="__blank"
                  ><i class="fa fa-facebook" aria-hidden="true"></i
                ></a>
              </li>
              <li style="--i: 2">
                <a
                  href="https://www.linkedin.com/in/sivasai-yarlagadda/"
                  target="__blank"
                  ><i class="fa fa-linkedin" aria-hidden="true"></i
                ></a>
              </li>
              <li style="--i: 3">
                <a
                  href="https://www.instagram.com/sivasaiyarlagadda/"
                  target="__blank"
                  ><i class="fa fa-instagram" aria-hidden="true"></i
                ></a>
              </li>
            </ul>
          </div>
          <div class="card">
            <div class="content">
              <div class="imgBx">
                <img src="./images/member2.jpeg" alt="" />
              </div>
              <div class="contentBx">
                <h3>Abhinav Pamarthi<br /><span>Full-Stack Developer</span></h3>
              </div>
            </div>
            <ul class="sci">
              <li style="--i: 1">
                <a
                  href="https://www.facebook.com/abhinav.pamarthi"
                  target="__blank"
                  ><i class="fa fa-facebook" aria-hidden="true"></i
                ></a>
              </li>
              <li style="--i: 2">
                <a
                  href="https://www.linkedin.com/in/abhinav-pamarthi"
                  target="__blank"
                  ><i class="fa fa-linkedin" aria-hidden="true"></i
                ></a>
              </li>
              <li style="--i: 3">
                <a
                  href="https://www.instagram.com/abhinav_pamarthi/"
                  target="__blank"
                  ><i class="fa fa-instagram" aria-hidden="true"></i
                ></a>
              </li>
            </ul>
          </div>
          <div class="card">
            <div class="content">
              <div class="imgBx">
                <img src="./images/member3.jpeg" alt="" />
              </div>
              <div class="contentBx">
                <h3>Nikesh Rakoti<br /><span>Back-End Designer</span></h3>
              </div>
            </div>
            <ul class="sci">
              <li style="--i: 1">
                <a
                  href="https://www.facebook.com/sainikesh.rakoti"
                  target="__blank"
                  ><i class="fa fa-facebook" aria-hidden="true"></i
                ></a>
              </li>
              <li style="--i: 2">
                <a
                  href="https://www.linkedin.com/in/sainikesh-rakoti-6118a01a7"
                  target="__blank"
                  ><i class="fa fa-linkedin" aria-hidden="true"></i
                ></a>
              </li>
              <li style="--i: 3">
                <a
                  href="https://www.instagram.com/__n_i_k_e_s_h__16/"
                  target="__blank"
                  ><i class="fa fa-instagram" aria-hidden="true"></i
                ></a>
              </li>
            </ul>
          </div>
          <div class="card">
            <div class="content">
              <div class="imgBx">
                <img src="./images/member4_2.jpg" alt="" />
              </div>
              <div class="contentBx">
                <h3>
                  <!-- Surya Kiran Jonnalagadda<br /><span>Maa Guruvugaaru</span>-->
                  Surya Kiran Jonnalagadda<br /><span>Mana &nbsp;Nayakudu</span>
                </h3>
              </div>
            </div>
            <ul class="sci">
              <li style="--i: 1">
                <!--
                <a href="https://scholar.google.co.in/citations?user=Wo-aPawAAAAJ&hl=en" target="__blank"><i class="fa fa-google"></a>
                -->
                <a
                  href="https://kluniversity.irins.org/profile/77771"
                  target="__blank"
                  ><i class="fa fa-university"></i
                ></a>
              </li>
              <li style="--i: 2">
                <a
                  href="https://in.linkedin.com/in/suryakiran1993"
                  target="__blank"
                  ><i class="fa fa-linkedin" aria-hidden="true"></i
                ></a>
              </li>
              <li style="--i: 3">
                <a
                  href="https://www.instagram.com/suryakiranjonnalagadda"
                  target="__blank"
                  ><i class="fa fa-instagram" aria-hidden="true"></i
                ></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <div class="footer">
      <h2>
        Note: Do Carry The Registration Confirmation Receipt On the Day Of Fest
      </h2>
      <p>
          &copy; Copyright
          <% 
          	Date d = new Date();
          	int year = 1900+d.getYear();
          	out.println(year);
          %>
          	. All rights reserved with KL Fests
        </p>
      </div>
    <script type="text/javascript">
    function menutoggle() {
    	  try {
    	    const togglemenu = document.querySelector(".account-dropdown");
    	    togglemenu.classList.toggle("active");
    	  } catch (error) {
    	    console.log(error);
    	  }
    	}
    </script>
  </body>
</html>
