<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>English Language Tutoring</title>
    <style>
        h1{
            text-align: center;
        }
    </style>
</head>
<body>
    </br>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <c:set var="status" value="${requestScope.status}" />
	<c:if test="${status eq 'changePwSuccess'}">
            <h1 style="color: green">Password changed successfully.</h1>
	</c:if>
	<c:if test="${status eq 'wrongPw'}">
            <h1 style="color: red">The old password is not correct.</h1>
	</c:if> 
        <c:if test="${status eq 'changePwFail'}">
            <h1 style="color: red">The re-enter password is not the same.</h1>
	</c:if>
</body>
</html>