<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Menu" %>

<%
List<Menu> menuList =
    (List<Menu>) request.getAttribute("menuList");

Integer restaurantId =
    (Integer) request.getAttribute("restaurantId");

String fallbackImage =
    "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=800&q=85";
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Foodie - Restaurant Menu</title>

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
    height: 72px;
    background: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 7%;
    border-bottom: 1px solid #eee;
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo {
    font-size: 29px;
    font-weight: bold;
    color: #e23744;
}

.logo span {
    color: #222;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 20px;
}

.nav-links a {
    text-decoration: none;
    color: #333;
    font-size: 16px;
}

.nav-links a:hover {
    color: #e23744;
}

.cart-btn {
    background: #e23744;
    color: white !important;
    padding: 10px 18px;
    border-radius: 7px;
}

/* ================= RESTAURANT HEADER ================= */

.restaurant-header {
    background: white;
    padding: 35px 7%;
    border-bottom: 1px solid #eee;
}

.restaurant-header h1 {
    font-size: 32px;
    margin-bottom: 10px;
}

.restaurant-header p {
    color: #777;
    font-size: 15px;
}

.back-btn {
    display: inline-block;
    margin-top: 18px;
    color: #e23744;
    text-decoration: none;
    font-weight: bold;
}

/* ================= MENU ================= */

.menu-section {
    padding: 40px 7%;
}

.menu-title {
    font-size: 28px;
    margin-bottom: 25px;
}

.menu-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

/* ================= CARD ================= */

.menu-card {
    background: white;
    border-radius: 14px;
    overflow: hidden;
    border: 1px solid #eee;
    transition: 0.3s;
}

.menu-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 28px rgba(0,0,0,0.15);
}

.menu-image {
    width: 100%;
    height: 210px;
    object-fit: cover;
    display: block;
    background: #eee;
    transition: 0.3s;
}

.menu-card:hover .menu-image {
    transform: scale(1.04);
}

.menu-info {
    padding: 18px;
}

.menu-info h2 {
    font-size: 20px;
    margin-bottom: 8px;
}

.category {
    display: inline-block;
    color: #777;
    font-size: 13px;
    margin-bottom: 10px;
}

.description {
    color: #666;
    font-size: 14px;
    line-height: 1.5;
    min-height: 42px;
}

.price {
    font-size: 20px;
    font-weight: bold;
    margin-top: 12px;
    color: #222;
}

.card-bottom {
    margin-top: 18px;
}

/* ================= ADD TO CART ================= */

.add-btn {
    width: 100%;
    background: #e23744;
    color: white;
    border: none;
    padding: 12px;
    border-radius: 7px;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
    transition: 0.2s;
}

.add-btn:hover {
    background: #c82333;
    transform: scale(1.02);
}

/* ================= NOT AVAILABLE ================= */

.not-available {
    display: block;
    text-align: center;
    background: #ddd;
    color: #777;
    padding: 11px;
    border-radius: 7px;
}

/* ================= EMPTY ================= */

.empty {
    background: white;
    text-align: center;
    padding: 60px 20px;
    border-radius: 12px;
    color: #777;
}

/* ================= RESPONSIVE ================= */

