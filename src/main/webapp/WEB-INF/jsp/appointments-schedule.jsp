<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
        <div class="container">
                <div class="row col-md-6 col-md-offset-2 custyle">
                        <table class="table table-striped custab">
                                <thead>
                                        <td class="text-center">Date</td>
                                        <td class="text-center">Time</td>
                                        <td class="text-center">Tutor</td>
                                        <td class="text-center">Schedule</td>
                                </thead>
                                <c:forEach items="${requestScope.appointmentList}"
                                        var="appointment">
                                        <tr>
                                            <td class="text-center">${appointment.date}</td>
                                            <td class="text-center">${appointment.time}</td>
                                            <td class="text-center">${appointment.sender.name}</td>
                                            <td class="text-center col-md-4"> <a
								href="${contextPath}/appointments.htm?action=confirmed&appointmentid=${appointment.appointmentid}"
								class="btn btn-success btn-xs"><span
									class="glyphicon glyphicon-ok"></span>Confirm</a></td>
                                        </tr>
                                </c:forEach>
                        </table>
                </div>
        </div>
</body>
</html>