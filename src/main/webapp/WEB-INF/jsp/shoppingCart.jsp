<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/header_Style.css"/> "/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/shopping_cart.css"/> "/>

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <title>Shopping Cart</title>

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
            <table id="cart" class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width:50%">Product</th>
                        <th style="width:10%">Price</th>
                        <th style="width:8%">Quantity</th>
                        <th style="width:22%" class="text-center">Subtotal</th>
                        <th style="width:10%"></th>
                    </tr>
                </thead>

                <!-- Variable to compute the total price of all items -->

                <c:set var = "totalPrice" value = "${0}"/>

                <tbody>

                    <!-- Loop for all products -->

                    <c:forEach items="${products}" var="product" varStatus="status">

                        <tr>

                            <td data-th="Product">
                                    <div class="col-sm-2 hidden-xs"><img src="${product.getProducts().getImage()}" class="img-responsive"/></div>
                                    <div class="col-sm-10">
                                        <h4 class="nomargin">${product.getProducts().getName()}</h4>
                                        <p>${product.getProducts().getDescription()}</p>
                                    </div>
                            </td>

                            <td data-th="Price">${product.getPrice()} €</td>

                            <!-- Change quantity of an item -->

                            <td data-th="Quantity">
                                <form id="quantityForm" action="" method="POST">
                                    <input type="number" id="quantity" class="form-control text-center quantity" <c:out value="value=${product.getQuantity()}"/> />
                                    <input type="hidden" id ="name" name="id" value="${products[status.index].getProducts().getId()}" />
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>
                            </td>
                            
                            <td> Kg</td>
                            
                            <!-- Price * Quantity for each product -->

                            <td data-th="Subtotal" class="text-center">${product.getProducts().getPrice()*product.getQuantity()} €</td>

                            <!-- Delete an item from the cart-->

                            <td class="actions" data-th="">
                                <form action="<c:url value='/client/cart_delete/${products[status.index].getProducts().getId()}' />" method="POST">
                                    <button class="btn btn-danger btn-sm col-sm-6"><i class="fa fa-trash-o"></i></button>	
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>
                            </td>

                        </tr>

                        <!-- Compute total price and add result to totalPrice variable -->

                        <c:set var="totalPrice" value="${totalPrice + product.getProducts().getPrice()*product.getQuantity()}"/>
                    </c:forEach>

                </tbody>
                <tfoot>
                    <tr class="visible-xs">
                        <td class="text-center"><strong>Total <c:out value = "${totalPrice}"/> €</strong></td>
                    </tr>
                    <tr>
                        <td><a href="/products" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                        <td colspan="3" class="hidden-xs"></td>

                        <td class="hidden-xs text-center"><strong>Total <c:out value = "${totalPrice}"/> €</strong></td>
                        
                        <c:if test="${empty products}">
                            <td><button type="button" id="emptycartmessage" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></button> </td>
                        </c:if>
                            
                        <c:if test="${not empty products}">
                            <td><button type="button" class="btn btn-success btn-block" data-toggle="modal" data-target="#myModal">Checkout <i class="fa fa-angle-right"></i></button> </td>
                        </c:if>

                <!-- Modal -->

                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header text-center" style="background-color: black; color:white;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Do you want to complete your order ?</h4>
                            </div>
                            <div class="modal-body text-center" style="background-color: lightgray;">
                                <p style="font-size: 18px; margin-top: 50px; margin-bottom: 50px;">If you want to proceed to order payment press the green button</p>
                            </div>
                            <div class="modal-footer text-center" style="background-color: lightgray;">
                                <a href="/client/checkout/${totalPrice}" class="btn btn-success btn-sm-5">Proceed to checkout  <i class="fa fa-angle-right"></i></a>
                                <button type="button" class="btn btn-default btn-sm-5" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                </tr>
                </tfoot>
            </table>

            <!-- Loop for all products -->

            <c:if test="${not empty itemsDontExistList}">
                <c:forEach items="${itemsDontExistList}" var="item" varStatus="status">
                    <div>
                        <div class="alert alert-danger">
                            <strong>Product ${item[0]} has smaller quantity</strong> It's quantity is ${item[1]}
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <!-- If cart is empty show this jsp -->

            <c:if test="${empty products}">
                <jsp:include page="emptylist.jsp" />
            </c:if>
            
            <div class="alert alert-danger" id="alertemptycart">
                <strong>Error!</strong> Please fill with your info all the inputs.
            </div>

        </div>

        <!-- Script for changing form action to pass the appropriate path parameter to the controller -->

        <script>
            $(document).ready(function()
            {
                $("#alertemptycart").hide();
                
                $(".quantity").on('change', function() {
                    if ($("#quantity").val() < 1)
                        $("#quantity").val(1);

                    $(this).closest("form").attr('action', '/client/update_cart_quantity/' + $(this).siblings('#name').val() + "/" + $(this).closest("input").val());
                    $(this).closest("form").submit();
                });
                
                $("#emptycartmessage").on('click',function(){
                    $("#alertemptycart").show();
                });
            });
        </script>

    </body>
</html>
