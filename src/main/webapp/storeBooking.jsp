<%@ page import="java.sql.*, java.io.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String fullName = request.getParameter("full_name");
    String address = request.getParameter("address");
    String nic = request.getParameter("nic");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String whatsapp = request.getParameter("whatsapp");
    String fromLocation = request.getParameter("from_location");
    String toLocation = request.getParameter("to_location");
    String vehicleId = request.getParameter("vehicle_id");
    String vehicleModel = request.getParameter("vehicle_model");
    String rentPrice = request.getParameter("rent_price");

    // Validate that required fields are not empty
    if (fullName == null || address == null || nic == null || phone == null || email == null || 
        whatsapp == null || fromLocation == null || toLocation == null || vehicleId == null || 
        vehicleModel == null || rentPrice == null) {
        
        out.println("<script>alert('All fields are required. Please try again.'); window.history.back();</script>");
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");

            String sql = "INSERT INTO checkout (full_name, address, nic, phone, email, whatsapp, from_location, to_location, vehicle_id, vehicle_model, rent_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, fullName);
            stmt.setString(2, address);
            stmt.setString(3, nic);
            stmt.setString(4, phone);
            stmt.setString(5, email);
            stmt.setString(6, whatsapp);
            stmt.setString(7, fromLocation);
            stmt.setString(8, toLocation);
            stmt.setInt(9, Integer.parseInt(vehicleId));
            stmt.setString(10, vehicleModel);
            stmt.setDouble(11, Double.parseDouble(rentPrice));

            int rowsInserted = stmt.executeUpdate();
            int generatedId = -1;

            if (rowsInserted > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
                rs.close();
            }

            stmt.close();
            conn.close();

            if (generatedId != -1) {
%>
                <form id="ticketForm" action="downloadTicket" method="post">
                    <input type="hidden" name="full_name" value="<%= fullName %>">
                    <input type="hidden" name="address" value="<%= address %>">
                    <input type="hidden" name="nic" value="<%= nic %>">
                    <input type="hidden" name="phone" value="<%= phone %>">
                    <input type="hidden" name="email" value="<%= email %>">
                    <input type="hidden" name="from_location" value="<%= fromLocation %>">
                    <input type="hidden" name="to_location" value="<%= toLocation %>">
                    <input type="hidden" name="vehicle_model" value="<%= vehicleModel %>">
                    <input type="hidden" name="rent_price" value="<%= rentPrice %>">
                </form>

                <script>
			        document.getElementById("ticketForm").submit();
			        setTimeout(function () {
			            window.location.href = "index.jsp";
			        }, 500); // Wait 3 seconds before redirecting
			    </script>
<%
            } else {
                out.println("<script>alert('Failed to insert booking. Try again.'); window.history.back();</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.history.back();</script>");
        }
    }
%>
