<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.FoodieStore.Model.Menu"%>
<%@page import="com.FoodieStore.Model.Resturant"%>

<%
String username=(String)session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Menu</title>

<style>
/* ==========================================================================
   MENU.CSS - PREMIUM CRIMSON DARK MODE (MENU PAGE)
   Matches home.css theme · Inspired by the food-delivery reference image
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
    --bg-panel: #110a0a;
    --bg-card: #140d0d;
    --bg-card-hover: #1c1313;
    --bg-navbar: rgba(15, 9, 9, 0.96);

    /* Red & Gold Accents */
    --accent-red: #e50914;
    --accent-red-hover: #ff1e27;
    --accent-red-dark: #b20710;
    --accent-red-glow: rgba(229, 9, 20, 0.45);
    --accent-gold: #ffb400;

    /* Text Colors */
    --text-white: #f5ede4;
    --text-muted: #a09090;
    --text-soft: #b39b91;
    --text-subtle: #786a6a;

    /* Borders */
    --border: rgba(255, 255, 255, 0.08);
    --glass-border: rgba(229, 9, 20, 0.3);
    --card-border: rgba(255, 255, 255, 0.08);

    /* Transitions */
    --transition: all 0.32s cubic-bezier(0.22, 1, 0.36, 1);
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
}

