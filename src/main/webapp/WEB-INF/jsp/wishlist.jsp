<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/header_Style.css"/> "/>

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <title>Wishlist</title>

    </head>
    <body>

        <!-- Header -->

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <jsp:include page="navigation_bar/nav_bar_admin.jsp" />
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_CLIENT')">
            <jsp:include page="navigation_bar/nav_bar_client.jsp" />
        </sec:authorize>


          <div style=" padding: 0; width: 1280px; margin: auto; border: px solid black;" class="container">

            <div class="col-sm-12"  style="margin-top: 10px;">
                <div class="jumbotron" style="background-color: lightgrey; height: 200px; text-align: center;">
                    <h1 style="margin-top: -10px;">Wishlist</h1> 
                    <p>In this list you can save your favorite products.</p> 
                </div>
            </div>

            <table id="cart" class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width:50%">Product</th>
                        <th style="width:10%">Price</th>
                        <th style="width:8%">Quantity</th>
                        <th style="width:10%"></th>
                    </tr>
                </thead>

                <!-- Variable to compute the total price of all items -->

                <c:set var = "totalPrice" value = "${0}"/>

                <tbody>

                    <!-- Loop for all products -->

                    <c:if test="${not empty products}">
                        <c:forEach items="${products}" var="product" varStatus="status">

                            <tr>

                                <td data-th="Product">
                                    <div class="row">
                                        <div class="col-sm-2 hidden-xs"><img src="${product.getImage()}" class="img-responsive"/></div>
                                        <div class="col-sm-10">
                                            <h4 class="nomargin">${product.getName()}</h4>
                                            <p>${product.getDescription()}</p>
                                        </div>
                                    </div>
                                </td>

                                <td data-th="Price">${products[status.index].getId()} €</td>

                                <td data-th="Quantity">${product.getQuantity()} Kg</td>

                                <!-- Add an item to the cart-->
                                
                                <td class="actions" data-th="" style="text-align: right;">
                                    
                                    <form action="<c:url value="/client/addcart/"/>${products[status.index].getId()}/1" method="POST" style="margin-left: 30px;">
                                        <button class="btn btn-success btn-sm"><i class="fa fa-shopping-cart"></i></button>	
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </form>
                                    
                                </td>   

                                <!-- Delete an item from the cart-->
                                
                                <td>
                                    
                                    <form action="<c:url value='/client/wishlist_delete/${products[status.index].getId()}' />" method="POST">
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>	
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </form>
                                    
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>

                </tbody>
            </table>

            <!-- If list is empty show this jsp -->
                
            <c:if test="${empty products}">
                <jsp:include page="emptylist.jsp" />
            </c:if>
                
        </div>

        <!-- Script for changing form action to pass the appropriate path parameter to the controller -->

        <script>
            $(document).ready(function()
                {
                    $(".quantity").on('change', function() {
                        if ($(".quantity").val() < 1)
                    $(".quantity").val(1);

                    $(this).closest("form").attr('action', '/client/update_quantity/' + $(this).siblings('#name').val() + "/" + $(this).closest("input").val());
                $(this).closest("form").submit();
            });
            });
        </script>

    </body>
</html>
