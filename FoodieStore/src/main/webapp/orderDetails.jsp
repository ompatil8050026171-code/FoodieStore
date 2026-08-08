<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.FoodieStore.Model.OrderItem,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details - Foodie Store</title>

<style>
/* ==========================================================================
   ORDER-DETAILS.CSS - PREMIUM CRIMSON DARK MODE (ORDER DETAILS PAGE)
   Matches home.css, menu.css & order.css theme
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
    --bg-card: rgba(14, 8, 8, 0.96);
    --bg-card-hover: #1c1313;
    --bg-navbar: rgba(15, 9, 9, 0.96);

    /* Red & Gold Accents */
    --accent-red: #e50914;
    --accent-red-hover: #ff1e27;
    --accent-red-dark: #b20710;
    --accent-red-deeper: #9f0710;
    --accent-red-glow: rgba(229, 9, 20, 0.45);
    --accent-gold: #ffb400;
    --accent-gold-soft: #f2b90f;

    /* Text Colors */
    --text-white: #f5ede4;
    --text-muted: #b39b91;
    --text-label: #a08d7a;
    --text-subtle: #786a6a;

    /* Borders */
    --card-border: rgba(255, 255, 255, 0.08);
    --glass-border: rgba(229, 9, 20, 0.3);

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
    color: var(--text-white);
    overflow-x: hidden;
    background-color: var(--bg-dark);
    background-image:
        radial-gradient(circle at 10% 12%, rgba(229, 9, 20, 0.22) 0%, transparent 40%),
        radial-gradient(circle at 92% 88%, rgba(178, 7, 16, 0.16) 0%, transparent 45%),
        radial-gradient(circle at 50% 50%, rgba(20, 10, 10, 0.8) 0%, transparent 80%);
    background-attachment: fixed;
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

body {
    background: transparent;
    padding: 0;
}

/* Background video disabled */
.bg-video-wrap,
.bg-overlay {
    display: none;
}

/* ===== Ambient Floating Orbs ===== */
html::before,
html::after {
    content: '';
    position: fixed;
    border-radius: 50%;
    z-index: 0;
    pointer-events: none;
    filter: blur(110px);
}

html::before {
    width: 480px;
    height: 480px;
    top: -100px;
    left: -60px;
    background: radial-gradient(circle, rgba(229, 9, 20, 0.18), transparent 70%);
    animation: orbDrift 20s ease-in-out infinite alternate;
}

html::after {
    width: 380px;
    height: 380px;
    bottom: -80px;
    right: -40px;
    background: radial-gradient(circle, rgba(255, 180, 0, 0.1), transparent 70%);
    animation: orbDrift 24s ease-in-out infinite alternate-reverse;
}

