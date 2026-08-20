<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Foodie - Restaurants</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #f7f8fc;
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
    box-shadow: 0 2px 15px rgba(0,0,0,0.08);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo {
    font-size: 30px;
    font-weight: bold;
    color: #e23744;
}

.nav-links {
    display: flex;
    gap: 28px;
    align-items: center;
}

.nav-links a {
    text-decoration: none;
    color: #333;
    font-size: 15px;
    font-weight: 600;
}

.nav-links a:hover {
    color: #e23744;
}

/* ================= HERO ================= */

.hero {
    min-height: 300px;

    background:
        linear-gradient(
            rgba(0,0,0,0.55),
            rgba(0,0,0,0.55)
        ),
        url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1600&q=85")
        center/cover;

    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
}

.hero-content {
    color: white;
}

.hero h1 {
    font-size: 42px;
    margin-bottom: 12px;
}

.hero p {
    font-size: 18px;
    margin-bottom: 25px;
}

/* ================= SEARCH ================= */

.search-box {
    width: 650px;
    max-width: 90%;
    background: white;
    padding: 7px;
    border-radius: 10px;
    display: flex;
    margin: auto;
}

.search-box input {
    flex: 1;
    border: none;
    outline: none;
    padding: 15px;
    font-size: 15px;
}

.search-box button {
    border: none;
    background: #e23744;
    color: white;
    padding: 0 28px;
    border-radius: 7px;
    cursor: pointer;
    font-weight: bold;
}

.search-box button:hover {
    background: #c82333;
}

/* ================= LOCATION ================= */

.location-bar {
    background: white;
    padding: 18px 7%;
    border-bottom: 1px solid #eee;
}

.location {
    color: #666;
}

.location strong {
    color: #222;
}

/* ================= SECTION ================= */

.section {
    padding: 45px 7%;
}

.section-title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.section-title h2 {
    font-size: 28px;
}

.count {
    color: #777;
    font-size: 14px;
}

/* ================= RESTAURANTS ================= */

.restaurants {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 28px;
}

/* ================= CARD ================= */

.card {
    background: white;
    border-radius: 18px;
    overflow: hidden;
    box-shadow: 0 5px 25px rgba(0,0,0,0.08);
    transition: 0.35s;
}

.card:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
}

/* ================= IMAGE ================= */

.restaurant-image {
    width: 100%;
    height: 210px;
    object-fit: cover;
    display: block;
    background: #eee;
}

/* ================= CARD CONTENT ================= */

.card-content {
    padding: 20px;
}

.card-content h3 {
    font-size: 21px;
    margin-bottom: 10px;
}

.description {
    color: #777;
    font-size: 14px;
    margin-bottom: 12px;
    min-height: 20px;
}

/* ================= RATING ================= */

.rating {
    display: inline-block;
    background: #24963f;
    color: white;
    padding: 6px 9px;
    border-radius: 6px;
    font-size: 13px;
    font-weight: bold;
}

/* ================= INFO ================= */

.info {
    margin-top: 14px;
    color: #666;
    font-size: 14px;
    line-height: 1.8;
}

.info span {
    margin-right: 8px;
}

/* ================= BUTTON ================= */

