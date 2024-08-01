<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register_page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 89%, 75% 100%, 36% 93%, 0 100%);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center bg-primary banner-background" style="height: 90vh">
            <div class="container">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center">
                            <span class="fa fa-user-circle fa-2x"></span>
                            <br>
                            Register here
                        </div>
                        <div class="card-body">
                            <form id="reg" action="registerservlet" method="POST">
                                <div class="mb-3">
                                    <label for="User_name" class="form-label">User_name</label>
                                    <input name="user_name" type="text" class="form-control" id="User_name" aria-describedby="User_nameHelp" placeholder="Enter Name">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email Address">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="mb-3 form-check">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input name="gender" type="radio" id="female" value="female">Female
                                    <input name="gender" type="radio" id="male" value="male">Male
                                </div>
                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms And Conditions</label>
                                </div>

                                <button id="submit-btn" name="submit" type="submit" class="btn btn-primary">Submit</button>

                            </form>
                        </div>
                        <div class="card-footer">
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Script -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
      $(document).ready(function () {
    console.log("loaded...");

    $('#reg').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);
        console.log("Form submitted...");

        // Send data to servlet
        $.ajax({
            url: "registerservlet", // Ensure this is the correct path to your servlet
            type: "POST",
            data: form,
            processData: false, // Prevent jQuery from automatically transforming the data into a query string
            contentType: false, // Prevent jQuery from setting the content type
            success: function (data, textStatus, jqXHR) {
                console.log("Success:", data);
                console.log("Trimmed data:", data.trim());
                if (data.trim() === "done") {
                    Swal.fire("SweetAlert2 is working!").then(() => {
                        console.log("Redirecting to login_page.jsp...");
                        window.location= "login_page.jsp";
                    });
                } else {
                    Swal.fire(data);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error:", textStatus, errorThrown);
                // Handle the error here (e.g., show an error message)
            }
        });
    });
});
</script>
    </body>
</html>
