<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html" pageEncoding="windows-1253"%>
<%@ page session="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>

        <link href="<c:url value="/resources/style/products_style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/header_Style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/categoryfilter.css"/>" rel="stylesheet" type="text/css">

        <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/2.9.0/flags/1x1/gr.svg">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <title>Products</title>

    </head>
    <body>

        <div id="constraint">

            <!-- Header -->

            <sec:authorize access="isAnonymous()">
                <jsp:include page="navigation_bar/nav_bar_simple.jsp" />
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <jsp:include page="navigation_bar/nav_bar_admin.jsp" />
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_CLIENT')">
                <jsp:include page="navigation_bar/nav_bar_client.jsp" />
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_MEMBER')">
                <jsp:include page="navigation_bar/nav_bar_members.jsp" />
            </sec:authorize>

            <!-- Left Panel -->
            <div id="panel">
                <div id="leftSide">
                    <div style="margin-top: 25px; margin-bottom: 10px" class="categoriesPart">
                        <p><strong>Categories</strong></p>
                        <button type="button" class="btn active" onclick="filterSelection('all')">All</button>
                        <button type="button" class="btn" onclick="filterSelection('1')">Organic</button>
                        <button type="button" class="btn" onclick="filterSelection('2')">Dairy</button>
                    </div>
                </div>

                <c:if test="${not empty existsws}">
                    <div>
                        <div class="alert alert-danger col-sm-8" style="margin-top: 25px; float: none; margin: auto;">
                            <strong>This item is already in wishlist.</strong> Please can not store it twice.
                        </div>
                    </div>
                </c:if>

                <!-- Products -->

                <div id="containerItems">
                    <div id="inBetween">
                        <c:forEach items="${products}" var="product" varStatus="status">
                            <div class="filterDiv ${product.categories.id}">
                                <div class="containerOfItem3">

                                    <div class="span4">
                                        <div class="thumbnail">
                                            <img style="height:170px" src="${product.getImage()}" alt="post image">
                                            <div class="caption">
                                                <h3 class="">${product.getName()}</h3>
                                                <p class="">${product.getDescription()}</p>
                                                <c:forEach items="${product.getUserses()}" var="users">
                                                <p class="" style="font-weight: bold">Member: ${users.getUsername()}</p>
                                                </c:forEach>
                                                <div class="row-fluid">
                                                    <div class="span6">
                                                        <p class="lead">${product.getPrice()} €</p>
                                                    </div>

                                                    <sec:authorize access="hasRole('ROLE_CLIENT')">

                                                        <div class="span6">
                                                            <a class="btn btn-danger btn-block" href="<c:url value="/client/inserItem/"/>${products[status.index].getId()}">Add to wishlist</a>
                                                            <a class="btn btn-success btn-block" href="<c:url value="/client/addcart/"/>${product.getId()}/1">Add to cart</a>
                                                        </div>

                                                    </sec:authorize>

                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                    <script src="/resources/script/filtercategory.js"></script>
                </div>
            </div>
        </div>
        
    </body>
</html>