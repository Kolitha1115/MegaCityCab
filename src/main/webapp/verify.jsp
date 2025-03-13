<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verification</title>
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

        .vericatioin_interface_c1_user_details_block_const {
            margin-bottom: 20px;
        }

        #verify_sologon_m500 {
            font-size: 1rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .verification_user_input_otp_code_block {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .verification_user_input_otp_code_block input {
            width: 50px;
            height: 50px;
            text-align: center;
            font-size: 1.2rem;
            border: 1px solid #ddd;
            border-radius: 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .verification_user_input_otp_code_block input:focus {
            border-color: #007bff;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        }

        #verify_sologon_m501 {
            font-size: 0.9rem;
            margin-bottom: 20px;
        }

        #verify_sologon_m501 a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        #verify_sologon_m501 a:hover {
            color: #0056b3;
        }

        .login_btn_user_inputbtn_c025 button {
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

        .login_btn_user_inputbtn_c025 button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 123, 255, 0.5);
        }

        .style_sologo_text_c035 {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 20px 0;
        }

        .style_sologo_text_c035 .item {
            flex: 1;
            height: 1px;
            background: #ddd;
        }

        #m03_add_custom_css {
            margin: 0 10px;
            font-size: 0.9rem;
            color: #666;
        }

        .login_interface_c1_user_clickable_btn {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .login_interface_c1_user_clickable_btn button {
            background: white;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login_interface_c1_user_clickable_btn button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .google_btn_m02, .apple_btn_m02 {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .google_btn_m02 img, .apple_btn_m02 img {
            width: 20px;
            height: 20px;
        }

        #footer_m504_zmy {
            font-size: 0.9rem;
            margin-top: 20px;
        }

        #footer_m504_zmy a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        #footer_m504_zmy a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="main_wrapper_login_page">
        <div class="main_wrapper_login_interface_c1">
            <h2>Verification!</h2>
            <div class="vericatioin_interface_c1_user_details_block_const">
                <p id="verify_sologon_m500">Enter Verification Code</p>
                <div class="verification_user_input_otp_code_block">
                    <input type="text" maxlength="1" placeholder="">
                    <input type="text" maxlength="1" placeholder="">
                    <input type="text" maxlength="1" placeholder="">
                    <input type="text" maxlength="1" placeholder="">
                </div>
            </div>
            <p id="verify_sologon_m501">If you didn't receive code. <a href="">Resend</a></p>
            <span id="m02_free_space"></span>
            <div class="login_btn_user_inputbtn_c025">
                <button><a href="newpassword.jsp">Check OTP</a></button>
            </div>
            <div class="style_sologo_text_c035">
                <div class="item"></div>
                <p id="m03_add_custom_css">Or Sign in</p>
                <div class="item"></div>
            </div>
            <span id="m03_free_space"></span>
            <div class="login_interface_c1_user_clickable_btn">
                <button type="button">
                    <div class="google_btn_m02">
                        <img src="assert/google.png" width="20" height="20" alt="">
                        <p>Log in with Google</p>
                    </div>
                </button>
                <button type="button">
                    <div class="apple_btn_m02">
                        <img src="assert/apple-logo.png" width="20" height="20" alt="">
                        <p>Log in with Apple</p>
                    </div>
                </button>
            </div>
            <p id="footer_m504_zmy">Do you have an account? <a href="register.jsp">Sign up</a></p>
        </div>
    </div>
</body>
</html>