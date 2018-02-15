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

        <link href="<c:url value="/resources/style/products_style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/header_Style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/categoryfilter.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/transcactions.css"/>" rel="stylesheet" type="text/css">

        <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/2.9.0/flags/1x1/gr.svg">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style type="text/css">.table-responsive{margin-top:25px;};</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Share Money</title>
    </head>
    <body>
        <div>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <jsp:include page="navigation_bar/nav_bar_admin.jsp" />
                </sec:authorize>

            </div>
          <div style=" padding: 0; width: 1280px; margin: auto; border: px solid black;" class="container">
            

            <div class="jumbotron" style="background-color: lightgrey;">
                <h1>Share Money</h1> 
            </div> 

            <div class="row">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="text-align: center">ID</th>
                                <th style="text-align: center">Username</th>
                                <th style="text-align: center">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${accounts}" var="account">
                                <tr>

                                    <td>${account.getId()}</td>
                                    <td>${account.getUsers().getUsername()}</td>
                                    <td>${account.getAmount()} €</td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div> 
            <form action="/admin/shared" method="post">
                <button type="submit" class="btn confirmButton btn-lg">Share money</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
            
        </div>
            
    </body>
</html>
