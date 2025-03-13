<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin Dashboard - MegaCab</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 36px;
            margin: 0;
        }

        .footer p {
            margin: 0;
        }

        .admin-container {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }

        .page_header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #1d3557;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .company_logo h1 {
            color: #e63946;
            margin: 0;
        }

        .user_indicator a {
            color: #a8dadc;
            text-decoration: none;
            font-size: 14px;
        }

        /* Sidebar Styling */
        .admin-sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100%;
            background-color: #1d3557;
            padding: 30px 20px;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
            transition: width 0.3s ease;
        }

        .admin-sidebar a {
            color: #a8dadc;
            text-decoration: none;
            font-size: 18px;
            margin: 20px 0;
            display: block;
            padding: 12px;
            border-radius: 5px;
            transition: 0.3s;
        }

        .admin-sidebar a:hover {
            background-color: #e63946;
            color: #fff;
        }

        /* Main Content Styling */
        .admin-content {
            margin-left: 260px;
            padding: 20px;
            background-color: #f1faee;
            flex-grow: 1;
        }

        /* Table Styling */
        .table-container {
            margin-top: 20px;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .table-container table {
            width: 100%;
            border-collapse: collapse;
        }

        .table-container th, .table-container td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .table-container th {
            background-color: #457b9d;
            color: #fff;
        }

        .table-container td {
            background-color: #f1faee;
        }

        .table-container button {
            background-color: #e63946;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 5px;
            transition: 0.3s;
        }

        .table-container button:hover {
            background-color: #1d3557;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-container button {
            background-color: #e63946;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #1d3557;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .admin-sidebar {
                width: 60px;
                padding: 10px;
                height: auto;
            }

            .admin-sidebar a {
                font-size: 14px;
                text-align: center;
                padding: 8px;
            }

            .admin-content {
                margin-left: 0;
                padding: 10px;
            }
        }
    </style>
</head>

