<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="windows-1253"%>
<%@ page session="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>

        <link href="<c:url value="/resources/style/header_Style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/transcactions.css"/>" rel="stylesheet" type="text/css">

        <link rel="stylesheet" type="text/css" media="screen" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href="./css/prettify-1.0.css" rel="stylesheet">
        <link href="./css/base.css" rel="stylesheet">
        <link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src = "https://code.highcharts.com/highcharts.js"></script> 
        <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
        <script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
        <style type="text/css">.table-responsive{margin-top:25px;};</style>

        <title>All Sales</title>

    </head>
    <body>
        <div>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <jsp:include page="navigation_bar/nav_bar_admin.jsp" />
            </sec:authorize>

        </div> 
        <div class="container">

            <div class="jumbotron" style="background-color: lightgrey; text-align: center; margin-top: 20px;">
                <h1>Sales</h1> 
            </div>
            
            <div class="row">
            <form class="form-inline col-md-9" action="datesales" method="POST">

                <div class='col-md-4' style="margin-right:30px;">
                    <p>Start date:</p>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker6' >
                            <input type='text' class="form-control" id="date1" name="date1"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar " style="font-size: 18px; "></span>
                            </span>
                        </div>
                    </div>
                </div>
                
                <div class='col-md-4'>
                    <p>End date:</p>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker7' >
                            <input type='text' class="form-control" id="date2" name="date2"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar" style="font-size: 18px;"></span>
                            </span>
                        </div>
                    </div>
                </div>

                <script type="text/javascript">
                    $(function() {
                        $('#datetimepicker6').datetimepicker({
                            format: "YYYY-MM-DD HH:mm:ss"
                        });
                        $('#datetimepicker7').datetimepicker({
                            format: "YYYY-MM-DD HH:mm:ss"

                        });
                        $("#datetimepicker6").on("dp.change", function(e) {
                            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
                        });
                        $("#datetimepicker7").on("dp.change", function(e) {
                            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
                        });
                    });
                </script>
                
                <p style="visibility: hidden;">   Speraaaaaaaa </p>
               <button type="submit" style="background-color: black; color: white;" class="btn btn-default col-sm-2" id="submit" name="submit">Submit</button>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
            </div>

            <div class="row">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center">Order Id</th>
                                <th class="text-center">Product</th>
                                <th class="text-center">Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orders}" var="order">
                                <tr>

                                    <td class="text-center">${order.getOrders().getId()}</td>
                                    <td class="text-center">${order.getProducts().getName()}</td>
                                    <td class="text-center">${order.getQuantity()}</td> 
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>