@keyframes orbDrift {
    0%   { transform: translate(0, 0) scale(1); }
    50%  { transform: translate(35px, -25px) scale(1.06); }
    100% { transform: translate(-15px, 15px) scale(0.96); }
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

/* ===== Brand ===== */
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
    margin: 0;
    padding: 0;
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

/* ===== Page Wrapper ===== */
.details-page {
    max-width: 800px;
    margin: 0 auto;
    position: relative;
    z-index: 1;
    padding: 44px 20px 56px;
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

/* ===== Main Heading ===== */
.details-page h2 {
    text-align: center;
    font-family: var(--heading-font);
    font-size: clamp(28px, 5vw, 40px);
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    margin-bottom: 10px;
    color: var(--text-white);
    line-height: 1.1;
    animation: textSlideIn 0.7s 0.15s cubic-bezier(0.16, 1, 0.3, 1) both;
}

/* Red underline accent */
.details-page h2::after {
    content: '';
    display: block;
    width: 60px;
    height: 4px;
    margin: 16px auto 0;
    border-radius: 99px;
    background: linear-gradient(90deg, var(--accent-red), var(--accent-red-dark));
    box-shadow: 0 0 16px var(--accent-red-glow);
}

@keyframes textSlideIn {
    from {
        opacity: 0;
        transform: translateY(14px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== Order Meta (ID / Date) ===== */
.order-meta {
    font-family: var(--main-font);
    text-align: center;
    color: var(--text-muted);
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 36px;
    letter-spacing: 0.02em;
    animation: textSlideIn 0.7s 0.25s cubic-bezier(0.16, 1, 0.3, 1) both;
}

.order-meta span {
    color: var(--accent-gold);
    font-weight: 800;
}

/* ===== Order Details Card ===== */
.details-card {
    background: var(--bg-card);
    border: 1px solid var(--card-border);
    border-radius: 24px;
    overflow: hidden;
    margin-bottom: 24px;
    position: relative;
    box-shadow:
        0 24px 60px rgba(0, 0, 0, 0.55),
        0 0 0 1px rgba(229, 9, 20, 0.06);
    animation: cardSlideUp 0.7s 0.3s cubic-bezier(0.16, 1, 0.3, 1) both;
}

/* Gradient top accent bar */
.details-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, var(--accent-red-dark), var(--accent-red), var(--accent-red-dark));
    box-shadow: 0 0 20px var(--accent-red-glow);
    z-index: 1;
}

@keyframes cardSlideUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== Items Header Row ===== */
.details-header {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 16px 28px;
    background: rgba(18, 10, 10, 0.98);
    border-bottom: 1px solid rgba(229, 9, 20, 0.2);
}

.details-header span {
    font-family: var(--main-font);
    font-size: 10.5px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    color: var(--accent-gold);
}

.details-header .col-name {
    flex: 1;
}

.details-header .col-price,
.details-header .col-qty,
.details-header .col-total {
    flex-shrink: 0;
}

.details-header .col-price,
.details-header .col-total {
    width: 95px;
    text-align: center;
}

.details-header .col-qty {
    width: 75px;
    text-align: center;
}

/* ===== Item Row ===== */
.details-item {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 18px 28px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    transition: var(--transition);
    position: relative;
}

.details-item:last-child {
    border-bottom: none;
}

.details-item:hover {
    background: rgba(229, 9, 20, 0.04);
}

/* Hover indicator bar on left */
.details-item::before {
    content: '';
    position: absolute;
    left: 0;
    top: 20%;
    bottom: 20%;
    width: 3px;
    border-radius: 0 3px 3px 0;
    background: var(--accent-red);
    opacity: 0;
    transform: scaleY(0.5);
    transition: var(--transition);
}

.details-item:hover::before {
    opacity: 1;
    transform: scaleY(1);
}

/* ===== Item Name ===== */
.details-item-name {
    flex: 1;
    font-family: var(--heading-font);
    font-size: 16px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.03em;
    color: var(--text-white);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    transition: color 0.2s ease;
}

.details-item:hover .details-item-name {
    color: #ffffff;
}

/* ===== Item Price ===== */
.details-item-price {
    font-family: var(--main-font);
    width: 95px;
    text-align: center;
    flex-shrink: 0;
    font-size: 14px;
    color: var(--accent-gold);
    font-weight: 700;
    letter-spacing: -0.01em;
}

/* ===== Item Quantity Badge ===== */
.details-item-qty {
    width: 75px;
    text-align: center;
    flex-shrink: 0;
}

.details-item-qty span {
    font-family: var(--main-font);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 36px;
    background: rgba(229, 9, 20, 0.1);
    border: 1px solid rgba(229, 9, 20, 0.2);
    color: var(--text-white);
    font-size: 12px;
    font-weight: 800;
    padding: 5px 14px;
    border-radius: 999px;
    transition: var(--transition);
}

.details-item:hover .details-item-qty span {
    background: rgba(229, 9, 20, 0.18);
    border-color: rgba(229, 9, 20, 0.35);
}

/* ===== Item Total ===== */
.details-item-total {
    font-family: var(--main-font);
    width: 95px;
    text-align: right;
    flex-shrink: 0;
    font-size: 15px;
    font-weight: 800;
    color: var(--accent-red);
    letter-spacing: -0.01em;
}

/* ===== Bill Summary Card ===== */
.bill-card {
    background: var(--bg-card);
    border: 1px solid var(--card-border);
    border-radius: 24px;
    padding: 32px 34px;
    position: relative;
    overflow: hidden;
    box-shadow:
        0 24px 60px rgba(0, 0, 0, 0.55),
        0 0 0 1px rgba(229, 9, 20, 0.06);
    animation: cardSlideUp 0.7s 0.45s cubic-bezier(0.16, 1, 0.3, 1) both;
}

/* Subtle top glow */
.bill-card::before {
    content: '';
    position: absolute;
    top: -50%;
    left: 50%;
    transform: translateX(-50%);
    width: 250px;
    height: 250px;
    background: radial-gradient(circle, rgba(229, 9, 20, 0.06), transparent 70%);
    border-radius: 50%;
    pointer-events: none;
}

.bill-row {
    font-family: var(--main-font);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 11px 0;
    font-size: 14.5px;
    color: var(--text-muted);
    position: relative;
    z-index: 1;
}

.bill-row span:first-child {
    color: var(--text-label);
    font-weight: 600;
    letter-spacing: 0.01em;
}

.bill-row span:last-child {
    font-weight: 700;
}

/* ===== Grand Total ===== */
.bill-row.total-row {
    border-top: 2px solid rgba(229, 9, 20, 0.2);
    margin-top: 12px;
    padding-top: 20px;
    font-size: 26px;
    font-weight: 900;
    text-transform: uppercase;
    color: var(--text-white);
}

.bill-row.total-row span:first-child {
    font-family: var(--main-font);
    font-weight: 800;
    text-transform: uppercase;
    font-size: 13px;
    letter-spacing: 0.08em;
    color: var(--accent-red);
    display: flex;
    align-items: center;
    gap: 6px;
}

.bill-row.total-row span:first-child::before {
    content: '';
    display: inline-block;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: var(--accent-red);
    box-shadow: 0 0 10px var(--accent-red-glow);
    animation: pulseDot 2s ease-in-out infinite;
}

@keyframes pulseDot {
    0%, 100% { opacity: 1; transform: scale(1); }
    50%      { opacity: 0.4; transform: scale(0.7); }
}

.bill-row.total-row span:last-child {
    font-family: var(--heading-font);
    font-weight: 900;
    letter-spacing: -0.02em;
    background: linear-gradient(135deg, var(--text-white), var(--accent-gold));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

/* ===== Back Button ===== */
.back-row {
    text-align: center;
    margin-top: 34px;
    animation: textSlideIn 0.7s 0.6s cubic-bezier(0.16, 1, 0.3, 1) both;
}

.back-btn {
    font-family: var(--main-font);
    text-decoration: none;
    background: rgba(255, 255, 255, 0.05);
    color: var(--text-white);
    border: 2px solid rgba(255, 255, 255, 0.12);
    padding: 15px 36px;
    border-radius: 999px;
    font-size: 13px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    transition: var(--transition-bounce);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    position: relative;
    overflow: hidden;
}

/* Shimmer sweep */
.back-btn::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.12),
        transparent
    );
    transition: left 0.5s ease;
}

.back-btn:hover::after {
    left: 100%;
}

.back-btn:hover {
    background: linear-gradient(135deg, var(--accent-red) 0%, var(--accent-red-dark) 100%);
    color: #ffffff;
    border-color: transparent;
    transform: translateY(-3px);
    box-shadow: 0 12px 32px var(--accent-red-glow);
}

.back-btn:active {
    transform: translateY(0);
    box-shadow: 0 4px 14px rgba(229, 9, 20, 0.3);
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

    .details-page {
        padding: 32px 16px 40px;
    }

    .details-header {
        padding: 14px 20px;
    }

    .details-item {
        padding: 16px 20px;
    }

    .bill-card {
        padding: 28px 24px;
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

    /* Hide table header on mobile */
    .details-header {
        display: none;
    }

    /* Stack item rows vertically */
    .details-item {
        flex-wrap: wrap;
        padding: 16px 18px;
        gap: 8px;
    }

    .details-item::before {
        display: none;
    }

    .details-item-name {
        flex: 1 1 100%;
        margin-bottom: 4px;
        font-size: 15px;
        white-space: normal;
    }

    .details-item-price {
        width: auto;
        text-align: left;
        font-size: 13px;
    }

    .details-item-qty {
        width: auto;
        margin-left: auto;
    }

    .details-item-total {
        width: auto;
        text-align: right;
        font-size: 14px;
    }

    .bill-card {
        padding: 24px 20px;
    }

    .bill-row.total-row {
        font-size: 22px;
    }

    .details-page h2 {
        font-size: 26px;
        letter-spacing: 0.05em;
    }

    .back-btn {
        width: 100%;
        justify-content: center;
    }
}

/* ===== Responsive — Small Phones ===== */
@media (max-width: 400px) {
    .details-page {
        padding: 24px 12px 36px;
    }

    .details-item {
        padding: 14px 14px;
    }

    .bill-card {
        padding: 20px 16px;
    }

    .bill-row.total-row {
        font-size: 20px;
    }
}

</style>

</head>
<body>

<!-- ===== Background Video ===== -->
<div class="bg-video-wrap">
    <video autoplay muted loop playsinline>
        <source src="videos/display.mp4" type="video/mp4">
    </video>
</div>
<div class="bg-overlay"></div>

<!-- ===== Navbar ===== -->
<nav class="navbar">

    <a href="home" class="navbar-brand">Foodie Store</a>

    <ul class="navbar-links">
        <li><a href="home" class="nav-btn">Home</a></li>
        <li><a href="cart.jsp" class="nav-btn">Cart</a></li>
        <li><a href="orderHistory.jsp" class="nav-btn active">Order History</a></li>
        <li><a href="LogoutServlet" class="nav-btn logout">Logout</a></li>
    </ul>

</nav>

<div class="details-page">

    <h2>📋 Order Details</h2>
   

    <div class="details-card">

        <div class="details-header">
            <span class="col-name">Item Name</span>
            <span class="col-price">Price</span>
            <span class="col-qty">Qty</span>
            <span class="col-total">Total</span>
        </div>
		<%
			List<OrderItem> items=(List<OrderItem>)request.getAttribute("orderitem");
			double itemTotal=0;
			double grandTotal=0;
			for(OrderItem item : items )
			{
		%>
        <div class="details-item">
            <span class="details-item-name"><%=item.getName() %></span>
            <span class="details-item-price">₹<%=item.getPrice() %></span>
            <span class="details-item-qty"><span><%=item.getQuantity() %></span></span>
            <span class="details-item-total">₹<%=item.getPrice()*item.getQuantity()%></span>
        </div>
		<%
			itemTotal += item.getPrice() * item.getQuantity();
			 grandTotal=itemTotal+30+12;
		} %>
       

    </div>

    <div class="bill-card">

        <div class="bill-row">
            <span>Item Total</span>
            <span>₹<%=itemTotal %></span>
        </div>

        <div class="bill-row">
            <span>Delivery Fee</span>
            <span>₹30</span>
        </div>

        <div class="bill-row">
            <span>Taxes & Charges</span>
            <span>₹12</span>
        </div>

        <div class="bill-row total-row">
            <span>Grand Total</span>
            <span>₹<%=grandTotal %></span>
        </div>

    </div>

    <div class="back-row">
        <a href="orderHistory" class="back-btn">⬅ Back to Order History</a>
    </div>

</div>

</body>
</html>