<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="windows-1253"%>

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

        <title>Confirm Products</title>

    </head>
    <body>
         <div>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <jsp:include page="navigation_bar/nav_bar_admin.jsp" />
                </sec:authorize>

            </div>
        <div id="constraint">

            <!-- Left Panel -->
            
            <div id="panel">
                <div id="leftSide">
                    <div style="margin-top: 50px;" class="categoriesPart">
                        <p><strong>Members</strong></p>
                        <button type="button" class="btn active" onclick="filterSelection('all')">All</button>
                        <c:forEach items="${members}" var="member">
                            <button type="button" class="btn" onclick="filterSelection('${member.id}')">${member.username}</button>
                        </c:forEach>
                    </div>
                </div>

                <!-- Products -->
                
                <div  id="containerItems">
                    <div id="inBetween">
                        <c:forEach items="${products}" var="product">
                            <div class="filterDiv ${product.userses}">
                                <div  class="containerOfItem3">
                                    <div class="span4">
                                        <div class="thumbnail">
                                            <img style="height:170px;" src="${product.getImage()}" alt="post image">
                                            <div style="height:200px !important; text-align:center;"  class="caption">
                                                
                                                <h3 class="">${product.getName()}</h3>
                                                
                                                <p class="">${product.getDescription()}</p>
                                                
                                                <form class="form-horizontal col-sm-6" action="/admin/confirmCheck/${product.getId()}" method="POST" style="margin-left: 30px;"> 
                                                    
                                                    <div class="row-fluid">
                                                        <div class="form-group">
                                                            <div class="col-sm-15"> 
                                                                <input type="number" class="form-control" id="price" name="price" placeholder="Give price"  required> 
                                                            </div>
                                                        </div>                                                       
                                                    </div> 
                                                    
                                                    <div class="form-group"> 
                                                        <div class="col-sm-offset-1 col-sm-10">
                                                            <button type="submit" style="background-color: black; color: white;" class="btn btn-default col-sm-12" id="submit" name="submit">Go Live</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    
                                                </form>
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