<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="windows-1253"%>

<!DOCTYPE html>
<html>
    <head>

        <link href="<c:url value="/resources/style/products_style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/header_Style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/categoryfilter.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/transcactions.css"/>" rel="stylesheet" type="text/css">

        <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/2.9.0/flags/1x1/gr.svg">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style type="text/css">.table-responsive{margin-top:25px;};</style>

        <title>All Transactions</title>

    </head>
    <body>
        <div>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <jsp:include page="navigation_bar/nav_bar_admin.jsp" />
            </sec:authorize>

        </div>

           <div style=" padding: 0; width: 1280px; margin: auto; border: px solid black;" class="container">

            <div class="jumbotron" style="background-color: lightgrey;">
                <h1>All Transactions</h1> 

            </div>

            <div class="row">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">From</th>
                                <th class="text-center">To</th>
                                <th class="text-center">Amount</th>
                                <th class="text-center">Date</th>
                                <th class="text-center">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${transactions}" var="transaction">
                                <tr>

                                    <td>${transaction.getId().toString()}</td>
                                    <td>${transaction.usersByFromId.username}</td>
                                    <td>${transaction.usersByToId.username}</td>
                                    <td>${transaction.amount} €</td>
                                    <td>${transaction.transactionDate}</td>
                                    <td><span class="label label-info">Completed</span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
