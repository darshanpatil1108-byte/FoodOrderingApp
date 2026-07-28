<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Foodie - Register</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    min-height: 100vh;

    background:
        linear-gradient(
            rgba(0,0,0,0.45),
            rgba(0,0,0,0.45)
        ),
        url("https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1600&q=85")
        center/cover;

    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.register-container {
    width: 430px;
    max-width: 100%;
    background: white;
    padding: 35px 40px;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}

.logo {
    text-align: center;
    font-size: 32px;
    font-weight: bold;
    color: #e23744;
    margin-bottom: 8px;
}

.subtitle {
    text-align: center;
    color: #777;
    margin-bottom: 25px;
}

.form-group {
    margin-bottom: 16px;
}

.form-group label {
    display: block;
    margin-bottom: 7px;
    font-weight: bold;
    color: #333;
}

.form-group input {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 7px;
    font-size: 15px;
    outline: none;
}

.form-group input:focus {
    border-color: #e23744;
}

/* PASSWORD BOX */

.password-box {
    position: relative;
}

.password-box input {
    padding-right: 45px;
}

.eye-btn {
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    border: none;
    background: transparent;
    cursor: pointer;
    font-size: 20px;
}

/* PASSWORD RULES */

.password-rules {
    margin-top: 8px;
    padding: 10px;
    background: #f8f8f8;
    border-radius: 7px;
    font-size: 12px;
    color: #777;
}

.rule {
    margin: 4px 0;
}

.valid {
    color: #24963f;
}

.invalid {
    color: #d60000;
}

/* PASSWORD MATCH */

.match-message {
    font-size: 12px;
    margin-top: 6px;
    display: none;
}

.match-success {
    color: #24963f;
}

.match-error {
    color: #d60000;
}

.register-btn {
    width: 100%;
    padding: 13px;
    background: #e23744;
    border: none;
    color: white;
    font-size: 17px;
    font-weight: bold;
    border-radius: 7px;
    cursor: pointer;
    margin-top: 5px;
}

.register-btn:hover {
    background: #c82333;
}

.login {
    text-align: center;
    margin-top: 20px;
    color: #666;
}

.login a {
    color: #e23744;
    font-weight: bold;
    text-decoration: none;
}

.home {
    text-align: center;
    margin-top: 15px;
}

.home a {
    color: #555;
    text-decoration: none;
    font-size: 14px;
}

.error-message {
    background: #ffe5e5;
    color: #d60000;
    padding: 10px;
    border-radius: 6px;
    text-align: center;
    margin-bottom: 15px;
    font-size: 14px;
}

@media(max-width: 500px) {

    .register-container {
        padding: 30px 22px;
    }

}

</style>

</head>

<body>

<div class="register-container">


<div class="logo">
    🍔 Foodie.
</div>

<div class="subtitle">
    Create your Foodie account
</div>


<% if ("password".equals(request.getParameter("error"))) { %>

    <div class="error-message">
        Passwords do not match.
    </div>

<% } %>


<% if ("failed".equals(request.getParameter("error"))) { %>

    <div class="error-message">
        Registration failed. Email or phone may already exist.
    </div>

<% } %>


<form
    id="registerForm"
    action="${pageContext.request.contextPath}/register"
    method="post"
    onsubmit="return validateForm();">


    <!-- FULL NAME -->

    <div class="form-group">

        <label>Full Name</label>

        <input
            type="text"
            name="name"
            placeholder="Enter your full name"
            required>

    </div>


    <!-- EMAIL -->

    <div class="form-group">

        <label>Email</label>

        <input
            type="email"
            name="email"
            placeholder="Enter your email"
            required>

    </div>


    <!-- PHONE -->

    <div class="form-group">

        <label>Phone Number</label>

        <input
            type="tel"
            name="phone"
            placeholder="Enter 10 digit phone number"
            pattern="[0-9]{10}"
            maxlength="10"
            required>

    </div>


    <!-- PASSWORD -->

    <div class="form-group">

        <label>Password</label>

        <div class="password-box">

            <input
                type="password"
                id="password"
                name="password"
                placeholder="Example: Darshan@123"
                required
                oninput="checkPassword()">

            <button
                type="button"
                class="eye-btn"
                onclick="togglePassword('password', this)">

                👁️

            </button>

        </div>


        <!-- PASSWORD REQUIREMENTS -->

        <div class="password-rules">

            <div id="capitalRule" class="rule invalid">
                ❌ First letter must be CAPITAL
            </div>

            <div id="numberRule" class="rule invalid">
                ❌ Must contain a number
            </div>

            <div id="atRule" class="rule invalid">
                ❌ Must contain @
            </div>

            <div id="lengthRule" class="rule invalid">
                ❌ Minimum 8 characters
            </div>

        </div>

    </div>


    <!-- CONFIRM PASSWORD -->

    <div class="form-group">

        <label>Confirm Password</label>

        <div class="password-box">

            <input
                type="password"
                id="confirmPassword"
                name="confirmPassword"
                placeholder="Re-enter your password"
                required
                oninput="checkMatch()">

            <button
                type="button"
                class="eye-btn"
                onclick="togglePassword('confirmPassword', this)">

                👁️

            </button>

        </div>

        <div
            id="matchMessage"
            class="match-message">
        </div>

    </div>


    <!-- REGISTER BUTTON -->

    <button
        type="submit"
        class="register-btn">

        Create Account

    </button>


