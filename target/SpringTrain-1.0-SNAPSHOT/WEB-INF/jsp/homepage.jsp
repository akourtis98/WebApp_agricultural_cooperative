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

        <link href="<c:url value="/resources/style/header_Style.css"/>" rel="stylesheet" type="text/css">
   <link href="<c:url value="/resources/style/bootstrap.min.css"/>" rel="stylesheet" type="text/css">
   <link href="<c:url value="/resources/style/landing-page.min.css"/>" rel="stylesheet" type="text/css">
   <link href="<c:url value="/resources/style/mdb.min.css"/>" rel="stylesheet" type="text/css">
           <link href="<c:url value="/resources/style/homepage_style.css"/>" rel="stylesheet" type="text/css">
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
        
<a href="#" class="scrollToTop"><span style="color: white" class="glyphicon glyphicon-arrow-up"></span>  
</a>
        <div style="width: 1280px;
    height: 650px;
    position: relative;
    top: px;
    margin: auto;" id="layer1">
            
            <div style="width: 1280px !important; border: px solid red;
    height: 650px !important;
    padding: 0px !important; margin: auto !important;" class="">
                <div class="carousel slide" data-ride="carousel" id="myCarousel">
                    <div style=" height: 650px !important;
    width: 1280px !important;" class="carousel-inner">
                         <div class="item active"><img alt="Los Angeles" src="https://images.pexels.com/photos/53588/tomatoes-vegetables-food-frisch-53588.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb" style="width: 100% "></div>
                        <div class="item"><img alt="Chicago" src="https://images.unsplash.com/photo-1512485209041-5bacefbdf80a?ixlib=rb-0.3.5&s=0cb29d520d9057d145c5ad73908e011b&auto=format&fit=crop&w=1350&q=80" style="width: 100%"></div>
                        <div class="item"><img alt="New york" src="https://healthnewshub.org/wp-content/uploads/2017/11/Newsmilkprostate.jpg" style="width: 100%"></div>
                        <div class="item"><img alt="New york" src="https://cms.splendidtable.org/sites/default/files/styles/w2000/public/ThinkstockPhotos-453653835.jpg?itok=GpXg-bEZ" style="width: 100%"></div>
                    </div><!-- Left and right controls -->
                    <a class="left carousel-control" data-slide="prev" href="#myCarousel"><span class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span></a> <a class="right carousel-control" data-slide="next" href="#myCarousel"><span class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span></a>
                </div>
            </div>

        </div>

     
                    
      
                    <div style="border: px solid red; margin: auto;" class="container">
                            
      <div class="row">
        <div class="col-sm-8">
          <h2 class="mt-4" style="color: #333 !important;">What We Do</h2>
          <p style="width:600px;">We specialize at providing people with the best quality products varying from dairy to vegetables. Our business has been opersating for almost 2 weeks and since then we have achieved countless awards and nominations for our excellent services. </p>
          <p>You can check out all our  items for sale by clicking the button below.</p>
          <p>
            <a class="btn btn-success btn-lg" href="#">Go to products &raquo;</a>
          </p>
        </div>
        <div class="col-sm-4">
          <h2 class="mt-4">Contact Us</h2>
          <address>
            <strong>Food Bootcampers</strong>
            <br>Beverly Hills, CA 90210
            <br>
          </address>
          <address>
            <abbr title="Phone">P:</abbr>
            (123) 456-7890
            <br>
            <abbr title="Email">E:</abbr>
            <a href="mailto:#">foodbootcampers@gmail.com</a>
          </address>
        </div>
      </div>
        </div>  
                                                 
                      
                            
                            <div style="border: px solid red; margin: auto;" class="container">
                            
                          <h2 style="color: #333 !important;">Our services!</h2>
                                <section class="showcase">
      <div class="container-fluid p-0">
        <div class="row no-gutters">
          <div class="col-lg-4 order-lg-3 text-white showcase-img" style="background-image: url(https://us.123rf.com/450wm/merfin/merfin1605/merfin160502508/57445034-concept-illustration-for-shop-supermarket-supermarket-banner-flat-set-with-online-purchase-buying-el.jpg?ver=6);"></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>For clients </h2>
            <p class="lead mb-0">When you create an account as a client you are instantly eligible to purchase any item that you fancy without any limititations. Hesitate not!</p>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-4 order-lg-2 text-white showcase-img" style="background-image: url(https://thumbs.dreamstime.com/z/human-hand-gives-money-bag-to-another-person-payment-banking-poster-vector-illustration-54884513.jpg)"></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>For members </h2>
            <p class="lead mb-0">The members are our suppliers. We cooperate with the most well known and trustworthy businesses to make sure we will never let down our precious clients.</p>
          </div>
        </div>
      </div>
    </section>
       
                              <section style='background-color: white !important; border: px solid red' class="testimonials text-center bg-light">
      <div   class="container">
          <h2 class="mb-5" style="color: #333 !important; "><b>What our customers are saying...</b></h2>
        <div style="margin-top: 5px;" class="row">
          <div class="col-lg-4">
              <img style='border-radius: 50%; width:180px; height:160px;' class="img-fluid rounded-circle" src="https://pbs.twimg.com/media/CZ6jSP_WAAE7Vkv.jpg" alt="">
              <h4>Kim Jong Un</h4>
              <p class="font-weight-light mb-0"><blockquote>There is nothing better than communism, nuclear bombs and greek feta.</blockquote></p>
          </div>
          <div class="col-lg-4">
              <img style='border-radius: 50%; width:180px; height:160px;' style="width:230px; height: 120px;" class="img-fluid rounded-circle" src="https://hypb.imgix.net/image/2018/01/barack-obama-shares-favorite-songs-of-2017-list-1.jpg?q=75&w=800&fit=max&auto=compress%2Cformat" alt="">
              <h4>Barack Obama</h4>
              <p class="font-weight-light mb-0"><blockquote>I plan on using that greek olive oil and them tomatoes to make America great again.</blockquote></p>
            </div>
          <div class="col-lg-4">
              <img style='border-radius: 50%; width:180px; height:160px;' style="width:230px; height: 120px;" class="img-fluid rounded-circle" src="http://www.slate.com/content/dam/slate/uploads/2015/9/3/trump_finger.jpg.CROP.promo-xlarge2.jpg" alt="">
              <h4>Donald Trump</h4>
              <p class="font-weight-light mb-0"> <blockquote>Your onions make our breaths smell so bad no mexican wants to come near us. Thanks guys!</blockquote></p>
          </div>
        </div>
      </div>
    </section>  
                       
  
                        </div>
                     <div style="margin-top: 0px;" class="pimg3">
    <div class="ptext">
      <span style="border:px solid white; background-color: transparent;" class="border">
          Let's make the first step <strong>ther</togestrong>
      </span>
    </div></div>  
        <section style="text-align: center !important; height: 180px;" class="call-to-action text-white text-center">
            <a style="text-decoration: none;" href="/products"> <button id="testbutn" style="width:150px;height:49px; margin:auto; border: 1px solid #929fba; background-color: #929fba;" type="submit" class="btn btn-block btn-lg">Shop! &raquo;</button></a>
    </section>
   
              <footer class="page-footer center-on-small-only unique-color-dark pt-0">

    <div style="background-color: #929fba">
        <div class="container">
            <!--Grid row-->
            <div class="row py-4 d-flex align-items-center">

                <!--Grid column-->
                <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                    <h4 class="mb-0 white-text">Get connected with us on social networks!</h4>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div style=";" class="col-md-6 col-lg-7 text-center text-md-right">
                    <!--Facebook-->
                    <a class="icons-sm fb-ic ml-0"><i style="font-size:31px;" class="fa fa-facebook white-text mr-lg-4"> </i></a>
                    <!--Twitter-->
                    <a class="icons-sm tw-ic"><i style="font-size:31px;"class="fa fa-twitter white-text mr-lg-4"> </i></a>
                    <!--Google +-->
                    <a class="icons-sm gplus-ic"><i style="font-size:31px;"class="fa fa-google-plus white-text mr-lg-4"> </i></a>
                    <!--Linkedin-->
                    <a class="icons-sm li-ic"><i style="font-size:31px;"class="fa fa-linkedin white-text mr-lg-4"> </i></a>
                    <!--Instagram-->
                    <a class="icons-sm ins-ic"><i style="font-size:31px;"class="fa fa-instagram white-text mr-lg-4"> </i></a>
                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->
        </div>
    </div>

    <!--Footer Links-->
    <div  class="container mt-5 mb-4 text-center text-md-left">
        <div class="row mt-3">

            <!--First column-->
            <div class="col-md-3 col-lg-4 col-xl-3 mb-r">
                <h6 class="title font-bold"><strong>Food bootcampers</strong></h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>Here are some helpful links to learn more about us, our services & our products. Our company's goal and priority is to serve the customer 
                the healthiest food at the most competitive price. We strive everyday to make this a reality. Thank you!</p>
            </div>
            <!--/.First column-->

            <!--Second column-->
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-r">
                <h6 class="title font-bold"><strong>Products</strong></h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p><a href="#!">Vegetables</a></p>
                <p><a href="#!">Dairy</a></p>
                <p><a href="#!">Fruits</a></p>
                <p><a href="#!">Almonds</a></p>
            </div>
            <!--/.Second column-->

            <!--Third column-->
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-r">
                <h6 class="title font-bold"><strong>Info </strong></h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p><a href="#!">About us </a></p>
                <p><a href="#!">Terms of service</a></p>
                <p><a href="#!">Shipping Rates</a></p>
                <p><a href="#!">Shipping information</a></p>
            </div>
            <!--/.Third column-->

            <!--Fourth column-->
            <div class="col-md-4 col-lg-3 col-xl-3">
                <h6 class="title font-bold"><strong>Contact</strong></h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p><i class="fa fa-home mr-3"></i> Beverly Hills, CA 90210S</p>
                <p><i class="fa fa-envelope mr-3"></i> foodbootcampers@gmail.com</p>
                <p><i class="fa fa-phone mr-3"></i> + (123) 456-7890</p>
                <p><i class="fa fa-print mr-3"></i> + 01 234 567 89</p>
            </div>
            <!--/.Fourth column-->

        </div>
    </div>
    <!--/.Footer Links-->

    <!-- Copyright-->
    <div class="footer-copyright">
        <div class="container-fluid">
            © 2017 Copyright: <a href="#"><strong> foodbootcampers.com</strong></a>
        </div>
    </div>
    <!--/.Copyright -->
    
</footer>


        <!--Footer-->

<!--/.Footer-->
    </body>
</html>