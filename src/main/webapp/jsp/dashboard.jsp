<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Foodie - Dashboard</title>

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
    align-items: center;
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

/* LOCATION BAR */

.location-bar {
    background: white;
    padding: 20px 7%;
    border-bottom: 1px solid #eee;
}

.location {
    font-size: 15px;
    color: #555;
}

.location strong {
    color: #222;
}

/* HERO */

.hero {
    min-height: 350px;

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
    font-size: 19px;
    margin-bottom: 25px;
}

/* SEARCH */

.search-box {
    background: white;
    padding: 7px;
    border-radius: 8px;
    width: 650px;
    max-width: 90%;
    display: flex;
    margin: auto;
}

.search-box input {
    flex: 1;
    border: none;
    outline: none;
    padding: 14px;
    font-size: 15px;
}

.search-box button {
    border: none;
    background: #e23744;
    color: white;
    padding: 0 25px;
    border-radius: 6px;
    cursor: pointer;
}

/* SECTIONS */

.section {
    padding: 40px 7%;
}

.section h2 {
    margin-bottom: 25px;
    font-size: 27px;
}

/* CATEGORIES */

.categories {
    display: flex;
    gap: 30px;
    overflow-x: auto;
}

.category {
    min-width: 120px;
    text-align: center;
}

.category img {
    width: 110px;
    height: 110px;
    object-fit: cover;
    border-radius: 50%;
}

.category p {
    margin-top: 10px;
    font-weight: bold;
}

/* RESTAURANTS */

.restaurant-section {
    background: #fff;
}

.restaurants {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 12px rgba(0,0,0,0.08);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);
}

.card img {
    width: 100%;
    height: 190px;
    object-fit: cover;
}

.card-content {
    padding: 18px;
}

.card-content h3 {
    margin-bottom: 8px;
    font-size: 20px;
}

.rating {
    display: inline-block;
    background: #24963f;
    color: white;
    padding: 5px 8px;
    border-radius: 5px;
    font-size: 13px;
}

.info {
    color: #777;
    margin-top: 10px;
    line-height: 1.6;
    font-size: 14px;
}

.menu-btn {
    display: inline-block;
    margin-top: 15px;
    background: #e23744;
    color: white;
    padding: 10px 18px;
    border-radius: 6px;
    text-decoration: none;
}

.menu-btn:hover {
    background: #c82333;
}

/* FOOTER */

.footer {
    background: #222;
    color: white;
    padding: 35px 7%;
    margin-top: 30px;
}

.footer h2 {
    color: #e23744;
    margin-bottom: 10px;
}

.footer p {
    color: #bbb;
}

/* RESPONSIVE */

@media(max-width: 900px) {

    .restaurants {
        grid-template-columns: repeat(2, 1fr);
    }

}

@media(max-width: 600px) {

    .navbar {
        padding: 0 20px;
    }

    .nav-links {
        gap: 10px;
    }

    .nav-links a {
        font-size: 13px;
    }

    .restaurants {
        grid-template-columns: 1fr;
    }

    .search-box {
        flex-direction: column;
    }

    .search-box button {
        padding: 13px;
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

        <a href="dashboard.jsp">
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

        <a href="login.jsp">
            Logout
        </a>

    </div>

</div>


<!-- LOCATION -->

<div class="location-bar">

    <div class="location">

        📍 Delivering to:

        <strong>
            Bangalore
        </strong>

    </div>

</div>


<!-- HERO -->

<section class="hero">

    <div class="hero-content">

        <h1>
            What are you craving today?
        </h1>

        <p>
            Discover delicious food from restaurants near you
        </p>


        <div class="search-box">

            <input
                type="text"
                placeholder="Search for restaurant or food">

            <button>
                Search
            </button>

        </div>

    </div>

</section>


<!-- CATEGORIES -->

<section class="section">

    <h2>
        What's on your mind?
    </h2>


    <div class="categories">


        <div class="category">

            <img src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38">

            <p>
                Pizza
            </p>

        </div>


        <div class="category">

            <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd">

            <p>
                Burger
            </p>

        </div>


        <div class="category">

            <img src="https://images.unsplash.com/photo-1563379091339-03246963d96c">

            <p>
                Biryani
            </p>

        </div>


        <div class="category">

            <img src="https://images.unsplash.com/photo-1547592180-85f173990554">

            <p>
                Healthy
            </p>

        </div>


        <div class="category">

            <img src="https://images.unsplash.com/photo-1551024506-0bccd828d307">

            <p>
                Desserts
            </p>

        </div>


    </div>

</section>


<!-- RESTAURANTS -->

<section class="section restaurant-section">

    <h2>
        Restaurants near you
    </h2>


    <div class="restaurants">


        <!-- DOMINOS -->

        <div class="card">

            <img src="https://images.unsplash.com/photo-1579751626657-72bc17010498">

            <div class="card-content">

                <h3>
                    Dominos Pizza
                </h3>

                <span class="rating">
                    ★ 4.5
                </span>

                <div class="info">

                    🍕 Pizza • Fast Food

                    <br>

                    ⏱ 30 mins • 📍 MG Road

                </div>

                <a href="#" class="menu-btn">
                    View Menu
                </a>

            </div>

        </div>


        <!-- KFC -->

        <div class="card">

            <img src="https://images.unsplash.com/photo-1513639776629-7b61b0ac49cb">

            <div class="card-content">

                <h3>
                    KFC
                </h3>

                <span class="rating">
                    ★ 4.4
                </span>

                <div class="info">

                    🍗 Chicken • Fast Food

                    <br>

                    ⏱ 25 mins • 📍 Indiranagar

                </div>

                <a href="#" class="menu-btn">
                    View Menu
                </a>

            </div>

        </div>


        <!-- BURGER KING -->

        <div class="card">

            <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd">

            <div class="card-content">

                <h3>
                    Burger King
                </h3>

                <span class="rating">
                    ★ 4.3
                </span>

                <div class="info">

                    🍔 Burgers • Snacks

                    <br>

                    ⏱ 35 mins • 📍 Whitefield

                </div>

                <a href="#" class="menu-btn">
                    View Menu
                </a>

            </div>

        </div>


        <!-- PIZZA HUT -->

        <div class="card">

            <img src="https://images.unsplash.com/photo-1579751626657-72bc17010498">

            <div class="card-content">

                <h3>
                    Pizza Hut
                </h3>

                <span class="rating">
                    ★ 4.2
                </span>

                <div class="info">

                    🍕 Pizza • Italian

                    <br>

                    ⏱ 40 mins • 📍 Koramangala

                </div>

                <a href="#" class="menu-btn">
                    View Menu
                </a>

            </div>

        </div>


        <!-- BIRYANI HOUSE -->

        <div class="card">

            <img src="https://images.unsplash.com/photo-1563379091339-03246963d96c">

            <div class="card-content">

                <h3>
                    Biryani House
                </h3>

                <span class="rating">
                    ★ 4.7
                </span>

                <div class="info">

                    🍛 Biryani • Indian

                    <br>

                    ⏱ 28 mins • 📍 HSR Layout

                </div>

                <a href="#" class="menu-btn">
                    View Menu
                </a>

            </div>

        </div>


    </div>

</section>


<!-- FOOTER -->

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