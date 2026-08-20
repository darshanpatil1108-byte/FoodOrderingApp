<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.foodapp.model.User" %>

<%
    String contextPath = request.getContextPath();

    User loggedInUser = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Foodie - Online Food Delivery</title>

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
            font-family: "Segoe UI", Arial, sans-serif;
            background: #fff8f5;
            color: #222;
            overflow-x: hidden;
        }

        a {
            text-decoration: none;
        }

        img {
            display: block;
        }


        /* =========================================================
           NAVBAR
        ========================================================= */

        .navbar {
            position: sticky;
            top: 0;
            z-index: 9999;
            height: 78px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 7%;

            background: rgba(255, 255, 255, 0.96);
            backdrop-filter: blur(15px);

            border-bottom: 1px solid rgba(0, 0, 0, 0.07);

            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.06);
        }

        .logo {
            font-size: 30px;
            font-weight: 900;
            color: #ff3d00;
            letter-spacing: -1px;
        }

        .logo span {
            color: #ff8a00;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            color: #333;
            font-size: 15px;
            font-weight: 600;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #ff3d00;
            transform: translateY(-2px);
        }

        .login-btn {
            padding: 11px 22px;
            color: white !important;
            background: linear-gradient(135deg, #ff3d00, #ff8a00);
            border-radius: 25px;
            box-shadow: 0 8px 20px rgba(255, 61, 0, 0.25);
        }

        .login-btn:hover {
            color: white !important;
            transform: translateY(-2px);
        }

        .register-btn {
            padding: 11px 22px;
            color: #ff3d00 !important;
            border: 2px solid #ff3d00;
            border-radius: 25px;
            transition: 0.3s;
        }

        .register-btn:hover {
            background: #ff3d00;
            color: white !important;
        }

        .user-name {
            color: #ff3d00 !important;
            font-weight: 800 !important;
        }


        /* =========================================================
           HERO
        ========================================================= */

        .hero {
            min-height: 650px;

            position: relative;

            display: flex;
            align-items: center;
            justify-content: center;

            text-align: center;

            padding: 70px 20px;

            background:
                linear-gradient(
                    135deg,
                    rgba(255, 61, 0, 0.86),
                    rgba(255, 140, 0, 0.72)
                ),
                url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1800&q=90")
                center/cover no-repeat;

            overflow: hidden;
        }

        .hero::before {
            content: "";

            position: absolute;

            width: 450px;
            height: 450px;

            background: rgba(255, 255, 255, 0.12);

            border-radius: 50%;

            top: -180px;
            left: -150px;

            animation: floatCircle 7s infinite alternate ease-in-out;
        }

        .hero::after {
            content: "";

            position: absolute;

            width: 350px;
            height: 350px;

            background: rgba(255, 255, 255, 0.10);

            border-radius: 50%;

            bottom: -150px;
            right: -100px;

            animation: floatCircle 6s infinite alternate ease-in-out;
        }

        @keyframes floatCircle {

            from {
                transform: translateY(0);
            }

            to {
                transform: translateY(35px);
            }

        }

        .hero-content {
            position: relative;
            z-index: 2;

            max-width: 900px;

            color: white;

            animation: heroAppear 1s ease;
        }

        @keyframes heroAppear {

            from {
                opacity: 0;
                transform: translateY(35px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }

        }

        .hero-badge {
            display: inline-block;

            padding: 9px 18px;

            margin-bottom: 20px;

            border-radius: 30px;

            background: rgba(255, 255, 255, 0.18);

            border: 1px solid rgba(255, 255, 255, 0.35);

            backdrop-filter: blur(10px);

            font-size: 14px;
            font-weight: 600;
        }

        .hero h1 {

            font-size: clamp(42px, 6vw, 72px);

            line-height: 1.05;

            margin-bottom: 22px;

            font-weight: 900;

            letter-spacing: -2px;

            text-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
        }

        .hero h1 span {
            color: #fff2a8;
        }

        .hero p {

            font-size: 19px;

            max-width: 650px;

            margin: 0 auto 30px;

            line-height: 1.7;

            color: #fff8f2;
        }


        /* =========================================================
           SEARCH
        ========================================================= */

        .search-box {

            width: min(720px, 95%);

            margin: auto;

            background: white;

            padding: 8px;

            display: flex;

            border-radius: 18px;

            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.25);

            transition: 0.3s;
        }

        .search-box:focus-within {

            transform: translateY(-3px);

            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3);
        }

        .search-icon {

            width: 55px;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 22px;

            color: #ff3d00;
        }

        .search-box input {

            flex: 1;

            border: none;

            outline: none;

            font-size: 16px;

            padding: 15px;

            color: #333;
        }

        .search-box button {

            border: none;

            padding: 0 30px;

            border-radius: 13px;

            color: white;

            font-size: 15px;

            font-weight: 700;

            cursor: pointer;

            background: linear-gradient(
                135deg,
                #ff3d00,
                #ff8a00
            );

            transition: 0.3s;
        }

        .search-box button:hover {

            transform: scale(1.03);

            box-shadow: 0 8px 20px rgba(255, 61, 0, 0.3);
        }


        /* =========================================================
           STATS
        ========================================================= */

        .stats {

            position: relative;

            margin: -55px auto 0;

            z-index: 10;

            width: min(900px, 90%);

            display: grid;

            grid-template-columns: repeat(3, 1fr);

            background: white;

            border-radius: 20px;

            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.12);

            overflow: hidden;
        }

        .stat {

            padding: 25px;

            text-align: center;

            border-right: 1px solid #eee;
        }

        .stat:last-child {
            border-right: none;
        }

        .stat h2 {

            color: #ff3d00;

            font-size: 28px;

            margin-bottom: 5px;
        }

        .stat p {

            color: #777;

            font-size: 14px;
        }


        /* =========================================================
           SECTION
        ========================================================= */

        .section {
            padding: 80px 7%;
        }

        .section-title {

            text-align: center;

            margin-bottom: 45px;
        }

        .section-title h2 {

            font-size: 38px;

            margin-bottom: 10px;

            color: #222;
        }

        .section-title p {

            color: #777;

            font-size: 16px;
        }


        /* =========================================================
           CATEGORIES
        ========================================================= */

        .categories {

            display: grid;

            grid-template-columns: repeat(7, 1fr);

            gap: 18px;
        }

        .category {

            background: white;

            padding: 18px 10px;

            border-radius: 18px;

            text-align: center;

            cursor: pointer;

            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.06);

            transition: 0.35s;

            border: 1px solid transparent;
        }

        .category:hover {

            transform: translateY(-10px);

            border-color: #ffb199;

            box-shadow: 0 15px 35px rgba(255, 61, 0, 0.15);
        }

        .category img {

            width: 85px;

            height: 85px;

            object-fit: cover;

            border-radius: 50%;

            margin: 0 auto 12px;

            transition: 0.35s;
        }

        .category:hover img {

            transform: scale(1.08) rotate(3deg);
        }

        .category h3 {

            font-size: 15px;

            color: #333;
        }

        .category p {

            color: #999;

            font-size: 12px;

            margin-top: 5px;
        }


        /* =========================================================
           FEATURED
        ========================================================= */

        .featured {

            background:
                linear-gradient(
                    135deg,
                    #fff0e8,
                    #fff8f1
                );
        }


        /* =========================================================
           FOOD CARDS
        ========================================================= */

        .food-grid {

            display: grid;

            grid-template-columns: repeat(4, 1fr);

            gap: 25px;
        }

        .food-card {

            background: white;

            border-radius: 20px;

            overflow: hidden;

            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);

            transition: 0.35s;

            position: relative;
        }

        .food-card:hover {

            transform: translateY(-10px);

            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.14);
        }

        .food-image {

            height: 210px;

            position: relative;

            overflow: hidden;
        }

        .food-image img {

            width: 100%;

            height: 100%;

            object-fit: cover;

            transition: 0.5s;
        }

        .food-card:hover .food-image img {

            transform: scale(1.08);
        }

        .offer {

            position: absolute;

            top: 15px;
            left: 15px;

            padding: 7px 12px;

            border-radius: 20px;

            background: #ff3d00;

            color: white;

            font-size: 12px;

            font-weight: 700;
        }

        .food-info {
            padding: 18px;
        }

        .food-info h3 {

            font-size: 19px;

            margin-bottom: 7px;
        }

        .food-info p {

            color: #777;

            font-size: 13px;

            margin-bottom: 12px;
        }

        .food-bottom {

            display: flex;

            justify-content: space-between;

            align-items: center;
        }

        .price {

            font-size: 18px;

            font-weight: 800;

            color: #222;
        }

        .rating {

            background: #159447;

            color: white;

            padding: 5px 8px;

            border-radius: 7px;

            font-size: 12px;

            font-weight: 700;
        }


        /* =========================================================
           RESTAURANT BANNER
        ========================================================= */

        .restaurant-banner {

            margin: 0 7% 80px;

            min-height: 330px;

            border-radius: 30px;

            display: flex;

            align-items: center;

            padding: 60px;

            position: relative;

            overflow: hidden;

            color: white;

            background:
                linear-gradient(
                    110deg,
                    rgba(35, 15, 5, 0.95),
                    rgba(35, 15, 5, 0.45)
                ),
                url("https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?auto=format&fit=crop&w=1500&q=90")
                center/cover no-repeat;
        }

        .restaurant-banner-content {

            max-width: 580px;

            position: relative;

            z-index: 2;
        }

        .restaurant-banner h2 {

            font-size: 40px;

            margin-bottom: 15px;
        }

        .restaurant-banner p {

            color: #eee;

            line-height: 1.7;

            margin-bottom: 25px;
        }

        .primary-btn {

            display: inline-block;

            padding: 14px 25px;

            background:
                linear-gradient(
                    135deg,
                    #ff3d00,
                    #ff8a00
                );

            color: white;

            border-radius: 12px;

            font-weight: 700;

            transition: 0.3s;
        }

        .primary-btn:hover {

            transform: translateY(-3px);

            box-shadow: 0 10px 25px rgba(255, 61, 0, 0.35);
        }


        /* =========================================================
           FEATURES
        ========================================================= */

        .features {

            display: grid;

            grid-template-columns: repeat(4, 1fr);

            gap: 20px;
        }

        .feature {

            background: white;

            padding: 30px 22px;

            border-radius: 18px;

            text-align: center;

            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.06);

            transition: 0.3s;
        }

        .feature:hover {

            transform: translateY(-7px);
        }

        .feature-icon {

            font-size: 40px;

            margin-bottom: 15px;
        }

        .feature h3 {

            margin-bottom: 8px;

            font-size: 18px;
        }

        .feature p {

            color: #777;

            font-size: 13px;

            line-height: 1.6;
        }


        /* =========================================================
           FOOTER
        ========================================================= */

        .footer {

            background: #1d1715;

            color: white;

            padding: 60px 7% 25px;
        }

        .footer-grid {

            display: grid;

            grid-template-columns: 2fr 1fr 1fr 1fr;

            gap: 40px;

            margin-bottom: 45px;
        }

        .footer h2 {

            color: #ff7043;

            margin-bottom: 15px;
        }

        .footer h3 {

            margin-bottom: 15px;
        }

        .footer p {

            color: #aaa;

            line-height: 1.7;

            font-size: 14px;
        }

        .footer a {

            display: block;

            color: #aaa;

            margin-bottom: 10px;

            font-size: 14px;

            transition: 0.3s;
        }

        .footer a:hover {

            color: #ff7043;
        }

        .copyright {

            border-top: 1px solid #3a302c;

            padding-top: 20px;

            text-align: center;

            color: #777;

            font-size: 13px;
        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 1100px) {

            .categories {
                grid-template-columns: repeat(4, 1fr);
            }

            .food-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .features {
                grid-template-columns: repeat(2, 1fr);
            }

        }


        @media (max-width: 750px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links {
                gap: 10px;
            }

            .nav-links a:not(.login-btn):not(.register-btn):not(.user-name) {
                display: none;
            }

            .hero {
                min-height: 600px;
            }

            .hero h1 {
                font-size: 43px;
            }

            .hero p {
                font-size: 16px;
            }

            .search-box {
                flex-direction: column;
                gap: 5px;
            }

            .search-icon {
                display: none;
            }

            .search-box input {
                padding: 16px;
            }

            .search-box button {
                padding: 15px;
            }

            .stats {
                grid-template-columns: 1fr;
            }

            .stat {
                border-right: none;
                border-bottom: 1px solid #eee;
            }

            .stat:last-child {
                border-bottom: none;
            }

            .categories {
                grid-template-columns: repeat(2, 1fr);
            }

            .food-grid {
                grid-template-columns: 1fr;
            }

            .features {
                grid-template-columns: 1fr;
            }

            .restaurant-banner {
                margin: 0 20px 60px;
                padding: 35px 25px;
            }

            .restaurant-banner h2 {
                font-size: 30px;
            }

            .footer-grid {
                grid-template-columns: 1fr 1fr;
            }

        }


        @media (max-width: 450px) {

            .section {
                padding: 55px 20px;
            }

            .section-title h2 {
                font-size: 29px;
            }

            .footer-grid {
                grid-template-columns: 1fr;
            }

            .logo {
                font-size: 25px;
            }

            .login-btn,
            .register-btn {
                padding: 9px 16px;
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
            🍔 Foodie<span>.</span>
        </div>


        <div class="nav-links">

            <a href="#home">
                Home
            </a>

            <a href="#categories">
                Categories
            </a>

            <a href="#popular">
                Popular
            </a>

            <a href="<%= contextPath %>/restaurants">
                Restaurants
            </a>


            <% if (loggedInUser == null) { %>

                <!-- NOT LOGGED IN -->

                <a href="<%= contextPath %>/jsp/login.jsp"
                   class="login-btn">
                    Login
                </a>

                <a href="<%= contextPath %>/jsp/register.jsp"
                   class="register-btn">
                    Register
                </a>

            <% } else { %>

                <!-- LOGGED IN -->

                <a href="#"
                   class="user-name">
                    👤 Welcome, <%= loggedInUser.getFullName() %>
                </a>

                <a href="<%= contextPath %>/logout"
                   class="login-btn">
                    Logout
                </a>

            <% } %>

        </div>

    </nav>



    <!-- =====================================================
         HERO
    ===================================================== -->

    <section class="hero" id="home">

        <div class="hero-content">

            <div class="hero-badge">
                🚀 Fast delivery • Fresh food • Best restaurants
            </div>

            <h1>
                Delicious food,
                <span>delivered fast.</span>
            </h1>

            <p>
                Discover the best restaurants, delicious meals and
                amazing offers near you. Order your favourite food
                and enjoy it at your doorstep.
            </p>


            <!-- SEARCH -->

            <form class="search-box"
                  action="<%= contextPath %>/restaurants"
                  method="get">

                <div class="search-icon">
                    🔍
                </div>

                <input
                    type="text"
                    name="keyword"
                    placeholder="Search restaurant, food or cuisine..."
                    autocomplete="off">

                <button type="submit">
                    Search
                </button>

            </form>

        </div>

    </section>



    <!-- =====================================================
         STATS
    ===================================================== -->

    <div class="stats">

        <div class="stat">

            <h2>
                500+
            </h2>

            <p>
                Delicious dishes
            </p>

        </div>


        <div class="stat">

            <h2>
                100+
            </h2>

            <p>
                Partner restaurants
            </p>

        </div>


        <div class="stat">

            <h2>
                30 min
            </h2>

            <p>
                Average delivery
            </p>

        </div>

    </div>



    <!-- =====================================================
         CATEGORIES
    ===================================================== -->

    <section class="section"
             id="categories">

        <div class="section-title">

            <h2>
                What's on your mind?
            </h2>

            <p>
                Explore food by category
            </p>

        </div>


        <div class="categories">


            <!-- PIZZA -->

            <div class="category">

                <img
                    src="https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=400&q=85"
                    alt="Pizza">

                <h3>
                    🍕 Pizza
                </h3>

                <p>
                    Cheesy & delicious
                </p>

            </div>


            <!-- BURGER -->

            <div class="category">

                <img
                    src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=400&q=85"
                    alt="Burger">

                <h3>
                    🍔 Burger
                </h3>

                <p>
                    Juicy & tasty
                </p>

            </div>


            <!-- CHINESE -->

            <div class="category">

                <img
                    src="https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=400&q=85"
                    alt="Chinese Food">

                <h3>
                    🥡 Chinese
                </h3>

                <p>
                    Hot & spicy
                </p>

            </div>


            <!-- INDIAN -->

            <div class="category">

                <img
                    src="https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=400&q=85"
                    alt="Indian Food">

                <h3>
                    🍽 Indian
                </h3>

                <p>
                    Authentic flavours
                </p>

            </div>


            <!-- DESSERT -->

            <div class="category">

                <img
                    src="https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=400&q=85"
                    alt="Dessert">

                <h3>
                    🍰 Desserts
                </h3>

                <p>
                    Sweet cravings
                </p>

            </div>


            <!-- HEALTHY -->

            <div class="category">

                <img
                    src="https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=400&q=85"
                    alt="Healthy Food">

                <h3>
                    🥗 Healthy
                </h3>

                <p>
                    Fresh & healthy
                </p>

            </div>


        </div>

    </section>



    <!-- =====================================================
         POPULAR FOOD
    ===================================================== -->

    <section class="section featured"
             id="popular">

        <div class="section-title">

            <h2>
                🔥 Popular Food
            </h2>

            <p>
                Customer favourites you should try
            </p>

        </div>


        <div class="food-grid">


            <!-- FOOD 1 -->

            <div class="food-card">

                <div class="food-image">

                    <img
                        src="https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=800&q=85"
                        alt="Margherita Pizza">

                    <div class="offer">
                        20% OFF
                    </div>

                </div>


                <div class="food-info">

                    <h3>
                        Margherita Pizza
                    </h3>

                    <p>
                        🍕 Italian • Cheese • Fresh toppings
                    </p>

                    <div class="food-bottom">

                        <span class="price">
                            ₹249
                        </span>

                        <span class="rating">
                            ★ 4.7
                        </span>

                    </div>

                </div>

            </div>



            <!-- FOOD 2 -->

            <div class="food-card">

                <div class="food-image">

                    <img
                        src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=85"
                        alt="Chicken Burger">

                    <div class="offer">
                        15% OFF
                    </div>

                </div>


                <div class="food-info">

                    <h3>
                        Classic Chicken Burger
                    </h3>

                    <p>
                        🍔 Chicken • Cheese • Crispy
                    </p>

                    <div class="food-bottom">

                        <span class="price">
                            ₹199
                        </span>

                        <span class="rating">
                            ★ 4.6
                        </span>

                    </div>

                </div>

            </div>



            <!-- FOOD 3 -->

            <div class="food-card">

                <div class="food-image">

                    <img
                        src="https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=800&q=85"
                        alt="Indian Food">

                    <div class="offer">
                        20% OFF
                    </div>

                </div>


                <div class="food-info">

                    <h3>
                        Indian Special
                    </h3>

                    <p>
                        🍽 Indian • Spicy • Traditional
                    </p>

                    <div class="food-bottom">

                        <span class="price">
                            ₹229
                        </span>

                        <span class="rating">
                            ★ 4.8
                        </span>

                    </div>

                </div>

            </div>



            <!-- FOOD 4 -->

            <div class="food-card">

                <div class="food-image">

                    <img
                        src="https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=800&q=85"
                        alt="Chocolate Dessert">

                    <div class="offer">
                        10% OFF
                    </div>

                </div>


                <div class="food-info">

                    <h3>
                        Chocolate Dessert
                    </h3>

                    <p>
                        🍰 Sweet • Chocolate • Creamy
                    </p>

                    <div class="food-bottom">

                        <span class="price">
                            ₹149
                        </span>

                        <span class="rating">
                            ★ 4.5
                        </span>

                    </div>

                </div>

            </div>


        </div>

    </section>



    <!-- =====================================================
         RESTAURANT CTA
    ===================================================== -->

    <section class="restaurant-banner">

        <div class="restaurant-banner-content">

            <h2>
                🍽️ Hungry already?
            </h2>

            <p>
                Explore restaurants near you and discover
                delicious food at amazing prices.
                Search by restaurant, food, location or cuisine.
            </p>

            <a
                href="<%= contextPath %>/restaurants"
                class="primary-btn">

                Explore Restaurants →

            </a>

        </div>

    </section>



    <!-- =====================================================
         FEATURES
    ===================================================== -->

    <section class="section">

        <div class="section-title">

            <h2>
                Why choose Foodie?
            </h2>

            <p>
                Everything you need for a great food experience
            </p>

        </div>


        <div class="features">


            <div class="feature">

                <div class="feature-icon">
                    ⚡
                </div>

                <h3>
                    Fast Delivery
                </h3>

                <p>
                    Get your favourite meals delivered
                    quickly and safely to your doorstep.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">
                    ⭐
                </div>

                <h3>
                    Top Rated
                </h3>

                <p>
                    Discover highly rated restaurants
                    loved by our customers.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">
                    🎁
                </div>

                <h3>
                    Amazing Offers
                </h3>

                <p>
                    Enjoy exciting discounts and
                    special offers on your favourite food.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">
                    🔒
                </div>

                <h3>
                    Secure Ordering
                </h3>

                <p>
                    Your orders and personal information
                    are handled securely.
                </p>

            </div>


        </div>

    </section>



    <!-- =====================================================
         FOOTER
    ===================================================== -->

    <footer class="footer">

        <div class="footer-grid">


            <!-- ABOUT -->

            <div>

                <h2>
                    🍔 Foodie.
                </h2>

                <p>
                    Your favourite food delivered quickly
                    from the best restaurants around you.
                </p>

            </div>


            <!-- FOODIE -->

            <div>

                <h3>
                    Foodie
                </h3>

                <a href="#home">
                    Home
                </a>

                <a href="#categories">
                    Categories
                </a>

                <a href="<%= contextPath %>/restaurants">
                    Restaurants
                </a>

            </div>


            <!-- HELP -->

            <div>

                <h3>
                    Help
                </h3>

                <a href="#">
                    Contact Us
                </a>

                <a href="#">
                    FAQ
                </a>

                <a href="#">
                    Support
                </a>

            </div>


            <!-- ACCOUNT -->

            <div>

                <h3>
                    Account
                </h3>


                <% if (loggedInUser == null) { %>

                    <a href="<%= contextPath %>/jsp/login.jsp">
                        Login
                    </a>

                    <a href="<%= contextPath %>/jsp/register.jsp">
                        Register
                    </a>

                <% } else { %>

                    <a href="#">
                        👤 <%= loggedInUser.getFullName() %>
                    </a>

                    <a href="<%= contextPath %>/logout">
                        Logout
                    </a>

                <% } %>


                <a href="<%= contextPath %>/restaurants">
                    Order Food
                </a>

            </div>


        </div>


        <div class="copyright">

            © 2026 Foodie. All Rights Reserved.

        </div>

    </footer>


</body>

</html>