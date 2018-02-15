<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="windows-1253"%>

<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/homepage_style.css"/> "/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/header_Style.css"/> "/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/copyright.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/login.css"/>">

        <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <title>Register Page</title>

    </head>
    <body>
        
        <!-- Header -->
        <jsp:include page="navigation_bar/nav_bar_simple.jsp" />

     <div style=" padding: 0; width: 1280px; margin: auto; border: px solid black;" class="container">
            <div class="col-sm-12"  style="margin-top: 10px;">
                <div class="jumbotron" style="background-color: lightgrey;">
                    <h1>Sign Up</h1> 
                    <p>Use your credentials to register to our the system.</p> 
                </div>
            </div>

            <form class="form-horizontal col-sm-6" onsubmit="return check();" action="/complete_register" method="POST" style="margin-left: 30px;">
                <label style="font-size: 18px;" class="control-label" for="name">NAME</label>
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter username">
                    </div>
                </div>
                <p class="help-block">Please provide your name</p>
                <label style="font-size: 18px;" class="control-label" for="password">PASSWORD</label>
                <div class="form-group">
                    <div class="col-sm-10"> 
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
                    </div>
                </div>
                <p class="help-block">Please provide your password</p>
                <label style="font-size: 18px;" class="control-label" for="password">CONFIRM PASSWORD</label>
                <div class="form-group">
                    <div class="col-sm-10"> 
                        <input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="Confirm password">
                    </div>
                </div>
                <p class="help-block">Please confirm your password</p>
                <label style="font-size: 18px;" class="control-label" for="email">E-MAIL</label>
                <div class="form-group">
                    <div class="col-sm-10"> 
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter e-mail">
                    </div>
                </div>
                <p class="help-block">Please provide your e-mail</p>
                <label style="font-size: 18px;" class="control-label" for="address">ADDRESS</label>
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="address" name="address" placeholder="Enter address">
                    </div>
                </div>
                <p class="help-block">Please provide your address</p>
                <div class="form-group"> 
                    <div class="col-sm-offset-5 col-sm-10">
                        <button type="submit" style="background-color: black; color: white;" class="btn btn-default col-sm-4" id="submit" name="submit">Submit</button>
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <c:if test="${not empty exists}">
                    <div>
                        <div class="alert alert-danger">
                            <strong>This username already exists.</strong> Please use another one.
                        </div>
                    </div>
                </c:if>
                
                <div class="alert alert-danger" id="alert">
                    <strong>Error!</strong> Please fill with your info all the inputs.
                </div>
                
                <div class="alert alert-danger" id="alert2">
                    <strong>Error!</strong> Please enter confirm password correctly.
                </div>
        </div>

        <div style="margin:60px;"></div>

        <!-- Footer -->

        <script>

            $("document").ready(function() {
                $("#alert").hide();
                $("#alert2").hide();
            });

            function check()
            {
                var check = 1;
                var pass = 1
                
                if ($("#name").val() === "")
                {
                    check = 2;
                    $("#name").css("border", "1px solid #f00");
                }
                else
                    $("#name").css("border", "1px solid #ccc");

                if ($("#password").val() === "")
                {
                    check = 2;
                    $("#password").css("border", "1px solid #f00");
                }
                else
                    $("#password").css("border", "1px solid #ccc");

                if ($("#cpassword").val() === "")
                {
                    pass = 2;
                    check = 2;
                    $("#cpassword").css("border", "1px solid #f00");
                }
                else
                    $("#cpassword").css("border", "1px solid #ccc");

                if ($("#email").val() === "")
                {
                    check = 2;
                    $("#email").css("border", "1px solid #f00");
                }
                else
                    $("#email").css("border", "1px solid #ccc");

                if ($("#address").val() === "")
                {
                    check = 2;
                    $("#address").css("border", "1px solid #f00");
                }
                else
                    $("#address").css("border", "1px solid #ccc");

                if (check === 1)
                    $("#alert").hide();
                else
                    $("#alert").show();


                if ($("#password").val() !== $("#cpassword").val())
                {
                    $("#cpassword").css("border", "1px solid #f00");   
                    $("#alert2").show();
                    check = 3;
                }
                else if (check === 2 && $("#password").val() === $("#cpassword").val())
                {
                    
                    $("#alert2").hide();
                }
                else
                {
                    $("#address").css("border", "1px solid #ccc");
                    $("#alert2").hide();
                }
                
                if (check === 1)
                    return true;
                else
                    return false;
            }
            
        </script>

    </body>
</html>
