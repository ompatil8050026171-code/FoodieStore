<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.FoodieStore.Model.Orders,com.FoodieStore.Model.OrderItem,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History - Foodie Store</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="orderHistory.css">

</head>
<style>
/* ==========================================================================
   ORDERHISTORY.CSS - ULTRA PREMIUM CRIMSON DARK MODE (FOODIE STORE)
   Matches home.css, menu.css, order.css & orderDetails.css themes
   ========================================================================== */

/* ===== Custom Font Imports ===== */
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap');

/* ===== Design Tokens ===== */
:root {
    --main-font: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    --heading-font: 'Plus Jakarta Sans', sans-serif;

    /* Crimson Dark Palette */
    --bg-dark: #090707;
    --bg-card: rgba(14, 8, 8, 0.96);
    --bg-card-hover: rgba(22, 12, 12, 0.98);
    --bg-card-inner: rgba(18, 10, 10, 0.98);
    --bg-navbar: rgba(15, 9, 9, 0.92);

    /* Red & Gold Accents */
    --accent-red: #e50914;
    --accent-red-hover: #ff1e27;
    --accent-red-dark: #b20710;
    --accent-red-deeper: #80040a;
    --accent-red-glow: rgba(229, 9, 20, 0.45);
    --accent-gold: #ffb400;
    --accent-gold-soft: #f2b90f;

    /* Status Colors */
    --status-delivered-bg: rgba(46, 204, 113, 0.12);
    --status-delivered-text: #2ecc71;
    --status-delivered-border: rgba(46, 204, 113, 0.25);

    /* Text Colors */
    --text-white: #f5ede4;
    --text-muted: #c8b39f;
    --text-soft: #b39b91;
    --text-label: #a08d7a;

    /* Borders & Glass */
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

/* Background video container disabled */
.bg-video-wrap,
.bg-overlay {
    display: none;
}

/* ===== Ambient Background Orbs ===== */
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
    width: 500px;
    height: 500px;
    top: -120px;
    left: -80px;
    background: radial-gradient(circle, rgba(229, 9, 20, 0.2), transparent 70%);
    animation: orbDrift 20s ease-in-out infinite alternate;
}

html::after {
    width: 450px;
    height: 450px;
    bottom: -100px;
    right: -60px;
    background: radial-gradient(circle, rgba(255, 180, 0, 0.12), transparent 70%);
    animation: orbDrift 24s ease-in-out infinite alternate-reverse;
}

@keyframes orbDrift {
    0%   { transform: translate(0, 0) scale(1); }
    50%  { transform: translate(35px, -25px) scale(1.08); }
    100% { transform: translate(-20px, 20px) scale(0.95); }
}

/* ===== Navigation Bar ===== */
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
    display: inline-flex;
    align-items: center;
    gap: 8px;
    transition: var(--transition-smooth);
}