.menu-btn {
    display: block;
    text-align: center;
    margin-top: 18px;
    background: linear-gradient(135deg, #e23744, #ff5a5f);
    color: white;
    padding: 12px;
    border-radius: 9px;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s;
}

.menu-btn:hover {
    transform: scale(1.02);
}

/* ================= FOOTER ================= */

.footer {
    background: #202020;
    color: white;
    padding: 40px 7%;
    margin-top: 30px;
}

.footer h2 {
    color: #e23744;
    margin-bottom: 10px;
}

.footer p {
    color: #aaa;
}

/* ================= RESPONSIVE ================= */

@media(max-width: 1000px) {

    .restaurants {
        grid-template-columns: repeat(2, 1fr);
    }

}

@media(max-width: 650px) {

    .navbar {
        padding: 0 20px;
    }

    .nav-links {
        gap: 10px;
    }

    .nav-links a {
        font-size: 12px;
    }

    .hero h1 {
        font-size: 30px;
    }

    .hero p {
        font-size: 15px;
    }

    .search-box {
        flex-direction: column;
        gap: 5px;
    }

    .search-box button {
        padding: 13px;
    }

    .restaurants {
        grid-template-columns: 1fr;
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

        <a href="${pageContext.request.contextPath}/dashboard.jsp">
            Home
        </a>

        <a href="#">
            Orders
        </a>

        <a href="#">
            🛒 Cart
        </a>

        <a href="#">
            👤 Profile
        </a>

        <a href="${pageContext.request.contextPath}/login.jsp">
            Logout
        </a>

    </div>

</div>


<!-- ================= LOCATION ================= -->

<div class="location-bar">

    📍 Delivering to:
    <strong>Bangalore</strong>

</div>


<!-- ================= HERO ================= -->

<section class="hero">

    <div class="hero-content">

        <h1>
            Discover Delicious Food 🍕
        </h1>

        <p>
            Find the best restaurants and food near you
        </p>

        <form action="${pageContext.request.contextPath}/restaurants"
              method="get"
              class="search-box">

            <input
                type="text"
                name="keyword"
                placeholder="Search restaurant, food, cuisine or area...">

            <button type="submit">
                🔍 Search
            </button>

        </form>

    </div>

</section>


<!-- ================= RESTAURANTS ================= -->

<section class="section">

    <div class="section-title">

        <h2>
            🍽️ Restaurants Near You
        </h2>

        <div class="count">

            <%
                List<Restaurant> restaurants =
                    (List<Restaurant>) request.getAttribute("restaurants");

                if (restaurants != null) {
            %>

                <%= restaurants.size() %> restaurants found

            <%
                }
            %>

        </div>

    </div>


    <div class="restaurants">


    <%

        if (restaurants != null && !restaurants.isEmpty()) {

            for (Restaurant restaurant : restaurants) {

    %>


        <!-- ================= RESTAURANT CARD ================= -->

        <div class="card">


            <!-- DATABASE IMAGE -->

            <img
                class="restaurant-image"
                src="<%= restaurant.getImage() %>"
                alt="<%= restaurant.getRestaurantName() %>"
                onerror="this.src='https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=900&q=85';">


            <div class="card-content">


                <h3>
                    <%= restaurant.getRestaurantName() %>
                </h3>


                <div class="description">

                    <%= restaurant.getDescription() %>

                </div>


                <span class="rating">

                    ★ <%= restaurant.getRating() %>

                </span>


                <div class="info">

                    🍽️ <%= restaurant.getCity() %>

                    <br>

                    📍 <%= restaurant.getAddress() %>

                    <br>

                    ⏱️ <%= restaurant.getDeliveryTime() %> mins

                    <br>

                    ⭐ Highly rated restaurant

                </div>


                <a
                    class="menu-btn"
                    href="${pageContext.request.contextPath}/menu?restaurantId=<%= restaurant.getRestaurantId() %>">

                    View Menu 🍽️

                </a>


            </div>

        </div>


    <%

            }

        } else {

    %>


        <div style="
            grid-column:1/-1;
            text-align:center;
            padding:60px;
            background:white;
            border-radius:15px;
        ">

            <h2>
                😔 No restaurants found
            </h2>

            <p style="margin-top:10px;color:#777;">
                Try searching for another restaurant or food.
            </p>

        </div>


    <%

        }

    %>


    </div>

</section>


<!-- ================= FOOTER ================= -->

<div class="footer">

    <h2>
        🍔 Foodie.
    </h2>

    <p>
        Your favourite food, delivered to your doorstep.
    </p>

</div>


</body>

</html>