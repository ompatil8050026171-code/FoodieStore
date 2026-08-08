<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
String username=(String)session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foodie Store</title>

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap">
    <link rel="stylesheet" href="https://fonts.cdnfonts.com/css/minion-sc">

    <!-- External Theme CSS -->
    <link rel="stylesheet" href="index.css">
</head>
<style>
/* ==========================================================================
   INDEX.CSS - FULL-SCREEN BG IMAGE CRIMSON DARK MODE
   Matches home, menu, order, orderDetails, orderHistory, profile, login & register
   ========================================================================== */

/* ===== Custom Font Import ===== */
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap');
@import url('https://fonts.cdnfonts.com/css/minion-sc');

/* ===== Design Tokens ===== */
:root {
    --main-font: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Minion SC', sans-serif;
    --heading-font: 'Plus Jakarta Sans', 'Minion SC', serif;

    /* Crimson Dark Palette */
    --bg-dark: #090707;
    --bg-card: rgba(14, 8, 8, 0.94);
    --bg-navbar: rgba(15, 9, 9, 0.96);

    /* Red & Gold Accents */
    --accent-red: #e50914;
    --accent-red-hover: #ff1e27;
    --accent-red-dark: #b20710;
    --accent-red-glow: rgba(229, 9, 20, 0.45);
    --accent-gold: #ffb400;

    /* Text Colors */
    --text-white: #f5ede4;
    --text-muted: #c8b39f;
    --text-soft: #b39b91;

    /* Borders */
    --card-border: rgba(255, 255, 255, 0.08);
    --glass-border: rgba(229, 9, 20, 0.3);

    /* Transitions */
    --transition-bounce: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
    --transition-smooth: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
}

/* ===== Reset & Base ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
    height: 100%;
}

html, body {
    min-height: 100vh;
    font-family: var(--main-font);
    color: var(--text-white);
    overflow-x: hidden;
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

/* ===== Full Screen Background Image with Dark Vignette & Crimson Tint ===== */
body {
    background-color: var(--bg-dark);
    background-image:
        linear-gradient(180deg, rgba(9, 7, 7, 0.65) 0%, rgba(9, 7, 7, 0.85) 50%, rgba(9, 7, 7, 0.96) 100%),
        radial-gradient(circle at 20% 30%, rgba(229, 9, 20, 0.35) 0%, transparent 60%),
        url('images/register_hero.jpg');
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    min-height: 100vh;
}

/* Background video disabled */
.bg-video-wrap,
.bg-overlay {
    display: none;
}

/* ===== Navbar ===== */
.navbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: var(--bg-navbar);
    padding: 16px 40px;
    position: sticky;
    top: 0;
    z-index: 100;
    border-bottom: 1px solid var(--glass-border);
    box-shadow:
        0 16px 40px rgba(0, 0, 0, 0.6),
        0 0 1px rgba(229, 9, 20, 0.3);
    flex-wrap: wrap;
    gap: 14px;
    backdrop-filter: blur(18px) saturate(1.6);
    -webkit-backdrop-filter: blur(18px) saturate(1.6);
}

/* Brand */
.navbar-brand {
    font-family: var(--heading-font);
    font-size: 26px;
    font-weight: 900;
    letter-spacing: -0.02em;
    text-transform: capitalize;
    color: var(--text-white);
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    transition: var(--transition-smooth);
}

.navbar-brand::before {
    content: "🍔 ";
}

.navbar-brand:hover {
    transform: scale(1.03);
}

.navbar-links {
    list-style: none;
    display: flex;
    align-items: center;
    gap: 10px;
    flex-wrap: wrap;
}

.nav-btn {
    font-family: var(--main-font);
    text-decoration: none;
    color: var(--text-white);
    background: rgba(255, 255, 255, 0.06);
    border: 1px solid rgba(255, 255, 255, 0.12);
    padding: 9px 20px;
    border-radius: 999px;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 0.02em;
    transition: var(--transition-bounce);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    white-space: nowrap;
}

