<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
	
        <link href="style/header_Style.css" rel="stylesheet" type="text/css">
		
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,800" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/2.9.0/flags/1x1/gr.svg">
		
    </head>
    <body>
	
        <div id="pre_header">
            <div id="logoPlaceHolder"></div>
            <div id="iconsConatiner"> 
                
             
                    
            </div>
        </div>
		 <div style="padding-top:8px;">
        <div class="header_constraint">
            <a href="/home"><p class="headings">Home</p></a> 
            <a href="/products"><p class="headings">Products</p></a> 
            <a href="/member/sell"><p class="headings">Sell Products</p></a> 
		   <form method="POST" action="/logout" style="float: right;">
                    <button type="submit" name="logout" id="logout" value="Logout" style=" background: none; padding: 0px; border: none;"><span class="marginIcons glyphicon glyphicon-log-out"></span></button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>
                
                <a href="/contact"><span class="marginIcons glyphicon">&#x2709;</span></a>
                <a href="/member/sell"><span class="marginIcons glyphicon">&#xe081;</span></a>
                <p class="marginIcons"><b>Member</b></p>
                <p class="marginIcons">${userName}
                        <security:authorize access="isAuthenticated()">
                            <security:authentication property="principal.username" /> 
                        </security:authorize>
                    </p>	
        </div>
   </div>
    </body>
</html>