
<%@page import="java.lang.Exception"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 89%, 75% 100%, 36% 93%, 0 100%);
                background: #FFD700;
            }
        </style>
    </head>
    <body>
        <div class="container text-center">
            <img src="images/computer.png" class="img-fluid">
            <h2 class="display-3">Sorry! Something went Wrong</h2>
            <%= exception%>
            <a href="index.jsp" class="mt-3 btn bg-primary display-3">Home</a>
        </div>
    </body>
</html>
