<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Restaurant" %>

<%
    List<Restaurant> restaurants =
        (List<Restaurant>) request.getAttribute("restaurants");

    String searchKeyword =
        (String) request.getAttribute("searchKeyword");

    if (restaurants == null) {
        restaurants = new java.util.ArrayList<Restaurant>();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodie - Food Delivery</title>

<style>

/* =========================================================
   RESET
========================================================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f7f8fc;
    color: #202124;
    overflow-x: hidden;
}

a {
    text-decoration: none;
}

/* =========================================================
   ANIMATIONS
========================================================= */

@keyframes fadeUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}

@keyframes floating {
    0% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-10px);
    }

    100% {
        transform: translateY(0);
    }
}

/* =========================================================
   NAVBAR
========================================================= */

.navbar {
    height: 76px;
    background: rgba(255,255,255,0.96);
    backdrop-filter: blur(15px);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 6%;
    position: sticky;
    top: 0;
    z-index: 1000;
    box-shadow: 0 4px 20px rgba(0,0,0,0.06);
}

.logo {
    font-size: 30px;
    font-weight: 900;
    color: #ff385c;
    letter-spacing: -1px;
}

.logo span {
    color: #ff7a00;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 25px;
}

.nav-links a {
    color: #333;
    font-size: 15px;
    font-weight: 600;
    padding: 10px 14px;
    border-radius: 10px;
    transition: all 0.3s ease;
}

.nav-links a:hover {
    color: #ff385c;
    background: #fff0f3;
    transform: translateY(-2px);
}

.cart-link {
    position: relative;
}

.cart-count {
    position: absolute;
    top: -3px;
    right: -2px;
    background: #ff385c;
    color: white;
    width: 19px;
    height: 19px;
    border-radius: 50%;
    font-size: 11px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
}

/* =========================================================
   LOCATION
========================================================= */

.location-bar {
    background: white;
    padding: 14px 6%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid #eee;
}

.location-left {
    display: flex;
    align-items: center;
    gap: 10px;
    color: #555;
    font-size: 14px;
}

.location-icon {
    width: 38px;
    height: 38px;
    background: #fff0f3;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
}

.location-left strong {
    color: #222;
    font-size: 15px;
}

.change-location {
    color: #ff385c;
    font-weight: 700;
    cursor: pointer;
}

/* =========================================================
   HERO
========================================================= */

.hero {
    min-height: 470px;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    overflow: hidden;

    background:
        linear-gradient(
            135deg,
            rgba(255,56,92,0.88),
            rgba(255,122,0,0.78),
            rgba(122,58,237,0.75)
        ),
        url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1600&q=85")
        center/cover;
}

.hero::before {
    content: "";
    position: absolute;
    width: 500px;
    height: 500px;
    background: rgba(255,255,255,0.12);
    border-radius: 50%;
    top: -250px;
    left: -150px;
    animation: floating 6s ease-in-out infinite;
}

.hero::after {
    content: "";
    position: absolute;
    width: 400px;
    height: 400px;
    background: rgba(255,255,255,0.1);
    border-radius: 50%;
    right: -150px;
    bottom: -200px;
    animation: floating 7s ease-in-out infinite;
}

.hero-content {
    position: relative;
    z-index: 2;
    color: white;
    width: 850px;
    max-width: 92%;
    animation: fadeUp 0.9s ease;
}

.hero-badge {
    display: inline-block;
    background: rgba(255,255,255,0.2);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255,255,255,0.3);
    padding: 9px 18px;
    border-radius: 30px;
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 20px;
}

.hero h1 {
    font-size: 55px;
    line-height: 1.1;
    margin-bottom: 15px;
    font-weight: 900;
}

.hero h1 span {
    color: #ffe16b;
}

.hero p {
    font-size: 19px;
    margin-bottom: 30px;
    color: rgba(255,255,255,0.92);
}

/* =========================================================
   SEARCH
========================================================= */

