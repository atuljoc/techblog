

<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.User"%>

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
        <!--Navbar start-->

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fa fa-flask"></span> Tech_BLOG</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"> <span class="fa fa-cubes"></span>Skill_Tech</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><span class="fa fa-volume-control-phone"></span> Contact</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fa fa-ellipsis-v"></span> categories
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#"><span class="fa fa-bug"></span> Programming languages</a></li>
                                <li><a class="dropdown-item" href="#"><span class="fa fa-code-fork"></span>Project implementation</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#"><span class="fa fa-code"></span>Data Structure & Algorithms</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-disabled="true"><span class="fa fa-user-plus"></span>Contact</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <%
                                User currentUser = (User) session.getAttribute("currentUser");
                            %>
                            <a  class="nav-link" href="#!" data-bs-toggle="modal"data-bs-target="#exampleModal" aria-disabled="true"><span class="fa fa-user-circle-o"></span><%= currentUser != null ? currentUser.getName() : "Guest"%></a>
                        </li> 
                        <li class="nav-item">
                            <a href="logoutservlet" class="nav-link" aria-disabled="true"><span class="fa fa-user-plus"></span>Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--Container-->
        <div class="container-fluid bg-primary banner-background " style="height: 550px" >

        </div>

        <!--Navbar end-->

        <!--Model Start-->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h1 class="modal-title fs-5 " id="exampleModalLabel" >TechBlog</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center" style="border-radius: 50%">
                            <img style="height: 70px; width:70px; border-radius:50%" src="pics/<%=currentUser.getProfile()%> ";
                                 <br>
                            <h1 class="modal-title fs-5 " id="exampleModalLabel" ><%=currentUser.getName()%></h1>
                            <div id="profile-details">
                                <table class="table">
                                    <thead>

                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%=currentUser.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Name:</th>
                                            <td><%=currentUser.getName()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%=currentUser.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%=currentUser.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Register date:</th>
                                            <td><%=currentUser.getRdate().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile-edit-->
                            <div id="profile-edit" class="text-center" style="display: none;" >

                                <h2 class="mt-3">Please Edit Carefully</h2>
                                <form action="editservlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td style="color: red">Id:</td>
                                            <%
                                                int id = currentUser.getId();
                                            %>
                                            <td>id</td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%=currentUser.getEmail()%>" </td>
                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%=currentUser.getName()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Gender:</td>
                                            <td><%=currentUser.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input type="text" class="form-control" name="user_password" value="<%=currentUser.getPassword()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>New profile pic:</td>
                                            <td><input type="file" class="form-control" name="user_profile"</td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button class="btn btn-primary" type="submit">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>                
                    <div class="modal-footer">

                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Ok</button>
                        <button type="button" id="edit-btn" class="btn btn-primary">Edit</button>

                    </div>

                </div>

            </div>
        </div>

        <!--Model End-->

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                let editornot = false;
                $('#edit-btn').click(function () {
                    if (!editornot) {
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        $(this).text('back');
                        editornot = true;
                    } else {
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editornot = false;
                        $(this).text('edit');
                    }
                });
            });


        </script>
    </body>
</html>