.navbar-brand:hover {
    transform: scale(1.03);
    text-shadow: 0 0 12px var(--accent-red-glow);
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
    gap: 6px;
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

.nav-btn.logout:hover {
    background: rgba(231, 76, 60, 0.25);
    border-color: rgba(231, 76, 60, 0.5);
    box-shadow: 0 6px 18px rgba(231, 76, 60, 0.3);
}

/* ===== Page Container ===== */
.history-page,
.order-history-container {
    max-width: 1100px;
    margin: 0 auto;
    min-height: calc(100vh - 100px);
    position: relative;
    z-index: 1;
    padding: 44px 20px 56px;
    display: flex;
    flex-direction: column;
    animation: pageReveal 0.6s cubic-bezier(0.16, 1, 0.3, 1) both;
}

@keyframes pageReveal {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== Main Header ===== */
.history-page h2,
.order-history-container h2 {
    text-align: center;
    font-family: var(--heading-font);
    font-size: clamp(28px, 5vw, 42px);
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    margin-bottom: 8px;
    color: var(--text-white);
    line-height: 1.1;
    animation: textSlideIn 0.7s 0.1s cubic-bezier(0.16, 1, 0.3, 1) both;
}

.history-page h2::after,
.order-history-container h2::after {
    content: '';
    display: block;
    width: 70px;
    height: 4px;
    margin: 16px auto 36px;
    border-radius: 99px;
    background: linear-gradient(90deg, var(--accent-red), var(--accent-gold), var(--accent-red));
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

/* ===== Order Card ===== */
.order-card {
    background: var(--bg-card);
    border: 1px solid var(--card-border);
    border-radius: 24px;
    overflow: hidden;
    margin-bottom: 24px;
    position: relative;
    box-shadow:
        0 20px 55px rgba(0, 0, 0, 0.5),
        0 0 0 1px rgba(229, 9, 20, 0.05);
    transition: var(--transition-bounce);
    animation: cardSlideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) both;
    backdrop-filter: blur(12px);
}

.order-card:nth-child(1) { animation-delay: 0.15s; }
.order-card:nth-child(2) { animation-delay: 0.25s; }
.order-card:nth-child(3) { animation-delay: 0.35s; }
.order-card:nth-child(4) { animation-delay: 0.45s; }
.order-card:nth-child(5) { animation-delay: 0.55s; }
.order-card:nth-child(n+6) { animation-delay: 0.60s; }

@keyframes cardSlideUp {
    from {
        opacity: 0;
        transform: translateY(24px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.order-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--accent-red-dark), var(--accent-red), var(--accent-gold), var(--accent-red-dark));
    opacity: 0;
    transition: opacity 0.35s ease;
    z-index: 2;
}

.order-card:hover::before {
    opacity: 1;
    box-shadow: 0 0 18px var(--accent-red-glow);
}

.order-card:hover {
    transform: translateY(-5px);
    background: var(--bg-card-hover);
    box-shadow:
        0 28px 65px rgba(0, 0, 0, 0.65),
        0 0 25px rgba(229, 9, 20, 0.15);
    border-color: rgba(229, 9, 20, 0.3);
}

/* Header */
.order-card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 12px;
    padding: 22px 28px;
    background: var(--bg-card-inner);
    border-bottom: 1px solid rgba(229, 9, 20, 0.16);
    position: relative;
}

.order-id-block {
    display: flex;
    flex-direction: column;
    gap: 4px;
}

.order-id {
    font-family: var(--heading-font);
    font-size: 18px;
    font-weight: 800;
    text-transform: capitalize;
    letter-spacing: 0.02em;
    color: var(--text-white);
    display: flex;
    align-items: center;
    gap: 8px;
}

.order-id::before {
    content: '🏬';
    font-size: 16px;
}

.order-date {
    font-family: var(--main-font);
    font-size: 12.5px;
    color: var(--text-muted);
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 6px;
}

.order-date::before {
    content: '📅';
    font-size: 12px;
}

.order-status {
    font-family: var(--main-font);
    padding: 7px 18px;
    border-radius: 999px;
    font-size: 11px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    display: inline-flex;
    align-items: center;
    gap: 7px;
    transition: var(--transition);
    background: var(--status-delivered-bg);
    color: var(--status-delivered-text);
    border: 1px solid var(--status-delivered-border);
    box-shadow: 0 4px 12px rgba(46, 204, 113, 0.15);
}

.order-status::before {
    content: '';
    display: inline-block;
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background: var(--status-delivered-text);
    box-shadow: 0 0 8px var(--status-delivered-text);
}

/* Footer */
.order-card-footer {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px 28px;
    background: var(--bg-card-inner);
    border-top: 1px solid rgba(229, 9, 20, 0.12);
    gap: 16px;
    flex-wrap: wrap;
}

.order-payment-mode {
    font-family: var(--main-font);
    font-size: 13px;
    color: var(--text-muted);
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 8px;
    background: rgba(255, 255, 255, 0.03);
    padding: 8px 16px;
    border-radius: 12px;
    border: 1px solid rgba(255, 255, 255, 0.06);
}

.order-payment-mode::before {
    content: '💳';
    font-size: 14px;
}

.order-payment-mode span {
    color: var(--text-white);
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.03em;
}

.order-details-btn {
    font-family: var(--main-font);
    text-decoration: none;
    background: linear-gradient(135deg, var(--accent-red) 0%, var(--accent-red-dark) 100%);
    color: #ffffff;
    border: none;
    padding: 11px 24px;
    border-radius: 999px;
    font-size: 12.5px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    transition: var(--transition-bounce);
    white-space: nowrap;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    box-shadow: 0 6px 20px rgba(229, 9, 20, 0.35);
    position: relative;
    overflow: hidden;
}

.order-details-btn::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.25),
        transparent
    );
    transition: left 0.5s ease;
}

