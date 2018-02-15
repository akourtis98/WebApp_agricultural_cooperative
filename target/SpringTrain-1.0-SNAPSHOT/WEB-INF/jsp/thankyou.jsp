<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

        <link href="<c:url value="/resources/style/homepage_style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/header_Style.css"/>" rel="stylesheet" type="text/css">

        <title>Registration completed</title>

    </head>
    <body>

        <!-- Header -->

        <sec:authorize access="isAnonymous()">
            <jsp:include page="navigation_bar/nav_bar_simple.jsp" />
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <jsp:include page="navigation_bar/nav_bar_admin.jsp" />
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_MEMBER')">
            <jsp:include page="navigation_bar/nav_bar_members.jsp" />
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_CLIENT')">
            <jsp:include page="navigation_bar/nav_bar_client.jsp" />
        </sec:authorize>

        <div class="container" style="text-align: center;">
            <div class="jumbotron text-xs-center">
                <h1 class="display-3">Thank You!</h1>
                <p class="lead"><strong>${message1}</strong>${message2}</p>
                <hr>
                <p>
                    If you have any question please <a href="/contact">Contact us</a>
                </p>
                <p class="lead">
                    <a class="btn btn-primary btn-lg" href="/home" role="button">Continue to homepage</a>
                </p>
            </div>
        </div>
                
    </body>
</html>
