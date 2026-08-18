<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.foodapp.model.User"%>

<%
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodie - Food Delivery</title>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
      rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


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
    font-family: 'Inter', Arial, sans-serif;
    background: #ffffff;
    color: #202020;
}

a {
    text-decoration: none;
    color: inherit;
}

button,
input {
    font-family: inherit;
}


/* =========================================================
   VARIABLES
========================================================= */

:root {

    --swiggy-orange: #ff5200;

    --orange-dark: #e64600;

    --orange-light: #fff1e8;

    --black: #02060c;

    --dark: #202020;

    --gray: #686b78;

    --light-gray: #f5f5f5;

    --border: #e8e8e8;

    --green: #24963f;

    --white: #ffffff;

}


/* =========================================================
   TOP NAVBAR
========================================================= */

.navbar {

    position: absolute;

    top: 0;

    left: 0;

    right: 0;

    height: 80px;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 10%;

    color: white;

    z-index: 1000;

}


/* LOGO */

.logo {

    display: flex;

    align-items: center;

    gap: 9px;

    font-size: 26px;

    font-weight: 800;

    color: white;

    cursor: pointer;

    letter-spacing: -1px;

}

.logo-icon {

    width: 38px;

    height: 38px;

    background: white;

    color: var(--swiggy-orange);

    border-radius: 10px;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 20px;

}

.logo span {

    color: white;

}


/* NAVIGATION */

.nav-right {

    display: flex;

    align-items: center;

    gap: 8px;

}

.nav-right a {

    display: flex;

    align-items: center;

    gap: 7px;

    padding: 11px 15px;

    color: white;

    font-size: 13px;

    font-weight: 600;

    border-radius: 7px;

    transition: 0.25s;

}

.nav-right a:hover {

    background: rgba(255,255,255,0.15);

}


/* APP BUTTON */

.app-btn {

    border: 1px solid rgba(255,255,255,0.8);

}


/* LOGIN */

.login-btn {

    background: #000000;

    border-radius: 9px !important;

    padding: 11px 20px !important;

}


/* SIGNUP */

.signup-btn {

    background: white;

    color: #000 !important;

    border-radius: 9px !important;

}


/* USER */

.user-welcome {

    display: flex;

    align-items: center;

    gap: 7px;

    color: white;

    font-size: 13px;

    font-weight: 600;

    padding: 10px;

}

.user-welcome i {

    font-size: 18px;

}


/* LOGOUT */

.logout-btn {

    background: rgba(0,0,0,0.85);

    border-radius: 8px !important;

}


/* CART */

.cart-link {

    position: relative;

}

.cart-badge {

    position: absolute;

    top: 3px;

    right: 2px;

    min-width: 16px;

    height: 16px;

    padding: 0 4px;

    display: flex;

    align-items: center;

    justify-content: center;

    background: white;

    color: var(--swiggy-orange);

    border-radius: 50%;

    font-size: 9px;

    font-weight: 800;

}


/* =========================================================
   HERO
========================================================= */

.hero {

    min-height: 620px;

    background: var(--swiggy-orange);

    position: relative;

    overflow: hidden;

    padding-top: 80px;

}


/* DECORATIVE FOOD LEFT */

.hero-left-food {

    position: absolute;

    left: -35px;

    top: 45px;

    width: 180px;

    opacity: 0.95;

    pointer-events: none;

}

.hero-left-food img {

    width: 100%;

}


/* DECORATIVE FOOD RIGHT */

.hero-right-food {

    position: absolute;

    right: -35px;

    top: 45px;

    width: 180px;

    opacity: 0.95;

    pointer-events: none;

}

.hero-right-food img {

    width: 100%;

}


/* HERO CONTENT */

.hero-content {

    width: 90%;

    max-width: 1150px;

    margin: auto;

    text-align: center;

    color: white;

    position: relative;

    z-index: 2;

}


/* HERO TITLE */

.hero-title {

    padding-top: 20px;

    font-size: 42px;

    line-height: 1.18;

    font-weight: 800;

    max-width: 650px;

    margin: 0 auto 26px;

    letter-spacing: -1.2px;

}

.hero-title span {

    color: white;

}


/* =========================================================
   SEARCH
========================================================= */

.search-box {

    display: flex;

    align-items: center;

    justify-content: center;

    gap: 10px;

    margin: 0 auto;

    max-width: 700px;

}


/* LOCATION */

.search-location {

    width: 260px;

    height: 58px;

    display: flex;

    align-items: center;

    background: white;

    border-radius: 9px;

    padding: 0 17px;

    box-shadow: 0 3px 15px rgba(0,0,0,0.12);

}

.search-location i {

    color: var(--swiggy-orange);

    margin-right: 10px;

}

.search-location input {

    width: 100%;

    border: none;

    outline: none;

    font-size: 13px;

    color: #333;

}


/* FOOD SEARCH */

.search-food {

    flex: 1;

    height: 58px;

    max-width: 420px;

    display: flex;

    align-items: center;

    background: white;

    border-radius: 9px;

    padding: 0 17px;

    box-shadow: 0 3px 15px rgba(0,0,0,0.12);

}

.search-food i {

    color: #777;

    margin-right: 10px;

}

.search-food input {

    width: 100%;

    border: none;

    outline: none;

    font-size: 13px;

}