.search-box {
    background: white;
    padding: 8px;
    border-radius: 18px;
    width: 780px;
    max-width: 100%;
    margin: auto;
    display: flex;
    align-items: center;
    box-shadow: 0 18px 45px rgba(0,0,0,0.22);
}

.search-icon {
    font-size: 21px;
    padding-left: 15px;
}

.search-box input {
    flex: 1;
    border: none;
    outline: none;
    padding: 17px 14px;
    font-size: 15px;
    color: #333;
}

.search-box button {
    border: none;
    background: linear-gradient(
        135deg,
        #ff385c,
        #ff7a00
    );
    color: white;
    padding: 16px 28px;
    border-radius: 13px;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
}

/* =========================================================
   GENERAL SECTION
========================================================= */

.section {
    padding: 55px 6%;
}

.section-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 28px;
}

.section-title {
    font-size: 29px;
    font-weight: 850;
    color: #202124;
}

.section-subtitle {
    margin-top: 6px;
    color: #777;
    font-size: 14px;
}

.view-all {
    color: #ff385c;
    font-size: 14px;
    font-weight: 700;
}

/* =========================================================
   CATEGORY
========================================================= */

.category-wrapper {
    overflow-x: auto;
    padding-bottom: 10px;
    scrollbar-width: none;
}

.category-wrapper::-webkit-scrollbar {
    display: none;
}

.categories {
    display: flex;
    gap: 24px;
    min-width: max-content;
}

.category {
    width: 125px;
    text-align: center;
    cursor: pointer;
    transition: 0.3s;
}

.category:hover {
    transform: translateY(-8px);
}

.category-image {
    width: 112px;
    height: 112px;
    margin: auto;
    border-radius: 50%;
    padding: 5px;
    background: linear-gradient(
        135deg,
        #ff385c,
        #ffb347
    );
    box-shadow: 0 8px 25px rgba(0,0,0,0.12);
}

.category-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
    border: 4px solid white;
    display: block;
}

.category p {
    margin-top: 12px;
    font-weight: 700;
    font-size: 14px;
}

/* =========================================================
   POPULAR FOOD
========================================================= */

.food-section {
    background: #ffffff;
}

.food-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 22px;
}

.food-card {
    background: white;
    border-radius: 18px;
    overflow: hidden;
    border: 1px solid #eeeeee;
    box-shadow: 0 7px 22px rgba(0,0,0,0.07);
    transition: 0.3s;
}

.food-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 18px 35px rgba(0,0,0,0.13);
}

.food-image {
    width: 100%;
    height: 190px;
    object-fit: cover;
    display: block;
    background: #eee;
}

.food-content {
    padding: 17px;
}

.food-content h3 {
    font-size: 18px;
    margin-bottom: 6px;
}

.food-content p {
    color: #777;
    font-size: 13px;
    margin-bottom: 10px;
}

.food-price {
    color: #ff385c;
    font-size: 17px;
    font-weight: 800;
}

/* =========================================================
   OFFERS
========================================================= */

.offer-section {
    background: linear-gradient(
        135deg,
        #fff4f6,
        #fff9ed
    );
}

.offers {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 22px;
}

.offer-card {
    min-height: 170px;
    border-radius: 20px;
    padding: 25px;
    color: white;
    position: relative;
    overflow: hidden;
    transition: 0.4s;
    box-shadow: 0 12px 30px rgba(0,0,0,0.1);
}

.offer-card:hover {
    transform: translateY(-8px);
}

.offer-card:nth-child(1) {
    background: linear-gradient(
        135deg,
        #ff385c,
        #ff6b35
    );
}

.offer-card:nth-child(2) {
    background: linear-gradient(
        135deg,
        #7b2ff7,
        #f107a3
    );
}

.offer-card:nth-child(3) {
    background: linear-gradient(
        135deg,
        #00a86b,
        #00c6a7
    );
}

.offer-icon {
    font-size: 35px;
    margin-bottom: 10px;
}

