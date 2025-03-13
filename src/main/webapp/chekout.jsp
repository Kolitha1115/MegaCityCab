<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.Base64" %>
<%
    String vehicleId = request.getParameter("id");  
    String model = "", rentPrice = "", imageBase64 = "";

    if (vehicleId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
            PreparedStatement stmt = conn.prepareStatement("SELECT vehicle_model, vehicle_rent, vehicle_image FROM vehicles WHERE vehicle_id = ?");
            stmt.setInt(1, Integer.parseInt(vehicleId)); // Ensure vehicleId is an integer
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                model = rs.getString("vehicle_model");
                rentPrice = rs.getString("vehicle_rent");

                byte[] imgData = rs.getBytes("vehicle_image");
                if (imgData != null) {
                    imageBase64 = Base64.getEncoder().encodeToString(imgData);
                }
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Cab</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f1faee;
            color: #1d3557;
            line-height: 1.6;
        }

        .page_header {
            background-color: #457b9d;
            padding: 15px;
            text-align: center;
            color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .page_header h1 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #e63946;
        }

        .user_indicator {
            text-align: right;
            margin-top: 10px;
        }

        .user_indicator img {
            margin: 0 10px;
            cursor: pointer;
        }

        .user_indicator a {
            color: white;
            text-decoration: none;
            margin-left: 10px;
        }

        .container {
            max-width: 800px;
            margin-top: 40px;
        }

        .card {
            padding: 20px;
            border-radius: 15px;
            background: #fff;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            font-size: 1.8rem;
            color: #457b9d;
            text-align: center;
            margin-bottom: 20px;
        }

        .text-center img {
            max-height: 200px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        .form-label {
            font-weight: bold;
            color: #457b9d;
        }

        .form-control {
            border-radius: 10px;
            background-color: #f1faee;
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 1rem;
        }

        .btn-primary {
            background-color: #e63946;
            color: white;
            border-radius: 25px;
            padding: 12px 24px;
            font-size: 1.2rem;
            width: 100%;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #d62828;
        }

        .btn-secondary {
            color: #457b9d;
            border: 1px solid #457b9d;
            border-radius: 25px;
            padding: 12px 24px;
            font-size: 1.2rem;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #f1faee;
        }

        /* Footer Section */
        .page_footer {
            background-color: #457b9d;
            padding: 20px;
            color: white;
            text-align: center;
            margin-top: 40px;
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .card {
                padding: 15px;
            }
        }
    </style>

</head>

<body>

    <!-- Header Section -->
    <div class="page_header">
        <h1>MegaCityCab</h1>
        <div class="user_indicator">
            <img src="assert/online-shopping.png" width="25" height="25" alt="Shopping Cart">
            <img src="assert/heart.png" width="25" height="25" alt="Wishlist">
            <img src="assert/user.png" width="25" height="25" alt="User">
            <p id="u_name">User</p>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <!-- Main Content Section -->
    <div class="container">
        <div class="card">
            <h3>Book Your Ride</h3>

            <% if (!imageBase64.isEmpty()) { %>
                <div class="text-center">
                    <img src="data:image/jpeg;base64,<%= imageBase64 %>" class="img-fluid" alt="Vehicle Image">
                </div>
            <% } %>

            <p class="text-center mt-3"><strong>Vehicle Model:</strong> <%= model %></p>
            <p class="text-center"><strong>Rent Price:</strong> LKR <%= rentPrice %></p>

            <form action="storeBooking.jsp" method="post" class="mt-3">
                <input type="hidden" name="vehicle_id" value="<%= vehicleId != null ? vehicleId : "" %>">
                <input type="hidden" name="vehicle_model" value="<%= model != null ? model : "" %>">
                <input type="hidden" name="rent_price" value="<%= rentPrice != null ? rentPrice : "" %>">

                <!-- Form Fields -->
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-user"></i> Full Name</label>
                        <input type="text" name="full_name" class="form-control" placeholder="Enter your name" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-map-marker-alt"></i> Address</label>
                        <input type="text" name="address" class="form-control" placeholder="Enter your address" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-id-card"></i> NIC</label>
                        <input type="text" name="nic" class="form-control" placeholder="Enter NIC" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-phone"></i> Phone</label>
                        <input type="text" name="phone" class="form-control" placeholder="Enter phone number" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fab fa-whatsapp"></i> WhatsApp</label>
                        <input type="text" name="whatsapp" class="form-control" placeholder="Enter WhatsApp number" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-envelope"></i> Email</label>
                        <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-map-marker-alt"></i> From Location</label>
                        <input type="text" name="from_location" class="form-control" placeholder="From location" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-map-marker-alt"></i> To Location</label>
                        <input type="text" name="to_location" class="form-control" placeholder="To location" required>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary w-100"><i class="fas fa-ticket-alt"></i> Download Ticket</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="page_footer">
        <p>&copy; 2025 MegaCityCab. All Rights Reserved.</p>
    </div>

    <!-- Bootstrap and FontAwesome JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