.nav-btn:hover {
    background: rgba(229, 9, 20, 0.2);
    color: var(--text-white);
    border-color: rgba(229, 9, 20, 0.5);
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(229, 9, 20, 0.25);
}

.nav-btn.active {
    background: var(--accent-red);
    color: var(--text-white);
    border-color: var(--accent-red);
    box-shadow: 0 6px 20px var(--accent-red-glow);
}

.nav-btn.logout {
    background: rgba(229, 9, 20, 0.15);
    border-color: rgba(229, 9, 20, 0.35);
    color: var(--text-white);
}

.nav-btn.logout:hover {
    background: var(--accent-red-dark);
    color: var(--text-white);
    border-color: var(--accent-red-dark);
    box-shadow: 0 8px 22px rgba(229, 9, 20, 0.45);
}

/* ===== Main Content Area ===== */
.main-content {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: calc(100vh - 74px);
    padding: 50px 20px;
    position: relative;
    z-index: 1;
    animation: pageReveal 0.8s cubic-bezier(0.16, 1, 0.3, 1) both;
}

@keyframes pageReveal {
    from {
        opacity: 0;
        transform: translateY(24px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== Welcome Card & Login Message Card ===== */
.login-message,
.card {
    background: var(--bg-card);
    border: 1px solid var(--card-border);
    border-radius: 28px;
    padding: 56px 46px;
    text-align: center;
    max-width: 540px;
    width: 100%;
    position: relative;
    overflow: hidden;
    box-shadow:
        0 30px 80px rgba(0, 0, 0, 0.75),
        0 0 0 1px rgba(229, 9, 20, 0.12);
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
    transition: var(--transition-bounce);
    animation: cardPop 0.7s 0.15s cubic-bezier(0.16, 1, 0.3, 1) both;
}

@keyframes cardPop {
    from {
        opacity: 0;
        transform: translateY(20px) scale(0.97);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

/* Top Crimson Gradient Accent Bar */
.login-message::before,
.card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 5px;
    background: linear-gradient(90deg, var(--accent-red-dark), var(--accent-red), var(--accent-gold), var(--accent-red));
    box-shadow: 0 0 24px var(--accent-red-glow);
}

/* Subtle Radial Glow Behind Content */
.login-message::after,
.card::after {
    content: '';
    position: absolute;
    top: -40%;
    left: 50%;
    transform: translateX(-50%);
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(229, 9, 20, 0.08), transparent 70%);
    border-radius: 50%;
    pointer-events: none;
    z-index: 0;
}

.login-message:hover,
.card:hover {
    transform: translateY(-4px);
    box-shadow:
        0 35px 90px rgba(0, 0, 0, 0.85),
        0 0 35px rgba(229, 9, 20, 0.25);
    border-color: rgba(229, 9, 20, 0.35);
}

/* Card Headings */
.card h1,
.login-message b {
    font-family: var(--heading-font);
    font-size: clamp(26px, 4vw, 34px);
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    color: var(--text-white);
    margin-bottom: 12px;
    display: block;
    position: relative;
    z-index: 1;
}

.card p,
.login-message .sub-text {
    font-family: var(--main-font);
    font-size: 15.5px;
    color: var(--text-muted);
    line-height: 1.8;
    margin-bottom: 30px;
    position: relative;
    z-index: 1;
}

/* Button Group */
.btn-group {
    display: flex;
    justify-content: center;
    gap: 14px;
    flex-wrap: wrap;
    position: relative;
    z-index: 1;
}

.btn-group .nav-btn,
.login-message .sub-text .nav-btn {
    font-family: var(--main-font);
    background: linear-gradient(135deg, var(--accent-red) 0%, var(--accent-red-dark) 100%);
    color: #ffffff;
    border: none;
    padding: 15px 32px;
    font-size: 13.5px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    box-shadow: 0 8px 24px var(--accent-red-glow);
    border-radius: 999px;
    transition: var(--transition-bounce);
    position: relative;
    overflow: hidden;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
}

/* Shimmer Sweep */
.btn-group .nav-btn::after,
.login-message .sub-text .nav-btn::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.18),
        transparent
    );
    transition: left 0.5s ease;
}

