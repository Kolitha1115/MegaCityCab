<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #FFDEE9 0%, #B5FFFC 50%, #ffffff 100%);
            color: #333;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .main_wrapper_login_page {
            width: 100%;
            max-width: 400px;
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

        .main_wrapper_login_interface_c1 {
            text-align: center;
        }

        .main_wrapper_login_interface_c1 h2 {
            font-size: 2rem;
            color: #007bff;
            margin-bottom: 20px;
        }

        .new_password_Image {
            margin-bottom: 20px;
        }

        .new_password_Image img {
            width: 100%;
            height: auto;
            border-radius: 20px;
        }

        .newpassword_interface_c1_user_details_block_const {
            margin-bottom: 20px;
        }

        .newpassword_interface_c1_user_details_block_const input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 1rem;
            margin-bottom: 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .newpassword_interface_c1_user_details_block_const input:focus {
            border-color: #007bff;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        }

        .update_btn_user_inputbtn_c025 button {
            background: linear-gradient(135deg, #007bff, #00bfff);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .update_btn_user_inputbtn_c025 button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 123, 255, 0.5);
        }
    </style>
</head>
<body>
    <div class="main_wrapper_login_page">
        <div class="main_wrapper_login_interface_c1">
            <h2>New Password!</h2>
            <div class="new_password_Image">
                <!-- <img src="assert/Secure login-pana.svg" alt="" srcset=""> -->
            </div>
            <div class="newpassword_interface_c1_user_details_block_const">
                <input type="password" placeholder="Enter New Password">
                <input type="password" placeholder="Confirm Password">
            </div>
            <div class="update_btn_user_inputbtn_c025">
                <button>Update</button>
            </div>
        </div>
    </div>
</body>
</html>