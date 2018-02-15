<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>

        <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/2.9.0/flags/1x1/gr.svg">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

        <link href="<c:url value="/resources/style/header_Style.css"/>" rel="stylesheet" type="text/css">
          <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/homepage_style.css"/> "/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/header_Style.css"/> "/>
     <link href="<c:url value="/resources/style/bootstrap.min.css"/>" rel="stylesheet" type="text/css">
     <link href="<c:url value="/resources/style/mdb.min.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/style/bootstrap.min.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/style/landing-page.min.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources/style/contact.css"/>" rel="stylesheet" type="text/css">
        
        <script type="text/javascript" src="<c:url value="/resources/script/script.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/script/script111.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/script/bounce.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/script/dashboardscript.js"/>"></script>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6ipyzfaDU_e7ZnFvZL1cs6SOyrKlNI8k&callback=myMap"></script>

        <title>Contact</title>

    </head>
    <body>
        
        <!-- Header -->

        <sec:authorize access="isAnonymous()">
            <jsp:include page="navigation_bar/nav_bar_simple.jsp" />
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
           c
        </sec:authorize>

        <sec:authorize access="hasRole('ROLE_CLIENT')">
            <jsp:include page="navigation_bar/nav_bar_client.jsp" />
        </sec:authorize>
        
        <sec:authorize access="hasRole('ROLE_MEMBER')">
            <jsp:include page="navigation_bar/nav_bar_members.jsp" />
        </sec:authorize>
        
        <!-- Page -->

        <div id="dashboard_panel">
            <div id="footer">
                <div id="contactPart" class="container-fluid bg-grey">
                    <h2 class="text-center">CONTACT</h2>
                    <div class="row">

                        <div id="infoFooter" class="col-sm-5">
                            <p>Contact us and we'll get back to you within 24 hours.</p>
                            <p><span class="glyphicon glyphicon-map-marker"></span> Athens, GR</p>
                            <p><span class="glyphicon glyphicon-phone"></span> +69 6969696969</p>
                            <p><span class="glyphicon glyphicon-envelope"></span> dont@email.com</p>
                        </div>

                        <form action="mailto:akourtis@hauniv.edu">
                            <div class="col-sm-7">
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <input style="font-size:18px;" class="form-control" id="name" name="name" placeholder="Name" type="text" required>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <input style="font-size:18px;"class="form-control" id="email" name="email" placeholder="Email" type="email" required>
                                    </div>
                                </div>
                                <textarea style="font-size:18px;" class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
                                <div class="row">
                                    <div class="col-sm-12 form-group">
                                        <button class="btn btn-success pull-right" type="submit">Send</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div id="googleMap"></div>     
        </div>
        <br><br><br>
 <jsp:include page="footer.jsp" />
<!--/.Footer-->
        <!-- Footer -->
    </body>
</html>