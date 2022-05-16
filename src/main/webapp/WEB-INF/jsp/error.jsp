<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>English Language Tutoring</title>
</head>
<body>

<h1>Error Page</h1>
<p>${errorMessage}</p>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <a href="${contextPath}/user/login.htm">Click here to go back</a>

</body>
</html>