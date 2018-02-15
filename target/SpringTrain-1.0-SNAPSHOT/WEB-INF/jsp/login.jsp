<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html" pageEncoding="windows-1253"%>

<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/homepage_style.css"/> "/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/header_Style.css"/> "/>
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <title>Login page</title>
        
    </head>
    <body>

        <!-- Header -->
        <jsp:include page="navigation_bar/nav_bar_simple.jsp" />

         <div style=" padding: 0; width: 1280px; margin: auto; border: px solid black;" class="container">
            <div class="col-sm-12"  style="width:1280px; margin: 10px auto;">
                <div class="jumbotron" style="background-color: lightgrey;">
                    <h1>Log In</h1> 
                    <p>Use your credentials to login to the system.</p> 
                </div>
            </div>

            <form name="loginForm" onsubmit="return check();" class="form-horizontal col-sm-12" style="margin-left: 30px;" action = "<c:url value='login' />" method="post" role="form">
                <label style="font-size: 18px; margin-left: 15px;" class="control-label" for="email">NAME</label>
                <div class="input-group col-xs-4">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user" style="font-size: 16px;"></i></span>
                    <input id="username" type="text" class="form-control" name="username" placeholder="Usename">
                </div>
                <p class="help-block">Please provide your name</p>

                <label style="font-size: 18px; margin-left: 15px;" class="control-label" for="password">PASSWORD</label>
                <div class="input-group col-xs-4" style="margin-top: 8px;">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock" style="font-size: 16px;"></i></span>
                    <input id="password" type="password" class="form-control" name="password" placeholder="Password">
                </div>
                <p class="help-block">Please provide your password</p>
                <br>
                <div class="form-group"> 
                    <div class="col-sm-8 col-sm-offset-1">
                        <button type="submit" style="background-color: black; color: white;" class="btn btn-default col-sm-4" id="submit" name="submit">Submit</button>
                    </div>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <c:if test="${not empty error}">
                    <div>
                        <div class="alert alert-danger">
                            <strong>Wrong credentials</strong> Please try again.
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty msg}">
                    <div class="msg">${msg}</div>
                </c:if>
                    
                <div class="alert alert-danger" id="alert">
                    <strong>Error!</strong> Please fill with your info all the inputs.
                </div>
                    
            </form>
        </div>
                
        <div style="margin:60px;"></div>
        
        <script>

            $("document").ready(function() {
                $("#alert").hide();
            });

            function check()
            {
                var check = 1;
                
                if ($("#username").val() === "")
                {
                    check = 2;
                    $("#username").css("border", "1px solid #f00");
                }
                else
                    $("#username").css("border", "1px solid #ccc");

                if ($("#password").val() === "")
                {
                    check = 2;
                    $("#password").css("border", "1px solid #f00");
                }
                else
                    $("#password").css("border", "1px solid #ccc");

                if (check === 1)
                    $("#alert").hide();
                else
                    $("#alert").show();

                if (check === 1)
                    return true;
                else
                    return false;
            }
            
        </script>
    </body>
</html>