.btn-group .nav-btn:hover::after,
.login-message .sub-text .nav-btn:hover::after {
    left: 100%;
}

.btn-group .nav-btn:hover,
.login-message .sub-text .nav-btn:hover {
    background: linear-gradient(135deg, var(--accent-red-hover) 0%, #d30812 100%);
    color: #ffffff;
    transform: translateY(-3px);
    box-shadow: 0 14px 36px rgba(229, 9, 20, 0.55);
}

.btn-group .nav-btn:active,
.login-message .sub-text .nav-btn:active {
    transform: translateY(0);
}

/* ===== Custom Scrollbar ===== */
::-webkit-scrollbar {
    width: 8px;
}

::-webkit-scrollbar-track {
    background: var(--bg-dark);
}

::-webkit-scrollbar-thumb {
    background: rgba(229, 9, 20, 0.35);
    border-radius: 99px;
}

::-webkit-scrollbar-thumb:hover {
    background: rgba(229, 9, 20, 0.55);
}

/* ===== Selection Highlight ===== */
::selection {
    background: rgba(229, 9, 20, 0.4);
    color: #ffffff;
}

/* ===== Responsive ===== */
@media (max-width: 900px) {
    .navbar {
        flex-direction: column;
        padding: 16px 20px;
    }

    .navbar-links {
        justify-content: center;
        width: 100%;
    }
}

@media (max-width: 600px) {
    .navbar {
        padding: 14px;
    }

    .navbar-links {
        flex-direction: column;
        align-items: stretch;
    }

    .nav-btn {
        width: 100%;
        justify-content: center;
    }

    .card,
    .login-message {
        padding: 40px 24px;
        border-radius: 22px;
    }

    .card h1,
    .login-message b {
        font-size: 24px;
    }

    .btn-group {
        flex-direction: column;
    }

    .btn-group .nav-btn,
    .login-message .sub-text .nav-btn {
        width: 100%;
    }
}


</style>

<body>

<!-- Background Video Disabled in theme -->
<div class="bg-video-wrap">
    <video autoplay muted loop playsinline>
        <source src="videos/display.mp4" type="video/mp4">
    </video>
</div>
<div class="bg-overlay"></div>

<!-- Navbar -->
<nav class="navbar">

    <a href="#" class="navbar-brand">Foodie Store</a>

    <ul class="navbar-links">

    <% if(username==null){ %>

        <li><a href="login.jsp" class="nav-btn">Login</a></li>
        <li><a href="register.jsp" class="nav-btn">Register</a></li>
        <li><a href="home" class="nav-btn">Restaurants</a></li>

    <% } else { %>
        <li><a href="profile.jsp" class="nav-btn"><%=username%></a></li>
        <li><a href="index.jsp" class="nav-btn active">Home</a></li>
        <li><a href="cart.jsp" class="nav-btn">Cart</a></li>
        <li><a href="orderHistory" class="nav-btn">Orders</a></li>
        <li><a href="LogoutServlet" class="nav-btn logout">Logout</a></li>

    <% } %>

    </ul>

</nav>

<!-- Main Content Wrapper -->
<div class="main-content">

<%
if(username==null){
%>

<!-- Login Required Card -->
<div class="login-message">

<b>🔒 LOGIN REQUIRED 🍔</b>

<div class="sub-text">

Please Login First to unlock amazing restaurants 🍕<br>
Add delicious food to your cart 🛒<br>
Place your orders instantly 🚀<br><br>

<a href="login.jsp" class="nav-btn">Login</a>
<a href="home" class="nav-btn">Restaurants</a>

</div>

</div>

<%
}else{
%>

<!-- Welcome Card -->
<div class="card">

<h1>Welcome <%=username%> 👋</h1>

<p>
Enjoy delicious meals from your favourite restaurants.
</p>

<div class="btn-group">

<a href="home" class="nav-btn active">
🍽 Explore Restaurants
</a>

</div>

</div>

<%
}
%>

</div>

</body>
</html>
