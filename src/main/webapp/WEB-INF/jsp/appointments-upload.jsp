<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <style>
        div.container{
            position: absolute;
            top: 20%;
            left: 40%;
        }
    </style>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"
	integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
	crossorigin="anonymous"></script>
<link rel="styleshee" type="text/css" href="${contextPath}/resources/jquery.timepicker.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap-datepicker.css" />
<script type="text/javascript" src="${contextPath}/resources/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${contextPath}/resources/jquery.timepicker.js"></script>
<script type="text/javascript" src="${contextPath}/resources/Datepair.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>English Language Tutoring</title>
</head>
<body>
    <div class="container" id = "box">
		<div class="row" id="a">
			<form action="${contextPath}/appointments.htm?action=request"
				method="POST" class="form-horizontal">
                                <div class="form-group">
                                        <label class="col-md-4">From:</label>
                                        <p class="col-md-4" style="font-size:20px;">${requestScope.sender.name}</p>
                                </div><br><br>			
                                                
				<div class="form-group">
					<label class="col-md-4 control-label" for="content">Date :</label>
					<p id="dateOnly" class="col-md-4">
						<input type="text" class="date" name="date" />
					</p>
				</div><br><br>	

				<div class="form-group">
					<label class="col-md-4 control-label" for="content">Time :</label>
					<p id="timeOnly" class="col-md-4">
						<input type="time" name="time" />
					</p>
                                </div><br><br>

				<script>
					$('#timeOnly .time').timepicker({
						showDuration : true,
						timeFormat : 'g:ia'
					});
                                        
					var timeOnlyEl = document.getElementById('timeOnly');
					var timeOnlyDatepair = new Datepair(timeOnlyEl);

					$('#dateOnly .date').datepicker({
						format : 'yyyy-m-d',
						autoclose : true
					});

					var dateOnlyEl = document.getElementById('dateOnly');
					var dateOnlyDatepair = new Datepair(dateOnlyEl);
				</script>

				<div class="form-group">
					<p style="text-align: center"><input type="submit" class="btn btn-success col-md-4" name="Submit"/></p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>