/* SEARCH BUTTON */

.search-btn {

    height: 58px;

    padding: 0 25px;

    border: none;

    border-radius: 9px;

    background: #000;

    color: white;

    font-size: 14px;

    font-weight: 700;

    cursor: pointer;

    transition: 0.25s;

}

.search-btn:hover {

    background: #222;

}


/* =========================================================
   HERO CARDS
========================================================= */

.hero-cards {

    width: 90%;

    max-width: 1150px;

    margin: 42px auto 0;

    display: grid;

    grid-template-columns: repeat(3, 1fr);

    gap: 28px;

    position: relative;

    z-index: 3;

}


/* CARD */

.service-card {

    height: 365px;

    background: white;

    border-radius: 40px;

    position: relative;

    overflow: hidden;

    cursor: pointer;

    transition: 0.3s;

    box-shadow: 0 8px 20px rgba(0,0,0,0.08);

}

.service-card:hover {

    transform: translateY(-7px);

    box-shadow: 0 15px 30px rgba(0,0,0,0.15);

}


/* CARD TEXT */

.service-content {

    position: relative;

    z-index: 2;

    padding: 38px 30px;

}

.service-content h2 {

    font-size: 34px;

    line-height: 1.05;

    color: #3d3d45;

    font-weight: 800;

    letter-spacing: -1px;

}

.service-content h3 {

    margin-top: 7px;

    font-size: 22px;

    color: #969696;

    font-weight: 500;

}

.discount {

    display: inline-block;

    margin-top: 16px;

    padding: 7px 13px;

    background: #fff0e7;

    color: var(--swiggy-orange);

    border-radius: 18px;

    font-size: 17px;

    font-weight: 700;

}


/* CARD IMAGE */

.service-image {

    position: absolute;

    right: -10px;

    bottom: -8px;

    width: 70%;

    height: 58%;

    display: flex;

    align-items: flex-end;

    justify-content: flex-end;

}

.service-image img {

    width: 100%;

    height: 100%;

    object-fit: contain;

}


/* ARROW */

.service-arrow {

    position: absolute;

    left: 30px;

    bottom: 30px;

    width: 53px;

    height: 53px;

    background: var(--swiggy-orange);

    color: white;

    border-radius: 50%;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 22px;

    z-index: 4;

}


/* =========================================================
   CATEGORY SECTION
========================================================= */

.categories {

    padding: 50px 10% 65px;

    background: white;

}


.section-heading {

    margin-bottom: 30px;

}


.section-title {

    font-size: 22px;

    font-weight: 800;

    color: #202020;

}


.section-subtitle {

    margin-top: 5px;

    color: #686b78;

    font-size: 13px;

}


/* CATEGORY GRID */

.category-list {

    display: grid;

    grid-template-columns: repeat(11, 1fr);

    gap: 22px;

    overflow-x: auto;

    padding-bottom: 10px;

}


/* CATEGORY */

.category {

    min-width: 82px;

    text-align: center;

    cursor: pointer;

    transition: 0.25s;

}

.category:hover {

    transform: translateY(-5px);

}


/* CATEGORY IMAGE */

.category-image {

    width: 82px;

    height: 82px;

    margin: auto;

    border-radius: 50%;

    overflow: hidden;

    background: #f5f5f5;

}

.category-image img {

    width: 100%;

    height: 100%;

    object-fit: cover;

}


/* CATEGORY NAME */

.category-name {

    margin-top: 9px;

    font-size: 12px;

    font-weight: 600;

    color: #333;

}


/* =========================================================
   RESTAURANTS
========================================================= */

.restaurants {

    background: #f7f7f7;

    padding: 55px 10% 75px;

}


.restaurant-heading {

    margin-bottom: 25px;

}

.restaurant-heading h2 {

    font-size: 26px;

    font-weight: 800;

}

.restaurant-heading p {

    margin-top: 6px;

    color: #686b78;

    font-size: 13px;

}


/* =========================================================
   FILTERS
========================================================= */

.filters {

    display: flex;

    gap: 10px;

    margin-bottom: 28px;

    flex-wrap: wrap;

}


.filter {

    border: 1px solid #dddddd;

    background: white;

    color: #444;

    padding: 9px 15px;

    border-radius: 20px;

    cursor: pointer;

    font-size: 12px;

    font-weight: 600;

    transition: 0.25s;

}

.filter:hover {

    border-color: var(--swiggy-orange);

    color: var(--swiggy-orange);

}

.filter.active {

    background: var(--swiggy-orange);

    border-color: var(--swiggy-orange);

    color: white;

}


/* =========================================================
   RESTAURANT GRID
========================================================= */

.restaurant-grid {

    display: grid;

    grid-template-columns: repeat(3, 1fr);

    gap: 24px;

}


/* =========================================================
   RESTAURANT CARD
========================================================= */

.restaurant-card {

    background: white;

    border-radius: 18px;

    overflow: hidden;

    border: 1px solid #eeeeee;

    transition: 0.3s;

    box-shadow: 0 2px 8px rgba(0,0,0,0.04);

}

.restaurant-card:hover {

    transform: translateY(-5px);

    box-shadow: 0 10px 25px rgba(0,0,0,0.12);

}


/* RESTAURANT IMAGE */

.restaurant-image {

    height: 210px;

    position: relative;

    overflow: hidden;

}

