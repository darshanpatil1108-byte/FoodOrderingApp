<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Foodie - Food Delivery</title>

<style>

/* =========================================================
   GLOBAL
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
    font-family: Arial, Helvetica, sans-serif;
    background: #f7f7f7;
    color: #1c1c1c;
}

a {
    text-decoration: none;
}

button,
input {
    font-family: inherit;
}

/* =========================================================
   NAVBAR
========================================================= */

.navbar {
    height: 74px;
    background: rgba(255,255,255,0.97);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 7%;
    position: sticky;
    top: 0;
    z-index: 1000;
    border-bottom: 1px solid #eee;
    box-shadow: 0 3px 18px rgba(0,0,0,0.08);
}

.logo {
    font-size: 31px;
    font-weight: 900;
    color: #ff4b2b;
    letter-spacing: -1px;
}

.logo span {
    color: #ff7a18;
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 12px;
}

.nav-right a {
    color: #333;
    font-size: 15px;
    font-weight: 600;
    padding: 10px 15px;
    border-radius: 9px;
    transition: 0.3s;
}

.nav-right a:hover {
    background: #fff1ec;
    color: #ff4b2b;
}

.login-btn {
    border: 1px solid #ddd;
}

.signup-btn {
    background: linear-gradient(135deg,#ff4b2b,#ff7a18);
    color: white !important;
    box-shadow: 0 5px 15px rgba(255,75,43,0.25);
}

.signup-btn:hover {
    color: white !important;
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(255,75,43,0.35);
}

.cart-link {
    background: #fff5f1;
    color: #ff4b2b !important;
}

/* =========================================================
   HERO
========================================================= */

.hero {
    min-height: 590px;

    background:
        linear-gradient(
            rgba(15,15,15,0.50),
            rgba(15,15,15,0.68)
        ),
        url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1800&q=90")
        center/cover;

    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;

    position: relative;
}

.hero-content {
    width: 1050px;
    max-width: 92%;
    color: white;
    animation: heroAppear 0.9s ease;
}

@keyframes heroAppear {
    from {
        opacity: 0;
        transform: translateY(30px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.hero-logo {
    font-size: 72px;
    font-weight: 900;
    letter-spacing: -3px;

    background: linear-gradient(
        90deg,
        #ff512f,
        #ff9966
    );

    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;

    margin-bottom: 5px;
}

.hero-title {
    font-size: 44px;
    font-weight: 800;
    margin-bottom: 12px;
}

.hero-subtitle {
    font-size: 18px;
    color: #eee;
    margin-bottom: 32px;
}

/* =========================================================
   SEARCH
========================================================= */

.search-container {
    background: white;
    padding: 7px;
    border-radius: 15px;

    display: flex;
    max-width: 900px;
    margin: auto;

    box-shadow: 0 15px 45px rgba(0,0,0,0.35);

    transition: 0.3s;
}

.search-container:focus-within {
    transform: translateY(-4px);
    box-shadow: 0 20px 55px rgba(0,0,0,0.4);
}

.location-input {
    width: 260px;
    border: none;
    border-right: 1px solid #ddd;
    padding: 16px;
    font-size: 15px;
    outline: none;
    color: #333;
}

.food-input {
    flex: 1;
    border: none;
    padding: 16px;
    font-size: 15px;
    outline: none;
}

.search-btn {
    border: none;
    background: linear-gradient(
        135deg,
        #ff4b2b,
        #ff7a18
    );

    color: white;
    padding: 0 30px;

    border-radius: 11px;
    cursor: pointer;

    font-size: 15px;
    font-weight: bold;

    transition: 0.3s;

    box-shadow: 0 6px 16px rgba(255,75,43,0.25);
}

.search-btn:hover {
    transform: translateY(-2px) scale(1.02);
    box-shadow: 0 9px 22px rgba(255,75,43,0.4);
}

/* =========================================================
   LOCATION
========================================================= */

.location-box {
    margin: 20px auto 0;
    max-width: 900px;
}

.location-btn {
    border: 1px solid rgba(255,255,255,0.4);

    background: rgba(255,255,255,0.95);
    color: #ff4b2b;

    padding: 12px 23px;
    border-radius: 10px;

    cursor: pointer;

    font-size: 15px;
    font-weight: bold;

    transition: 0.3s;
}

.location-btn:hover {
    background: #ff4b2b;
    color: white;
    transform: translateY(-2px);
}

.location-status {
    margin-top: 12px;
    font-size: 14px;
    min-height: 20px;
}

/* =========================================================
   MAIN CATEGORY SECTION
========================================================= */

.main {
    padding: 60px 7%;
    background: white;
}

.section-title {
    font-size: 30px;
    font-weight: 800;
    margin-bottom: 7px;
}

.section-subtitle {
    color: #777;
    margin-bottom: 30px;
    font-size: 15px;
}

/* =========================================================
   CATEGORY
========================================================= */

.category-container {
    display: flex;
    gap: 35px;
    overflow-x: auto;
    padding: 10px 5px 25px;
}

.category-container::-webkit-scrollbar {
    height: 6px;
}

.category-container::-webkit-scrollbar-thumb {
    background: #ddd;
    border-radius: 20px;
}

.category {
    min-width: 125px;
    text-align: center;
    cursor: pointer;
    transition: 0.3s;
}

.category img {
    width: 120px;
    height: 120px;

    border-radius: 50%;
    object-fit: cover;

    border: 5px solid white;

    box-shadow:
        0 7px 25px rgba(0,0,0,0.15);

    transition: 0.35s;
}

.category:hover {
    transform: translateY(-7px);
}

.category:hover img {
    transform: scale(1.08);

    box-shadow:
        0 12px 30px rgba(255,75,43,0.30);
}

.category-name {
    margin-top: 13px;
    font-weight: bold;
    font-size: 15px;
}

/* =========================================================
   RESTAURANTS
========================================================= */

.restaurant-section {
    background: #f7f7f7;
    padding: 60px 7%;
}

.restaurant-grid {
    display: grid;
    grid-template-columns: repeat(3,1fr);
    gap: 28px;
}

/* =========================================================
   RESTAURANT CARD
========================================================= */

.restaurant-card {
    background: white;

    border-radius: 18px;
    overflow: hidden;

    border: 1px solid #eee;

    transition: 0.35s;

    box-shadow:
        0 4px 15px rgba(0,0,0,0.05);
}

.restaurant-card:hover {
    transform: translateY(-9px);

    box-shadow:
        0 18px 40px rgba(0,0,0,0.14);
}

.restaurant-image-container {
    position: relative;
    overflow: hidden;
}

.restaurant-image {
    width: 100%;
    height: 225px;

    object-fit: cover;
    display: block;

    transition: 0.5s;
}

.restaurant-card:hover .restaurant-image {
    transform: scale(1.08);
}

.offer {
    position: absolute;
    left: 13px;
    bottom: 13px;

    background: linear-gradient(
        135deg,
        #256fef,
        #4b8cff
    );

    color: white;

    padding: 7px 12px;
    border-radius: 6px;

    font-size: 12px;
    font-weight: 800;

    box-shadow: 0 4px 10px rgba(0,0,0,0.18);
}

.restaurant-info {
    padding: 19px;
}

.restaurant-name {
    font-size: 21px;
    font-weight: 800;
    margin-bottom: 9px;
}

.rating-row {
    display: flex;
    align-items: center;
    gap: 9px;
}

.rating {
    background: #24963f;
    color: white;

    padding: 5px 8px;
    border-radius: 6px;

    font-size: 13px;
    font-weight: bold;
}

.rating-count {
    color: #777;
    font-size: 13px;
}

.food-type {
    color: #555;
    margin-top: 13px;
    font-size: 14px;
}

.restaurant-location {
    color: #777;
    font-size: 14px;
    margin-top: 8px;
}

.delivery {
    color: #555;
    font-size: 14px;
    margin-top: 8px;
}

.distance {
    color: #ff4b2b;
    font-weight: bold;
    font-size: 13px;
    margin-top: 8px;
}

.card-bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;

    margin-top: 19px;
    padding-top: 15px;

    border-top: 1px solid #eee;
}

.price {
    color: #555;
    font-size: 14px;
    font-weight: 600;
}

.menu-btn {
    background: linear-gradient(
        135deg,
        #ff4b2b,
        #ff7a18
    );

    color: white;

    padding: 10px 17px;

    border-radius: 8px;

    font-size: 14px;
    font-weight: bold;

    transition: 0.3s;

    box-shadow:
        0 5px 13px rgba(255,75,43,0.2);
}

.menu-btn:hover {
    color: white;

    transform: translateY(-2px);

    box-shadow:
        0 8px 20px rgba(255,75,43,0.35);
}

/* =========================================================
   WHY FOODIE
========================================================= */

.info-section {
    padding: 65px 7%;
    background: white;
}

.info-grid {
    display: grid;
    grid-template-columns: repeat(3,1fr);
    gap: 25px;
}

.info-card {
    text-align: center;

    padding: 35px 25px;

    border-radius: 18px;

    border: 1px solid #eee;

    background:
        linear-gradient(
            180deg,
            #fff,
            #fff8f5
        );

    transition: 0.3s;
}

.info-card:hover {
    transform: translateY(-7px);

    box-shadow:
        0 12px 30px rgba(0,0,0,0.10);
}

.info-icon {
    width: 75px;
    height: 75px;

    display: flex;
    align-items: center;
    justify-content: center;

    margin: auto auto 18px;

    border-radius: 50%;

    background: #fff0eb;

    font-size: 38px;
}

.info-card h3 {
    margin-bottom: 10px;
    font-size: 19px;
}

.info-card p {
    color: #777;
    line-height: 1.6;
    font-size: 14px;
}

/* =========================================================
   FOOTER
========================================================= */

.footer {
    background: #202020;
    color: white;
    padding: 50px 7%;
}

.footer-top {
    display: flex;
    justify-content: space-between;
    gap: 30px;
}

.footer-logo {
    color: #ff5a36;
    font-size: 30px;
    font-weight: 900;
}

.footer p {
    color: #aaa;
    margin-top: 10px;
}

.footer-links {
    display: flex;
    gap: 25px;
}

.footer-links a {
    color: #aaa;
    transition: 0.3s;
}

.footer-links a:hover {
    color: #ff6845;
}

.footer-bottom {
    border-top: 1px solid #444;

    margin-top: 30px;
    padding-top: 20px;

    color: #888;
    font-size: 13px;

    text-align: center;
}

/* =========================================================
   RESPONSIVE
========================================================= */

@media(max-width:1000px) {

    .restaurant-grid {
        grid-template-columns: repeat(2,1fr);
    }

    .info-grid {
        grid-template-columns: 1fr;
    }

}

@media(max-width:700px) {

    .navbar {
        padding: 0 18px;
    }

    .logo {
        font-size: 25px;
    }

    .nav-right {
        gap: 3px;
    }

    .nav-right a {
        font-size: 12px;
        padding: 8px;
    }

    .hero {
        min-height: 620px;
    }

    .hero-logo {
        font-size: 50px;
    }

    .hero-title {
        font-size: 30px;
    }

    .hero-subtitle {
        font-size: 15px;
    }

    .search-container {
        flex-direction: column;
        gap: 5px;
    }

    .location-input {
        width: 100%;
        border-right: none;
        border-bottom: 1px solid #ddd;
    }

    .search-btn {
        padding: 15px;
    }

    .restaurant-grid {
        grid-template-columns: 1fr;
    }

    .footer-top {
        flex-direction: column;
    }

    .footer-links {
        flex-wrap: wrap;
    }

}

</style>

</head>

<body>


<!-- =========================================================
     NAVBAR
========================================================= -->

<nav class="navbar">

    <div class="logo">
        🍔 Foodie<span>.</span>
    </div>

    <div class="nav-right">

        <a href="<%= request.getContextPath() %>/">
            🏠 Home
        </a>

        <a href="<%= request.getContextPath() %>/jsp/login.jsp"
           class="login-btn">
            Login
        </a>

        <a href="<%= request.getContextPath() %>/jsp/register.jsp"
           class="signup-btn">
            Sign Up
        </a>

        <a href="<%= request.getContextPath() %>/cart"
           class="cart-link">
            🛒 Cart
        </a>

    </div>

</nav>


<!-- =========================================================
     HERO
========================================================= -->

<section class="hero">

    <div class="hero-content">

        <div class="hero-logo">
            Foodie
        </div>

        <h1 class="hero-title">
            Discover the best food & drinks
        </h1>

        <p class="hero-subtitle">
            Order delicious food from restaurants near you
        </p>


        <div class="search-container">

            <input
                type="text"
                id="locationInput"
                class="location-input"
                placeholder="📍 Enter your location">


            <input
                type="text"
                id="foodInput"
                class="food-input"
                placeholder="🔎 Search restaurant or food">


            <button
                class="search-btn"
                onclick="searchFood()">

                🔎 Search

            </button>

        </div>


        <div class="location-box">

            <button
                type="button"
                class="location-btn"
                onclick="getLocation()">

                📍 Enable Location

            </button>

            <div
                id="locationStatus"
                class="location-status">
            </div>

        </div>

    </div>

</section>


<!-- =========================================================
     CATEGORIES
========================================================= -->

<section class="main">

    <h2 class="section-title">
        Inspiration for your first order
    </h2>

    <p class="section-subtitle">
        Explore popular food categories
    </p>


    <div class="category-container">


        <div class="category">

            <img
                src="https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=600&q=90"
                alt="Pizza">

            <div class="category-name">
                Pizza
            </div>

        </div>


        <div class="category">

            <img
                src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=600&q=90"
                alt="Burger">

            <div class="category-name">
                Burgers
            </div>

        </div>


        <div class="category">

            <img
                src="https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=600&q=90"
                alt="Biryani">

            <div class="category-name">
                Biryani
            </div>

        </div>


        <div class="category">

            <img
                src="https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?auto=format&fit=crop&w=600&q=90"
                alt="Indian Food">

            <div class="category-name">
                Indian Food
            </div>

        </div>


        <div class="category">

            <img
                src="https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=600&q=90"
                alt="Desserts">

            <div class="category-name">
                Desserts
            </div>

        </div>


        <div class="category">

            <img
                src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=600&q=90"
                alt="Healthy Food">

            <div class="category-name">
                Healthy
            </div>

        </div>


        <div class="category">

            <img
                src="https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=600&q=90"
                alt="French Fries">

            <div class="category-name">
                French Fries
            </div>

        </div>

    </div>

</section>


<!-- =========================================================
     RESTAURANTS
========================================================= -->

<section class="restaurant-section">

    <h2 class="section-title">
        Best restaurants near you
    </h2>

    <p class="section-subtitle">
        Delicious food from popular restaurants
    </p>


    <div class="restaurant-grid">


        <!-- RESTAURANT 1 -->

        <div class="restaurant-card">

            <div class="restaurant-image-container">

                <img
                    class="restaurant-image"
                    src="https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=900&q=90"
                    alt="Dominos Pizza">

                <div class="offer">
                    20% OFF
                </div>

            </div>

            <div class="restaurant-info">

                <h3 class="restaurant-name">
                    Domino's Pizza
                </h3>

                <div class="rating-row">

                    <span class="rating">
                        ★ 4.5
                    </span>

                    <span class="rating-count">
                        2,500+ ratings
                    </span>

                </div>

                <p class="food-type">
                    🍕 Pizza • Italian • Fast Food
                </p>

                <p class="restaurant-location">
                    📍 MG Road
                </p>

                <p class="delivery">
                    🛵 25–30 mins
                </p>

                <p class="distance">
                    📍 Enable location to calculate distance
                </p>

                <div class="card-bottom">

                    <span class="price">
                        ₹200 for one
                    </span>

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=1"
                        class="menu-btn">

                        View Menu →

                    </a>

                </div>

            </div>

        </div>


        <!-- RESTAURANT 2 -->

        <div class="restaurant-card">

            <div class="restaurant-image-container">

                <img
                    class="restaurant-image"
                    src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=900&q=90"
                    alt="KFC">

                <div class="offer">
                    30% OFF
                </div>

            </div>

            <div class="restaurant-info">

                <h3 class="restaurant-name">
                    KFC
                </h3>

                <div class="rating-row">

                    <span class="rating">
                        ★ 4.4
                    </span>

                    <span class="rating-count">
                        3,100+ ratings
                    </span>

                </div>

                <p class="food-type">
                    🍗 Chicken • Fast Food • Snacks
                </p>

                <p class="restaurant-location">
                    📍 Indiranagar
                </p>

                <p class="delivery">
                    🛵 20–25 mins
                </p>

                <p class="distance">
                    📍 Enable location to calculate distance
                </p>

                <div class="card-bottom">

                    <span class="price">
                        ₹250 for one
                    </span>

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=2"
                        class="menu-btn">

                        View Menu →

                    </a>

                </div>

            </div>

        </div>


        <!-- RESTAURANT 3 -->

        <div class="restaurant-card">

            <div class="restaurant-image-container">

                <img
                    class="restaurant-image"
                    src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=900&q=90"
                    alt="Burger King">

                <div class="offer">
                    25% OFF
                </div>

            </div>

            <div class="restaurant-info">

                <h3 class="restaurant-name">
                    Burger King
                </h3>

                <div class="rating-row">

                    <span class="rating">
                        ★ 4.3
                    </span>

                    <span class="rating-count">
                        1,800+ ratings
                    </span>

                </div>

                <p class="food-type">
                    🍔 Burgers • American • Snacks
                </p>

                <p class="restaurant-location">
                    📍 Whitefield
                </p>

                <p class="delivery">
                    🛵 30–35 mins
                </p>

                <p class="distance">
                    📍 Enable location to calculate distance
                </p>

                <div class="card-bottom">

                    <span class="price">
                        ₹220 for one
                    </span>

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=3"
                        class="menu-btn">

                        View Menu →

                    </a>

                </div>

            </div>

        </div>


        <!-- RESTAURANT 4 -->

        <div class="restaurant-card">

            <div class="restaurant-image-container">

                <img
                    class="restaurant-image"
                    src="https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=900&q=90"
                    alt="Pizza Hut">

                <div class="offer">
                    40% OFF
                </div>

            </div>

            <div class="restaurant-info">

                <h3 class="restaurant-name">
                    Pizza Hut
                </h3>

                <div class="rating-row">

                    <span class="rating">
                        ★ 4.2
                    </span>

                    <span class="rating-count">
                        1,500+ ratings
                    </span>

                </div>

                <p class="food-type">
                    🍕 Pizza • Italian • Beverages
                </p>

                <p class="restaurant-location">
                    📍 Koramangala
                </p>

                <p class="delivery">
                    🛵 30–40 mins
                </p>

                <p class="distance">
                    📍 Enable location to calculate distance
                </p>

                <div class="card-bottom">

                    <span class="price">
                        ₹230 for one
                    </span>

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=4"
                        class="menu-btn">

                        View Menu →

                    </a>

                </div>

            </div>

        </div>


        <!-- RESTAURANT 5 -->

        <div class="restaurant-card">

            <div class="restaurant-image-container">

                <img
                    class="restaurant-image"
                    src="https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=900&q=90"
                    alt="Biryani House">

                <div class="offer">
                    35% OFF
                </div>

            </div>

            <div class="restaurant-info">

                <h3 class="restaurant-name">
                    Biryani House
                </h3>

                <div class="rating-row">

                    <span class="rating">
                        ★ 4.7
                    </span>

                    <span class="rating-count">
                        4,200+ ratings
                    </span>

                </div>

                <p class="food-type">
                    🍛 Biryani • Indian • Mughlai
                </p>

                <p class="restaurant-location">
                    📍 HSR Layout
                </p>

                <p class="delivery">
                    🛵 25–30 mins
                </p>

                <p class="distance">
                    📍 Enable location to calculate distance
                </p>

                <div class="card-bottom">

                    <span class="price">
                        ₹240 for one
                    </span>

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=5"
                        class="menu-btn">

                        View Menu →

                    </a>

                </div>

            </div>

        </div>


        <!-- RESTAURANT 6 -->

        <div class="restaurant-card">

            <div class="restaurant-image-container">

                <img
                    class="restaurant-image"
                    src="https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?auto=format&fit=crop&w=900&q=90"
                    alt="Spice Garden">

                <div class="offer">
                    20% OFF
                </div>

            </div>

            <div class="restaurant-info">

                <h3 class="restaurant-name">
                    Spice Garden
                </h3>

                <div class="rating-row">

                    <span class="rating">
                        ★ 4.6
                    </span>

                    <span class="rating-count">
                        2,700+ ratings
                    </span>

                </div>

                <p class="food-type">
                    🍛 Indian • North Indian • Chinese
                </p>

                <p class="restaurant-location">
                    📍 Marathahalli
                </p>

                <p class="delivery">
                    🛵 25–35 mins
                </p>

                <p class="distance">
                    📍 Enable location to calculate distance
                </p>

                <div class="card-bottom">

                    <span class="price">
                        ₹210 for one
                    </span>

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=6"
                        class="menu-btn">

                        View Menu →

                    </a>

                </div>

            </div>

        </div>


        <!-- RESTAURANT 7 -->

        <div class="restaurant-card">

            <div class="restaurant-image-container">

                <img
    class="restaurant-image"
    src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgFSBeLYPWy_1KZiuFhqgYS2Q5c-UjEDtuqFKvY6q-rgpFVDSB8kKASRIyY68zs4ObKdDIjVs789_UOtO7Az2Wa-2tm99pL8dI0fmUWopv4aQ8yPbmYYiprRgq13HGchd20bgj3-cRvtab7/s1600/Jollada_Rotti_Oota_3.jpg"
    alt="Jolada Rotti">

                <div class="offer">
                    SPECIAL
                </div>

            </div>

            <div class="restaurant-info">

                <h3 class="restaurant-name">
                    Basaveshwara Khanavali
                </h3>

                <div class="rating-row">

                    <span class="rating">
                        ★ 4.8
                    </span>

                    <span class="rating-count">
                        1,200+ ratings
                    </span>

                </div>

                <p class="food-type">
                    🫓 Jolada Rotti • Palya • North Karnataka
                </p>

                <p class="restaurant-location">
                    📍 Tavarekeri Main Road
                </p>

                <p class="delivery">
                    🛵 20–30 mins
                </p>

                <p class="distance">
                    📍 Enable location to calculate distance
                </p>

                <div class="card-bottom">

                    <span class="price">
                        ₹150 for one
                    </span>

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=6"
                        class="menu-btn">

                        View Menu →

                    </a>

                </div>

            </div>

        </div>


        <!-- RESTAURANT 8 -->

        <div class="restaurant-card">

            <div class="restaurant-image-container">

                <img
    class="restaurant-image"
    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcQ2yB2vNwhrBu38alCW_iCEYU2cTiG_YL_Rx-YvgH2YbTnIb3_pX0JmY&s=10"
    alt="North Karnataka Khanavali">

                <div class="offer">
                    LOCAL SPECIAL
                </div>

            </div>

            <div class="restaurant-info">

                <h3 class="restaurant-name">
                    North Karnataka Khanavali
                </h3>

                <div class="rating-row">

                    <span class="rating">
                        ★ 4.9
                    </span>

                    <span class="rating-count">
                        950+ ratings
                    </span>

                </div>

                <p class="food-type">
                    🫓 Jolada Rotti • Ennegayi • Palya
                </p>

                <p class="restaurant-location">
                    📍 Near Tavarekeri
                </p>

                <p class="delivery">
                    🛵 20–30 mins
                </p>

                <p class="distance">
                    📍 Enable location to calculate distance
                </p>

                <div class="card-bottom">

                    <span class="price">
                        ₹160 for one
                    </span>

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=7"
                        class="menu-btn">

                        View Menu →

                    </a>

                </div>

            </div>

        </div>


    </div>

</section>


<!-- =========================================================
     WHY FOODIE
========================================================= -->

<section class="info-section">

    <h2 class="section-title">
        Why order from Foodie?
    </h2>

    <p class="section-subtitle">
        Everything you need for a great food delivery experience
    </p>


    <div class="info-grid">


        <div class="info-card">

            <div class="info-icon">
                📍
            </div>

            <h3>
                Restaurants Near You
            </h3>

            <p>
                Enable location and discover restaurants
                around your current area.
            </p>

        </div>


        <div class="info-card">

            <div class="info-icon">
                🛵
            </div>

            <h3>
                Fast Delivery
            </h3>

            <p>
                Get your favourite meals delivered
                quickly to your doorstep.
            </p>

        </div>


        <div class="info-card">

            <div class="info-icon">
                ⭐
            </div>

            <h3>
                Highly Rated Food
            </h3>

            <p>
                Choose from highly rated restaurants
                and popular dishes.
            </p>

        </div>


    </div>

</section>


<!-- =========================================================
     FOOTER
========================================================= -->

<footer class="footer">

    <div class="footer-top">

        <div>

            <div class="footer-logo">
                🍔 Foodie.
            </div>

            <p>
                Your favourite food, delivered to your doorstep.
            </p>

        </div>


        <div class="footer-links">

            <a href="<%= request.getContextPath() %>/">
                Home
            </a>

            <a href="<%= request.getContextPath() %>/jsp/login.jsp">
                Login
            </a>

            <a href="<%= request.getContextPath() %>/jsp/register.jsp">
                Register
            </a>

            <a href="<%= request.getContextPath() %>/cart">
                Cart
            </a>

        </div>

    </div>


    <div class="footer-bottom">
        © 2026 Foodie. All rights reserved.
    </div>

</footer>


<!-- =========================================================
     JAVASCRIPT
========================================================= -->

<script>

/* =========================================================
   LOCATION
========================================================= */

function getLocation() {

    const status =
        document.getElementById("locationStatus");

    const locationInput =
        document.getElementById("locationInput");


    if (!navigator.geolocation) {

        status.innerHTML =
            "❌ Location is not supported by your browser.";

        return;
    }


    status.innerHTML =
        "📍 Detecting your location...";


    navigator.geolocation.getCurrentPosition(

        function(position) {

            const latitude =
                position.coords.latitude;

            const longitude =
                position.coords.longitude;


            localStorage.setItem(
                "foodieLatitude",
                latitude
            );


            localStorage.setItem(
                "foodieLongitude",
                longitude
            );


            locationInput.value =
                "Current Location";


            status.innerHTML =
                "✅ Location enabled successfully!";


            showDistances();

        },


        function(error) {

            if (error.code === 1) {

                status.innerHTML =
                    "❌ Location permission denied. Please allow location access.";

            }

            else if (error.code === 2) {

                status.innerHTML =
                    "❌ Your location could not be determined.";

            }

            else if (error.code === 3) {

                status.innerHTML =
                    "❌ Location request timed out.";

            }

            else {

                status.innerHTML =
                    "❌ Unable to get your location.";

            }

        },


        {
            enableHighAccuracy: true,
            timeout: 10000,
            maximumAge: 0
        }

    );

}


/* =========================================================
   DISTANCES
========================================================= */

function showDistances() {

    const distanceElements =
        document.querySelectorAll(".distance");


    distanceElements.forEach(function(element) {

        element.innerHTML =
            "📍 Nearby restaurant";

    });

}


/* =========================================================
   SEARCH
========================================================= */

function searchFood() {

    const location =
        document
        .getElementById("locationInput")
        .value
        .trim();


    const food =
        document
        .getElementById("foodInput")
        .value
        .trim();


    const status =
        document
        .getElementById("locationStatus");


    const cards =
        document
        .querySelectorAll(".restaurant-card");


    if (location === "" && food === "") {

        cards.forEach(function(card) {

            card.style.display = "block";

        });


        status.innerHTML =
            "🔎 Please enter a location or food.";

        return;
    }


    if (food !== "") {

        let found = false;


        cards.forEach(function(card) {

            const text =
                card.innerText.toLowerCase();


            if (
                text.includes(
                    food.toLowerCase()
                )
            ) {

                card.style.display = "block";

                found = true;

            }

            else {

                card.style.display = "none";

            }

        });


        if (found) {

            status.innerHTML =
                "🔎 Showing results for: " + food;


            document
                .querySelector(".restaurant-section")
                .scrollIntoView({
                    behavior: "smooth"
                });

        }

        else {

            status.innerHTML =
                "😔 No restaurant or food found for: " + food;

        }

    }

    else {

        cards.forEach(function(card) {

            card.style.display = "block";

        });


        status.innerHTML =
            "📍 Showing restaurants for: " + location;

    }

}


/* =========================================================
   ENTER KEY SEARCH
========================================================= */

document
    .getElementById("foodInput")
    .addEventListener(
        "keydown",
        function(event) {

            if (event.key === "Enter") {

                searchFood();

            }

        }
    );


/* =========================================================
   RESTORE LOCATION
========================================================= */

window.onload = function() {

    const latitude =
        localStorage.getItem("foodieLatitude");


    const longitude =
        localStorage.getItem("foodieLongitude");


    if (latitude && longitude) {

        document
            .getElementById("locationStatus")
            .innerHTML =
            "✅ Location already enabled.";


        document
            .getElementById("locationInput")
            .value =
            "Current Location";


        showDistances();

    }

};

</script>

</body>
</html>