@media(max-width: 950px) {

    .menu-container {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media(max-width: 600px) {

    .navbar {
        padding: 0 20px;
    }

    .menu-container {
        grid-template-columns: 1fr;
    }

    .menu-section {
        padding: 30px 20px;
    }

    .restaurant-header {
        padding: 30px 20px;
    }

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <div class="logo">
        🍔 Foodie<span>.</span>
    </div>

    <div class="nav-links">

        <a href="<%= request.getContextPath() %>/">
            🏠 Home
        </a>

        <a href="<%= request.getContextPath() %>/cart"
           class="cart-btn">
            🛒 Cart
        </a>

    </div>

</div>

<!-- ================= RESTAURANT HEADER ================= -->

<div class="restaurant-header">

    <h1>
        🍽️ Restaurant Menu
    </h1>

    <p>
        Choose your favourite food and add it to your cart.
    </p>

    <a href="<%= request.getContextPath() %>/"
       class="back-btn">

        ← Back to Restaurants

    </a>

</div>

<!-- ================= MENU ================= -->

<section class="menu-section">

    <h2 class="menu-title">
        Popular Food Items
    </h2>

<%
if (menuList != null && !menuList.isEmpty()) {
%>

    <div class="menu-container">

<%
for (Menu menu : menuList) {

    String image = menu.getImage();

    /*
     * CONSOLE CHECK
     * This shows exactly which image is coming
     * from MySQL.
     */
    System.out.println(
        "MENU ID: " + menu.getMenuId()
        + " | ITEM: " + menu.getItemName()
        + " | IMAGE FROM DB: " + image
    );

    String itemName = menu.getItemName();

    if (itemName == null) {
        itemName = "";
    }

    String lowerItemName =
        itemName.toLowerCase();

    /*
     * =================================================
     * NORTH KARNATAKA FOOD IMAGE FIX
     * =================================================
     */

    if (lowerItemName.contains("jolada rotti")
            || lowerItemName.contains("jowar roti")) {

        /*
         * Jolada Rotti image from your database
         * will be used automatically.
         *
         * Do NOT replace it here.
         */
    }

    else if (lowerItemName.contains("ennegayi")
            || lowerItemName.contains("badnekayi palya")
            || lowerItemName.contains("palya")) {

        /*
         * Keep database image.
         */
    }

    else if (lowerItemName.contains("rotti oota")
            || lowerItemName.contains("jowar roti oota")) {

        /*
         * Keep database image.
         */
    }

    else if (lowerItemName.contains("thali")) {

        /*
         * Keep database image.
         */
    }

    else if (lowerItemName.contains("shenga chutney")) {

        /*
         * Keep database image.
         */
    }

    /*
     * If image is empty, use fallback.
     */

    if (image == null || image.trim().isEmpty()) {

        image = fallbackImage;

    }

%>

        <!-- ================= MENU CARD ================= -->

        <div class="menu-card">

            <!-- FOOD IMAGE -->

            <img
                class="menu-image"
                src="<%= image %>"
                alt="<%= menu.getItemName() %>"
                onerror="this.onerror=null; this.src='<%= fallbackImage %>';">


            <div class="menu-info">

                <!-- FOOD NAME -->

                <h2>
                    <%= menu.getItemName() %>
                </h2>

                <!-- CATEGORY -->

                <span class="category">

                    🍴 <%= menu.getCategory() %>

                </span>

                <!-- DESCRIPTION -->

                <p class="description">

                    <%= menu.getDescription() %>

                </p>

                <!-- PRICE -->

                <div class="price">

                    ₹<%= String.format("%.2f",
                            menu.getPrice()) %>

                </div>

                <div class="card-bottom">

<%
if (menu.isAvailable()) {
%>

                    <!-- ================= ADD TO CART ================= -->

                    <form
                        action="<%= request.getContextPath() %>/addToCart"
                        method="post">

                        <input
                            type="hidden"
                            name="menuId"
                            value="<%= menu.getMenuId() %>">

                        <button
                            type="submit"
                            class="add-btn">

                            🛒 Add to Cart

                        </button>

                    </form>

<%
} else {
%>

                    <span class="not-available">

                        Not Available

                    </span>

<%
}
%>

                </div>

            </div>

        </div>

<%
}
%>

    </div>

<%
} else {
%>

<!-- ================= EMPTY MENU ================= -->

<div class="empty">

    <h2>
        😔 No menu items available
    </h2>

    <p>
        This restaurant currently has no available food items.
    </p>

    <a
        href="<%= request.getContextPath() %>/"
        class="back-btn">

        ← Browse Restaurants

    </a>

</div>

<%
}
%>

</section>

</body>

</html>