.restaurant-image img {

    width: 100%;

    height: 100%;

    object-fit: cover;

    transition: 0.4s;

}

.restaurant-card:hover .restaurant-image img {

    transform: scale(1.06);

}


/* OFFER */

.offer {

    position: absolute;

    left: 12px;

    bottom: 12px;

    background: #256fef;

    color: white;

    padding: 5px 10px;

    border-radius: 5px;

    font-size: 11px;

    font-weight: 700;

}


/* RESTAURANT INFO */

.restaurant-info {

    padding: 17px;

}


.restaurant-top {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 7px;

}


.restaurant-name {

    font-size: 17px;

    font-weight: 700;

    white-space: nowrap;

    overflow: hidden;

    text-overflow: ellipsis;

}


.rating {

    background: var(--green);

    color: white;

    padding: 4px 7px;

    border-radius: 5px;

    font-size: 11px;

    font-weight: 700;

    white-space: nowrap;

}


.cuisine {

    color: #686b78;

    font-size: 12px;

    margin-bottom: 12px;

}


.restaurant-meta {

    display: flex;

    justify-content: space-between;

    align-items: center;

    color: #686b78;

    font-size: 12px;

    margin-bottom: 11px;

}


.restaurant-meta i {

    color: var(--swiggy-orange);

    margin-right: 4px;

}


.restaurant-location {

    color: #777;

    font-size: 12px;

    margin-bottom: 15px;

}


.restaurant-location i {

    color: var(--swiggy-orange);

    margin-right: 5px;

}


/* FOOTER */

.card-footer {

    border-top: 1px solid #eeeeee;

    padding-top: 12px;

    display: flex;

    justify-content: flex-end;

}


.menu-btn {

    display: inline-flex;

    align-items: center;

    gap: 7px;

    color: var(--swiggy-orange);

    border: 1px solid var(--swiggy-orange);

    padding: 8px 14px;

    border-radius: 7px;

    font-size: 12px;

    font-weight: 700;

    transition: 0.25s;

}

.menu-btn:hover {

    background: var(--swiggy-orange);

    color: white;

}


/* =========================================================
   WHY FOODIE
========================================================= */

.why-foodie {

    padding: 65px 10%;

    background: white;

}


.why-heading {

    text-align: center;

    margin-bottom: 40px;

}

.why-heading h2 {

    font-size: 27px;

    font-weight: 800;

}

.why-heading p {

    color: #686b78;

    margin-top: 7px;

    font-size: 13px;

}


.why-grid {

    display: grid;

    grid-template-columns: repeat(3, 1fr);

    gap: 25px;

}


.why-card {

    text-align: center;

    padding: 30px 25px;

    border: 1px solid #eeeeee;

    border-radius: 15px;

    transition: 0.3s;

}

.why-card:hover {

    transform: translateY(-5px);

    box-shadow: 0 8px 20px rgba(0,0,0,0.08);

}


.why-icon {

    width: 60px;

    height: 60px;

    margin: auto auto 17px;

    display: flex;

    align-items: center;

    justify-content: center;

    border-radius: 50%;

    background: #fff0e7;

    color: var(--swiggy-orange);

    font-size: 24px;

}


.why-card h3 {

    font-size: 16px;

    margin-bottom: 8px;

}


.why-card p {

    color: #777;

    font-size: 12px;

    line-height: 1.6;

}


/* =========================================================
   FOOTER
========================================================= */

.footer {

    background: #02060c;

    color: white;

    padding: 55px 10% 25px;

}


.footer-top {

    display: grid;

    grid-template-columns: 2fr 1fr 1fr 1fr;

    gap: 45px;

    padding-bottom: 40px;

    border-bottom: 1px solid #333;

}


.footer-logo {

    font-size: 28px;

    font-weight: 800;

    color: white;

    margin-bottom: 12px;

}

.footer-logo span {

    color: var(--swiggy-orange);

}


.footer-description {

    color: #aaa;

    font-size: 12px;

    line-height: 1.7;

    max-width: 350px;

}


.footer-column h4 {

    font-size: 14px;

    margin-bottom: 18px;

}


.footer-column a {

    display: block;

    color: #aaa;

    font-size: 12px;

    margin-bottom: 12px;

    transition: 0.2s;

}

.footer-column a:hover {

    color: white;

}


.footer-bottom {

    display: flex;

    justify-content: space-between;

    padding-top: 22px;

    color: #777;

    font-size: 11px;

}


/* =========================================================
   TOAST
========================================================= */

.toast {

    position: fixed;

    right: 25px;

    bottom: 25px;

    background: #02060c;

    color: white;

    padding: 13px 18px;

    border-radius: 8px;

    font-size: 13px;

    display: none;

    z-index: 3000;

    box-shadow: 0 8px 25px rgba(0,0,0,0.25);

}


/* =========================================================
   RESPONSIVE
========================================================= */

@media(max-width: 1100px) {

    .navbar {

        padding: 0 5%;

    }

    .hero-cards {

        grid-template-columns: repeat(3, 1fr);

        gap: 15px;

    }

    .service-card {

        height: 320px;

    }

    .service-content h2 {

        font-size: 27px;

    }

    .category-list {

        grid-template-columns: repeat(7, 1fr);

    }

    .restaurant-grid {

        grid-template-columns: repeat(2, 1fr);

    }

    .categories,
    .restaurants,
    .why-foodie {

        padding-left: 5%;

        padding-right: 5%;

    }

    .footer {

        padding-left: 5%;

        padding-right: 5%;

    }

}


