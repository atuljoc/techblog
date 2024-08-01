<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login_page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 89%, 75% 100%, 36% 93%, 0 100%);
            }
        </style>
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center bg-primary text-white banner-background" style="height: 70vh">
            <div class="container ">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                             <div class="card-header bg-dark text-white text-center">
                                <span class="fa fa-user-plus fa-2x"></span>
                                <p>Login here</p>

                                <%
                                    Message m = (Message) session.getAttribute("msg");
                                    if (m != null) {
                                %>
                                <div class="alert <%= m.getCssClass() %>" role="alert">
                                    <%= m.getContent() %>
                                </div>
                                <%
                                        session.removeAttribute("msg");
                                    }
                                %>
                            </div> 

                            <div class="card-body">
                                <form action="loginServlet" method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="container text-center"> 
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div> 

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- outer connection -->
    <scripts
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </body>
    </html>
