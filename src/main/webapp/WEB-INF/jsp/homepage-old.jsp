<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>

        <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/2.9.0/flags/1x1/gr.svg">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

        <link href="<c:url value="/resources/style/homepage_style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/header_Style.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/footer.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/copyright.css"/>" rel="stylesheet" type="text/css">

        <script type="text/javascript" src="<c:url value="/resources/script/script.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/script/script111.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/script/bounce.js"/>"></script>

        <title>Homepage</title>

    </head>
    <body>

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

        <div id="layer1">
            <div class="container">
                <div class="carousel slide" data-ride="carousel" id="myCarousel">
                    <div class="carousel-inner">
                        <div class="item active"><img alt="Los Angeles" src="<c:url value="/resources/images/img10.jpeg"/>" style="width: 100%"></div>
                        <div class="item"><img alt="Chicago" src="<c:url value="/resources/images/img20.jpeg"/>" style="width: 100%"></div>
                        <div class="item"><img alt="New york" src="<c:url value="/resources/images/img30.jpg"/>" style="width: 100%"></div>
                        <div class="item"><img alt="New york" src="<c:url value="/resources/images/img40.jpg"/>" style="width: 100%"></div>
                    </div><!-- Left and right controls -->
                    <a class="left carousel-control" data-slide="prev" href="#myCarousel"><span class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span></a> <a class="right carousel-control" data-slide="next" href="#myCarousel"><span class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span></a>
                </div>
            </div>

        </div>

        <div id="layer2">
            <div class="text_layer2">
                <h1><strong>Welcome to our website </strong></h1>
                <p>Spicy jalapeno bacon ipsum dolor amet deserunt tail consectetur, turkey t-bone doner ribeye id kielbasa pariatur. Quis brisket ball tip reprehenderit dolore aliqua nostrud beef ribs bresaola sausage et. Porchetta drumstick in jerky prosciutto enim. Ea esse meatloaf, qui anim bacon capicola ham et pariatur ipsum beef enim t-bone brisket. Ad meatloaf filet mignon, eiusmod ut magna non incididunt short loin.</p>
                <button style="transition: 0.3s ease-out;" class="btn btn-default pull-left">Store</button>

                <div  id="infobtn">  <button style="transition: 0.3s ease-out; background-color: #FF4136; color: white; border: 1px;" class="animation-target btn btn-default pull-left">More info</button></div>

            </div>
        </div>
                    
        <div style=" font-size: 15px; font-family: Raleway;color: #FF4136 !important" id="layer5">
            <h1 style="text-align:center; color: #FF4136; letter-spacing: 1px;"><strong>Java coders keep you safe</strong></h1>
            <div style="margin-left: 130px; margin-top: 25px;" class="col-lg-3 col-md-1 mb-4">
                <div class="card">
                    <img class="card-img-top" src="http://placehold.it/200x185" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Trustworthy sellers</h4>
                        <p class="card-text">You can read their reviews and policies, and contact them with any questions</p>
                    </div>
                </div>
            </div>
            
            <div style="margin-left: 50px; margin-top: 25px;" class="col-lg-3 col-md-1 mb-4">
                <div class="card">
                    <img class="card-img-top" src="http://placehold.it/200x185" alt="">
                    <div class="card-body">
                        <h4 class="card-title">World-class security</h4>
                        <p class="card-text">Safeguarding your information is the top priority of our dedicated security experts</p>
                    </div>
                </div>
            </div>
            
            <div style="margin-left: 50px; margin-top: 25px;" class="col-lg-3 col-md-1 mb-4">
                <div class="card">
                    <img class="card-img-top" src="http://placehold.it/200x185" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Purchase protection</h4>
                        <p class="card-text">If anything goes wrong, our global support team has got your back</p>
                    </div>
                </div>
            </div>
            
        </div>

        <div class="layer">
            <div class="container text-center">
                <h2 style="font-size: 35px;">About us</h2>
                <p><em>We love serving our customer great products!</em></p>
                <p>We have created a fictional eshop website. Lorem ipsum. picy jalapeno bacon ipsum dolor amet deserunt tail consectetur, turkey t-bone doner ribeye id kielbasa pariatur. Quis brisket ball tip reprehenderit dolore aliqua nostrud beef ribs bresaola sausage et. Porchetta drumstick in jerky prosciutto enim. Ea esse meatloaf, qui anim bacon capicola ham et pariatur ipsum beef enim t-bone brisket. Ad meatloaf filet mignon, eiusmod ut magna non incididunt short loin..</p>

                <p>
                    <br>We have created a fictional eshop website. Lorem ipsum. picy jalapeno bacon ipsum dolor amet deserunt tail consectetur, turkey t-bone doner ribeye id kielbasa pariatur. Quis brisket ball tip reprehenderit dolore aliqua nostrud beef ribs bresaola sausage et. Porchetta drumstick in jerky prosciutto enim. Ea esse meatloaf, qui anim bacon capicola ham et pariatur ipsum beef enim t-bone brisket. Ad meatloaf filet mignon, eiusmod ut magna non incididunt short loin..</p>
            </div>
        </div>
        <div id="layer3">
            <div class="container-fluid text-center">
                <h2 style="font-size: 35px;">What we are known for</h2>
                <br>
                <div class="row">
                    <div class="col-sm-4">
                        <span style="font-size: 40px; color: #FF4136;" class="glyphicon glyphicon-off"></span>
                        <h4>POWER</h4>
                        <p>Lorem ipsum dolor sit amet..</p>
                    </div>
                    <div class="col-sm-4">
                        <span style="font-size: 40px; color: #FF4136;" class="glyphicon glyphicon-heart"></span>
                        <h4>LOVE</h4>
                        <p>Lorem ipsum dolor sit amet..</p>
                    </div>
                    <div class="col-sm-4">
                        <span style="font-size: 40px; color: #FF4136;" class="glyphicon glyphicon-lock"></span>
                        <h4>JOB DONE</h4>
                        <p>Lorem ipsum dolor sit amet..</p>
                    </div>
                </div>
                <br><br>
                <div class="row">
                    <div class="col-sm-4">
                        <span style="font-size: 40px; color: #FF4136;" class="glyphicon glyphicon-leaf"></span>
                        <h4>GREEN</h4>
                        <p>Lorem ipsum dolor sit amet..</p>
                    </div>
                    <div class="col-sm-4">
                        <span style="font-size: 40px; color: #FF4136;" class="glyphicon glyphicon-certificate"></span>
                        <h4>CERTIFIED</h4>
                        <p>Lorem ipsum dolor sit amet..</p>
                    </div>
                    <div class="col-sm-4">
                        <span style="font-size: 40px; color: #FF4136;"  class="glyphicon glyphicon-wrench"></span>
                        <h4>HARD WORK</h4>
                        <p>Lorem ipsum dolor sit amet..</p>
                    </div>
                </div>
            </div>
        </div>
                    
        <!-- Footer -->
        
        <jsp:include page="footer.jsp" />

    </body>
</html>