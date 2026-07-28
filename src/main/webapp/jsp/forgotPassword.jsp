<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Foodie - Forgot Password</title>

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

.container {

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

    margin-bottom: 30px;

    line-height: 1.5;
}

.form-group {

    margin-bottom: 20px;
}

.form-group label {

    display: block;

    margin-bottom: 8px;

    font-weight: bold;
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

.reset-btn {

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

.reset-btn:hover {

    background: #c82333;
}

.login {

    text-align: center;

    margin-top: 20px;

    color: #666;
}

.login a {

    color: #e23744;

    font-weight: bold;

    text-decoration: none;
}

.home {

    text-align: center;

    margin-top: 15px;
}

.home a {

    color: #555;

    text-decoration: none;

    font-size: 14px;
}

</style>

</head>

<body>


<div class="container">


    <div class="logo">
        🍔 Foodie.
    </div>


    <div class="subtitle">

        Forgot your password?

        <br>

        Enter your registered email to reset it.

    </div>


    <form action="#" method="post">


        <div class="form-group">

            <label>
                Email
            </label>

            <input
                type="email"
                name="email"
                placeholder="Enter your registered email"
                required>

        </div>


        <button
            type="submit"
            class="reset-btn">

            Reset Password

        </button>


    </form>


    <div class="login">

        Remember your password?

        <a href="login.jsp">
            Login
        </a>

    </div>


    <div class="home">

        <a href="../index.jsp">
            ← Back to Home
        </a>

    </div>


</div>


</body>

</html>