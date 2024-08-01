
<%@page import="com.tech.blog.helper.databaseconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech_blog</title>
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
        <!-- Navbar -->
        <%@include file="normal_navbar.jsp" %>
        <div class="container-fluid p-4 m-0 bg-primary text-white banner-background">
            <div class="jumbotron px-3 ">
                <div class="container">
                    <h3 class="display-3">Welcome,Friends</h3>
                    <h3>Skill_Tech</h3>
                    <p>Welcome in technical world,World of technology,Programming languages are described in terms of their syntax (form) and semantics (meaning), usually defined by a formal language. Languages usually provide features such as a type system, variables and mechanisms for error handling. An implementation of a programming language is required in order to execute programs, namely a compiler or an interpreter. An interpreter directly executes the source code, while a compiler produces an executable program.</p>
                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span> It's Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span> Login</a>
                </div>
            </div>
        </div>
        <br>
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">python Programming</h5>
                            <p class="card-text">Python is a high-level, interpreted programming language known for its readability and simplicity1</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java-script programming</h5>
                            <p class="card-text">JavaScript is a versatile, high-level programming language primarily used for creating dynamic and interactive content on web pages1.</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a high-level, object-oriented programming,s It is widely used for building web applications, mobile apps, and enterprise software</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"> PHP Scripting</h5>
                            <p class="card-text">PHP (Hypertext Preprocessor) is a widely-used, open-source scripting language designed for web development1</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">.NET Programming</h5>
                            <p class="card-text">.NET is a free, cross-platform, open-source developer platform for building a wide range of applications1..</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">C++ Programming</h5>
                            <p class="card-text">C++ is a high-level, general-purpose programming language developed by Bjarne Stroustrup as an extension of the C language1..</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    <scripts
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </body>
    </html>
