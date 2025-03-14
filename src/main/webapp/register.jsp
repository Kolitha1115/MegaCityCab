<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register - Meca City Cab Service</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- Google Fonts for Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f1faee;
            margin: 0;
            padding: 0;
        }

        .header, .footer {
            background-color: #457b9d;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }

        .header h1 {
            font-size: 36px;
            margin: 0;
        }

        .footer p {
            margin: 0;
        }

        .register_form_wrapper {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .register_form_wrapper h2 {
            color: #1d3557;
            font-weight: 600;
        }

        .register_form_wrapper p {
            color: #a8dadc;
        }

        .register_form_wrapper input {
            border-radius: 5px;
        }

        .register_form_wrapper .btn-primary {
            background-color: #e63946;
            border-color: #e63946;
        }

        .register_form_wrapper .btn-primary:hover {
            background-color: #1d3557;
            border-color: #1d3557;
        }

        .register_image_wrapper img {
            max-width: 100%;
            border-radius: 10px;
        }

        .user_check_box p {
            color: #457b9d;
            font-size: 14px;
        }

        .redirect_loging_page a {
            color: #e63946;
        }

        .footer_btn button {
            width: 100%;
            padding: 10px;
            background-color: #e63946;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: 600;
            font-size: 16px;
            transition: 0.3s;
        }

        .footer_btn button:hover {
            background-color: #1d3557;
        }

        @media (max-width: 768px) {
            .register_image_wrapper {
                display: none;
            }

            .register_form_wrapper {
                padding: 30px;
            }
        }
    </style>
</head>

<body>
    <!-- Header Section -->
    <header class="header">
        <h1>Welcome to Meca City Cab Service</h1>
        <p>Your ride, your way. Rent cabs with ease!</p>
    </header>

    <div class="register_main_wrapper">
        <!-- Body Section -->
        <div class="page_body_main_wrapper">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-6">
                        <div class="register_form_wrapper p-5 rounded shadow-lg">
                            <h2 class="mb-4 text-center">Create Your Account</h2>
                            <p class="text-muted text-center mb-4">Fill in your details below to start using our service.</p>
                            <!-- Display error messages -->
					        <% 
					            String errorMessages = (String) request.getAttribute("errorMessages");
					            if (errorMessages != null) {
					        %>
					            <div class="alert alert-danger">
					                <%= errorMessages %>
					            </div>
					        <% 
					            }
					        %>
                            <form action="Register" method="post">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Customer Name</label>
                                    <input name="Name" type="text" class="form-control" placeholder="Customer Name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="nic" class="form-label">NIC</label>
                                    <input name="NIC" type="text" class="form-control" placeholder="Your NIC" required>
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input name="Address" type="text" class="form-control" placeholder="Your Address" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input name="pass" type="password" class="form-control" placeholder="Your Password" required>
                                </div>
                                <div class="mb-3 user_check_box">
                                    <input name="agree" type="checkbox" required>
                                    <p>I agree to receive marketing, advertising, and promotional information via email.</p>
                                </div>
                                <div class="mb-3 text-center redirect_loging_page">
                                    <p>If you have an account <a href="login.jsp">Login?</a></p>
                                </div>
                                <div class="footer_btn">
                                    <button type="submit">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6 d-none d-md-block">
                        <div class="register_image_wrapper text-center">
                            <img src="assert/rg.png" alt="Meca City Cab Service">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="footer">
        <p>&copy; 2025 Meca City Cab Service. All Rights Reserved.</p>
    </footer>

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
