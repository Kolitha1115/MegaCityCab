<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="CSS/Login.css">
    
</head>
<body>
    <input type="hidden" id="Response" value="<%=request.getAttribute("Response")%>">
    <div class="login_main_wrapper">
        <!-- Header Section -->
        <div class="header_section bg-primary text-white py-3">
            <div class="container d-flex justify-content-between align-items-center">
                <div class="abc_header_section_left d-flex gap-3">
                    <a href="#" class="text-white text-decoration-none">Welcome</a>
                    <a href="#" class="text-white text-decoration-none">Types</a>
                    <a href="#" class="text-white text-decoration-none">Select Your Choice</a>
                    <a href="#" class="text-white text-decoration-none">Offer</a>
                </div>
                <div class="abc_header_section_middle text-center">
                    <img src="assert/logo1.png" width="70" height="70" alt="LOGO" class="img-fluid">
                    <p class="mb-0">MEGA CITY CAB SERVICE</p>
                </div>
                <div class="abc_header_section_right d-flex gap-3 align-items-center">
                    <img src="assert/search.png" width="20" alt="Search" class="img-fluid">
                    <a href="login.html" class="btn btn-light">Become a Member</a>
                </div>
            </div>
        </div>

        <!-- Body Section -->
        <div class="page_body_main_wrapper d-flex align-items-center justify-content-center">
            <div class="body_content bg-white p-4 rounded shadow-lg">
                <div class="row">
                    <!-- Left Wrapper -->
                    <div class="col-md-6">
                        <form id="loginForm" action="Login" method="get">
                            <h2 class="mb-3">Login to Your Account</h2>
                            <p class="text-muted mb-4">Fill your details below</p>
                            <div class="mb-3">
                                <label for="username" class="form-label">User Name</label>
                                <input type="text" name="name" id="username" class="form-control" placeholder="User Name" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" name="pass" id="password" class="form-control" placeholder="Your Password" required>
                            </div>
                            <div class="mb-3 text-end">
                                <a href="forgot.jsp" class="text-decoration-none">Forgot Password?</a>
                            </div>
                            <div class="mb-3 text-center">
                                <p class="mb-0">Don't have an account? <a href="register.jsp" class="text-decoration-none">Register</a></p>
                            </div>
                            <div class="d-grid">
                                <button type="submit" id="loginBtn" class="btn btn-primary">Login</button>
                            </div>
                        </form>
                    </div>
                    <!-- Right Wrapper -->
                    <div class="col-md-6 d-flex align-items-center justify-content-center">
                        <img src="assert/blog-1.png" alt="Login Image" class="img-fluid rounded">
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Section -->
        <div class="footer_wrapper bg-dark text-white py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 text-center">
                        <h5>CONTACT</h5>
                        <p>5 Colombo, 2002 Paris</p>
                        <p>Call - +94719208046</p>
                        <p>megacitycabservice@gmail.com</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <h5>JOIN OUR MAILING LIST</h5>
                        <div class="input-group mb-3">
                            <input type="email" class="form-control" placeholder="Email">
                            <button class="btn btn-warning" type="button">Subscribe</button>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <h5>WORKING HOURS</h5>
                        <p>Mon-Fri 7.00am - 10.00pm</p>
                        <p>Sat: 7.00am - 6.00pm</p>
                        <p>Sun: 8.00am - 6.00pm</p>
                    </div>
                </div>
                <div class="text-center mt-3">
                    <p class="mb-0">Copyright - Mega City Cab Service 2024 </p>
                </div>
            </div>
        </div>
    </div>

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script>
        $(document).ready(function () {
            const response = $("#Response").val();
            if (response === "success") {
                Swal.fire({
                    title: "Success!",
                    text: "You have successfully logged in.",
                    icon: "success",
                    confirmButtonColor: "#3085d6",
                }).then(() => {
                    window.location.href = "index.jsp"; // Redirect after success
                });
            } else if (response === "failed") {
                Swal.fire({
                    title: "Error!",
                    text: "Invalid username or password.",
                    icon: "error",
                    confirmButtonColor: "#d33",
                });
            }
        });
    </script>
</body>
</html>