/* TABLET */

@media(max-width: 800px) {

    .navbar {

        height: auto;

        min-height: 70px;

        padding: 12px 5%;

        flex-wrap: wrap;

        gap: 10px;

    }

    .nav-right {

        flex-wrap: wrap;

        justify-content: flex-end;

    }

    .nav-right a {

        padding: 7px 9px;

        font-size: 11px;

    }

    .hero {

        padding-top: 110px;

        min-height: 950px;

    }

    .hero-title {

        font-size: 34px;

    }

    .search-box {

        flex-direction: column;

        max-width: 500px;

    }

    .search-location {

        width: 100%;

    }

    .search-food {

        width: 100%;

        max-width: none;

    }

    .search-btn {

        width: 100%;

    }

    .hero-cards {

        grid-template-columns: 1fr;

        max-width: 500px;

    }

    .service-card {

        height: 280px;

    }

    .service-image {

        width: 55%;

    }

    .restaurant-grid {

        grid-template-columns: repeat(2, 1fr);

    }

    .why-grid {

        grid-template-columns: 1fr;

    }

    .footer-top {

        grid-template-columns: 1fr 1fr;

    }

}


/* MOBILE */

@media(max-width: 600px) {

    .logo {

        font-size: 21px;

    }

    .logo-icon {

        width: 32px;

        height: 32px;

        font-size: 16px;

    }

    .nav-right {

        width: 100%;

        justify-content: center;

    }

    .hero {

        min-height: 1050px;

    }

    .hero-title {

        font-size: 29px;

    }

    .hero-cards {

        width: 90%;

    }

    .service-card {

        height: 270px;

    }

    .service-content h2 {

        font-size: 27px;

    }

    .service-content h3 {

        font-size: 18px;

    }

    .restaurant-grid {

        grid-template-columns: 1fr;

    }

    .footer-top {

        grid-template-columns: 1fr;

    }

    .footer-bottom {

        flex-direction: column;

        gap: 10px;

        text-align: center;

    }

    .hero-left-food,
    .hero-right-food {

        opacity: 0.5;

        width: 110px;

    }

}


/* =========================================================
   HIDE SCROLLBAR
========================================================= */

.category-list::-webkit-scrollbar {

    height: 4px;

}

.category-list::-webkit-scrollbar-thumb {

    background: #ddd;

    border-radius: 10px;

}

</style>

</head>


<body>


<!-- =========================================================
     NAVBAR
========================================================= -->

<nav class="navbar">


    <!-- LOGO -->

    <div class="logo"
         onclick="window.location.href='<%= request.getContextPath() %>/'">

        <div class="logo-icon">
            <i class="fa-solid fa-utensils"></i>
        </div>

        Foodie

    </div>


    <!-- NAV RIGHT -->

    <div class="nav-right">


        <a href="<%= request.getContextPath() %>/">

            <i class="fa-solid fa-house"></i>

            Home

        </a>


        <a href="#restaurants">

            <i class="fa-solid fa-store"></i>

            Restaurants

        </a>


        <a href="#">

            <i class="fa-solid fa-briefcase"></i>

            Foodie Corporate

        </a>


        <a href="#">

            <i class="fa-solid fa-handshake"></i>

            Partner with us

        </a>


        <a href="#"
           class="app-btn">

            <i class="fa-solid fa-mobile-screen"></i>

            Get the App

        </a>


        <% if (user == null) { %>


            <a href="<%= request.getContextPath() %>/jsp/login.jsp"
               class="login-btn">

                <i class="fa-solid fa-right-to-bracket"></i>

                Sign In

            </a>


            <a href="<%= request.getContextPath() %>/jsp/register.jsp"
               class="signup-btn">

                <i class="fa-solid fa-user-plus"></i>

                Sign Up

            </a>


        <% } else { %>


            <span class="user-welcome">

                <i class="fa-solid fa-circle-user"></i>

                Welcome, <%= user.getFullName() %>

            </span>


            <a href="<%= request.getContextPath() %>/logout"
               class="logout-btn">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </a>


        <% } %>


        <!-- CART -->

        <a href="<%= request.getContextPath() %>/cart"
           class="cart-link">

            <i class="fa-solid fa-cart-shopping"></i>

            Cart

            <span class="cart-badge">0</span>

        </a>


    </div>

</nav>



<!-- =========================================================
     HERO
========================================================= -->

