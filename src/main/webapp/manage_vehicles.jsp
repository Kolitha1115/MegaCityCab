<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Vehicles</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Manage Vehicles</h2>
    <a href="add_vehicle.jsp">Add Vehicle</a> |
    <a href="admin_dashboard.jsp">Back to Dashboard</a>
    
    <table border="1">
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
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
</body>
</html>
