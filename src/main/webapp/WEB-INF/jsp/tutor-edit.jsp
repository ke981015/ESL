<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"
	integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
	crossorigin="anonymous"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    .custab {
            border: 1px solid #ccc;
            padding: 5px;
            margin: 5% 0;
            box-shadow: 3px 3px 2px #ccc;
            transition: 0.5s;
    }

    .custab:hover {
            box-shadow: 3px 3px 0px transparent;
            transition: 0.5s;
    }
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="container">
		<div class="row">
			<table class="table table-striped custab">
				<thead>
					<td class="text-center">My Information</td>
				</thead>
					<tr>
                                                <td class="text-center">${tutor.information}</td>
					</tr>
			</table>
                                        
                        <form action="${contextPath}/information.htm?action=edit"
				method="POST" class="form-horizontal">
					<label class="col-md-4 control-label" for="content" style="font-size:15px;">New Information:</label>
					<p id="dateOnly" class="col-md-4">
						<textarea class="col-md-4" name="content" cols="112" rows="10"></textarea>
					</p><br>
                              
                            <div class="form-group" style="text-align:center;">
                                        <input name="submit" type="submit" class="btn btn-success col-md-4"
                                                value="Submit"></input>
                            </div>
			</form>
		</div>
	</div>
</body>
</html>