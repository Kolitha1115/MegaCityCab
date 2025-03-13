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
    <title>Manage Rents</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Manage Rents</h2>
    <a href="admin_dashboard.jsp">Back to Dashboard</a>
    
    <table border="1">
        <tr>
            <th>Rent ID</th>
            <th>Customer</th>
            <th>Vehicle</th>
            <th>Total Amount</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
                java.sql.PreparedStatement pst = con.prepareStatement("SELECT * FROM rents");
                java.sql.ResultSet rs = pst.executeQuery();
                
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("rent_id") %></td>
            <td><%= rs.getString("customer_name") %></td>
            <td><%= rs.getString("vehicle_id") %></td>
            <td><%= rs.getDouble("total_amount") %></td>
            <td>
                <a href="edit_rent.jsp?id=<%= rs.getInt("rent_id") %>">Edit</a> |
                <a href="delete_rent.jsp?id=<%= rs.getInt("rent_id") %>">Delete</a>
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
</body>
</html>
