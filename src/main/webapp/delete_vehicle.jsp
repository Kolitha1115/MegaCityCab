<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>

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
        response.sendRedirect("admin_dashboard.jsp?error=NoID");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Vehicle</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    
    <style>
        body {
            background: linear-gradient(135deg, #FFDEE9 0%, #B5FFFC 50%, #ffffff 100%);
            font-family: 'Poppins', sans-serif;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 500px;
            margin-top: 100px;
            background: rgba(255, 255, 255, 0.9);
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
        }

        .btn-danger {
            background: linear-gradient(135deg, #dc3545, #b02a37);
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-danger:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(220, 53, 69, 0.5);
        }

        .btn-outline-secondary {
            border: 1px solid #6c757d;
            color: #6c757d;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-outline-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(108, 117, 125, 0.5);
        }

        .text-danger {
            color: #dc3545;
        }

        .text-dark {
            color: #333;
        }

        .text-center {
            text-align: center;
        }

        .fa-exclamation-triangle {
            margin-right: 10px;
        }

        .fa-trash-alt, .fa-times {
            margin-right: 10px;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="card text-center">
        <h3 class="text-danger"><i class="fas fa-exclamation-triangle"></i> Confirm Deletion</h3>
        <p class="text-dark">Are you sure you want to delete this vehicle? This action cannot be undone.</p>

        <form action="DeleteVehicleServlet" method="post">
            <input type="hidden" name="vehicleId" value="<%= vehicleId %>">
            <button type="submit" class="btn btn-danger w-100"><i class="fas fa-trash-alt"></i> Yes, Delete</button>
        </form>

        <a href="admin_dashboard.jsp" class="btn btn-outline-secondary w-100 mt-3"><i class="fas fa-times"></i> Cancel</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>