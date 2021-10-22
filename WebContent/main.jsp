<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*, java.util.Date, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="theme-color" content="#000" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./main.css" />
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
      <a href="#" class="logo"
        ><img src="./images/logo2.png" alt="KL Fests"
      /></a>
      <ul class="mynav">
        <li class="li">
          <a href="#">Home</a>
        </li>
        <li class="li"><a href="./fest.jsp">Fest Registration</a></li>
        <li class="li"><a href="./team.jsp">Our Team</a></li>
        <% if(session.getAttribute("email") == null) {
        	%>
	        <li class="li" id="login">
	          <a href="./login.jsp">Log in</a>
	        </li>
	        <li class="li" id="signup">
	          <a href="./register.jsp">Sign Up</a>
	        </li>
        <%
        }
        else {
        	if(session.getAttribute("role") == "admin") {
        		%>
        		<li class="li" id="AddFests">
		          <a href="./addfests.jsp">Add Fests</a>
		        </li>
        		<%
        	}
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

    <!-- Fests Details Starts -->
    <section class="homepage">
      <div class="maincontent">
        <!-- <h1 id="title">Welcome To KL Fests</h1> -->
        <h1 id="title">
          <span id="title2" class="title"></span>
        </h1>
        <p>Registration For Fests made&nbsp; <span class="typed"> </span></p>
        <!--  <input
          type="text"
          class="search"
          name="search"
          id="search"
          onkeyup="ipbx(this)"
          placeholder="Search For The Fests"
        />-->
        <form method="post" action="search" name="searchForm">
        	<input
        	type="text"
        	list="fest"
        	name="search"
        	placeholder="Search For The Fests"
        	required 
        	/>
                  <datalist id="fest">
				<%
					String Classname = "oracle.jdbc.driver.OracleDriver";
					String url = "jdbc:oracle:thin:@localhost:1521:XE";
					String username = "ep";
					String password = "ep";
	     	  		try {
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
					}
					catch(Exception e) {
						
					}
				 %>
			</datalist>
			<input type="submit" value="Search">
        </form>
        <div class="scroll-down" id="scroll-down">
          <i class="fa fa-angle-double-down"></i><br />
          <h5>Scroll Down For Fests Details</h5>
        </div>
      </div>
    </section>
    <section class="fests">
      <h1>Fests Details</h1>
      <div class="fests-boxes">
        <a href="" id="technical">
          <div class="fest-box">
            <div class="fest-double-box">
              <h2>SAMYAK</h2>
              <img
                style="width: 386px; height: 250px"
                src="./images/samyak.jfif"
                alt=""
              />
              <p class="fest-details">
                National Level Technical Fest Conduted By <br />
                KL University
              </p>
            </div>
          </div>
        </a>
        <br />
        <a href="" id="cultural">
          <div class="fest-box">
            <div class="fest-double-box">
              <h2>Surabhi</h2>
              <img
                style="width: 386px; height: 250px"
                src="./images/surabhi.jfif"
                alt=""
              />
              <p class="fest-details">
                Campus Level Cultural Fest Conduted By <br />
                KL University
              </p>
            </div>
          </div>
        </a>
        <br />
        <a href="" id="cse">
          <div class="fest-box">
            <div class="fest-double-box">
              <h2>#include</h2>
              <img
                style="width: 386px; height: 250px"
                src="./images/hash-include.jfif"
                alt=""
              />
              <p class="fest-details">
                Branch Level Fest Conduted By CSE Students Of KL University
              </p>
            </div>
          </div>
        </a>
        <a href="" class="ece">
          <div class="fest-box">
            <div class="fest-double-box">
              <h2>Zrotriya</h2>
              <img
                style="width: 386px; height: 250px"
                src="./images/zrotriya.jpg"
                alt=""
              />
              <p class="fest-details">
                Branch Level Fest Conduted By ECE Students Of KL University
              </p>
            </div>
          </div>
        </a>
        <br />
        <a href="" id="eee">
          <div class="fest-box">
            <div class="fest-double-box">
              <h2>Spark</h2>
              <img
                style="width: 386px; height: 250px"
                src="./images/spark.jfif"
                alt=""
              />
              <p class="fest-details">
                Branch Level Fest Conduted By EEE Students Of KL University
              </p>
            </div>
          </div>
        </a>
        <br />
        <a href="" id="mech">
          <div class="fest-box">
            <div class="fest-double-box">
              <h2>Yantrik</h2>
              <img
                style="width: 386px; height: 250px"
                src="./images/yantrik.jfif"
                alt=""
              />
              <p class="fest-details">
                Branch Level Fest Conduted By Mechanical Students Of KL
                University
              </p>
            </div>
          </div>
        </a>
        <a href="" class="civil">
          <div class="fest-box">
            <div class="fest-double-box">
              <h2>Race</h2>
              <img
                style="width: 386px; height: 250px"
                src="./images/race.jfif"
                alt=""
              />
              <p class="fest-details">
                Branch Level Fest Conduted By Civil Students Of KL University
              </p>
            </div>
          </div>
        </a>
        <br />
        <%
        Date d = new Date();
      	int year = 1900+d.getYear();
        try {
    		Connection con = DriverManager.getConnection(url, username, password);
            PreparedStatement festdetails = con.prepareStatement("select * from festdetails2 where year=?");
            festdetails.setInt(1, year);
            ResultSet festSet = festdetails.executeQuery();
            while(festSet.next()) {
            %>
            <a href="" class="civil">
              <div class="fest-box">
                <div class="fest-double-box">
                  <h2><%= festSet.getString(1)%></h2>
                  <img
                    style="width: 386px; height: 250px"
                    src=""
                    alt=""
                  />
                  <p class="fest-details">
                    <%= festSet.getString(2)%>
                  </p>
                </div>
              </div>
            </a>
            <br />
            <%
            }
            con.close();
        }
        catch(Exception e) {
        	System.out.println(e);
        }
        %>
        
      </div>
      <div class="footer">
        <h2>
          Note: Do Carry The Registration Confirmation Receipt On the Day Of Fest
        </h2>
        <br />
        <p>
          &copy; Copyright
          <% 
          	out.println(year); 
          	%> . All rights reserved with KL Fests
        </p>
      </div>

      <div class="scroll-up" id="scroll-up" style="color: #fff">
        <i
          class="fa fa-arrow-circle-o-up"
          onclick="window.scrollTo({top: 0, behavior: 'smooth'});"
        ></i>
        <p>Go To Top</p>
      </div>
    </section>
    <script>
        window.onload = function onpageload() {
          try {
            document.getElementById("search").value = "";
          } catch (error) {}
          try {
            var title = document.getElementById("title");
            var title2 = document.getElementById("title2");
            var font = ["abhi1", "abhi2", "abhi3", "abhi4", "abhi5"];
            var abhi = font[Math.floor(Math.random() * font.length)];
            title.style.fontFamily = abhi;
            title2.style.fontFamily = abhi;
            if (title.style.fontFamily === "abhi6") {
              title.style.fontSize = 70 + "px";
              title2.style.fontSize = 70 + "px";
            }
          } catch (error) {}
          try {
            var typed1 = new Typed(".typed", {
              strings: [" ", "Faster", "Smoother", "Easier"],
              typeSpeed: 100,
              backSpeed: 70,
              loop: true,
            });
            setTimeout(() => {
              var typed2 = new Typed(".title", {
                strings: ["Welcome To KL FESTS"],
                typeSpeed: 150,
              });
            }, 500);
          } catch (error) {}
        };

        
        /* <------------------------------ Search Suggestion Start ------------------------------> */

        function innerhtml(list) {
          document.getElementById("autocom-box").innerHTML = list;
        }

        function setatr() {
          let allList = document.getElementById("autocom-box").querySelectorAll("li");
          for (let i = 0; i < allList.length; i++) {
            allList[i].setAttribute("onclick", "select(this)");
          }
        }

        function select(element) {
          let selectUserData = element.textContent;
          document.getElementById("search").value = selectUserData;
          innerhtml(" ");
          isSearched = true;
          change("./fest.html");
        }

        /* <------------------------------- Search Suggestion End -------------------------------> */

        /* <-------------------------------- Search Click Start --------------------------------> */

//        function search() {
//          var search = document.getElementById("search");
//          isSearched = true;
//          festname = search.value;
//          search.value = "";
//        }

        function change(value) {
          window.location.href = value;
        }

        /* ------------------------------- Search Click End ------------------------------- */

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

        /* ------------------------------- OTP Logic Start ------------------------------- */

        var otp;
        function generateOTP() {
          var digits = "0123456789";
          let OTP = "";
          for (let i = 0; i < 6; i++) {
            OTP += digits[Math.floor(Math.random() * 10)];
          }
          this.otp = OTP;
          return OTP;
        }

        function validateOTP() {
          var OTP = document.getElementById("otp-field");
          if (OTP === otp) {
            return true;
          } else {
            return false;
          }
        }

          let suggestions = [
          "Samyak",
          "Surabhi",
          "Hash Include",
          "#Include",
          "Zrotriya",
          "Spark",
          "Yantrik",
          "Race",
        ];

        function ipbx(hello) {
          if (hello.value != null) {
            let userdata = hello.value;
            let emptyArray = [];
            if (userdata) {
              emptyArray = suggestions.filter((data) => {
                return data
                  .toLocaleLowerCase()
                  .startsWith(userdata.toLocaleLowerCase());
              });
              firstdata = emptyArray[0];
              emptyArray = emptyArray.map((data) => {
                return (data = "<li>" + data + "</li>");
              });
              showSuggestion(emptyArray, userdata);
              setatr();
            } else {
              innerhtml("");
            }
          } else {
            innerhtml("");
          }
        }

        function showSuggestion(list, userdata) {
          let listData;
          if (!list.length) {
            try {
              userValue = inputBox.value;
              listData = "<li>" + userValue + "</li>";
            } catch (error) {
              listData = "<li> No Fests </li>";
            }
          } else {
            listData = list.join("");
          }
          innerhtml(listData);
        }

        try {
          window.onscroll = function () {
            if (window.scrollY > 100) {
              document.getElementById("scroll-down").style.display = "none";
            } else {
              document.getElementById("scroll-down").style.display = "block";
            }
          };
        } catch (error) {}
        
    /*------------------ Typed.js--------------------------------------------*/
        /*!
         * 
         *   typed.js - A JavaScript Typing Animation Library
         *   Author: Matt Boldt <me@mattboldt.com>
         *   Version: v2.0.11
         *   Url: https://github.com/mattboldt/typed.js
         *   License(s): MIT
         * 
         */
        (function webpackUniversalModuleDefinition(root, factory) {
            if(typeof exports === 'object' && typeof module === 'object')
                module.exports = factory();
            else if(typeof define === 'function' && define.amd)
                define([], factory);
            else if(typeof exports === 'object')
                exports["Typed"] = factory();
            else
                root["Typed"] = factory();
        })(this, function() {
        return /******/ (function(modules) { // webpackBootstrap
        /******/ 	// The module cache
        /******/ 	var installedModules = {};
        /******/
        /******/ 	// The require function
        /******/ 	function __webpack_require__(moduleId) {
        /******/
        /******/ 		// Check if module is in cache
        /******/ 		if(installedModules[moduleId])
        /******/ 			return installedModules[moduleId].exports;
        /******/
        /******/ 		// Create a new module (and put it into the cache)
        /******/ 		var module = installedModules[moduleId] = {
        /******/ 			exports: {},
        /******/ 			id: moduleId,
        /******/ 			loaded: false
        /******/ 		};
        /******/
        /******/ 		// Execute the module function
        /******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
        /******/
        /******/ 		// Flag the module as loaded
        /******/ 		module.loaded = true;
        /******/
        /******/ 		// Return the exports of the module
        /******/ 		return module.exports;
        /******/ 	}
        /******/
        /******/
        /******/ 	// expose the modules object (__webpack_modules__)
        /******/ 	__webpack_require__.m = modules;
        /******/
        /******/ 	// expose the module cache
        /******/ 	__webpack_require__.c = installedModules;
        /******/
        /******/ 	// __webpack_public_path__
        /******/ 	__webpack_require__.p = "";
        /******/
        /******/ 	// Load entry module and return exports
        /******/ 	return __webpack_require__(0);
        /******/ })
        /************************************************************************/
        /******/ ([
        /* 0 */
        /***/ (function(module, exports, __webpack_require__) {

            'use strict';

            Object.defineProperty(exports, '__esModule', {
              value: true
            });

            var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

            function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

            var _initializerJs = __webpack_require__(1);

            var _htmlParserJs = __webpack_require__(3);

            /**
             * Welcome to Typed.js!
             * @param {string} elementId HTML element ID _OR_ HTML element
             * @param {object} options options object
             * @returns {object} a new Typed object
             */

            var Typed = (function () {
              function Typed(elementId, options) {
                _classCallCheck(this, Typed);

                // Initialize it up
                _initializerJs.initializer.load(this, options, elementId);
                // All systems go!
                this.begin();
              }

              /**
               * Toggle start() and stop() of the Typed instance
               * @public
               */

              _createClass(Typed, [{
                key: 'toggle',
                value: function toggle() {
                  this.pause.status ? this.start() : this.stop();
                }

                /**
                 * Stop typing / backspacing and enable cursor blinking
                 * @public
                 */
              }, {
                key: 'stop',
                value: function stop() {
                  if (this.typingComplete) return;
                  if (this.pause.status) return;
                  this.toggleBlinking(true);
                  this.pause.status = true;
                  this.options.onStop(this.arrayPos, this);
                }

                /**
                 * Start typing / backspacing after being stopped
                 * @public
                 */
              }, {
                key: 'start',
                value: function start() {
                  if (this.typingComplete) return;
                  if (!this.pause.status) return;
                  this.pause.status = false;
                  if (this.pause.typewrite) {
                    this.typewrite(this.pause.curString, this.pause.curStrPos);
                  } else {
                    this.backspace(this.pause.curString, this.pause.curStrPos);
                  }
                  this.options.onStart(this.arrayPos, this);
                }

                /**
                 * Destroy this instance of Typed
                 * @public
                 */
              }, {
                key: 'destroy',
                value: function destroy() {
                  this.reset(false);
                  this.options.onDestroy(this);
                }

                /**
                 * Reset Typed and optionally restarts
                 * @param {boolean} restart
                 * @public
                 */
              }, {
                key: 'reset',
                value: function reset() {
                  var restart = arguments.length <= 0 || arguments[0] === undefined ? true : arguments[0];

                  clearInterval(this.timeout);
                  this.replaceText('');
                  if (this.cursor && this.cursor.parentNode) {
                    this.cursor.parentNode.removeChild(this.cursor);
                    this.cursor = null;
                  }
                  this.strPos = 0;
                  this.arrayPos = 0;
                  this.curLoop = 0;
                  if (restart) {
                    this.insertCursor();
                    this.options.onReset(this);
                    this.begin();
                  }
                }

                /**
                 * Begins the typing animation
                 * @private
                 */
              }, {
                key: 'begin',
                value: function begin() {
                  var _this = this;

                  this.options.onBegin(this);
                  this.typingComplete = false;
                  this.shuffleStringsIfNeeded(this);
                  this.insertCursor();
                  if (this.bindInputFocusEvents) this.bindFocusEvents();
                  this.timeout = setTimeout(function () {
                    // Check if there is some text in the element, if yes start by backspacing the default message
                    if (!_this.currentElContent || _this.currentElContent.length === 0) {
                      _this.typewrite(_this.strings[_this.sequence[_this.arrayPos]], _this.strPos);
                    } else {
                      // Start typing
                      _this.backspace(_this.currentElContent, _this.currentElContent.length);
                    }
                  }, this.startDelay);
                }

                /**
                 * Called for each character typed
                 * @param {string} curString the current string in the strings array
                 * @param {number} curStrPos the current position in the curString
                 * @private
                 */
              }, {
                key: 'typewrite',
                value: function typewrite(curString, curStrPos) {
                  var _this2 = this;

                  if (this.fadeOut && this.el.classList.contains(this.fadeOutClass)) {
                    this.el.classList.remove(this.fadeOutClass);
                    if (this.cursor) this.cursor.classList.remove(this.fadeOutClass);
                  }

                  var humanize = this.humanizer(this.typeSpeed);
                  var numChars = 1;

                  if (this.pause.status === true) {
                    this.setPauseStatus(curString, curStrPos, true);
                    return;
                  }

                  // contain typing function in a timeout humanize'd delay
                  this.timeout = setTimeout(function () {
                    // skip over any HTML chars
                    curStrPos = _htmlParserJs.htmlParser.typeHtmlChars(curString, curStrPos, _this2);

                    var pauseTime = 0;
                    var substr = curString.substr(curStrPos);
                    // check for an escape character before a pause value
                    // format: \^\d+ .. eg: ^1000 .. should be able to print the ^ too using ^^
                    // single ^ are removed from string
                    if (substr.charAt(0) === '^') {
                      if (/^\^\d+/.test(substr)) {
                        var skip = 1; // skip at least 1
                        substr = /\d+/.exec(substr)[0];
                        skip += substr.length;
                        pauseTime = parseInt(substr);
                        _this2.temporaryPause = true;
                        _this2.options.onTypingPaused(_this2.arrayPos, _this2);
                        // strip out the escape character and pause value so they're not printed
                        curString = curString.substring(0, curStrPos) + curString.substring(curStrPos + skip);
                        _this2.toggleBlinking(true);
                      }
                    }

                    // check for skip characters formatted as
                    // "this is a `string to print NOW` ..."
                    if (substr.charAt(0) === '`') {
                      while (curString.substr(curStrPos + numChars).charAt(0) !== '`') {
                        numChars++;
                        if (curStrPos + numChars > curString.length) break;
                      }
                      // strip out the escape characters and append all the string in between
                      var stringBeforeSkip = curString.substring(0, curStrPos);
                      var stringSkipped = curString.substring(stringBeforeSkip.length + 1, curStrPos + numChars);
                      var stringAfterSkip = curString.substring(curStrPos + numChars + 1);
                      curString = stringBeforeSkip + stringSkipped + stringAfterSkip;
                      numChars--;
                    }

                    // timeout for any pause after a character
                    _this2.timeout = setTimeout(function () {
                      // Accounts for blinking while paused
                      _this2.toggleBlinking(false);

                      // We're done with this sentence!
                      if (curStrPos >= curString.length) {
                        _this2.doneTyping(curString, curStrPos);
                      } else {
                        _this2.keepTyping(curString, curStrPos, numChars);
                      }
                      // end of character pause
                      if (_this2.temporaryPause) {
                        _this2.temporaryPause = false;
                        _this2.options.onTypingResumed(_this2.arrayPos, _this2);
                      }
                    }, pauseTime);

                    // humanized value for typing
                  }, humanize);
                }

                /**
                 * Continue to the next string & begin typing
                 * @param {string} curString the current string in the strings array
                 * @param {number} curStrPos the current position in the curString
                 * @private
                 */
              }, {
                key: 'keepTyping',
                value: function keepTyping(curString, curStrPos, numChars) {
                  // call before functions if applicable
                  if (curStrPos === 0) {
                    this.toggleBlinking(false);
                    this.options.preStringTyped(this.arrayPos, this);
                  }
                  // start typing each new char into existing string
                  // curString: arg, this.el.html: original text inside element
                  curStrPos += numChars;
                  var nextString = curString.substr(0, curStrPos);
                  this.replaceText(nextString);
                  // loop the function
                  this.typewrite(curString, curStrPos);
                }

                /**
                 * We're done typing the current string
                 * @param {string} curString the current string in the strings array
                 * @param {number} curStrPos the current position in the curString
                 * @private
                 */
              }, {
                key: 'doneTyping',
                value: function doneTyping(curString, curStrPos) {
                  var _this3 = this;

                  // fires callback function
                  this.options.onStringTyped(this.arrayPos, this);
                  this.toggleBlinking(true);
                  // is this the final string
                  if (this.arrayPos === this.strings.length - 1) {
                    // callback that occurs on the last typed string
                    this.complete();
                    // quit if we wont loop back
                    if (this.loop === false || this.curLoop === this.loopCount) {
                      return;
                    }
                  }
                  this.timeout = setTimeout(function () {
                    _this3.backspace(curString, curStrPos);
                  }, this.backDelay);
                }

                /**
                 * Backspaces 1 character at a time
                 * @param {string} curString the current string in the strings array
                 * @param {number} curStrPos the current position in the curString
                 * @private
                 */
              }, {
                key: 'backspace',
                value: function backspace(curString, curStrPos) {
                  var _this4 = this;

                  if (this.pause.status === true) {
                    this.setPauseStatus(curString, curStrPos, true);
                    return;
                  }
                  if (this.fadeOut) return this.initFadeOut();

                  this.toggleBlinking(false);
                  var humanize = this.humanizer(this.backSpeed);

                  this.timeout = setTimeout(function () {
                    curStrPos = _htmlParserJs.htmlParser.backSpaceHtmlChars(curString, curStrPos, _this4);
                    // replace text with base text + typed characters
                    var curStringAtPosition = curString.substr(0, curStrPos);
                    _this4.replaceText(curStringAtPosition);

                    // if smartBack is enabled
                    if (_this4.smartBackspace) {
                      // the remaining part of the current string is equal of the same part of the new string
                      var nextString = _this4.strings[_this4.arrayPos + 1];
                      if (nextString && curStringAtPosition === nextString.substr(0, curStrPos)) {
                        _this4.stopNum = curStrPos;
                      } else {
                        _this4.stopNum = 0;
                      }
                    }

                    // if the number (id of character in current string) is
                    // less than the stop number, keep going
                    if (curStrPos > _this4.stopNum) {
                      // subtract characters one by one
                      curStrPos--;
                      // loop the function
                      _this4.backspace(curString, curStrPos);
                    } else if (curStrPos <= _this4.stopNum) {
                      // if the stop number has been reached, increase
                      // array position to next string
                      _this4.arrayPos++;
                      // When looping, begin at the beginning after backspace complete
                      if (_this4.arrayPos === _this4.strings.length) {
                        _this4.arrayPos = 0;
                        _this4.options.onLastStringBackspaced();
                        _this4.shuffleStringsIfNeeded();
                        _this4.begin();
                      } else {
                        _this4.typewrite(_this4.strings[_this4.sequence[_this4.arrayPos]], curStrPos);
                      }
                    }
                    // humanized value for typing
                  }, humanize);
                }

                /**
                 * Full animation is complete
                 * @private
                 */
              }, {
                key: 'complete',
                value: function complete() {
                  this.options.onComplete(this);
                  if (this.loop) {
                    this.curLoop++;
                  } else {
                    this.typingComplete = true;
                  }
                }

                /**
                 * Has the typing been stopped
                 * @param {string} curString the current string in the strings array
                 * @param {number} curStrPos the current position in the curString
                 * @param {boolean} isTyping
                 * @private
                 */
              }, {
                key: 'setPauseStatus',
                value: function setPauseStatus(curString, curStrPos, isTyping) {
                  this.pause.typewrite = isTyping;
                  this.pause.curString = curString;
                  this.pause.curStrPos = curStrPos;
                }

                /**
                 * Toggle the blinking cursor
                 * @param {boolean} isBlinking
                 * @private
                 */
              }, {
                key: 'toggleBlinking',
                value: function toggleBlinking(isBlinking) {
                  if (!this.cursor) return;
                  // if in paused state, don't toggle blinking a 2nd time
                  if (this.pause.status) return;
                  if (this.cursorBlinking === isBlinking) return;
                  this.cursorBlinking = isBlinking;
                  if (isBlinking) {
                    this.cursor.classList.add('typed-cursor--blink');
                  } else {
                    this.cursor.classList.remove('typed-cursor--blink');
                  }
                }

                /**
                 * Speed in MS to type
                 * @param {number} speed
                 * @private
                 */
              }, {
                key: 'humanizer',
                value: function humanizer(speed) {
                  return Math.round(Math.random() * speed / 2) + speed;
                }

                /**
                 * Shuffle the sequence of the strings array
                 * @private
                 */
              }, {
                key: 'shuffleStringsIfNeeded',
                value: function shuffleStringsIfNeeded() {
                  if (!this.shuffle) return;
                  this.sequence = this.sequence.sort(function () {
                    return Math.random() - 0.5;
                  });
                }

                /**
                 * Adds a CSS class to fade out current string
                 * @private
                 */
              }, {
                key: 'initFadeOut',
                value: function initFadeOut() {
                  var _this5 = this;

                  this.el.className += ' ' + this.fadeOutClass;
                  if (this.cursor) this.cursor.className += ' ' + this.fadeOutClass;
                  return setTimeout(function () {
                    _this5.arrayPos++;
                    _this5.replaceText('');

                    // Resets current string if end of loop reached
                    if (_this5.strings.length > _this5.arrayPos) {
                      _this5.typewrite(_this5.strings[_this5.sequence[_this5.arrayPos]], 0);
                    } else {
                      _this5.typewrite(_this5.strings[0], 0);
                      _this5.arrayPos = 0;
                    }
                  }, this.fadeOutDelay);
                }

                /**
                 * Replaces current text in the HTML element
                 * depending on element type
                 * @param {string} str
                 * @private
                 */
              }, {
                key: 'replaceText',
                value: function replaceText(str) {
                  if (this.attr) {
                    this.el.setAttribute(this.attr, str);
                  } else {
                    if (this.isInput) {
                      this.el.value = str;
                    } else if (this.contentType === 'html') {
                      this.el.innerHTML = str;
                    } else {
                      this.el.textContent = str;
                    }
                  }
                }

                /**
                 * If using input elements, bind focus in order to
                 * start and stop the animation
                 * @private
                 */
              }, {
                key: 'bindFocusEvents',
                value: function bindFocusEvents() {
                  var _this6 = this;

                  if (!this.isInput) return;
                  this.el.addEventListener('focus', function (e) {
                    _this6.stop();
                  });
                  this.el.addEventListener('blur', function (e) {
                    if (_this6.el.value && _this6.el.value.length !== 0) {
                      return;
                    }
                    _this6.start();
                  });
                }

                /**
                 * On init, insert the cursor element
                 * @private
                 */
              }, {
                key: 'insertCursor',
                value: function insertCursor() {
                  if (!this.showCursor) return;
                  if (this.cursor) return;
                  this.cursor = document.createElement('span');
                  this.cursor.className = 'typed-cursor';
                  this.cursor.innerHTML = this.cursorChar;
                  this.el.parentNode && this.el.parentNode.insertBefore(this.cursor, this.el.nextSibling);
                }
              }]);

              return Typed;
            })();

            exports['default'] = Typed;
            module.exports = exports['default'];

        /***/ }),
        /* 1 */
        /***/ (function(module, exports, __webpack_require__) {

            'use strict';

            Object.defineProperty(exports, '__esModule', {
              value: true
            });

            var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

            var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

            function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

            function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

            var _defaultsJs = __webpack_require__(2);

            var _defaultsJs2 = _interopRequireDefault(_defaultsJs);

            /**
             * Initialize the Typed object
             */

            var Initializer = (function () {
              function Initializer() {
                _classCallCheck(this, Initializer);
              }

              _createClass(Initializer, [{
                key: 'load',

                /**
                 * Load up defaults & options on the Typed instance
                 * @param {Typed} self instance of Typed
                 * @param {object} options options object
                 * @param {string} elementId HTML element ID _OR_ instance of HTML element
                 * @private
                 */

                value: function load(self, options, elementId) {
                  // chosen element to manipulate text
                  if (typeof elementId === 'string') {
                    self.el = document.querySelector(elementId);
                  } else {
                    self.el = elementId;
                  }

                  self.options = _extends({}, _defaultsJs2['default'], options);

                  // attribute to type into
                  self.isInput = self.el.tagName.toLowerCase() === 'input';
                  self.attr = self.options.attr;
                  self.bindInputFocusEvents = self.options.bindInputFocusEvents;

                  // show cursor
                  self.showCursor = self.isInput ? false : self.options.showCursor;

                  // custom cursor
                  self.cursorChar = self.options.cursorChar;

                  // Is the cursor blinking
                  self.cursorBlinking = true;

                  // text content of element
                  self.elContent = self.attr ? self.el.getAttribute(self.attr) : self.el.textContent;

                  // html or plain text
                  self.contentType = self.options.contentType;

                  // typing speed
                  self.typeSpeed = self.options.typeSpeed;

                  // add a delay before typing starts
                  self.startDelay = self.options.startDelay;

                  // backspacing speed
                  self.backSpeed = self.options.backSpeed;

                  // only backspace what doesn't match the previous string
                  self.smartBackspace = self.options.smartBackspace;

                  // amount of time to wait before backspacing
                  self.backDelay = self.options.backDelay;

                  // Fade out instead of backspace
                  self.fadeOut = self.options.fadeOut;
                  self.fadeOutClass = self.options.fadeOutClass;
                  self.fadeOutDelay = self.options.fadeOutDelay;

                  // variable to check whether typing is currently paused
                  self.isPaused = false;

                  // input strings of text
                  self.strings = self.options.strings.map(function (s) {
                    return s.trim();
                  });

                  // div containing strings
                  if (typeof self.options.stringsElement === 'string') {
                    self.stringsElement = document.querySelector(self.options.stringsElement);
                  } else {
                    self.stringsElement = self.options.stringsElement;
                  }

                  if (self.stringsElement) {
                    self.strings = [];
                    self.stringsElement.style.display = 'none';
                    var strings = Array.prototype.slice.apply(self.stringsElement.children);
                    var stringsLength = strings.length;

                    if (stringsLength) {
                      for (var i = 0; i < stringsLength; i += 1) {
                        var stringEl = strings[i];
                        self.strings.push(stringEl.innerHTML.trim());
                      }
                    }
                  }

                  // character number position of current string
                  self.strPos = 0;

                  // current array position
                  self.arrayPos = 0;

                  // index of string to stop backspacing on
                  self.stopNum = 0;

                  // Looping logic
                  self.loop = self.options.loop;
                  self.loopCount = self.options.loopCount;
                  self.curLoop = 0;

                  // shuffle the strings
                  self.shuffle = self.options.shuffle;
                  // the order of strings
                  self.sequence = [];

                  self.pause = {
                    status: false,
                    typewrite: true,
                    curString: '',
                    curStrPos: 0
                  };

                  // When the typing is complete (when not looped)
                  self.typingComplete = false;

                  // Set the order in which the strings are typed
                  for (var i in self.strings) {
                    self.sequence[i] = i;
                  }

                  // If there is some text in the element
                  self.currentElContent = this.getCurrentElContent(self);

                  self.autoInsertCss = self.options.autoInsertCss;

                  this.appendAnimationCss(self);
                }
              }, {
                key: 'getCurrentElContent',
                value: function getCurrentElContent(self) {
                  var elContent = '';
                  if (self.attr) {
                    elContent = self.el.getAttribute(self.attr);
                  } else if (self.isInput) {
                    elContent = self.el.value;
                  } else if (self.contentType === 'html') {
                    elContent = self.el.innerHTML;
                  } else {
                    elContent = self.el.textContent;
                  }
                  return elContent;
                }
              }, {
                key: 'appendAnimationCss',
                value: function appendAnimationCss(self) {
                  var cssDataName = 'data-typed-js-css';
                  if (!self.autoInsertCss) {
                    return;
                  }
                  if (!self.showCursor && !self.fadeOut) {
                    return;
                  }
                  if (document.querySelector('[' + cssDataName + ']')) {
                    return;
                  }

                  var css = document.createElement('style');
                  css.type = 'text/css';
                  css.setAttribute(cssDataName, true);

                  var innerCss = '';
                  if (self.showCursor) {
                    innerCss += '\n        .typed-cursor{\n          opacity: 1;\n        }\n        .typed-cursor.typed-cursor--blink{\n          animation: typedjsBlink 0.7s infinite;\n          -webkit-animation: typedjsBlink 0.7s infinite;\n                  animation: typedjsBlink 0.7s infinite;\n        }\n        @keyframes typedjsBlink{\n          50% { opacity: 0.0; }\n        }\n        @-webkit-keyframes typedjsBlink{\n          0% { opacity: 1; }\n          50% { opacity: 0.0; }\n          100% { opacity: 1; }\n        }\n      ';
                  }
                  if (self.fadeOut) {
                    innerCss += '\n        .typed-fade-out{\n          opacity: 0;\n          transition: opacity .25s;\n        }\n        .typed-cursor.typed-cursor--blink.typed-fade-out{\n          -webkit-animation: 0;\n          animation: 0;\n        }\n      ';
                  }
                  if (css.length === 0) {
                    return;
                  }
                  css.innerHTML = innerCss;
                  document.body.appendChild(css);
                }
              }]);

              return Initializer;
            })();

            exports['default'] = Initializer;
            var initializer = new Initializer();
            exports.initializer = initializer;

        /***/ }),
        /* 2 */
        /***/ (function(module, exports) {

            /**
             * Defaults & options
             * @returns {object} Typed defaults & options
             * @public
             */

            'use strict';

            Object.defineProperty(exports, '__esModule', {
              value: true
            });
            var defaults = {
              /**
               * @property {array} strings strings to be typed
               * @property {string} stringsElement ID of element containing string children
               */
              strings: ['These are the default values...', 'You know what you should do?', 'Use your own!', 'Have a great day!'],
              stringsElement: null,

              /**
               * @property {number} typeSpeed type speed in milliseconds
               */
              typeSpeed: 0,

              /**
               * @property {number} startDelay time before typing starts in milliseconds
               */
              startDelay: 0,

              /**
               * @property {number} backSpeed backspacing speed in milliseconds
               */
              backSpeed: 0,

              /**
               * @property {boolean} smartBackspace only backspace what doesn't match the previous string
               */
              smartBackspace: true,

              /**
               * @property {boolean} shuffle shuffle the strings
               */
              shuffle: false,

              /**
               * @property {number} backDelay time before backspacing in milliseconds
               */
              backDelay: 700,

              /**
               * @property {boolean} fadeOut Fade out instead of backspace
               * @property {string} fadeOutClass css class for fade animation
               * @property {boolean} fadeOutDelay Fade out delay in milliseconds
               */
              fadeOut: false,
              fadeOutClass: 'typed-fade-out',
              fadeOutDelay: 500,

              /**
               * @property {boolean} loop loop strings
               * @property {number} loopCount amount of loops
               */
              loop: false,
              loopCount: Infinity,

              /**
               * @property {boolean} showCursor show cursor
               * @property {string} cursorChar character for cursor
               * @property {boolean} autoInsertCss insert CSS for cursor and fadeOut into HTML <head>
               */
              showCursor: true,
              cursorChar: '|',
              autoInsertCss: true,

              /**
               * @property {string} attr attribute for typing
               * Ex: input placeholder, value, or just HTML text
               */
              attr: null,

              /**
               * @property {boolean} bindInputFocusEvents bind to focus and blur if el is text input
               */
              bindInputFocusEvents: false,

              /**
               * @property {string} contentType 'html' or 'null' for plaintext
               */
              contentType: 'html',

              /**
               * Before it begins typing
               * @param {Typed} self
               */
              onBegin: function onBegin(self) {},

              /**
               * All typing is complete
               * @param {Typed} self
               */
              onComplete: function onComplete(self) {},

              /**
               * Before each string is typed
               * @param {number} arrayPos
               * @param {Typed} self
               */
              preStringTyped: function preStringTyped(arrayPos, self) {},

              /**
               * After each string is typed
               * @param {number} arrayPos
               * @param {Typed} self
               */
              onStringTyped: function onStringTyped(arrayPos, self) {},

              /**
               * During looping, after last string is typed
               * @param {Typed} self
               */
              onLastStringBackspaced: function onLastStringBackspaced(self) {},

              /**
               * Typing has been stopped
               * @param {number} arrayPos
               * @param {Typed} self
               */
              onTypingPaused: function onTypingPaused(arrayPos, self) {},

              /**
               * Typing has been started after being stopped
               * @param {number} arrayPos
               * @param {Typed} self
               */
              onTypingResumed: function onTypingResumed(arrayPos, self) {},

              /**
               * After reset
               * @param {Typed} self
               */
              onReset: function onReset(self) {},

              /**
               * After stop
               * @param {number} arrayPos
               * @param {Typed} self
               */
              onStop: function onStop(arrayPos, self) {},

              /**
               * After start
               * @param {number} arrayPos
               * @param {Typed} self
               */
              onStart: function onStart(arrayPos, self) {},

              /**
               * After destroy
               * @param {Typed} self
               */
              onDestroy: function onDestroy(self) {}
            };

            exports['default'] = defaults;
            module.exports = exports['default'];

        /***/ }),
        /* 3 */
        /***/ (function(module, exports) {

            /**
             * TODO: These methods can probably be combined somehow
             * Parse HTML tags & HTML Characters
             */

            'use strict';

            Object.defineProperty(exports, '__esModule', {
              value: true
            });

            var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

            function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

            var HTMLParser = (function () {
              function HTMLParser() {
                _classCallCheck(this, HTMLParser);
              }

              _createClass(HTMLParser, [{
                key: 'typeHtmlChars',

                /**
                 * Type HTML tags & HTML Characters
                 * @param {string} curString Current string
                 * @param {number} curStrPos Position in current string
                 * @param {Typed} self instance of Typed
                 * @returns {number} a new string position
                 * @private
                 */

                value: function typeHtmlChars(curString, curStrPos, self) {
                  if (self.contentType !== 'html') return curStrPos;
                  var curChar = curString.substr(curStrPos).charAt(0);
                  if (curChar === '<' || curChar === '&') {
                    var endTag = '';
                    if (curChar === '<') {
                      endTag = '>';
                    } else {
                      endTag = ';';
                    }
                    while (curString.substr(curStrPos + 1).charAt(0) !== endTag) {
                      curStrPos++;
                      if (curStrPos + 1 > curString.length) {
                        break;
                      }
                    }
                    curStrPos++;
                  }
                  return curStrPos;
                }

                /**
                 * Backspace HTML tags and HTML Characters
                 * @param {string} curString Current string
                 * @param {number} curStrPos Position in current string
                 * @param {Typed} self instance of Typed
                 * @returns {number} a new string position
                 * @private
                 */
              }, {
                key: 'backSpaceHtmlChars',
                value: function backSpaceHtmlChars(curString, curStrPos, self) {
                  if (self.contentType !== 'html') return curStrPos;
                  var curChar = curString.substr(curStrPos).charAt(0);
                  if (curChar === '>' || curChar === ';') {
                    var endTag = '';
                    if (curChar === '>') {
                      endTag = '<';
                    } else {
                      endTag = '&';
                    }
                    while (curString.substr(curStrPos - 1).charAt(0) !== endTag) {
                      curStrPos--;
                      if (curStrPos < 0) {
                        break;
                      }
                    }
                    curStrPos--;
                  }
                  return curStrPos;
                }
              }]);

              return HTMLParser;
            })();

            exports['default'] = HTMLParser;
            var htmlParser = new HTMLParser();
            exports.htmlParser = htmlParser;

        /***/ })
        /******/ ])
        });
        ;
      </script>
  </body>
</html>