<body>
    <div class="admin-container">
        <!-- Header Section -->
        <div class="page_header">
            <div class="company_logo">
                <h1>MegaCab</h1>
            </div>
            <div class="user_indicator">
                <p id="u_name">Admin</p>
                <a href="logout.jsp">Logout</a>
            </div>
        </div>

        <!-- Sidebar Navigation -->
        <div class="admin-sidebar">
            <a href="javascript:void(0)" onclick="openCity('London')">Manage Vehicles</a>
            <a href="javascript:void(0)" onclick="openCity('Paris')">Manage Rents</a>
            <a href="javascript:void(0)" onclick="openCity('Tokyo')">Add Vehicle</a>
        </div>

        <!-- Main Content -->
        <div class="admin-content">
            <!-- Manage Vehicles Section -->
            <div id="London" class="w3-container city active">
                <h2>Manage Vehicles</h2>
                <div class="table-container">
                    <table>
                        <tr>
                            <th>Vehicle ID</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Model</th>
                            <th>License Plate</th>
                            <th>Type</th>
                            <th>Rent (LKR)</th>
                            <th>Actions</th>
                        </tr>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
                                java.sql.PreparedStatement pst = con.prepareStatement("SELECT * FROM vehicles");
                                java.sql.ResultSet rs = pst.executeQuery();

                                while (rs.next()) {
                                    int vehicleId = rs.getInt("vehicle_id");
                                    String name = rs.getString("vehicle_name");
                                    String model = rs.getString("vehicle_model");
                                    String licensePlate = rs.getString("vehicle_number");
                                    String type = rs.getString("vehicle_type");
                                    double rent = rs.getDouble("vehicle_rent");

                                    // Convert image BLOB to base64 for display
                                    byte[] imgData = rs.getBytes("vehicle_image");
                                    String base64Image = "";
                                    if (imgData != null) {
                                        base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imgData);
                                    }
                        %>
                        <tr>
                            <td><%= vehicleId %></td>
                            <td>
                                <% if (!base64Image.isEmpty()) { %>
                                    <img src="<%= base64Image %>" alt="Vehicle Image" width="100">
                                <% } else { %>
                                    No Image
                                <% } %>
                            </td>
                            <td><%= name %></td>
                            <td><%= model %></td>
                            <td><%= licensePlate %></td>
                            <td><%= type %></td>
                            <td><%= rent %></td>
                            <td>
                                <button><a href="edit_vehicle.jsp?id=<%= vehicleId %>">Edit</a></button>
                                <button><a href="delete_vehicle.jsp?id=<%= vehicleId %>">Delete</a></button>
                            </td>
                        </tr>
                        <%
                                }
                                con.close();
                            } catch (Exception e) {
                                out.println("Error: " + e.getMessage());
                            }
                        %>
                    </table>
                </div>
            </div>

            <!-- Manage Rents Section -->
            <div id="Paris" class="w3-container city">
                <h2>Manage Rents</h2>
                <div class="table-container">
                    <table>
                        <tr>
                            <th>Booking ID</th>
                            <th>Full Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Vehicle</th>
                            <th>Price (LKR)</th>
                            <th>Actions</th>
                        </tr>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
                                java.sql.PreparedStatement pst = con.prepareStatement("SELECT * FROM checkout");
                                java.sql.ResultSet rs = pst.executeQuery();

                                while (rs.next()) {
                                    int bookingId = rs.getInt("id");
                                    String fullName = rs.getString("full_name");
                                    String phone = rs.getString("phone");
                                    String email = rs.getString("email");
                                    String fromLocation = rs.getString("from_location");
                                    String toLocation = rs.getString("to_location");
                                    String vehicleModel = rs.getString("vehicle_model");
                                    double rentPrice = rs.getDouble("rent_price");
                        %>
                        <tr id="booking-<%= bookingId %>">
                            <td><%= bookingId %></td>
                            <td><%= fullName %></td>
                            <td><%= phone %></td>
                            <td><%= email %></td>
                            <td><%= fromLocation %></td>
                            <td><%= toLocation %></td>
                            <td><%= vehicleModel %></td>
                            <td><%= rentPrice %></td>
                            <td>
                                <button onclick="deleteBooking(<%= bookingId %>)">Delete</button>
                            </td>
                        </tr>
                        <%
                                }
                                con.close();
                            } catch (Exception e) {
                                out.println("Error: " + e.getMessage());
                            }
                        %>
                    </table>
                </div>
            </div>

            <!-- Add Vehicle Section -->
            <div id="Tokyo" class="w3-container city">
                <h2>Add Vehicle</h2>
                <form action="AddVehicleServlet" method="post" enctype="multipart/form-data">
                    <div class="form-container">
                        <div class="form-group">
                            <label>Vehicle Name:</label>
                            <input type="text" name="name" required>
                            <label>Vehicle Model:</label>
                            <input type="text" name="model" required>
                            <label>Vehicle Number:</label>
                            <input type="text" name="number" required>
                        </div>
                        <div class="form-group">
                            <label>Vehicle Type:</label>
                            <input type="text" name="type" required>
                            <label>Rent per Day:</label>
                            <input type="number" name="rent" step="0.01" required>
                            <label>Vehicle Image:</label>
                            <input type="file" name="image" accept="image/*" required>
                        </div>
                    </div>
                    <button type="submit">Add Vehicle</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Custom JS -->
    <script>
        function openCity(cityName) {
            var i;
            var x = document.getElementsByClassName("city");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            document.getElementById(cityName).style.display = "block";
        }

        function deleteBooking(bookingId) {
            if (confirm("Are you sure you want to delete this booking?")) {
                fetch("DeleteBookingServlet?id=" + bookingId)
                    .then(response => response.text())
                    .then(data => {
                        if (data.trim() === "success") {
                            alert("Booking deleted successfully");
                            let bookingRow = document.getElementById("booking-" + bookingId);
                            if (bookingRow) {
                                bookingRow.remove(); // Remove row dynamically
                            }
                        } else {
                            alert("Error deleting booking");
                        }
                    })
                    .catch(error => console.error("Fetch error:", error));
            }
        }
    </script>
</body>

</html>