<section class="hero">


    <!-- LEFT DECORATION -->

    <div class="hero-left-food">

        <img src="https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=500&q=80"
             alt="Food">

    </div>


    <!-- RIGHT DECORATION -->

    <div class="hero-right-food">

        <img src="https://images.unsplash.com/photo-1553621042-f6e147245754?auto=format&fit=crop&w=500&q=80"
             alt="Food">

    </div>


    <!-- HERO CONTENT -->

    <div class="hero-content">


        <h1 class="hero-title">

            Order food & groceries.
            Discover best restaurants.
            <span>Foodie it!</span>

        </h1>


        <!-- SEARCH -->

        <div class="search-box">


            <div class="search-location">

                <i class="fa-solid fa-location-dot"></i>

                <input
                    type="text"
                    id="locationInput"
                    placeholder="Enter your location">

            </div>


            <div class="search-food">

                <i class="fa-solid fa-magnifying-glass"></i>

                <input
                    type="text"
                    id="foodInput"
                    placeholder="Search for restaurant, item or more">

            </div>


            <button class="search-btn"
                    onclick="searchFood()">

                Search

            </button>


        </div>


        <!-- LOCATION -->

        <div style="margin-top:15px;">

            <button
                onclick="getLocation()"
                style="
                border:none;
                background:rgba(255,255,255,0.15);
                color:white;
                padding:9px 16px;
                border-radius:20px;
                cursor:pointer;
                font-size:12px;
                ">

                <i class="fa-solid fa-location-crosshairs"></i>

                Detect my location

            </button>


            <span id="locationStatus"
                  style="
                  margin-left:10px;
                  font-size:12px;
                  ">

            </span>

        </div>


    </div>



    <!-- =====================================================
         THREE MAIN SERVICE CARDS
    ====================================================== -->

    <div class="hero-cards">


        <!-- FOOD DELIVERY -->

        <div class="service-card"
             onclick="document.getElementById('restaurants').scrollIntoView({behavior:'smooth'})">


            <div class="service-content">

                <h2>
                    FOOD<br>
                    DELIVERY
                </h2>

                <h3>
                    FROM RESTAURANTS
                </h3>

                <span class="discount">
                    UPTO 60% OFF
                </span>

            </div>


            <div class="service-image">

                <img
                    src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=700&q=90"
                    alt="Food Delivery">

            </div>


            <div class="service-arrow">

                <i class="fa-solid fa-arrow-right"></i>

            </div>


        </div>



        <!-- INSTAMART -->

        <div class="service-card">


            <div class="service-content">

                <h2>
                    INSTA<br>
                    MART
                </h2>

                <h3>
                    INSTANT GROCERY
                </h3>

                <span class="discount">
                    UPTO 60% OFF
                </span>

            </div>


            <div class="service-image">

                <img
                    src="https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=700&q=90"
                    alt="Grocery">

            </div>


            <div class="service-arrow">

                <i class="fa-solid fa-arrow-right"></i>

            </div>


        </div>



        <!-- DINEOUT -->

        <div class="service-card">


            <div class="service-content">

                <h2>
                    DINEOUT
                </h2>

                <h3>
                    EAT OUT & SAVE MORE
                </h3>

                <span class="discount">
                    UPTO 50% OFF
                </span>

            </div>


            <div class="service-image">

                <img
                    src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=700&q=90"
                    alt="Dineout">

            </div>


            <div class="service-arrow">

                <i class="fa-solid fa-arrow-right"></i>

            </div>


        </div>


    </div>


</section>



<!-- =========================================================
     FOOD CATEGORIES
========================================================= -->

<section class="categories">


    <div class="section-heading">

        <h2 class="section-title">

            Order our best food options

        </h2>

        <p class="section-subtitle">

            Explore popular food categories

        </p>

    </div>



    <div class="category-list">


        <!-- SOUTH INDIAN -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1589301760014-d929f3979dbc?auto=format&fit=crop&w=300&q=80"
                    alt="South Indian">

            </div>

            <div class="category-name">
                South Indian
            </div>

        </div>



        <!-- BIRYANI -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=300&q=80"
                    alt="Biryani">

            </div>

            <div class="category-name">
                Biryani
            </div>

        </div>



        <!-- NORTH INDIAN -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=300&q=80"
                    alt="North Indian">

            </div>

            <div class="category-name">
                North Indian
            </div>

        </div>



        <!-- DESSERT -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=300&q=80"
                    alt="Desserts">

            </div>

            <div class="category-name">
                Desserts
            </div>

        </div>



        <!-- CAKE -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=300&q=80"
                    alt="Cake">

            </div>

            <div class="category-name">
                Cake
            </div>

        </div>



        <!-- CHINESE -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1525755662778-989d0524087e?auto=format&fit=crop&w=300&q=80"
                    alt="Chinese">

            </div>

            <div class="category-name">
                Chinese
            </div>

        </div>



        <!-- BURGER -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=300&q=80"
                    alt="Burger">

            </div>

            <div class="category-name">
                Burger
            </div>

        </div>



        <!-- PIZZA -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=300&q=80"
                    alt="Pizza">

            </div>

            <div class="category-name">
                Pizza
            </div>

        </div>



        <!-- SALAD -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=300&q=80"
                    alt="Salad">

            </div>

            <div class="category-name">
                Salad
            </div>

        </div>



        <!-- ICE CREAM -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1501443762994-82bd5dace89a?auto=format&fit=crop&w=300&q=80"
                    alt="Ice Cream">

            </div>

            <div class="category-name">
                Ice Cream
            </div>

        </div>



        <!-- NOODLES -->

        <div class="category">

            <div class="category-image">

                <img
                    src="https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=300&q=80"
                    alt="Noodles">

            </div>

            <div class="category-name">
                Noodles
            </div>

        </div>



    </div>

</section>



<!-- =========================================================
     RESTAURANTS
========================================================= -->

