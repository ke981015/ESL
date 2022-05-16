<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>English Language Tutoring</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<frameset cols="30%, 70%">
    <frame src="${contextPath}/leftFrame.htm"/>
    <frame name="right" src="${contextPath}/appointments.htm?action=view">
</frameset>

</html>