html, body {
    min-height: 100vh;
    font-family: var(--main-font);
    background-color: var(--bg-dark);
    background-image:
        radial-gradient(circle at 10% 12%, rgba(229, 9, 20, 0.22) 0%, transparent 40%),
        radial-gradient(circle at 92% 88%, rgba(178, 7, 16, 0.16) 0%, transparent 45%),
        radial-gradient(circle at 50% 50%, rgba(20, 10, 10, 0.8) 0%, transparent 80%);
    background-attachment: fixed;
    color: var(--text-white);
    overflow-x: hidden;
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

body {
    background: none;
    padding-bottom: 40px;
}

img {
    display: block;
    max-width: 100%;
}

a {
    color: inherit;
}

button, input, select, textarea {
    font: inherit;
}

/* Background video disabled in this theme */
.bg-video-wrap,
.bg-overlay {
    display: none;
}

/* ===== Ambient Floating Orbs (background decoration) ===== */
html::before,
html::after {
    content: '';
    position: fixed;
    border-radius: 50%;
    z-index: 0;
    pointer-events: none;
    filter: blur(100px);
}

html::before {
    width: 500px;
    height: 500px;
    top: -120px;
    left: -80px;
    background: radial-gradient(circle, rgba(229, 9, 20, 0.18), transparent 70%);
    animation: orbFloat 18s ease-in-out infinite alternate;
}

html::after {
    width: 420px;
    height: 420px;
    bottom: -100px;
    right: -60px;
    background: radial-gradient(circle, rgba(178, 7, 16, 0.14), transparent 70%);
    animation: orbFloat 22s ease-in-out infinite alternate-reverse;
}

@keyframes orbFloat {
    0%   { transform: translate(0, 0) scale(1); }
    50%  { transform: translate(40px, -30px) scale(1.08); }
    100% { transform: translate(-20px, 20px) scale(0.95); }
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

.navbar-brand {
    font-family: var(--heading-font);
    font-size: 26px;
    font-weight: 900;
    letter-spacing: -0.02em;
    text-transform: capitalize;
    color: var(--text-white);
    text-decoration: none;
    display: flex;
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
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 9px 20px;
    border-radius: 999px;
    border: 1px solid rgba(255, 255, 255, 0.12);
    background: rgba(255, 255, 255, 0.06);
    color: var(--text-white);
    text-decoration: none;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 0.02em;
    transition: var(--transition-bounce);
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

/* ===== Page Heading ===== */
h2 {
    text-align: center;
    font-family: var(--heading-font);
    font-size: clamp(2rem, 4vw, 3.2rem);
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    margin: 36px auto 6px;
    max-width: 960px;
    padding: 0 20px;
    line-height: 1.1;
    color: var(--text-white);
    position: relative;
    z-index: 1;
    animation: headingSlide 0.7s cubic-bezier(0.16, 1, 0.3, 1) both;
}

/* Subtle red underline accent beneath the heading */
h2::after {
    content: '';
    display: block;
    width: 70px;
    height: 4px;
    margin: 18px auto 0;
    border-radius: 99px;
    background: linear-gradient(90deg, var(--accent-red), var(--accent-red-dark));
    box-shadow: 0 0 16px var(--accent-red-glow);
}

@keyframes headingSlide {
    from {
        opacity: 0;
        transform: translateY(-18px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== Top Controls (Filter / Sort) ===== */
.top-controls {
    display: flex;
    justify-content: center;
    gap: 14px;
    padding: 20px 24px 8px;
    flex-wrap: wrap;
    position: relative;
    z-index: 1;
    background: none;
    border: none;
    box-shadow: none;
    animation: fadeInPage 0.6s 0.15s cubic-bezier(0.16, 1, 0.3, 1) both;
}

.sort-form {
    display: flex;
    gap: 14px;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
}

.filter-dropdown {
    font-family: var(--main-font);
    min-width: 200px;
    max-width: 260px;
    padding: 12px 24px;
    padding-right: 44px;
    border-radius: 999px;
    border: 1px solid rgba(229, 9, 20, 0.35);
    background: rgba(26, 16, 16, 0.85);
    color: var(--text-white);
    font-size: 13px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    outline: none;
    cursor: pointer;
    transition: var(--transition-bounce);
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%23ffffff'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: calc(100% - 14px) center;
    background-size: 16px;
    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.4);
    backdrop-filter: blur(8px);
}

.filter-dropdown:hover {
    border-color: var(--accent-red);
    box-shadow: 0 6px 20px var(--accent-red-glow);
    transform: translateY(-2px);
}

.filter-dropdown:focus {
    border-color: var(--accent-red);
    box-shadow: 0 0 0 3px rgba(229, 9, 20, 0.18), 0 6px 20px var(--accent-red-glow);
}

.filter-dropdown option {
    background: #181010;
    color: #ffffff;
    padding: 8px;
}

/* ===== Menu Grid Container ===== */
.container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 28px;
    padding: 28px 36px 50px;
    max-width: 1400px;
    margin: 0 auto;
    position: relative;
    z-index: 1;
    animation: fadeInPage 0.8s 0.2s cubic-bezier(0.16, 1, 0.3, 1) both;
}

@keyframes fadeInPage {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== Menu Item Card ===== */
.card {
    position: relative;
    background: var(--bg-card);
    border: 1px solid var(--card-border);
    border-radius: 22px;
    overflow: hidden;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
    transition: var(--transition-bounce);
    display: flex;
    flex-direction: column;
}

.card:hover {
    transform: translateY(-8px);
    box-shadow:
        0 30px 65px rgba(0, 0, 0, 0.7),
        0 0 30px rgba(229, 9, 20, 0.2);
    border-color: rgba(229, 9, 20, 0.35);
}

/* ===== Card Image ===== */
.card img {
    width: 100%;
    height: 210px;
    object-fit: contain;
    background: #ffffff;
    padding: 24px;
    transition: transform 0.45s cubic-bezier(0.22, 1, 0.36, 1);
    border-bottom: none;
}

.card:hover img {
    transform: scale(1.06);
}

/* ===== Card Body ===== */
.card-body {
    padding: 22px 24px 26px;
    display: flex;
    flex-direction: column;
    flex: 1;
    background: var(--bg-card);
    border: 1px solid var(--card-border);
    border-top: none;
    border-radius: 0 0 22px 22px;
    position: relative;
}

/* Decorative top-edge glow on hover */
.card:hover .card-body::before {
    content: '';
    position: absolute;
    top: 0;
    left: 10%;
    right: 10%;
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--accent-red), transparent);
    opacity: 0.6;
}

/* ===== Item Name ===== */
.card-body h3 {
    font-family: var(--heading-font);
    font-size: 20px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.03em;
    color: var(--text-white);
    margin-bottom: 6px;
    line-height: 1.3;
    transition: color 0.3s ease;
}

.card:hover .card-body h3 {
    color: #fff;
}

/* ===== Description ===== */
.card-body p {
    font-size: 13.5px;
    color: var(--text-soft);
    line-height: 1.6;
    margin-bottom: 10px;
}

/* ===== Price ===== */
.price {
    font-family: var(--main-font);
    font-size: 20px !important;
    font-weight: 900;
    color: var(--accent-red) !important;
    margin-bottom: 10px !important;
    letter-spacing: -0.01em;
    display: flex;
    align-items: baseline;
    gap: 4px;
}

/* ===== Veg / Non-Veg Tags ===== */
.veg-tag,
.nonveg-tag {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    font-family: var(--main-font);
    font-size: 11px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    padding: 5px 14px;
    border-radius: 999px;
    margin-bottom: 10px;
    transition: var(--transition);
}

.veg-tag {
    background: rgba(72, 199, 80, 0.1);
    color: #7ee787;
    border: 1px solid rgba(72, 199, 80, 0.2);
}

.veg-tag::before {
    content: '●';
    font-size: 8px;
    color: #48c750;
}

.nonveg-tag {
    background: rgba(229, 9, 20, 0.1);
    color: #ff9090;
    border: 1px solid rgba(229, 9, 20, 0.2);
}

.nonveg-tag::before {
    content: '●';
    font-size: 8px;
    color: var(--accent-red);
}

/* ===== Availability ===== */
.available {
    font-family: var(--main-font);
    font-size: 11.5px !important;
    font-weight: 700;
    color: var(--text-muted) !important;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    margin-bottom: 14px !important;
    display: flex;
    align-items: center;
    gap: 6px;
}

.available::before {
    content: '';
    display: inline-block;
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background: #48c750;
    box-shadow: 0 0 8px rgba(72, 199, 80, 0.5);
    animation: pulse-dot 2s ease-in-out infinite;
}

@keyframes pulse-dot {
    0%, 100% { opacity: 1; transform: scale(1); }
    50%      { opacity: 0.5; transform: scale(0.8); }
}

/* ===== Add to Cart Form ===== */
.card-body form {
    margin-top: auto;
    padding-top: 16px;
    border-top: 1px solid rgba(255, 255, 255, 0.06);
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.card-body label {
    font-family: var(--main-font);
    font-size: 12px;
    font-weight: 700;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: 0.06em;
    margin-right: 10px;
}

.quantity {
    width: 72px;
    padding: 10px 12px;
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.12);
    background: rgba(255, 255, 255, 0.05);
    color: var(--text-white);
    text-align: center;
    font-weight: 700;
    font-size: 14px;
    transition: var(--transition);
    outline: none;
}

.quantity:focus {
    border-color: var(--accent-red);
    box-shadow: 0 0 0 3px rgba(229, 9, 20, 0.15);
    background: rgba(229, 9, 20, 0.05);
}

/* ===== Add to Cart Button ===== */
.btn {
    font-family: var(--main-font);
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    padding: 14px 20px;
    border-radius: 999px;
    border: none;
    background: linear-gradient(135deg, #e50914 0%, #b20710 100%);
    color: #ffffff;
    font-size: 13px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    cursor: pointer;
    transition: var(--transition-bounce);
    box-shadow: 0 8px 24px var(--accent-red-glow);
    position: relative;
    overflow: hidden;
}

/* Shimmer sweep on hover */
.btn::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.15),
        transparent
    );
    transition: left 0.5s ease;
}

.btn:hover::after {
    left: 100%;
}

.btn:hover {
    background: linear-gradient(135deg, #ff1e27 0%, #d30812 100%);
    transform: translateY(-3px);
    box-shadow: 0 14px 36px rgba(229, 9, 20, 0.55);
}

.btn:active {
    transform: translateY(0);
    box-shadow: 0 4px 14px rgba(229, 9, 20, 0.3);
}

.btn:disabled {
    background: rgba(60, 50, 50, 0.7);
    color: #6b5a5a;
    cursor: not-allowed;
    box-shadow: none;
    transform: none;
}

.btn:disabled::after {
    display: none;
}

/* ===== View Cart Button ===== */
.cart-btn {
    font-family: var(--main-font);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    padding: 14px 34px;
    border-radius: 999px;
    border: 2px solid var(--accent-red);
    background: rgba(229, 9, 20, 0.08);
    color: var(--accent-red);
    font-size: 13px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
    transition: var(--transition-bounce);
    position: relative;
    overflow: hidden;
}

.cart-btn::before {
    content: '🛒';
    margin-right: 8px;
    font-size: 15px;
}

.cart-btn:hover {
    background: linear-gradient(135deg, #e50914 0%, #b20710 100%);
    color: #ffffff;
    border-color: transparent;
    transform: translateY(-3px);
    box-shadow: 0 12px 30px var(--accent-red-glow);
}

.cart-btn:active {
    transform: translateY(0);
}

/* ===== Empty State ===== */
.empty-state {
    grid-column: 1 / -1;
    padding: 56px 30px;
    border-radius: 22px;
    background: var(--bg-card);
    border: 1px solid var(--glass-border);
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
    color: var(--text-white);
    text-align: center;
    font-size: 22px;
    font-weight: 700;
    animation: fadeInPage 0.6s ease both;
}

.empty-state::before {
    content: '🍽️';
    display: block;
    font-size: 48px;
    margin-bottom: 16px;
}

/* ===== Unavailable Message ===== */
.unavailable-msg {
    color: #ff9090;
    font-family: var(--main-font);
    font-size: 13px;
    font-weight: 800;
    margin: 10px 0;
    text-align: center;
    padding: 10px 16px;
    border-radius: 12px;
    background: rgba(229, 9, 20, 0.08);
    border: 1px solid rgba(229, 9, 20, 0.15);
}

/* ===== Scrollbar Styling ===== */
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

/* ===== Responsive — Tablet ===== */
@media (max-width: 900px) {
    .navbar {
        flex-direction: column;
        padding: 16px 20px;
    }

    .navbar-links {
        justify-content: center;
        width: 100%;
    }

    .container {
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        padding: 20px 18px 40px;
        gap: 22px;
    }

    h2 {
        font-size: 2rem;
        letter-spacing: 0.06em;
    }
}

/* ===== Responsive — Mobile ===== */
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

    .container {
        grid-template-columns: 1fr;
        padding: 14px 16px 30px;
        gap: 18px;
    }

    .card img {
        height: 175px;
        padding: 18px;
    }

    .top-controls {
        flex-direction: column;
        align-items: center;
        padding: 14px 16px 4px;
    }

    .filter-dropdown {
        width: 100%;
        max-width: 100%;
    }

    h2 {
        font-size: 1.6rem;
        margin-top: 24px;
    }

    .cart-btn {
        width: 100%;
        justify-content: center;
    }
}

</style>

</head>

<body>
	<div class="bg-video-wrap">
		<video autoplay muted loop playsinline>
			<source src="videos/display.mp4" type="video/mp4">
		</video>
	</div>
	<div class="bg-overlay"></div>

	<%
Resturant resturant = (Resturant)request.getAttribute("resturant");

String filter = request.getParameter("filter");
if(filter == null){
	filter = "all";
}

String sort = request.getParameter("sort");
if(sort == null){
	sort = "";
}
%>

	<nav class="navbar">

		<a href="home" class="navbar-brand">Foodie Store</a>

		<ul class="navbar-links">
			<li><a href="ProfileServlet" class="nav-btn"> <%=username%> </a></li>
			<li><a href="home" class="nav-btn">⬅ Back to Restaurants</a></li>

			<li><a href="cart.jsp" class="nav-btn active">🛒 Cart</a></li>

		</ul>

	</nav>

	<h2>
		🍽
		<%= (resturant != null) ? resturant.getResturant_name() + " Menu" : "Restaurant Menu" %>
	</h2>

	<div class="top-controls">

		<form action="menuss" method="get" class="sort-form">

			<input type="hidden" name="restaurantId"
				value="<%=resturant.getResturant_id()%>"> <select
				name="filter" class="filter-dropdown" onchange="this.form.submit()">

				<option value="all" <%=filter.equals("all")?"selected":""%>>
					🍽 All</option>

				<option value="VEG"
					<%=filter.equalsIgnoreCase("VEG")?"selected":""%>>🥗 Veg</option>

				<option value="NON-VEG"
					<%=filter.equalsIgnoreCase("NON-VEG") ? "selected" : ""%>>🍗
					Non-Veg</option>

			</select> <select name="sort" class="filter-dropdown"
				onchange="this.form.submit()">

				<option value="">Sort By Price</option>

				<option value="priceAsc" <%=sort.equals("priceAsc")?"selected":""%>>
					💰 Low → High</option>

				<option value="priceDesc"
					<%=sort.equals("priceDesc")?"selected":""%>>💰 High → Low
				</option>

			</select>

		</form>

	</div>

	<div class="container">

		<%
		List<Menu> menus = (List<Menu>) request.getAttribute("menu");

		if (menus != null && !menus.isEmpty()) {

			for (Menu m : menus) {
		%>
		<div class="card">

			<img src="<%=m.getImage()%>" alt="<%=m.getName()%>">

			<div class="card-body">

				<h3><%=m.getName()%></h3>

				<p><%=m.getDescription()%></p>

				<p class="price">
					₹
					<%=m.getPrice()%>
				</p>

				<p>

					<%
		if(m.getFoodType().equalsIgnoreCase("veg")){
		%>

					<span class="veg-tag"> 🟢 Veg </span>

					<%
		}
		else{
		%>

					<span class="nonveg-tag"> 🔴 Non-Veg </span>

					<%
		}
		%>

				</p>

				<p class="available">

					Available :
					<%=m.getIsAvailable()%>

				</p>

				<form action="CartServlet" method="post">

					<input type="hidden" name="menuId" value="<%=m.getMenu_id()%>">

					<input type="hidden" name="restaurantId"
						value="<%=m.getResturant_id()%>">

					<!-- Added -->
					<input type="hidden" name="redirect" value="menu"> 
					<label>Quantity:</label> 
					
					<input class="quantity" type="number" name="quantity" value="1"
						min="0"> <input type="hidden" name="action" value="add">

					<br> <br>

					<%
					if (m.getIsAvailable().equalsIgnoreCase("YES")) {
					%>

					<input class="btn" type="submit" value="🛒 Add To Cart">

					<%
					} else {
					%>

					<p class="unavailable-msg">❌ Item is unavailable at this
						moment.</p>

					<input class="btn" type="button" value="Unavailable" disabled>

					<%
					}
					%>

				</form>

			</div>

		</div>

		<%
	}
}
else{
%>
		<h2 style="color: white; text-align: center; width: 100%;">No
			Menu Available</h2>

		<%
}
%>

	</div>

	<div style="text-align: center; margin: 30px 0;">

		<a href="cart.jsp" class="cart-btn">  Go To Cart </a>

	</div>

</body>
</html>