<section class="restaurants"
         id="restaurants">


    <div class="restaurant-heading">

        <h2>
            Best restaurants near you
        </h2>

        <p>
            Explore top-rated restaurants and order your favourites
        </p>

    </div>



    <!-- FILTERS -->

    <div class="filters">


        <button class="filter"
                onclick="filterRestaurants('all', this)">

            <i class="fa-solid fa-sliders"></i>

            All

        </button>


        <button class="filter"
                onclick="filterRestaurants('veg', this)">

            <i class="fa-solid fa-leaf"></i>

            Pure Veg

        </button>


        <button class="filter"
                onclick="filterRestaurants('rating', this)">

            <i class="fa-solid fa-star"></i>

            Rating 4.5+

        </button>


        <button class="filter"
                onclick="filterRestaurants('offer', this)">

            <i class="fa-solid fa-tags"></i>

            Great Offers

        </button>


    </div>



    <!-- RESTAURANT GRID -->

    <div class="restaurant-grid"
         id="restaurantGrid">



        <!-- =================================================
             RESTAURANT 1
        ================================================== -->

        <div class="restaurant-card"
             data-type="all"
             data-rating="4.5"
             data-offer="true">


            <div class="restaurant-image">

                <img
                    src="https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=900&q=90"
                    alt="Domino's Pizza">

                <div class="offer">
                    20% OFF
                </div>

            </div>


            <div class="restaurant-info">

                <div class="restaurant-top">

                    <h3 class="restaurant-name">
                        Domino's Pizza
                    </h3>

                    <span class="rating">
                        <i class="fa-solid fa-star"></i>
                        4.5
                    </span>

                </div>


                <p class="cuisine">
                    🍕 Pizza • Italian • Fast Food
                </p>


                <div class="restaurant-meta">

                    <span>
                        <i class="fa-solid fa-motorcycle"></i>
                        25–30 mins
                    </span>

                    <span>
                        ₹200 for one
                    </span>

                </div>


                <p class="restaurant-location">

                    <i class="fa-solid fa-location-dot"></i>

                    MG Road

                </p>


                <div class="card-footer">

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=1"
                        class="menu-btn">

                        View Menu

                        <i class="fa-solid fa-arrow-right"></i>

                    </a>

                </div>

            </div>

        </div>



        <!-- =================================================
             RESTAURANT 2
        ================================================== -->

        <div class="restaurant-card"
             data-type="nonveg"
             data-rating="4.4"
             data-offer="true">


            <div class="restaurant-image">

                <img
                    src="https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=900&q=90"
                    alt="KFC">

                <div class="offer">
                    30% OFF
                </div>

            </div>


            <div class="restaurant-info">

                <div class="restaurant-top">

                    <h3 class="restaurant-name">
                        KFC
                    </h3>

                    <span class="rating">
                        <i class="fa-solid fa-star"></i>
                        4.4
                    </span>

                </div>


                <p class="cuisine">
                    🍗 Chicken • Fast Food • Snacks
                </p>


                <div class="restaurant-meta">

                    <span>
                        <i class="fa-solid fa-motorcycle"></i>
                        20–25 mins
                    </span>

                    <span>
                        ₹250 for one
                    </span>

                </div>


                <p class="restaurant-location">

                    <i class="fa-solid fa-location-dot"></i>

                    Indiranagar

                </p>


                <div class="card-footer">

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=2"
                        class="menu-btn">

                        View Menu

                        <i class="fa-solid fa-arrow-right"></i>

                    </a>

                </div>

            </div>

        </div>



        <!-- =================================================
             RESTAURANT 3
        ================================================== -->

        <div class="restaurant-card"
             data-type="nonveg"
             data-rating="4.3"
             data-offer="true">


            <div class="restaurant-image">

                <img
                    src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=900&q=90"
                    alt="Burger King">

                <div class="offer">
                    25% OFF
                </div>

            </div>


            <div class="restaurant-info">

                <div class="restaurant-top">

                    <h3 class="restaurant-name">
                        Burger King
                    </h3>

                    <span class="rating">
                        <i class="fa-solid fa-star"></i>
                        4.3
                    </span>

                </div>


                <p class="cuisine">
                    🍔 Burgers • American • Snacks
                </p>


                <div class="restaurant-meta">

                    <span>
                        <i class="fa-solid fa-motorcycle"></i>
                        30–35 mins
                    </span>

                    <span>
                        ₹220 for one
                    </span>

                </div>


                <p class="restaurant-location">

                    <i class="fa-solid fa-location-dot"></i>

                    Whitefield

                </p>


                <div class="card-footer">

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=3"
                        class="menu-btn">

                        View Menu

                        <i class="fa-solid fa-arrow-right"></i>

                    </a>

                </div>

            </div>

        </div>



        <!-- =================================================
             RESTAURANT 4
        ================================================== -->

        <div class="restaurant-card"
             data-type="veg"
             data-rating="4.2"
             data-offer="true">


            <div class="restaurant-image">

                <img
                    src="https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=900&q=90"
                    alt="Pizza Hut">

                <div class="offer">
                    40% OFF
                </div>

            </div>


            <div class="restaurant-info">

                <div class="restaurant-top">

                    <h3 class="restaurant-name">
                        Pizza Hut
                    </h3>

                    <span class="rating">
                        <i class="fa-solid fa-star"></i>
                        4.2
                    </span>

                </div>


                <p class="cuisine">
                    🍕 Pizza • Italian • Beverages
                </p>


                <div class="restaurant-meta">

                    <span>
                        <i class="fa-solid fa-motorcycle"></i>
                        30–40 mins
                    </span>

                    <span>
                        ₹230 for one
                    </span>

                </div>


                <p class="restaurant-location">

                    <i class="fa-solid fa-location-dot"></i>

                    Koramangala

                </p>


                <div class="card-footer">

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=4"
                        class="menu-btn">

                        View Menu

                        <i class="fa-solid fa-arrow-right"></i>

                    </a>

                </div>

            </div>

        </div>



        <!-- =================================================
             RESTAURANT 5
        ================================================== -->

        <div class="restaurant-card"
             data-type="nonveg"
             data-rating="4.7"
             data-offer="true">


            <div class="restaurant-image">

                <img
                    src="https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=900&q=90"
                    alt="Biryani House">

                <div class="offer">
                    35% OFF
                </div>

            </div>


            <div class="restaurant-info">

                <div class="restaurant-top">

                    <h3 class="restaurant-name">
                        Biryani House
                    </h3>

                    <span class="rating">
                        <i class="fa-solid fa-star"></i>
                        4.7
                    </span>

                </div>


                <p class="cuisine">
                    🍛 Biryani • Indian • Mughlai
                </p>


                <div class="restaurant-meta">

                    <span>
                        <i class="fa-solid fa-motorcycle"></i>
                        25–30 mins
                    </span>

                    <span>
                        ₹240 for one
                    </span>

                </div>


                <p class="restaurant-location">

                    <i class="fa-solid fa-location-dot"></i>

                    HSR Layout

                </p>


                <div class="card-footer">

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=5"
                        class="menu-btn">

                        View Menu

                        <i class="fa-solid fa-arrow-right"></i>

                    </a>

                </div>

            </div>

        </div>



        <!-- =================================================
             RESTAURANT 6
        ================================================== -->

        <div class="restaurant-card"
             data-type="veg"
             data-rating="4.6"
             data-offer="true">


            <div class="restaurant-image">

                <img
                    src="https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?auto=format&fit=crop&w=900&q=90"
                    alt="Spice Garden">

                <div class="offer">
                    20% OFF
                </div>

            </div>


            <div class="restaurant-info">

                <div class="restaurant-top">

                    <h3 class="restaurant-name">
                        Spice Garden
                    </h3>

                    <span class="rating">
                        <i class="fa-solid fa-star"></i>
                        4.6
                    </span>

                </div>


                <p class="cuisine">
                    🍛 Indian • North Indian • Chinese
                </p>


                <div class="restaurant-meta">

                    <span>
                        <i class="fa-solid fa-motorcycle"></i>
                        25–35 mins
                    </span>

                    <span>
                        ₹210 for one
                    </span>

                </div>


                <p class="restaurant-location">

                    <i class="fa-solid fa-location-dot"></i>

                    Marathahalli

                </p>


                <div class="card-footer">

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=6"
                        class="menu-btn">

                        View Menu

                        <i class="fa-solid fa-arrow-right"></i>

                    </a>

                </div>

            </div>

        </div>



        <!-- =================================================
             RESTAURANT 7
        ================================================== -->

        <div class="restaurant-card"
             data-type="veg"
             data-rating="4.8"
             data-offer="true">


            <div class="restaurant-image">

                <img
                    src="https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?auto=format&fit=crop&w=900&q=90"
                    alt="Basaveshwara Khanavali">

                <div class="offer">
                    SPECIAL
                </div>

            </div>


            <div class="restaurant-info">

                <div class="restaurant-top">

                    <h3 class="restaurant-name">
                        Basaveshwara Khanavali
                    </h3>

                    <span class="rating">
                        <i class="fa-solid fa-star"></i>
                        4.8
                    </span>

                </div>


                <p class="cuisine">
                    🫓 Jolada Rotti • Palya • North Karnataka
                </p>


                <div class="restaurant-meta">

                    <span>
                        <i class="fa-solid fa-motorcycle"></i>
                        20–30 mins
                    </span>

                    <span>
                        ₹150 for one
                    </span>

                </div>


                <p class="restaurant-location">

                    <i class="fa-solid fa-location-dot"></i>

                    Bangalore

                </p>


                <div class="card-footer">

                    <a
                        href="<%= request.getContextPath() %>/menu?restaurantId=7"
                        class="menu-btn">

                        View Menu

                        <i class="fa-solid fa-arrow-right"></i>

                    </a>

                </div>

            </div>

        </div>


    </div>

