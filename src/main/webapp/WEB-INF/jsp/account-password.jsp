<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>English Language Tutoring</title>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"
	integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
	crossorigin="anonymous"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<style>
    div.container{
            position: absolute;
            top: 20%;
            left: 40%;
    }
</style>
</head>
<body>
    </br>
    <div class="container">
		<div class="row">
			<form action="${contextPath}/account.htm?action=modify-password" method="POST">
                                                
				<div class="form-group">
					<label class="col-md-4 control-label" for="content">Old Password:</label>
					<p id="dateOnly" class="col-md-4">
						<input type="password" name="oldPw" id="pw1" />
					</p>
                                </div><br><br>

				<div class="form-group">
					<label class="col-md-4 control-label" for="content">New Password:</label>
					<p id="timeOnly" class="col-md-4">
						<input type="password" name="newPw" />
					</p>
				</div><br><br>
                            
                                <div class="form-group">
					<label class="col-md-4 control-label" for="content">Re-enter Password:</label>
					<p id="timeOnly" class="col-md-4">
						<input type="password" name="rePw" id="pw2" onblur="check2pwd()"/>
					</p>
				</div><br><br>

				<div class="form-group">
                                    <p style="text-align: center"><input type="submit" class="btn btn-success col-md-4" name="Save Change"/></p>
				</div>
			</form>
		</div>
	</div>
                                 

</body>
</html>