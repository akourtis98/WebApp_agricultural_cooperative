<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="windows-1253"%>
<%@ page session="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/homepage_style.css"/> "/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/header_Style.css"/> "/>
   <link href="<c:url value="/resources/style/bootstrap.min.css"/>" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <title>Products Sale</title>

    </head>
    <body>
       

            <!-- Header -->


            <sec:authorize access="hasRole('ROLE_MEMBER')">
                <jsp:include page="navigation_bar/nav_bar_members.jsp" />
            </sec:authorize>
    <div style=" padding: 0; width: 1280px; margin: auto; border: px solid black;" class="container">
            <div class="col-sm-12"  style="margin-top: 0px;">
                <div class="jumbotron" style="border:
                      px solid black; width: 1280px; margin: auto; background-color: lightgrey;">
                    <h1 >Products Sale</h1> 
                    <p>Sell your products member here!</p> 
                </div>
            </div>

            <form style="margin-top:10px !important;" class="form-horizontal col-sm-6" action="/member/sellProduct" method="POST" onsubmit="return check();">


                <div class="form-group"> 
                    <label class="control-label col-sm-2" for="name">Product:</label>
                    <div class="col-sm-10"> 
                        <select id="name" name="name" class="selectpicker form-control" data-size="5">
                            <option value="olives">Olives</option>
                            <option value="tomatoes">Tomatoes</option>
                            <option value="onions">Onions</option>
                            <option value="milk">Milk</option>
                            <option value="yogurt">Yogurt</option>
                            <option value="pheta">Cheese</option>
                        </select>

                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="price">Price:</label>
                    <div class="col-sm-10"> 
                        <input type="text" class="form-control" id="price" name="price" placeholder="Enter price">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="quantity">Quantity</label>
                    <div class="col-sm-10"> 
                        <input type="text" class="form-control" id="quantity" name="quantity" placeholder="Enter quantity">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="description">Description</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="description" name="description" placeholder="Enter description">
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" style="background-color: black; color: white;" class="btn btn-default col-sm-4" id="submit" name="submit">Sell Product</button>
                    </div>
                </div>

                <div class="alert alert-danger" id="alert">
                    <strong>Error!</strong> Please fill with your info all the inputs.
                </div>

                <div class="alert alert-danger" id="alert2">
                    <strong>Error!</strong> Please insert arithmetic inputs.
                </div>
            </form>


            <script>

                $("document").ready(function () {
                    $("#alert").hide();
                    $("#alert2").hide();
                });

                function check()
                {
                    var check = 1;
                    var check2 = 1

                    // Check if inputs are empty

                    if ($("#price").val() === "")
                    {
                        check = 2;
                        $("#price").css("border", "1px solid #f00");
                    } else
                        $("#price").css("border", "1px solid #ccc");

                    if ($("#quantity").val() === "")
                    {
                        check = 2;
                        $("#quantity").css("border", "1px solid #f00");
                    } else
                        $("#quantity").css("border", "1px solid #ccc");

                    if ($("#description").val() === "")
                    {
                        check = 2;
                        $("#description").css("border", "1px solid #f00");
                    } else
                        $("#description").css("border", "1px solid #ccc");

                    if (check === 1)
                        $("#alert").hide();
                    else
                        $("#alert").show();

                    // Check if inputs are arithetic values

                    if (isNaN($("#price").val()))
                    {
                        $("#price").css("border", "1px solid #f00");
                        $("#alert2").show();
                        check2 = 3;
                    }

                    if (isNaN($("#quantity").val()))
                    {
                        check2 = 3;
                        $("#quantity").css("border", "1px solid #f00");
                        $("#alert2").show();
                    }

                    if (check2 === 1)
                    {
                        $("#address").css("border", "1px solid #ccc");
                        $("#alert2").hide();
                    }

                    // Return true if all are okay

                    if (check === 1 && check2 === 1)
                        return true;
                    else
                        return false;
                }

            </script>
    </body>
</html>