</section>



<!-- =========================================================
     WHY FOODIE
========================================================= -->

<section class="why-foodie">


    <div class="why-heading">

        <h2>
            Why order with Foodie?
        </h2>

        <p>
            Everything you need for a great food ordering experience
        </p>

    </div>


    <div class="why-grid">


        <div class="why-card">

            <div class="why-icon">

                <i class="fa-solid fa-bolt"></i>

            </div>

            <h3>
                Fast Delivery
            </h3>

            <p>
                Get your favourite food delivered quickly
                from restaurants near you.
            </p>

        </div>



        <div class="why-card">

            <div class="why-icon">

                <i class="fa-solid fa-utensils"></i>

            </div>

            <h3>
                Wide Selection
            </h3>

            <p>
                Choose from multiple restaurants,
                cuisines and delicious dishes.
            </p>

        </div>



        <div class="why-card">

            <div class="why-icon">

                <i class="fa-solid fa-shield-heart"></i>

            </div>

            <h3>
                Easy & Secure
            </h3>

            <p>
                Simple ordering, secure checkout and
                convenient payment options.
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

                Foodie<span>.</span>

            </div>

            <p class="footer-description">

                Foodie is your simple and convenient
                food ordering platform. Discover restaurants,
                explore menus and order delicious food online.

            </p>

        </div>



        <div class="footer-column">

            <h4>
                Foodie
            </h4>

            <a href="<%= request.getContextPath() %>/">
                Home
            </a>

            <a href="#restaurants">
                Restaurants
            </a>

            <a href="<%= request.getContextPath() %>/cart">
                Cart
            </a>

        </div>



        <div class="footer-column">

            <h4>
                Account
            </h4>

            <a href="<%= request.getContextPath() %>/jsp/login.jsp">
                Login
            </a>

            <a href="<%= request.getContextPath() %>/jsp/register.jsp">
                Register
            </a>

        </div>



        <div class="footer-column">

            <h4>
                Contact
            </h4>

            <a href="#">
                <i class="fa-solid fa-envelope"></i>
                support@foodie.com
            </a>

            <a href="#">
                <i class="fa-solid fa-phone"></i>
                +91 98765 43210
            </a>

        </div>


    </div>


    <div class="footer-bottom">

        <span>
            © 2026 Foodie. All rights reserved.
        </span>

        <span>
            Made with ❤️ for food lovers
        </span>

    </div>


