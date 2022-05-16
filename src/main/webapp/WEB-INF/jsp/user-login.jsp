<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>English Language Tutoring</title>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"
	integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
	crossorigin="anonymous"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
          <div class="modal-header">
              <h3 class="modal-title" id="myModalLabel" align="center">English Language Tutoring </h3>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-xs-6">
                      <div class="well">
                          <form id="loginForm" method="POST" action="${contextPath}/user/login.htm" novalidate="novalidate">
                              <div class="form-group">
                                  <label for="username" class="control-label">Username</label>
                                  <input type="text" class="form-control" id="username" name="username" value="" required="required" title="Please enter you username" placeholder="username">
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="password" name="password" value="" required="required" title="Please enter your password" placeholder="password">
                                  <span class="help-block"></span>
                              </div> <br/>                     
                              <button type="submit" class="btn btn-success btn-block">Login</button><br/>
                              <a href="${contextPath}/user/register.htm" class="btn btn-info btn-block">Register</a>
                          </form>
                      </div>
                  </div>
                  <div class="col-xs-6">
                        <p>Provides high-quality English language instruction through 50-minute individual and group tutoring appointments. Sessions focus on areas including academic writing, listening, speaking, reading, TOEFL, pronunciation, presentation, and career preparation.</p><br/>
                        <h4 style="color:red;">No-show Policy</h4>
                        <p>1. The account will be blocked once three no-shows have been accumulated. Students will need to email GSS at gss@northeastern.edu to enable the account.</p>
                        <p>2. The account will be blocked again if the fourth no-show has been accumulated and the student will need to make an appointment with GSS staff to review GSS no-show policies and discuss the further usage of GSS services. After the meeting, the account will be enabled.</p>
                        <p>3. The account will be blocked again if the fifth no-show has been accumulated and the student will need to make an appointment with GSS staff again. After the meeting, the account will be blocked for three months. </p>
                  </div>
              </div>
          </div>
</body>
</html>