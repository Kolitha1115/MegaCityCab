<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cab Description - MegaCityCab</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts for Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            background-image: url('assert/japanese-bg.png'); /* Japanese-inspired background */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
        }
        .page_main_wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .page_header {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .page_header_sub_wrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .company_logo h1 {
            font-size: 2rem;
            color: #e74c3c;
            margin: 0;
        }
        .user_indicator {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .user_indicator img {
            width: 25px;
            height: 25px;
        }
        .user_indicator a {
            color: #e74c3c;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .user_indicator a:hover {
            color: #c0392b;
        }
        .page_body {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .p_des_main_wrapper {
            display: flex;
            gap: 20px;
        }
        .left_p_dec {
            flex: 1;
        }
        .item_image img {
            max-width: 100%;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .right_p_dec {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .r_item_name {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 10px;
        }
        .r_price_wrapper {
            margin-bottom: 20px;
        }
        .r_price_wrapper p {
            font-size: 1.5rem;
            color: #e74c3c;
        }
        .r_price_wrapper button {
            background-color: #e74c3c;
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .r_price_wrapper button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="page_main_wrapper">
        <!-- Header Section -->
        <div class="page_header">
            <div class="page_header_sub_wrapper">
                <div class="company_logo">
                    <h1>MegaCityCab</h1>
                </div>
                <div class="user_indicator">
                    <img src="assert/online-shopping.png" width="25" height="25" alt="Shopping Cart">
                    <img src="assert/heart.png" width="25" height="25" alt="Wishlist">
                    <img src="assert/user.png" width="25" height="25" alt="User">
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
        </div>

        <!-- Body Section -->
        <div class="page_body">
            <div class="p_des_main_wrapper">
                <%
                    String url = "jdbc:mysql://localhost:3306/megacab";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    int vehicleId = Integer.parseInt(request.getParameter("id"));
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(url, user, password);
                        String query = "SELECT * FROM vehicles WHERE vehicle_id = ?";
                        pstmt = con.prepareStatement(query);
                        pstmt.setInt(1, vehicleId);
                        rs = pstmt.executeQuery();
                        
                        if (rs.next()) {
                            String model = rs.getString("vehicle_model");
                            String price = rs.getString("vehicle_rent");
                            String name = rs.getString("vehicle_name");
                            String number = rs.getString("vehicle_number");
                            String type = rs.getString("vehicle_type");
                            
                            // Convert image BLOB to base64 for display
                            byte[] imgData = rs.getBytes("vehicle_image");
                            String base64Image = "";
                            if (imgData != null) {
                                base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imgData);
                            }
                %>
                <div class="left_p_dec">
                    <div class="item_image">
                        <img src="<%= base64Image %>" width="100%" height="100%" alt="Vehicle Image">
                    </div>
                </div>
                <div class="right_p_dec">
                    <p class="r_item_name"><%= model %></p>
                    <p class="r_item_name"><%= name %></p>
                    <p class="r_item_name"><%= type %></p>
                    <div class="r_price_wrapper">
                        <p>LKR <%= price %></p>
                    </div>
                    <div class="r_price_wrapper">
                        <a href="chekout.jsp?id=<%= request.getParameter("id") %>">
                            <button>Rent Now</button>
                        </a>
                    </div>
                </div>
                <%
                        } else {
                            out.println("<p>Vehicle not found.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (con != null) con.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>