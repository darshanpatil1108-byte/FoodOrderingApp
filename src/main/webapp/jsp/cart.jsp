<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.foodapp.model.Cart" %>
<%@ page import="com.foodapp.model.CartItem" %>
<%@ page import="java.util.Map" %>

<%
    Cart cart = (Cart) request.getAttribute("cart");

    if (cart == null) {
        cart = new Cart();
    }

    Map<Integer, CartItem> items = cart.getItems();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodie - Cart</title>

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

/* ================= NAVBAR ================= */

.navbar {
    height: 75px;
    background: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 7%;
    border-bottom: 1px solid #eee;
    position: sticky;
    top: 0;
    z-index: 100;
}

.logo {
    font-size: 30px;
    font-weight: bold;
    color: #e23744;
}

.nav-links {
    display: flex;
    gap: 25px;
}

.nav-links a {
    text-decoration: none;
    color: #333;
    font-size: 16px;
}

.nav-links a:hover {
    color: #e23744;
}

/* ================= MAIN ================= */

.container {
    width: 86%;
    max-width: 1100px;
    margin: 40px auto;
}

.title {
    font-size: 30px;
    margin-bottom: 25px;
}

/* ================= CART ITEM ================= */

.cart-box {
    background: white;
    border-radius: 12px;
    padding: 20px;
    border: 1px solid #eee;
}

.cart-item {
    display: flex;
    align-items: center;
    gap: 20px;
    padding: 20px 0;
    border-bottom: 1px solid #eee;
}

.cart-item:last-child {
    border-bottom: none;
}

.food-image {
    width: 130px;
    height: 100px;
    object-fit: cover;
    border-radius: 10px;
}

.food-details {
    flex: 1;
}

.food-details h2 {
    font-size: 20px;
    margin-bottom: 8px;
}

.description {
    color: #777;
    margin-bottom: 8px;
    font-size: 14px;
}

.price {
    font-weight: bold;
    font-size: 16px;
}

.quantity {
    margin-top: 8px;
    color: #555;
}

.item-total {
    font-size: 18px;
    font-weight: bold;
}

.remove-btn {
    text-decoration: none;
    color: #e23744;
    border: 1px solid #e23744;
    padding: 8px 12px;
    border-radius: 6px;
}

.remove-btn:hover {
    background: #e23744;
    color: white;
}

/* ================= SUMMARY ================= */

.summary {
    background: white;
    margin-top: 20px;
    padding: 25px;
    border-radius: 12px;
    border: 1px solid #eee;
    max-width: 600px;
    margin-left: auto;
}

.summary h2 {
    margin-bottom: 20px;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    margin: 12px 0;
    color: #555;
}

.total {
    display: flex;
    justify-content: space-between;
    border-top: 1px solid #ddd;
    padding-top: 18px;
    margin-top: 18px;
    font-size: 22px;
    font-weight: bold;
}

/* ================= CHECKOUT BUTTON ================= */

.checkout-btn {
    display: block;
    text-align: center;
    margin-top: 25px;
    padding: 15px;
    background: #e23744;
    color: white;
    text-decoration: none;
    border-radius: 7px;
    font-size: 17px;
    font-weight: bold;
    cursor: pointer;
}

.checkout-btn:hover {
    background: #c82333;
}

/* ================= EMPTY CART ================= */

.empty-cart {
    background: white;
    text-align: center;
    padding: 70px 20px;
    border-radius: 12px;
}

.empty-cart-icon {
    font-size: 60px;
    margin-bottom: 15px;
}

.empty-cart h2 {
    margin-bottom: 10px;
}

.empty-cart p {
    color: #777;
    margin-bottom: 25px;
}

.browse-btn {
    display: inline-block;
    padding: 12px 22px;
    background: #e23744;
    color: white;
    text-decoration: none;
    border-radius: 6px;
}

/* ================= MOBILE ================= */

@media(max-width: 700px) {

    .container {
        width: 94%;
    }

    .cart-item {
        flex-wrap: wrap;
    }

    .food-image {
        width: 100px;
        height: 80px;
    }

    .summary {
        max-width: 100%;
    }

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <div class="logo">
        🍔 Foodie.
    </div>

    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/">
            🏠 Home
        </a>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="container">

    <h1 class="title">
        🛒 Your Cart
    </h1>


<%
    if (items == null || items.isEmpty()) {
%>

    <!-- ================= EMPTY CART ================= -->

    <div class="empty-cart">

        <div class="empty-cart-icon">
            🛒
        </div>

        <h2>
            Your cart is empty
        </h2>

        <p>
            Add some delicious food from our restaurants.
        </p>

        <a
            href="<%= request.getContextPath() %>/"
            class="browse-btn">

            Browse Food

        </a>

    </div>

<%
    } else {
%>


    <!-- ================= CART ITEMS ================= -->

    <div class="cart-box">

<%
        for (CartItem item : items.values()) {

            String image = item.getMenu().getImage();

            if (image == null || image.trim().isEmpty()) {

                image =
                    "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=500&q=80";
            }
%>

        <div class="cart-item">

            <img
                src="<%= image %>"
                class="food-image"
                alt="<%= item.getMenu().getItemName() %>">


            <div class="food-details">

                <h2>
                    <%= item.getMenu().getItemName() %>
                </h2>

                <div class="description">

                    <%= item.getMenu().getDescription() %>

                </div>

                <div class="price">

                    $<%= String.format("%.2f",
                        item.getMenu().getPrice()) %>

                </div>

                <div class="quantity">

                    Quantity:
                    <%= item.getQuantity() %>

                </div>

            </div>


            <div class="item-total">

                $<%= String.format("%.2f",
                    item.getTotalPrice()) %>

            </div>


            <a
                href="<%= request.getContextPath() %>/removeFromCart?menuId=<%= item.getMenu().getMenuId() %>"
                class="remove-btn">

                Remove

            </a>

        </div>

<%
        }
%>

    </div>


    <!-- ================= ORDER SUMMARY ================= -->

    <div class="summary">

        <h2>
            Order Summary
        </h2>


        <div class="summary-row">

            <span>
                Item Total
            </span>

            <span>
                $<%= String.format("%.2f",
                    cart.getTotal()) %>
            </span>

        </div>


        <div class="summary-row">

            <span>
                Delivery Fee
            </span>

            <span>
                $2.00
            </span>

        </div>


        <div class="summary-row">

            <span>
                Platform Fee
            </span>

            <span>
                $1.00
            </span>

        </div>


        <div class="total">

            <span>
                Total
            </span>

            <span>
                $<%= String.format("%.2f",
                    cart.getTotal() + 3.00) %>
            </span>

        </div>


        <!-- ================= IMPORTANT ================= -->

        <a
            href="<%= request.getContextPath() %>/checkout"
            class="checkout-btn">

            Proceed to Checkout →

        </a>

    </div>

<%
    }
%>

</div>

</body>

</html>