.order-details-btn:hover::after {
    left: 100%;
}

.order-details-btn:hover {
    background: linear-gradient(135deg, var(--accent-red-hover) 0%, #c40710 100%);
    color: #ffffff;
    transform: translateY(-3px);
    box-shadow: 0 10px 28px var(--accent-red-glow);
}

.order-grand-total {
    font-family: var(--heading-font);
    font-size: 22px;
    font-weight: 900;
    text-transform: uppercase;
    color: var(--text-white);
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    gap: 2px;
}

.order-grand-total span {
    font-family: var(--main-font);
    font-size: 10.5px;
    font-weight: 800;
    color: var(--accent-gold);
    text-transform: uppercase;
    letter-spacing: 0.08em;
    display: flex;
    align-items: center;
    gap: 6px;
}

.order-grand-total span::before {
    content: '';
    display: inline-block;
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: var(--accent-gold);
    box-shadow: 0 0 8px rgba(255, 180, 0, 0.5);
}


/* ==========================================================================
   BEST OF BEST PREMIUM NO ORDERS STATE (EMPTY STATE)
   Targeting user's exact HTML: .no-orders, .no-orders-icon, h3, p, .nav-btn
   ========================================================================== */

.no-orders {
    min-height: 65vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    background: linear-gradient(145deg, rgba(16, 9, 9, 0.95) 0%, rgba(12, 7, 7, 0.98) 100%);
    border: 1px solid rgba(229, 9, 20, 0.28);
    border-radius: 28px;
    padding: 68px 32px;
    margin: 20px auto;
    max-width: 820px;
    width: 100%;
    box-shadow:
        0 24px 60px rgba(0, 0, 0, 0.7),
        0 0 40px rgba(229, 9, 20, 0.12),
        inset 0 1px 1px rgba(255, 255, 255, 0.1);
    position: relative;
    overflow: hidden;
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    animation: emptyCardReveal 0.7s cubic-bezier(0.16, 1, 0.3, 1) both;
}

@keyframes emptyCardReveal {
    from {
        opacity: 0;
        transform: translateY(30px) scale(0.97);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

/* Ambient Backdrop Glow & Shimmer */
.no-orders::before {
    content: '';
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 380px;
    height: 380px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(229, 9, 20, 0.18) 0%, rgba(255, 180, 0, 0.06) 50%, transparent 75%);
    pointer-events: none;
    animation: emptyGlowPulse 4s ease-in-out infinite alternate;
}

.no-orders::after {
    content: '';
    position: absolute;
    top: 0;
    left: -150%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(229, 9, 20, 0.05),
        rgba(255, 255, 255, 0.03),
        transparent
    );
    animation: sweepShimmer 7s infinite linear;
    pointer-events: none;
}

@keyframes emptyGlowPulse {
    0% { transform: translate(-50%, -50%) scale(0.9); opacity: 0.7; }
    100% { transform: translate(-50%, -50%) scale(1.15); opacity: 1; }
}

@keyframes sweepShimmer {
    0% { left: -150%; }
    40%, 100% { left: 150%; }
}

/* Animated Glowing Icon Wrapper around .no-orders-icon */
.no-orders-icon {
    font-size: 54px;
    margin-bottom: 26px;
    position: relative;
    z-index: 2;
    width: 110px;
    height: 110px;
    border-radius: 50%;
    background: linear-gradient(135deg, rgba(32, 16, 16, 0.95), rgba(18, 9, 9, 0.98));
    border: 1px solid rgba(229, 9, 20, 0.4);
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow:
        0 14px 35px rgba(0, 0, 0, 0.6),
        0 0 30px rgba(229, 9, 20, 0.3),
        inset 0 2px 4px rgba(255, 255, 255, 0.12);
    animation: iconFloat 3.5s ease-in-out infinite alternate;
}

.no-orders-icon::before {
    content: '';
    position: absolute;
    inset: -6px;
    border-radius: 50%;
    background: linear-gradient(135deg, rgba(229, 9, 20, 0.6), rgba(255, 180, 0, 0.3), rgba(229, 9, 20, 0.2));
    padding: 2px;
    -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
    -webkit-mask-composite: xor;
    mask-composite: exclude;
    animation: ringRotate 8s linear infinite;
    pointer-events: none;
}

@keyframes ringRotate {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

@keyframes iconFloat {
    0% {
        transform: translateY(0) scale(1);
        box-shadow: 0 14px 35px rgba(0, 0, 0, 0.6), 0 0 25px rgba(229, 9, 20, 0.25);
    }
    100% {
        transform: translateY(-8px) scale(1.04);
        box-shadow: 0 22px 45px rgba(0, 0, 0, 0.7), 0 0 35px rgba(229, 9, 20, 0.4);
    }
}

/* Heading in No Orders */
.no-orders h3 {
    font-family: var(--heading-font);
    font-size: clamp(26px, 4vw, 36px);
    font-weight: 900;
    letter-spacing: 0.05em;
    text-transform: uppercase;
    background: linear-gradient(135deg, #ffffff 30%, var(--text-white) 70%, var(--text-muted) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    margin-bottom: 14px;
    position: relative;
    z-index: 2;
}

/* Paragraph in No Orders */
.no-orders p {
    font-family: var(--main-font);
    font-size: 16.5px;
    color: var(--text-muted);
    max-width: 500px;
    line-height: 1.8;
    margin-bottom: 36px;
    position: relative;
    z-index: 2;
    font-weight: 500;
}

/* Action Button inside .no-orders */
.no-orders .nav-btn {
    padding: 15px 40px;
    font-size: 15px;
    font-weight: 800;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    background: linear-gradient(135deg, var(--accent-red) 0%, var(--accent-red-dark) 100%);
    color: #ffffff !important;
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 999px;
    box-shadow:
        0 10px 30px var(--accent-red-glow),
        0 0 0 4px rgba(229, 9, 20, 0.15);
    position: relative;
    z-index: 2;
    overflow: hidden;
    transition: var(--transition-bounce);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    text-decoration: none;
}

.no-orders .nav-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.3),
        transparent
    );
    transition: left 0.6s ease;
}

