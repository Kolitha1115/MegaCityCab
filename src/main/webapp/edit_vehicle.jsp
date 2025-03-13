<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int vehicleId = -1;
    if (request.getParameter("id") != null) {
        vehicleId = Integer.parseInt(request.getParameter("id"));
    } else {
        response.sendRedirect("manage_vehicles.jsp?error=NoID");
        return;
    }

    String name = "", model = "", licensePlate = "", type = "";
    double rent = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
        PreparedStatement pst = con.prepareStatement("SELECT * FROM vehicles WHERE vehicle_id = ?");
        pst.setInt(1, vehicleId);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            name = rs.getString("vehicle_name");
            model = rs.getString("vehicle_model");
            licensePlate = rs.getString("vehicle_number");
            type = rs.getString("vehicle_type");
            rent = rs.getDouble("vehicle_rent");
        } else {
            response.sendRedirect("admin_dashboard.jsp?error=NotFound");
            return;
        }
        rs.close();
        pst.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle</title>
    
    <!-- Bootstrap CSS -->
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
            background: #f1faee;
            color: #1d3557;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 700px;
            margin-top: 50px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 20px;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background: #fff;
        }

        .btn-primary {
            background: linear-gradient(135deg, #ff4444, #cc0000);
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(255, 68, 68, 0.5);
        }

        .btn-outline-secondary {
            border: 1px solid #6c757d;
            color: #6c757d;
            padding: 10px 20px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-outline-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(108, 117, 125, 0.5);
        }

        .form-label {
            font-weight: bold;
            color: #ff4444;
        }

        .form-control {
            border-radius: 10px;
            border: 1px solid #444;
            padding: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            background-color: #fff;
            color: #333;
        }

        .form-control:focus {
            border-color: #ff4444;
            box-shadow: 0 0 10px rgba(255, 68, 68, 0.5);
        }

        .text-center {
            text-align: center;
        }

        .fa-edit, .fa-save, .fa-arrow-left {
            margin-right: 10px;
        }

        .page-title {
            font-size: 2rem;
            color: #ff4444;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="card">
            <h3 class="page-title text-center"><i class="fas fa-edit"></i> Edit Vehicle</h3>

            <form action="EditVehicleServlet" method="post" class="mt-3">
                <input type="hidden" name="vehicleId" value="<%= vehicleId %>">

                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-car"></i> Vehicle Name</label>
                        <input type="text" name="name" class="form-control" value="<%= name %>" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-car"></i> Model</label>
                        <input type="text" name="model" class="form-control" value="<%= model %>" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-id-card"></i> License Plate</label>
                        <input type="text" name="licensePlate" class="form-control" value="<%= licensePlate %>" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-tags"></i> Type</label>
                        <input type="text" name="type" class="form-control" value="<%= type %>" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-money-bill-wave"></i> Rent (LKR)</label>
                        <input type="number" step="0.01" name="rent" class="form-control" value="<%= rent %>" required>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Update Vehicle</button>
                </div>
            </form>

            <div class="text-center mt-3">
                <a href="admin_dashboard.jsp" class="btn btn-outline-secondary"><i class="fas fa-arrow-left"></i> Back to Manage Vehicles</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