.offer-card h3 {
    font-size: 22px;
    margin-bottom: 5px;
}

.offer-card p {
    font-size: 13px;
}

/* =========================================================
   FILTERS
========================================================= */

.filters {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    margin-bottom: 30px;
}

.filter {
    padding: 10px 18px;
    border: 1px solid #e4e4e4;
    background: white;
    border-radius: 30px;
    cursor: pointer;
    font-size: 13px;
    font-weight: 600;
}

.filter:hover,
.filter.active {
    background: #ff385c;
    color: white;
    border-color: #ff385c;
}

/* =========================================================
   RESTAURANTS
========================================================= */

.restaurant-section {
    background: white;
}

.restaurants {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.restaurant-card {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    border: 1px solid #eeeeee;
    box-shadow: 0 7px 25px rgba(0,0,0,0.07);
    transition: transform 0.4s ease,
                box-shadow 0.4s ease;
}

.restaurant-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 20px 45px rgba(0,0,0,0.14);
}

.restaurant-image-wrapper {
    height: 210px;
    position: relative;
    overflow: hidden;
    background: #eee;
}

.restaurant-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.offer-badge {
    position: absolute;
    top: 14px;
    left: 14px;
    background: #ff385c;
    color: white;
    padding: 7px 12px;
    border-radius: 8px;
    font-size: 11px;
    font-weight: 800;
}

.favorite {
    position: absolute;
    top: 12px;
    right: 12px;
    width: 38px;
    height: 38px;
    border-radius: 50%;
    background: rgba(255,255,255,0.95);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    cursor: pointer;
}

.restaurant-content {
    padding: 20px;
}

.restaurant-title-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 10px;
}

.restaurant-content h3 {
    font-size: 20px;
    margin-bottom: 7px;
    color: #202124;
}

.rating {
    background: #149447;
    color: white;
    padding: 6px 9px;
    border-radius: 7px;
    font-size: 12px;
    font-weight: 800;
}

.cuisine {
    color: #777;
    font-size: 13px;
    margin-bottom: 13px;
}

.restaurant-info {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    color: #666;
    font-size: 12px;
    margin-bottom: 16px;
}

.info-chip {
    background: #f7f7f7;
    padding: 6px 9px;
    border-radius: 7px;
}

.restaurant-description {
    color: #777;
    font-size: 13px;
    line-height: 1.5;
    margin-bottom: 17px;
}

.menu-btn {
    display: block;
    text-align: center;
    background: linear-gradient(
        135deg,
        #ff385c,
        #ff7a00
    );
    color: white;
    padding: 12px;
    border-radius: 11px;
    font-size: 14px;
    font-weight: 700;
}

/* =========================================================
   WHY
========================================================= */

.why-section {
    background: #f8f8fb;
}

.why-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.why-card {
    background: white;
    border-radius: 18px;
    padding: 28px 20px;
    text-align: center;
    border: 1px solid #eee;
}

.why-icon {
    width: 60px;
    height: 60px;
    margin: auto auto 15px;
    border-radius: 18px;
    background: #fff0f3;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 28px;
}

.why-card h3 {
    margin-bottom: 7px;
    font-size: 16px;
}

.why-card p {
    color: #777;
    font-size: 12px;
    line-height: 1.5;
}

/* =========================================================
   PAYMENT
========================================================= */

.payment-section {
    background: white;
    text-align: center;
}

.payment-box {
    max-width: 800px;
    margin: auto;
    background: linear-gradient(
        135deg,
        #fff5f7,
        #f7f3ff
    );
    border-radius: 22px;
    padding: 35px;
    border: 1px solid #eee;
}

.payment-box h2 {
    margin-bottom: 10px;
}

.payment-box p {
    color: #777;
    margin-bottom: 22px;
    font-size: 14px;
}

.payment-options {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 12px;
}

.payment {
    background: white;
    border: 1px solid #eee;
    padding: 10px 18px;
    border-radius: 12px;
    font-size: 13px;
    font-weight: 600;
}

