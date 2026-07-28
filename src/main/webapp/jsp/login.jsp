<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Foodie - Login</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    min-height: 100vh;

    background:
        linear-gradient(
            rgba(0,0,0,0.45),
            rgba(0,0,0,0.45)
        ),
        url("https://images.unsplash.com/photo-1504674900247-0877df9cc836")
        center/cover;

    display: flex;
    justify-content: center;
    align-items: center;
}

.login-container {
    width: 400px;
    background: white;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}

.logo {
    text-align: center;
    font-size: 32px;
    font-weight: bold;
    color: #e23744;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    color: #777;
    margin-bottom: 25px;
}

.error-message {
    background: #ffe5e5;
    color: #d60000;
    padding: 10px;
    border-radius: 6px;
    text-align: center;
    margin-bottom: 20px;
    font-size: 14px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #333;
}

.form-group input {
    width: 100%;
    padding: 13px;
    border: 1px solid #ddd;
    border-radius: 7px;
    font-size: 15px;
    outline: none;
}

.form-group input:focus {
    border-color: #e23744;
}

.login-btn {
    width: 100%;
    padding: 14px;
    background: #e23744;
    border: none;
    color: white;
    font-size: 17px;
    font-weight: bold;
    border-radius: 7px;
    cursor: pointer;
}

.login-btn:hover {
    background: #c82333;
}

.forgot {
    text-align: right;
    margin-top: 12px;
}

.forgot a {
    color: #e23744;
    text-decoration: none;
    font-size: 14px;
}

.register {
    text-align: center;
    margin-top: 25px;
    color: #666;
}

.register a {
    color: #e23744;
    font-weight: bold;
    text-decoration: none;
}

.home {
    text-align: center;
    margin-top: 20px;
}

.home a {
    color: #555;
    text-decoration: none;
    font-size: 14px;
}

</style>

</head>

<body>

<div class="login-container">

    <div class="logo">
        🍔 Foodie.
    </div>

    <div class="subtitle">
        Login to order your favourite food
    </div>


    <!-- LOGIN ERROR MESSAGE -->

    <% if ("invalid".equals(request.getParameter("error"))) { %>

        <div class="error-message">
            Invalid email or password.
        </div>

    <% } %>


    <!-- LOGIN FORM -->

    <form action="${pageContext.request.contextPath}/login"
          method="post">


        <div class="form-group">

            <label>
                Email
            </label>

            <input
                type="email"
                name="email"
                placeholder="Enter your email"
                required>

        </div>


        <div class="form-group">

            <label>
                Password
            </label>

            <input
                type="password"
                name="password"
                placeholder="Enter your password"
                required>

        </div>


        <button
            type="submit"
            class="login-btn">

            Login

        </button>


    </form>


    <!-- FORGOT PASSWORD -->

    <div class="forgot">

        <a href="forgotPassword.jsp">
            Forgot Password?
        </a>

    </div>


    <!-- REGISTER -->

    <div class="register">

        Don't have an account?

        <a href="register.jsp">
            Create Account
        </a>

    </div>


    <!-- HOME -->

    <div class="home">

        <a href="../index.jsp">
            ← Back to Home
        </a>

    </div>

</div>

</body>

</html>