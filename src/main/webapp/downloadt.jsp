<%@ page import="java.sql.*, java.util.Base64" %>

<%
    String bookingId = request.getParameter("id");
    String fullName = "", address = "", phone = "", email = "", fromLocation = "", toLocation = "", vehicleModel = "", rentPrice = "";

    if (bookingId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM checkout WHERE id = ?");
            stmt.setString(1, bookingId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                fullName = rs.getString("full_name");
                address = rs.getString("address");
                phone = rs.getString("phone");
                email = rs.getString("email");
                fromLocation = rs.getString("from_location");
                toLocation = rs.getString("to_location");
                vehicleModel = rs.getString("vehicle_model");
                rentPrice = rs.getString("rent_price");
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
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Download Ticket</title>
</head>
<body>
    <h2>Booking Ticket</h2>
    <p><strong>Name:</strong> <%= fullName %></p>
    <p><strong>Address:</strong> <%= address %></p>
    <p><strong>Phone:</strong> <%= phone %></p>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>From:</strong> <%= fromLocation %></p>
    <p><strong>To:</strong> <%= toLocation %></p>
    <p><strong>Vehicle:</strong> <%= vehicleModel %></p>
    <p><strong>Price:</strong> Rs.<%= rentPrice %>.00</p>

    <button onclick="window.print()">Download Ticket</button>
</body>
</html>