</footer>



<!-- =========================================================
     TOAST
========================================================= -->

<div id="toast"
     class="toast">

    Searching...

</div>



<script>

/* =========================================================
   SEARCH FOOD
========================================================= */

function searchFood() {

    const input =
        document.getElementById("foodInput")
        .value
        .trim()
        .toLowerCase();

    const cards =
        document.querySelectorAll(".restaurant-card");


    if (input === "") {

        cards.forEach(function(card) {

            card.style.display = "block";

        });

        showToast("Showing all restaurants");

        return;
    }


    let found = false;


    cards.forEach(function(card) {

        const text =
            card.innerText.toLowerCase();


        if (text.includes(input)) {

            card.style.display = "block";

            found = true;

        } else {

            card.style.display = "none";

        }

    });


    document
        .getElementById("restaurants")
        .scrollIntoView({
            behavior: "smooth"
        });


    if (found) {

        showToast(
            "Restaurants matching '" + input + "'"
        );

    } else {

        showToast(
            "No restaurant found for '" + input + "'"
        );

    }

}


/* =========================================================
   ENTER KEY SEARCH
========================================================= */

document
    .getElementById("foodInput")
    .addEventListener("keypress", function(event) {

        if (event.key === "Enter") {

            searchFood();

        }

    });


/* =========================================================
   LOCATION
========================================================= */

function getLocation() {

    const status =
        document.getElementById("locationStatus");

    const input =
        document.getElementById("locationInput");


    if (!navigator.geolocation) {

        status.innerText =
            "Location is not supported.";

        return;

    }


    status.innerText =
        "Detecting...";


    navigator.geolocation.getCurrentPosition(

        function(position) {

            const latitude =
                position.coords.latitude;

            const longitude =
                position.coords.longitude;


            input.value =
                "Location detected";


            status.innerText =
                "✓ Location enabled";


            showToast(
                "Your location has been detected"
            );

        },


        function(error) {

            status.innerText =
                "Unable to detect location.";

            showToast(
                "Please allow location permission"
            );

        }

    );

}


/* =========================================================
   RESTAURANT FILTER
========================================================= */

function filterRestaurants(type, button) {

    const cards =
        document.querySelectorAll(".restaurant-card");


    document
        .querySelectorAll(".filter")
        .forEach(function(btn) {

            btn.classList.remove("active");

        });


    button.classList.add("active");


    cards.forEach(function(card) {

        const cardType =
            card.getAttribute("data-type");

        const rating =
            parseFloat(
                card.getAttribute("data-rating")
            );

        const offer =
            card.getAttribute("data-offer");


        if (type === "all") {

            card.style.display = "block";

        }


        else if (type === "veg") {

            if (cardType === "veg") {

                card.style.display = "block";

            } else {

                card.style.display = "none";

            }

        }


        else if (type === "rating") {

            if (rating >= 4.5) {

                card.style.display = "block";

            } else {

                card.style.display = "none";

            }

        }


        else if (type === "offer") {

            if (offer === "true") {

                card.style.display = "block";

            } else {

                card.style.display = "none";

            }

        }

    });

}


/* =========================================================
   TOAST
========================================================= */

function showToast(message) {

    const toast =
        document.getElementById("toast");


    toast.innerText =
        message;


    toast.style.display =
        "block";


    setTimeout(function() {

        toast.style.display =
            "none";

    }, 2500);

}


/* =========================================================
   ACTIVE ALL FILTER
========================================================= */

window.addEventListener("load", function() {

    const firstFilter =
        document.querySelector(".filter");


    if (firstFilter) {

        firstFilter.classList.add("active");

    }

});

</script>


</body>

</html>