</form>


<div class="login">

    Already have an account?

    <a href="login.jsp">
        Login
    </a>

</div>


<div class="home">

    <a href="../index.jsp">
        ← Back to Home
    </a>

</div>


</div>

<script>

/* =========================
   SHOW / HIDE PASSWORD
========================= */

function togglePassword(inputId, button) {

    const input = document.getElementById(inputId);

    if (input.type === "password") {

        input.type = "text";
        button.innerHTML = "🙈";

    } else {

        input.type = "password";
        button.innerHTML = "👁️";

    }
}


/* =========================
   PASSWORD VALIDATION
========================= */

function checkPassword() {

    const password =
        document.getElementById("password").value;

    const capitalRule =
        document.getElementById("capitalRule");

    const numberRule =
        document.getElementById("numberRule");

    const atRule =
        document.getElementById("atRule");

    const lengthRule =
        document.getElementById("lengthRule");


    /* First character CAPITAL */

    if (/^[A-Z]/.test(password)) {

        capitalRule.className = "rule valid";
        capitalRule.innerHTML =
            "✅ First letter is CAPITAL";

    } else {

        capitalRule.className = "rule invalid";
        capitalRule.innerHTML =
            "❌ First letter must be CAPITAL";

    }


    /* Number */

    if (/[0-9]/.test(password)) {

        numberRule.className = "rule valid";
        numberRule.innerHTML =
            "✅ Contains a number";

    } else {

        numberRule.className = "rule invalid";
        numberRule.innerHTML =
            "❌ Must contain a number";

    }


    /* @ symbol */

    if (/@/.test(password)) {

        atRule.className = "rule valid";
        atRule.innerHTML =
            "✅ Contains @";

    } else {

        atRule.className = "rule invalid";
        atRule.innerHTML =
            "❌ Must contain @";

    }


    /* Minimum 8 characters */

    if (password.length >= 8) {

        lengthRule.className = "rule valid";
        lengthRule.innerHTML =
            "✅ Minimum 8 characters";

    } else {

        lengthRule.className = "rule invalid";
        lengthRule.innerHTML =
            "❌ Minimum 8 characters";

    }

    checkMatch();
}


/* =========================
   CONFIRM PASSWORD
========================= */

function checkMatch() {

    const password =
        document.getElementById("password").value;

    const confirmPassword =
        document.getElementById("confirmPassword").value;

    const message =
        document.getElementById("matchMessage");


    if (confirmPassword === "") {

        message.style.display = "none";
        return;
    }


    message.style.display = "block";


    if (password === confirmPassword) {

        message.className =
            "match-message match-success";

        message.innerHTML =
            "✅ Passwords match";

    } else {

        message.className =
            "match-message match-error";

        message.innerHTML =
            "❌ Passwords do not match";

    }
}


/* =========================
   FINAL FORM VALIDATION
========================= */

function validateForm() {

    const password =
        document.getElementById("password").value;

    const confirmPassword =
        document.getElementById("confirmPassword").value;


    /*
     * Password rules:
     * 1. First letter CAPITAL
     * 2. Number required
     * 3. @ required
     * 4. Minimum 8 characters
     */

    const passwordPattern =
        /^[A-Z](?=.*[0-9])(?=.*@).{7,}$/;


    if (!passwordPattern.test(password)) {

        alert(
            "Password must start with a capital letter, contain a number and @, and be at least 8 characters."
        );

        return false;
    }


    if (password !== confirmPassword) {

        alert("Passwords do not match.");

        return false;
    }


    return true;
}

</script>

</body>
</html>
