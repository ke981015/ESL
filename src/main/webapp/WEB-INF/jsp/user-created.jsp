<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>English Language Tutoring</title>
</head>
<body>
    <h1>Registered successfully!</h1>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <a href="${contextPath}/user/login.htm">Click here to login</a>
</body>
</html>