/* =========================================================
   FOOTER
========================================================= */

.footer {
    background: linear-gradient(
        135deg,
        #191919,
        #292929
    );
    color: white;
    padding: 50px 6% 25px;
}

.footer-top {
    display: grid;
    grid-template-columns: 2fr 1fr 1fr 1fr;
    gap: 40px;
    padding-bottom: 35px;
    border-bottom: 1px solid #444;
}

.footer-logo {
    font-size: 28px;
    font-weight: 900;
    color: #ff385c;
    margin-bottom: 13px;
}

.footer-description {
    color: #aaa;
    font-size: 13px;
    line-height: 1.7;
    max-width: 330px;
}

.footer h4 {
    margin-bottom: 15px;
    font-size: 15px;
}

.footer a {
    display: block;
    color: #aaa;
    font-size: 13px;
    margin-bottom: 9px;
}

.footer-bottom {
    text-align: center;
    padding-top: 25px;
    color: #888;
    font-size: 12px;
}

/* =========================================================
   RESPONSIVE
========================================================= */

@media(max-width:1100px) {

    .restaurants {
        grid-template-columns: repeat(2, 1fr);
    }

    .food-grid {
        grid-template-columns: repeat(2, 1fr);
    }

    .why-grid {
        grid-template-columns: repeat(2, 1fr);
    }

    .footer-top {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media(max-width:800px) {

    .nav-links {
        gap: 5px;
    }

    .nav-links a {
        padding: 8px;
        font-size: 13px;
    }

    .hero h1 {
        font-size: 40px;
    }

    .offers {
        grid-template-columns: 1fr;
    }
}

@media(max-width:600px) {

    .navbar {
        height: auto;
        padding: 15px 20px;
        flex-direction: column;
        gap: 10px;
    }

    .nav-links {
        width: 100%;
        justify-content: center;
        flex-wrap: wrap;
    }

    .location-bar {
        padding: 12px 20px;
    }

    .hero {
        min-height: 470px;
    }

    .hero h1 {
        font-size: 34px;
    }

    .hero p {
        font-size: 15px;
    }

    .search-box {
        flex-direction: column;
        padding: 10px;
    }

    .search-icon {
        display: none;
    }

    .search-box input {
        width: 100%;
        padding: 15px;
        text-align: center;
    }

    .search-box button {
        width: 100%;
    }

    .section {
        padding: 40px 20px;
    }

    .section-title {
        font-size: 24px;
    }

    .restaurants {
        grid-template-columns: 1fr;
    }

    .food-grid {
        grid-template-columns: 1fr;
    }

    .why-grid {
        grid-template-columns: 1fr;
    }

    .footer-top {
        grid-template-columns: 1fr;
    }
}

</style>

</head>

<body>

<!-- =====================================================
     NAVBAR
===================================================== -->

<nav class="navbar">

    <div class="logo">
        🍔 Food<span>ie</span>
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/dashboard">
            🏠 Home
        </a>

        <a href="#restaurants">
            🍽️ Restaurants
        </a>

        <a href="${pageContext.request.contextPath}/orders">
            📦 Orders
        </a>

        <a href="${pageContext.request.contextPath}/cart"
           class="cart-link">
            🛒 Cart
            <span class="cart-count">0</span>
        </a>

        <a href="#">
            👤 Profile
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            🚪 Logout
        </a>

    </div>

</nav>


<!-- =====================================================
     LOCATION
===================================================== -->

<div class="location-bar">

    <div class="location-left">

        <div class="location-icon">
            📍
        </div>

        <div>
            <div>Delivering to</div>

            <strong>
                Bangalore
            </strong>
        </div>

        <span class="change-location">
            Change
        </span>

    </div>

    <div>
        🚚 Fast delivery available
    </div>

</div>


<!-- =====================================================
     HERO
===================================================== -->

<section class="hero">

    <div class="hero-content">

        <div class="hero-badge">
            🔥 Discover delicious food near you
        </div>

        <h1>
            Good food.
            <span>Good mood.</span>
        </h1>

        <p>
            Discover amazing restaurants, delicious dishes
            and exciting offers near you.
        </p>

        <form
            action="${pageContext.request.contextPath}/restaurants"
            method="get"
            class="search-box">

            <div class="search-icon">
                🔍
            </div>

            <input
                type="text"
                name="search"
                placeholder="Search for restaurant, food or cuisine..."
                value="<%= searchKeyword != null ? searchKeyword : "" %>"
            >

            <button type="submit">
                🔍 Search
            </button>

        </form>

    </div>

</section>


<!-- =====================================================
     CATEGORIES
===================================================== -->

<section class="section">

    <div class="section-header">

        <div>

            <h2 class="section-title">
                What's on your mind? 🤔
            </h2>

            <p class="section-subtitle">
                Explore food categories
            </p>

        </div>

    </div>


    <div class="category-wrapper">

        <div class="categories">


            <!-- PIZZA -->

            <div class="category">

                <div class="category-image">

                    <img
                        src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=500&q=85"
                        alt="Pizza"
                        onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=500&q=85';"
                    >

                </div>

                <p>
                    🍕 Pizza
                </p>

            </div>


            <!-- BURGER -->

            <div class="category">

                <div class="category-image">

                    <img
                        src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=85"
                        alt="Burger"
                        onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=500&q=85';"
                    >

                </div>

                <p>
                    🍔 Burger
                </p>

            </div>


        
            <!-- CHINESE -->

            <div class="category">

                <div class="category-image">

                    <img
                        src="https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=500&q=85"
                        alt="Chinese"
                        onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1552611052-33e04de081de?auto=format&fit=crop&w=500&q=85';"
                    >

                </div>

                <p>
                    🍜 Chinese
                </p>

            </div>


            <!-- SOUTH INDIAN -->

            <div class="category">

                <div class="category-image">

                    <img
                        src="https://images.unsplash.com/photo-1589301760014-d929f3979dbc?auto=format&fit=crop&w=500&q=85"
                        alt="South Indian"
                        onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1630383249896-424e482df921?auto=format&fit=crop&w=500&q=85';"
                    >

                </div>

                <p>
                    🥘 South Indian
                </p>

            </div>


            <!-- DESSERT -->

            <div class="category">

                <div class="category-image">

                    <img
                        src="https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=500&q=85"
                        alt="Desserts"
                        onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1565958011703-44f9829ba187?auto=format&fit=crop&w=500&q=85';"
                    >

                </div>

                <p>
                    🍰 Desserts
                </p>

            </div>


            <!-- FAST FOOD -->

            <div class="category">

                <div class="category-image">

                    <img
                        src="https://images.unsplash.com/photo-1561758033-d89a9ad46330?auto=format&fit=crop&w=500&q=85"
                        alt="Fast Food"
                        onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=500&q=85';"
                    >

                </div>

                <p>
                    🍟 Fast Food
                </p>

            </div>


        </div>

    </div>

</section>


<!-- =====================================================
     POPULAR FOOD
===================================================== -->

<section class="section food-section">

    <div class="section-header">

        <div>

            <h2 class="section-title">
                🍽️ Popular Food
            </h2>

            <p class="section-subtitle">
                Delicious dishes loved by our customers
            </p>

        </div>

    </div>


    <div class="food-grid">


        <!-- CHICKEN BIRYANI -->

        <div class="food-card">

            <img
                class="food-image"
                src="https://images.unsplash.com/photo-1563379091339-03246963d96c?auto=format&fit=crop&w=700&q=85"
                alt="Chicken Biryani"
                loading="eager"
                onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=700&q=85';"
            >

            <div class="food-content">

                <h3>
                    🍛 Chicken Biryani
                </h3>

                <p>
                    Fragrant basmati rice with spicy
                    chicken and aromatic spices.
                </p>

                <div class="food-price">
                    ₹249
                </div>

            </div>

        </div>


        <!-- BUTTER CHICKEN -->

        <div class="food-card">

            <img
                class="food-image"
                src="https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?auto=format&fit=crop&w=700&q=85"
                alt="Butter Chicken"
                onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1588166524941-3bf61a9c41db?auto=format&fit=crop&w=700&q=85';"
            >

            <div class="food-content">

                <h3>
                    🍗 Butter Chicken
                </h3>

                <p>
                    Creamy and delicious Indian chicken curry.
                </p>

                <div class="food-price">
                    ₹229
                </div>

            </div>

        </div>


        <!-- PIZZA -->

        <div class="food-card">

            <img
                class="food-image"
                src="https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=700&q=85"
                alt="Pizza"
                onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=700&q=85';"
            >

            <div class="food-content">

                <h3>
                    🍕 Farmhouse Pizza
                </h3>

                <p>
                    Fresh vegetables and melted cheese.
                </p>

                <div class="food-price">
                    ₹299
                </div>

            </div>

        </div>


        <!-- BURGER -->

        <div class="food-card">

            <img
                class="food-image"
                src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=700&q=85"
                alt="Burger"
                onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=700&q=85';"
            >

            <div class="food-content">

                <h3>
                    🍔 Classic Burger
                </h3>

                <p>
                    Juicy burger with cheese and fresh vegetables.
                </p>

                <div class="food-price">
                    ₹179
                </div>

            </div>

        </div>


    </div>

</section>


<!-- =====================================================
     OFFERS
===================================================== -->

<section class="section offer-section">

    <div class="section-header">

        <div>

            <h2 class="section-title">
                🎁 Offers & Discounts
            </h2>

            <p class="section-subtitle">
                Delicious food at amazing prices
            </p>

        </div>

    </div>


    <div class="offers">

        <div class="offer-card">

            <div class="offer-icon">
                🔥
            </div>

            <h3>
                FLAT 50% OFF
            </h3>

            <p>
                On selected restaurants today
            </p>

        </div>


        <div class="offer-card">

            <div class="offer-icon">
                🚚
            </div>

            <h3>
                FREE DELIVERY
            </h3>

            <p>
                On orders above ₹299
            </p>

        </div>


        <div class="offer-card">

            <div class="offer-icon">
                🎉
            </div>

            <h3>
                WEEKEND SPECIAL
            </h3>

            <p>
                Extra discounts on your favourites
            </p>

        </div>

    </div>

</section>


<!-- =====================================================
     RESTAURANTS
===================================================== -->

<section
    class="section restaurant-section"
    id="restaurants"
>

    <div class="section-header">

        <div>

            <h2 class="section-title">

                <% if (searchKeyword != null
                       && !searchKeyword.trim().isEmpty()) { %>

                    🔍 Results for "<%= searchKeyword %>"

                <% } else { %>

                    ⭐ Top Restaurants Near You

                <% } %>

            </h2>

            <p class="section-subtitle">
                Discover highly rated restaurants around you
            </p>

        </div>


        <a
            href="${pageContext.request.contextPath}/restaurants"
            class="view-all"
        >
            View All →
        </a>

    </div>


    <!-- FILTERS -->

    <div class="filters">

        <div class="filter active">
            All
        </div>

        <div class="filter">
            🍕 Pizza
        </div>

        <div class="filter">
            🍔 Burger
        </div>

        <div class="filter">
            🍛 Biryani
        </div>

        <div class="filter">
            🍜 Chinese
        </div>

        <div class="filter">
            🥘 South Indian
        </div>

        <div class="filter">
            🍰 Desserts
        </div>

        <div class="filter">
            🍟 Fast Food
        </div>

    </div>


    <!-- RESTAURANT GRID -->

    <div class="restaurants">

        <%

            if (restaurants.isEmpty()) {

        %>

            <div class="empty-results">

                <div class="emoji">
                    😔
                </div>

                <h3>
                    No restaurants found
                </h3>

                <p>
                    Try searching for another restaurant,
                    food item or cuisine.
                </p>

            </div>

        <%

            } else {

                for (Restaurant restaurant : restaurants) {

        %>


        <div class="restaurant-card">

            <!-- RESTAURANT IMAGE -->

            <div class="restaurant-image-wrapper">

                <%

                    String imageUrl = restaurant.getImage();

                    if (imageUrl == null ||
                        imageUrl.trim().isEmpty()) {

                        imageUrl =
                            "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=900&q=85";
                    }

                %>


                <img
                    class="restaurant-image"
                    src="<%= imageUrl %>"
                    alt="<%= restaurant.getRestaurantName() %>"
                    onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=900&q=85';"
                >


                <div class="offer-badge">
                    🔥 SPECIAL OFFER
                </div>


                <div
                    class="favorite"
                    onclick="toggleFavorite(this)"
                >
                    🤍
                </div>

            </div>


            <!-- RESTAURANT CONTENT -->

            <div class="restaurant-content">

                <div class="restaurant-title-row">

                    <div>

                        <h3>
                            <%= restaurant.getRestaurantName() %>
                        </h3>

                    </div>


                    <span class="rating">

                        ★

                        <%= String.format(
                            "%.1f",
                            restaurant.getRating()
                        ) %>

                    </span>

                </div>


                <div class="cuisine">

                    🍽️

                    <%= restaurant.getDescription() != null
                        ? restaurant.getDescription()
                        : "Delicious food & great taste" %>

                </div>


                <div class="restaurant-info">

                    <span class="info-chip">

                        ⏱️

                        <%= restaurant.getDeliveryTime() %>

                        mins

                    </span>


                    <span class="info-chip">

                        📍

                        <%= restaurant.getCity() %>

                    </span>


                    <span class="info-chip">

                        💰 ₹₹

                    </span>

                </div>


                <div class="restaurant-description">

                    <%= restaurant.getAddress() != null
                        ? restaurant.getAddress()
                        : "Fresh and delicious food delivered to your doorstep." %>

                </div>


                <a
                    href="${pageContext.request.contextPath}/menu?restaurantId=<%= restaurant.getRestaurantId() %>"
                    class="menu-btn"
                >
                    🍽️ View Menu
                </a>

            </div>

        </div>


        <%

                }

            }

        %>

    </div>

</section>


<!-- =====================================================
     WHY FOODIE
===================================================== -->

<section class="section why-section">

    <div class="section-header">

        <div>

            <h2 class="section-title">
                Why choose Foodie? ❤️
            </h2>

            <p class="section-subtitle">
                Everything you need for a great food experience
            </p>

        </div>

    </div>


    <div class="why-grid">


        <div class="why-card">

            <div class="why-icon">
                ⚡
            </div>

            <h3>
                Fast Delivery
            </h3>

            <p>
                Get your favourite food delivered quickly
                and safely to your doorstep.
            </p>

        </div>


        <div class="why-card">

            <div class="why-icon">
                ⭐
            </div>

            <h3>
                Top Rated
            </h3>

            <p>
                Discover highly rated restaurants
                loved by food lovers.
            </p>

        </div>


        <div class="why-card">

            <div class="why-icon">
                🛡️
            </div>

            <h3>
                Secure Payment
            </h3>

            <p>
                Enjoy a safe and reliable checkout
                experience.
            </p>

        </div>


        <div class="why-card">

            <div class="why-icon">
                🎁
            </div>

            <h3>
                Best Offers
            </h3>

            <p>
                Save more with exciting discounts
                and special offers.
            </p>

        </div>


    </div>

</section>


<!-- =====================================================
     PAYMENT
===================================================== -->

<section class="section payment-section">

    <div class="payment-box">

        <h2>
            💳 Easy & Secure Payments
        </h2>

        <p>
            Choose your preferred payment method
            during checkout.
        </p>


        <div class="payment-options">

            <div class="payment">
                💵 Cash on Delivery
            </div>

            <div class="payment">
                📱 UPI
            </div>

            <div class="payment">
                💳 Debit Card
            </div>

            <div class="payment">
                💳 Credit Card
            </div>

        </div>

    </div>

</section>


<!-- =====================================================
     FOOTER
===================================================== -->

<footer class="footer">

    <div class="footer-top">


        <div>

            <div class="footer-logo">
                🍔 Foodie
            </div>

            <p class="footer-description">

                Your favourite food, delivered to your
                doorstep. Discover restaurants, explore
                delicious food and enjoy amazing offers.

            </p>

        </div>


        <div>

            <h4>
                Foodie
            </h4>

            <a href="#">
                About Us
            </a>

            <a href="#">
                Contact
            </a>

            <a href="#">
                Careers
            </a>

            <a href="#">
                Help
            </a>

        </div>


        <div>

            <h4>
                Explore
            </h4>

            <a href="#restaurants">
                Restaurants
            </a>

            <a href="#popular-food">
                Popular Food
            </a>

            <a href="#">
                Offers
            </a>

            <a href="#">
                Top Rated
            </a>

        </div>


        <div>

            <h4>
                Legal
            </h4>

            <a href="#">
                Privacy
            </a>

            <a href="#">
                Terms
            </a>

            <a href="#">
                Security
            </a>

        </div>


    </div>


    <div class="footer-bottom">

        © 2026 Foodie. All rights reserved.

    </div>

</footer>


<!-- =====================================================
     JAVASCRIPT
===================================================== -->

<script>

/* =====================================================
   FILTER BUTTON
===================================================== */

const filters =
    document.querySelectorAll(".filter");

filters.forEach(function(filter) {

    filter.addEventListener("click", function() {

        filters.forEach(function(item) {

            item.classList.remove("active");

        });

        this.classList.add("active");

    });

});


/* =====================================================
   FAVORITE BUTTON
===================================================== */

function toggleFavorite(button) {

    if (button.innerHTML.trim() === "❤️") {

        button.innerHTML = "🤍";

    } else {

        button.innerHTML = "❤️";

    }

}


/* =====================================================
   SEARCH ENTER KEY
===================================================== */

const searchInput =
    document.querySelector(".search-box input");

if (searchInput) {

    searchInput.addEventListener(
        "keydown",
        function(event) {

            if (event.key === "Enter") {

                event.preventDefault();

                this.form.submit();

            }

        }
    );

}


/* =====================================================
   IMAGE ERROR FALLBACK
===================================================== */

document.querySelectorAll("img").forEach(function(img) {

    img.addEventListener("error", function() {

        if (this.dataset.fallbackApplied === "true") {
            return;
        }

        this.dataset.fallbackApplied = "true";

        if (this.classList.contains("food-image")) {

            this.src =
                "https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=700&q=85";

        } else if (this.classList.contains("category-image")) {

            this.src =
                "https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=500&q=85";

        } else {

            this.src =
                "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=900&q=85";

        }

    });

});


/* =====================================================
   SCROLL ANIMATION
===================================================== */

const cards =
    document.querySelectorAll(
        ".restaurant-card, .why-card, .offer-card, .food-card"
    );

if ("IntersectionObserver" in window) {

    const observer =
        new IntersectionObserver(
            function(entries) {

                entries.forEach(function(entry) {

                    if (entry.isIntersecting) {

                        entry.target.style.opacity = "1";

                        entry.target.style.transform =
                            "translateY(0)";

                    }

                });

            },
            {
                threshold: 0.1
            }
        );


    cards.forEach(function(card) {

        card.style.opacity = "0";

        card.style.transform =
            "translateY(25px)";

        card.style.transition =
            "all 0.6s ease";

        observer.observe(card);

    });

}

</script>


</body>

</html>