<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style/emptylist.css"/> "/>
        
    </head>
    <body>
        <div style="text-align: center; margin-bottom: 100px;">
            
            <span class="glyphicon glyphicon-heart-empty myicon" style="font-size: 125px; color: gray; margin-top: 20px;"></span>
            <h1 class="bigheader" style="font-size: 60px;">Your list is empty</h1>
            <h6 class="smallheader" style="font-size: 25px;">You can your favorites items here</h6>
            
        </div>
    </body>
</html>
