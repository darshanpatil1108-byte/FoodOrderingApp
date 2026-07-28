<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Foodie - Restaurants</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #f8f8f8;
    color: #222;
}

/* NAVBAR */

.navbar {
    height: 70px;
    background: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 7%;
    border-bottom: 1px solid #eee;
}

.logo {
    font-size: 28px;
    font-weight: bold;
    color: #e23744;
}

.nav-links {
    display: flex;
    gap: 30px;
}

.nav-links a {
    text-decoration: none;
    color: #333;
    font-size: 16px;
}

.nav-links a:hover {
    color: #e23744;
}

/* HEADER */

.header {
    background: white;
    padding: 35px 7%;
}

.header h1 {
    font-size: 30px;
    margin-bottom: 10px;
}

.header p {
    color: #777;
}

/* RESTAURANTS */

.restaurant-container {
    width: 86%;
    margin: 30px auto;

    display: grid;
    grid-template-columns: repeat(3, 1fr);

    gap: 25px;
}

/* CARD */

.restaurant-card {
    background: white;
    border-radius: 12px;
    overflow: hidden;

    box-shadow: 0 3px 12px rgba(0,0,0,0.10);

    transition: 0.3s;
}

.restaurant-card:hover {
    transform: translateY(-5px);

    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
}

/* IMAGE */

.restaurant-image {
    width: 100%;
    height: 190px;
    object-fit: cover;
}

/* CONTENT */

.restaurant-content {
    padding: 18px;
}

.restaurant-name {
    font-size: 20px;
    font-weight: bold;

    margin-bottom: 8px;
}

.description {
    color: #777;

    font-size: 14px;

    margin: 10px 0;
}

.rating {
    display: inline-block;

    background: #24963f;

    color: white;

    padding: 4px 8px;

    border-radius: 5px;

    font-size: 12px;
}

.info {
    color: #666;

    font-size: 13px;

    line-height: 1.8;
}

.menu-btn {
    display: inline-block;

    margin-top: 15px;

    padding: 10px 18px;

    background: #e23744;

    color: white;

    text-decoration: none;

    border-radius: 6px;

    font-weight: bold;
}

.menu-btn:hover {
    background: #c82333;
}

/* RESPONSIVE */

@media(max-width: 900px) {

    .restaurant-container {
        grid-template-columns: repeat(2, 1fr);
    }

}

@media(max-width: 600px) {

    .restaurant-container {
        grid-template-columns: 1fr;
    }

}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        🍔 Foodie.
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/jsp/cart.jsp">
            🛒 Cart
        </a>

        <a href="${pageContext.request.contextPath}/jsp/orders.jsp">
            Orders
        </a>

        <a href="${pageContext.request.contextPath}/jsp/profile.jsp">
            Profile
        </a>

    </div>

</div>


<!-- HEADER -->

<div class="header">

    <h1>
        Restaurants near you
    </h1>

    <p>
        Discover the best restaurants and order your favourite food.
    </p>

</div>


<!-- RESTAURANT CARDS -->

<div class="restaurant-container">

<%

    List<Restaurant> restaurants =
        (List<Restaurant>) request.getAttribute("restaurants");

    if (restaurants != null && !restaurants.isEmpty()) {

        for (Restaurant restaurant : restaurants) {

%>

    <div class="restaurant-card">

        <img
            class="restaurant-image"
            src="${pageContext.request.contextPath}/images/<%= restaurant.getImage() %>"
            alt="<%= restaurant.getRestaurantName() %>">


        <div class="restaurant-content">

            <div class="restaurant-name">

                <%= restaurant.getRestaurantName() %>

            </div>


            <div class="rating">

                ⭐ <%= restaurant.getRating() %>

            </div>


            <div class="description">

                <%= restaurant.getDescription() %>

            </div>


            <div class="info">

                🍽️ <%= restaurant.getCity() %>

                <br>

                📍 <%= restaurant.getAddress() %>

                <br>

                ⏱️ <%= restaurant.getDeliveryTime() %> mins

            </div>


            <a
                class="menu-btn"
                href="${pageContext.request.contextPath}/menu?restaurantId=<%= restaurant.getRestaurantId() %>">

                View Menu

            </a>

        </div>

    </div>

<%

        }

    } else {

%>

    <div style="grid-column:1/-1;text-align:center;padding:50px;">

        <h2>No restaurants found</h2>

        <p>Please check your database.</p>

    </div>

<%

    }

%>

</div>

</body>
</html>