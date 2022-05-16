<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>English Language Tutoring</title>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	
	<script>
    function ajaxEvent() {

        var xmlHttp;
        try // Firefox, Opera 8.0+, Safari
        {
            xmlHttp = new XMLHttpRequest();
        } catch (e) {
            try // Internet Explorer
            {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                    alert("Your browser does not support AJAX!");
                    return false;
                }
            }
        }

        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                document.getElementById("usernameHint").innerHTML = xmlHttp.responseText;
            }
        }
        
        var username = document.getElementById("username").value;

        xmlHttp.open("POST", "../checkUserExistence.htm?username="+username, true);
        xmlHttp.send();
    }
</script>
</head>
<body>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
    <div id="login-overlay" class="modal-dialog" style="width:30%">
          <div class="modal-header">
              <h3 class="modal-title" id="myModalLabel" style="text-align:center;">Register</h3>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-xs-12">
                      <div class="well">
                          <form id="registerForm" method="POST" action="${contextPath}/user/register.htm" novalidate="novalidate">
                              <div class="form-group">
                                  <label for="username" class="control-label">Username</label>
                                  <input type="text" class="form-control" id="username" name="username" value="" required="required" title="Please enter you username"  onkeyup="ajaxEvent()">
                                  <div id="usernameHint"></div>
                              </div>
                              <div class="form-group">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="password" name="password" value="" required="required" title="Please enter your password" >
                              </div>
                              <div class="form-group">
                                  <label for="name" class="control-label">Name</label>
                                  <input type="text" class="form-control" id="password" name="name" value="" required="required" title="Please enter your name">
                              </div>
                              <div class="form-group">
                                  <label for="role" class="control-label">Role</label> &nbsp;  &nbsp;
                                  <input type="radio" class="checkbox-inline" name="role" value="student"> Student  &nbsp;
                                  <input type="radio" class="checkbox-inline" name="role" value="tutor"> Tutor
                              </div>
                              <button type="submit" class="btn btn-info btn-block">Register</button>
                          </form>
                      </div>
                    </div>
              </div>
          </div>
    </div>
</body>
</html>