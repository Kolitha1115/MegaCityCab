<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
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
        }

        .page_main_wrapper {
            max-width: 1200px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
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

        /* Header Section */
        .page_header {
            background: #0a1128;
            color: white;
            padding: 20px 0;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        .page_header_sub_wrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 90%;
            margin: 0 auto;
        }

        .company_logo h1 {
            font-size: 2.5rem;
            color: #e63946;
        }

        .page_search_bar {
            display: flex;
            align-items: center;
        }

        .pgs_main_wrapper {
            display: flex;
            align-items: center;
            background-color: #a8dadc;
            border-radius: 25px;
            padding: 0 10px;
            width: 20rem;
        }

        .pgs_main_wrapper input {
            width: 80%;
            height: 40px;
            border: none;
            outline: none;
            font-size: 1rem;
            background: transparent;
            color: #1d3557;
        }

        .search_icon img {
            width: 20px;
            height: 20px;
        }

        /* Hero Section */
        .hero {
            margin-top: 20px;
        }

        .header_image {
            width: 100%;
            height: 60vh;
            background-image: url('assert/carousel-2.jpg');
            background-size: cover;
            background-position: center;
            border-radius: 20px;
        }

        /* Body Section */
        .page_body {
            padding: 40px 0;
        }

        .head_compo1 h2 {
            font-size: 2rem;
            color: #457b9d;
            text-align: center;
            margin-bottom: 30px;
        }

        .supplier_item {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .p_item {
            width: 18rem;
            height: 30rem;
            background: #f1faee;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .p_item:hover {
            transform: translateY(-10px);
        }

        .pheader {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }

        .instock_compo p {
            font-size: 1.1rem;
            color: #457b9d;
        }

        .p_img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .item_name {
            font-size: 1.1rem;
            font-weight: bold;
            color: #1d3557;
            padding: 10px;
        }

        .item_price {
            font-size: 1.1rem;
            color: #a8dadc;
            padding: 10px;
        }

        .item_add_cart {
            background: #e63946;
            color: white;
            padding: 12px 20px;
            border-radius: 25px;
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .item_add_cart:hover {
            transform: scale(1.1);
        }

        /* Footer Section */
        .page_footer {
            background: #457b9d;
            color: white;
            padding: 40px 0;
            text-align: center;
        }

        .footer_Section {
            width: 90%;
            margin: 0 auto;
        }

        .footer_main_wrapper {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .footer_main_wrapper div {
            flex: 1;
            min-width: 200px;
        }

        .footer_main_wrapper h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .footer_main_wrapper input {
            width: 100%;
            padding: 12px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .footer_main_wrapper button {
            background: #e63946;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
        }

        /* Bottom Text */
        #footer_copyright {
            margin-top: 20px;
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.6);
        }
    </style>
    <title>MegaCityCab</title>
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
                    <img src="assert/online-shopping.png" width="25" height="25" alt="">
                    <img src="assert/heart.png" width="25" height="25" alt="">
                    <img src="assert/user.png" width="25" height="25" alt="">
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
        </div>

        <!-- Hero Section -->
        <div class="hero">
            <div class="header_image"></div>
        </div>

        <!-- Body Section -->
        <div class="page_body">
            <div class="head_compo1">
                <h2>Top Vehicles Available</h2>
            </div>

            <div class="supplier_item">
                <%
                    // Database connection and querying vehicle details
                    String url = "jdbc:mysql://localhost:3306/megacab";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Connect to the database
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(url, user, password);
                        stmt = con.createStatement();
                        String query = "SELECT * FROM vehicles";
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            String model = rs.getString("vehicle_model");
                            String price = rs.getString("vehicle_rent");
                            byte[] imgData = rs.getBytes("vehicle_image");
                            String base64Image = "";
                            if (imgData != null) {
                                base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imgData);
                            }
                %>

                <div class="p_item">
                    <div class="pheader">
                        <div class="instock_compo">
                            <p><%= model %></p>
                        </div>
                    </div>
                    <div class="p_img">
                        <img src="<%= base64Image %>" width="100%" height="100%" alt="Vehicle Image">
                    </div>
                    <p class="item_name"><%= model %></p>
                    <p class="item_price">LKR <%= price %></p>
                    <div class="item_add_cart" onclick="window.location.href='productDescription.jsp?id=<%= rs.getInt("vehicle_id") %>'">
                        Rent Now
                    </div>
                </div>

                <%
                        }
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (con != null) con.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>
            </div>
        </div>

        <!-- Footer Section -->
        <div class="page_footer">
            <div class="footer_Section">
                <div class="footer_main_wrapper">
                    <div>
                        <h2>MEGA CITY CAB</h2>
                        <h3>Subscribe</h3>
                        <p>Get 10% off your first ride</p>
                        <input type="email" placeholder="Enter your email">
                        <button>Subscribe</button>
                    </div>
                    <div>
                        <h3>Contact</h3>
                        <p>Email: megacitycab@gmail.com</p>
                        <p>Phone: +94719208046</p>
                    </div>
                    <div>
                        <h3>Account</h3>
                        <p>My Account</p>
                        <p>Login / Register</p>
                        <p>Cart</p>
                    </div>
                </div>
                <p id="footer_copyright">@ Copyright MegaCityCab 2025. All rights reserved</p>
            </div>
        </div>
    </div>
</body>

</html>
