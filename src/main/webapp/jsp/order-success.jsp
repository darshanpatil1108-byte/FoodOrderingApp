<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order Placed Successfully</title>

<style>

body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: #f7f7f7;
}

.success-container {
    width: 500px;
    max-width: 90%;
    margin: 80px auto;
    background: white;
    padding: 40px;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 8px 30px rgba(0,0,0,0.12);
}

.success-icon {
    font-size: 70px;
}

h1 {
    color: #24963f;
    margin-bottom: 10px;
}

.message {
    color: #555;
    font-size: 16px;
    margin-bottom: 25px;
}

.order-details {
    text-align: left;
    background: #f8f8f8;
    padding: 20px;
    border-radius: 10px;
    line-height: 1.8;
}

.order-details strong {
    color: #222;
}

.home-btn {
    display: inline-block;
    margin-top: 25px;
    background: #e23744;
    color: white;
    text-decoration: none;
    padding: 12px 22px;
    border-radius: 7px;
    font-weight: bold;
}

.home-btn:hover {
    background: #c82333;
}

</style>

</head>

<body>

<div class="success-container">

    <div class="success-icon">
        ✅
    </div>

    <h1>Order Placed Successfully!</h1>

    <p class="message">
        Thank you for ordering from Foodie.
        Your delicious food is on the way! 🍕
    </p>

    <div class="order-details">

        <strong>👤 Name:</strong>
        ${fullName}
        <br>

        <strong>📱 Mobile:</strong>
        ${mobile}
        <br>

        <strong>📍 Address:</strong>
        ${address}
        <br>

        <strong>🏙️ City:</strong>
        ${city}
        <br>

        <strong>📮 PIN Code:</strong>
        ${pinCode}
        <br>

        <strong>💳 Payment:</strong>
        ${paymentMethod}

    </div>

    <a
        href="<%= request.getContextPath() %>/"
        class="home-btn">

        🏠 Back to Home

    </a>

</div>

</body>
</html>