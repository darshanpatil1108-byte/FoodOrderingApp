
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.foodapp.model.Cart" %>
<%@ page import="com.foodapp.model.CartItem" %>

<%
    Cart cart = (Cart) request.getAttribute("cart");

    double itemTotal = cart.getTotal();
    double deliveryFee = 2.00;
    double platformFee = 1.00;
    double grandTotal = itemTotal + deliveryFee + platformFee;
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodie - Checkout</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    background: #f8f8f8;
    color: #222;
}

.navbar {
    height: 72px;
    background: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 7%;
    border-bottom: 1px solid #eee;
}

.logo {
    font-size: 29px;
    font-weight: bold;
    color: #e23744;
}

.logo span {
    color: #222;
}

.navbar a {
    text-decoration: none;
    color: #333;
}

.container {
    width: 86%;
    max-width: 1100px;
    margin: 35px auto;
}

.title {
    font-size: 30px;
    margin-bottom: 25px;
}

.checkout-grid {
    display: grid;
    grid-template-columns: 1.6fr 1fr;
    gap: 25px;
}

.box {
    background: white;
    padding: 25px;
    border-radius: 12px;
    border: 1px solid #eee;
    margin-bottom: 20px;
}

.box h2 {
    margin-bottom: 20px;
    font-size: 21px;
}

label {
    display: block;
    margin-bottom: 7px;
    font-weight: bold;
    font-size: 14px;
}

input,
textarea {
    width: 100%;
    padding: 13px;
    border: 1px solid #ddd;
    border-radius: 7px;
    margin-bottom: 15px;
    font-size: 14px;
    outline: none;
}

textarea {
    height: 90px;
    resize: none;
}

input:focus,
textarea:focus {
    border-color: #e23744;
}

.payment-option {
    display: block;
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 12px;
    cursor: pointer;
}

.payment-option:hover {
    border-color: #e23744;
}

.payment-option input {
    width: auto;
    margin: 0 10px 0 0;
}

.payment-title {
    font-weight: bold;
}

.payment-description {
    display: block;
    margin-left: 27px;
    margin-top: 5px;
    color: #777;
    font-size: 13px;
}

.order-item {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid #eee;
}

.order-item:last-child {
    border-bottom: none;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    margin: 14px 0;
    color: #555;
}

.total {
    display: flex;
    justify-content: space-between;
    border-top: 1px solid #ddd;
    padding-top: 18px;
    margin-top: 18px;
    font-size: 21px;
    font-weight: bold;
}

.place-order {
    width: 100%;
    border: none;
    background: #e23744;
    color: white;
    padding: 15px;
    border-radius: 7px;
    font-size: 17px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 20px;
}

.place-order:hover {
    background: #c82333;
}

@media(max-width: 800px) {

    .checkout-grid {
        grid-template-columns: 1fr;
    }

    .container {
        width: 94%;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        🍔 Foodie<span>.</span>
    </div>

    <a href="<%= request.getContextPath() %>/cart">
        ← Back to Cart
    </a>

</div>


<div class="container">

    <h1 class="title">
        📦 Checkout
    </h1>


    <div class="checkout-grid">


        <!-- LEFT SIDE -->

        <div>


            <!-- DELIVERY ADDRESS -->

            <div class="box">

                <h2>
                    📍 Delivery Address
                </h2>

                <form
                    action="<%= request.getContextPath() %>/payment"
                    method="post"
                    id="checkoutForm">


                    <label>
                        Full Name
                    </label>

                    <input
                        type="text"
                        name="name"
                        placeholder="Enter your full name"
                        required>


                    <label>
                        Mobile Number
                    </label>

                    <input
                        type="tel"
                        name="phone"
                        placeholder="Enter mobile number"
                        required>


                    <label>
                        Delivery Address
                    </label>

                    <textarea
                        name="address"
                        placeholder="House / Flat, Street, Area, Landmark"
                        required></textarea>


                    <label>
                        City
                    </label>

                    <input
                        type="text"
                        name="city"
                        placeholder="Enter city"
                        required>


                    <label>
                        PIN Code
                    </label>

                    <input
                        type="text"
                        name="pincode"
                        placeholder="Enter PIN code"
                        required>


                    <!-- PAYMENT -->

                    <h2 style="margin-top:25px;">
                        💳 Payment Method
                    </h2>


                    <label class="payment-option">

                        <input
                            type="radio"
                            name="paymentMethod"
                            value="UPI"
                            required>

                        <span class="payment-title">
                            📱 UPI
                        </span>

                        <span class="payment-description">
                            Google Pay / PhonePe / Paytm / UPI
                        </span>

                    </label>


                    <label class="payment-option">

                        <input
                            type="radio"
                            name="paymentMethod"
                            value="CARD">

                        <span class="payment-title">
                            💳 Credit / Debit Card
                        </span>

                        <span class="payment-description">
                            Visa / Mastercard / RuPay
                        </span>

                    </label>


                    <label class="payment-option">

                        <input
                            type="radio"
                            name="paymentMethod"
                            value="COD">

                        <span class="payment-title">
                            💵 Cash on Delivery
                        </span>

                        <span class="payment-description">
                            Pay when your food arrives
                        </span>

                    </label>


                    <button
                        type="submit"
                        class="place-order">

                        Continue to Payment →

                    </button>


                </form>

            </div>

        </div>


        <!-- RIGHT SIDE -->

        <div>


            <!-- ORDER SUMMARY -->

            <div class="box">

                <h2>
                    🛒 Your Order
                </h2>


<%
                for (CartItem item : cart.getItems().values()) {
%>

                <div class="order-item">

                    <span>

                        <%= item.getMenu().getItemName() %>
                        × <%= item.getQuantity() %>

                    </span>

                    <span>

                        $<%= String.format("%.2f",
                            item.getTotalPrice()) %>

                    </span>

                </div>

<%
                }
%>


                <div class="summary-row">

                    <span>
                        Item Total
                    </span>

                    <span>
                        $<%= String.format("%.2f",
                            itemTotal) %>
                    </span>

                </div>


                <div class="summary-row">

                    <span>
                        Delivery Fee
                    </span>

                    <span>
                        $<%= String.format("%.2f",
                            deliveryFee) %>
                    </span>

                </div>


                <div class="summary-row">

                    <span>
                        Platform Fee
                    </span>

                    <span>
                        $<%= String.format("%.2f",
                            platformFee) %>
                    </span>

                </div>


                <div class="total">

                    <span>
                        Total
                    </span>

                    <span>
                        $<%= String.format("%.2f",
                            grandTotal) %>
                    </span>

                </div>

            </div>


            <div class="box">

                <h2>
                    🔒 Safe & Secure
                </h2>

                <p style="color:#777; line-height:1.6;">

                    Your order details are securely
                    processed by Foodie.

                </p>

            </div>


        </div>

    </div>

</div>

</body>

</html>

