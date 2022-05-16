<%@page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"
    integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
    crossorigin="anonymous"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style>
        ul {
            list-style-type:none;
        }
        a {
            font-size:120%;
            color:#595959;
        }
    </style>
</head>
<body>
    
	<div class="panel panel-default">
            <div class="panel-heading"><h3>Appointment</h3></div>
            <div class="panel-body">
                <div class="container">
                    <div class="row">
                        <nav class="col-sm-3">
                            <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
                                <li><a href="${contextPath}/appointments.htm?action=view" target="right">View Appointment</a></li>
                                <li><a href="${contextPath}/appointments.htm?action=request" target="right">Upload Appointment</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>	
                            
        <div class="panel panel-default">
            <div class="panel-heading"><h3>Information</h3></div>
            <div class="panel-body">
                <div class="container">
                    <div class="row">
                        <nav class="col-sm-3">
                            <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
                                 <li><a href="${contextPath}/information.htm?action=edit" target="right">Edit Information</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
                            
        <div class="panel panel-default">
            <div class="panel-heading"><h3>Account</h3></div>
            <div class="panel-body">
                <div class="container">
                    <div class="row">
                        <nav class="col-sm-3">
                            <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
                                <li><a href="${contextPath}/account.htm" target="right">Change Password</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
                
        <br><br>
        <p style="text-align: center"><a href="${contextPath}/user/login.htm" class="btn btn-info btn-lg" target=_top>Log out</a></p>

</body>
</html>