.no-orders .nav-btn:hover::before {
    left: 100%;
}

.no-orders .nav-btn:hover {
    background: linear-gradient(135deg, var(--accent-red-hover) 0%, #c40710 100%);
    transform: translateY(-4px) scale(1.02);
    box-shadow:
        0 18px 45px rgba(229, 9, 20, 0.6),
        0 0 0 6px rgba(229, 9, 20, 0.25);
    border-color: rgba(255, 255, 255, 0.35);
    color: #ffffff !important;
}

.no-orders .nav-btn:active {
    transform: translateY(-1px) scale(0.99);
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
    background: rgba(229, 9, 20, 0.6);
}

/* ===== Selection Highlight ===== */
::selection {
    background: rgba(229, 9, 20, 0.4);
    color: #ffffff;
}


/* ==========================================================================
   RESPONSIVE DESIGN (TABLETS & MOBILE)
   ========================================================================== */

@media (max-width: 900px) {
    .navbar {
        flex-direction: column;
        padding: 16px 20px;
    }

    .navbar-links {
        justify-content: center;
        width: 100%;
    }

    .history-page,
    .order-history-container {
        padding: 32px 16px 40px;
    }

    .order-card-header,
    .order-card-footer {
        padding-left: 20px;
        padding-right: 20px;
    }
}

@media (max-width: 650px) {
    .navbar {
        padding: 14px;
    }

    .navbar-links {
        flex-direction: column;
        align-items: stretch;
        width: 100%;
    }

    .nav-btn {
        width: 100%;
        justify-content: center;
    }

    .history-page,
    .order-history-container {
        padding: 24px 12px 36px;
    }

    .history-page h2,
    .order-history-container h2 {
        font-size: 26px;
        letter-spacing: 0.04em;
    }

    /* Stack header & footer on small screens */
    .order-card-header,
    .order-card-footer {
        flex-direction: column;
        align-items: flex-start;
        gap: 12px;
    }

    .order-grand-total {
        align-items: flex-start;
        text-align: left;
    }

    .order-details-btn {
        width: 100%;
        justify-content: center;
    }

    .no-orders {
        padding: 44px 20px;
        min-height: 55vh;
    }

    .no-orders-icon {
        width: 90px;
        height: 90px;
        font-size: 42px;
    }

    .no-orders h3 {
        font-size: 24px;
    }

    .no-orders p {
        font-size: 14.5px;
    }

    .no-orders .nav-btn {
        width: 100%;
        padding: 14px 24px;
        font-size: 14px;
    }
}

@media (max-width: 400px) {
    .order-card-header,
    .order-card-footer {
        padding-left: 16px;
        padding-right: 16px;
    }

    .order-grand-total {
        font-size: 19px;
    }
}

</style>
<body>

<!-- ================= NAVBAR ================= -->
<nav class="navbar">

    <a href="home" class="navbar-brand">
        🍔 Foodie Store
    </a>

    <ul class="navbar-links">

        <li>
            <a href="home" class="nav-btn">
                Home
            </a>
        </li>

        <li>
            <a href="cart.jsp" class="nav-btn">
                Cart
            </a>
        </li>

        <li>
            <a href="orderHistory" class="nav-btn active">
                Order History
            </a>
        </li>

        <li>
            <a href="LogoutServlet" class="nav-btn logout">
                Logout
            </a>
        </li>

    </ul>

</nav>


<!-- ================= ORDER HISTORY ================= -->

<div class="order-history-container">

    <h2>📦 Order History</h2>

    <%
        List<Orders> orders =
                (List<Orders>) request.getAttribute("order");

        if (orders != null && !orders.isEmpty()) {

            for (Orders order : orders) {
    %>


    <!-- ================= ORDER CARD ================= -->

    <div class="order-card">

        <div class="order-card-header">

            <div class="order-id-block">

                <span class="order-id">
                    Restaurant : <%= order.getResturantName() %>
                </span>

                <span class="order-date">
                    Placed on <%= order.getOrder_date() %>
                </span>

            </div>

            <span class="order-status">
                Delivered
            </span>

        </div>


        <div class="order-card-footer">

            <div class="order-payment-mode">

                Paid via
                <span>
                    <%= order.getPayment_mode() %>
                </span>

            </div>


            <a href="orderDetails?orderId=<%= order.getOrder_id() %>"
               class="order-details-btn">

                📋 Order Details

            </a>


            <div class="order-grand-total">

                <span>Grand Total</span>

                ₹<%= order.getTotal_amount() %>

            </div>

        </div>

    </div>


    <%
            }

        } else {
    %>


    <!-- ================= NO ORDERS ================= -->

    <div class="no-orders">

        <div class="no-orders-icon">
            📭
        </div>

        <h3>No Orders Yet</h3>

        <p>
            You haven't placed any orders yet.<br>
            Discover amazing restaurants and order your favourite food.
        </p>

        <a href="home" class="nav-btn">
            🍽 Browse Restaurants
        </a>

    </div>


    <%
        }
    %>

</div>

</body>
</html>
