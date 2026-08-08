<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foodie Store | Login</title>

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap">
    <link rel="stylesheet" href="https://fonts.cdnfonts.com/css/minion-sc">

    <!-- External Theme CSS -->
    <link rel="stylesheet" href="login.css">

</head>

<style>
/* ==========================================================================
   LOGIN.CSS - FULL PAGE 50/50 SPLIT SCREEN LAYOUT
   Matches home, menu, order, orderDetails, orderHistory, profile & register
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
    --bg-card: #0d0808;
    --bg-navbar: rgba(15, 9, 9, 0.96);

    /* Red & Gold Accents */
    --accent-red: #e50914;
    --accent-red-hover: #ff1e27;
    --accent-red-dark: #b20710;
    --accent-red-deeper: #9f0710;
    --accent-red-glow: rgba(229, 9, 20, 0.45);
    --accent-gold: #ffb400;

    /* Text Colors */
    --text-white: #f5ede4;
    --text-muted: #c8b39f;
    --text-label: #7a6956;
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
    height: 100%;
}

html, body {
    min-height: 100vh;
    font-family: var(--main-font);
    color: var(--text-white);
    overflow-x: hidden;
    background-color: var(--bg-dark);
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

body {
    background: transparent;
    min-height: 100vh;
}

/* ===== Main Outer Wrapper (Full Viewport Screen) ===== */
.page-wrapper {
    min-height: 100vh;
    width: 100vw;
    display: flex;
    align-items: stretch;
    justify-content: center;
    padding: 0;
    margin: 0;
    position: relative;
    z-index: 1;
}

/* ===== Full Page Split Container ===== */
.split-card {
    display: flex;
    width: 100%;
    min-height: 100vh;
    background: var(--bg-card);
    border-radius: 0;
    border: none;
    box-shadow: none;
    position: relative;
    overflow: hidden;
    animation: fadeIn 0.6s ease-out both;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to   { opacity: 1; }
}

/* Glowing Top Crimson Accent Line */
.split-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, var(--accent-red-dark), var(--accent-red), var(--accent-gold), var(--accent-red));
    box-shadow: 0 0 20px var(--accent-red-glow);
    z-index: 10;
}

/* ===== LEFT HERO SECTION (Burger & Fries Image) ===== */
.login-hero-left {
    flex: 1;
    position: relative;
    background: url('images/register_hero.jpg') center/cover no-repeat;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 60px 60px;
    min-height: 100vh;
    overflow: hidden;
}

/* Dark Vignette Overlay */
.hero-overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(
        180deg,
        rgba(9, 7, 7, 0.45) 0%,
        rgba(9, 7, 7, 0.65) 50%,
        rgba(13, 8, 8, 0.95) 100%
    );
    z-index: 1;
}

/* Red Glow Accent Tint */
.hero-glow-overlay {
    position: absolute;
    inset: 0;
    background: radial-gradient(
        circle at 20% 30%,
        rgba(229, 9, 20, 0.4) 0%,
        transparent 65%
    );
    z-index: 2;
    pointer-events: none;
}

.hero-content-top {
    position: relative;
    z-index: 3;
}

.brand-badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: rgba(15, 9, 9, 0.8);
    border: 1px solid var(--glass-border);
    padding: 10px 22px;
    border-radius: 999px;
    font-size: 13.5px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: var(--text-white);
    backdrop-filter: blur(12px);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
}

.hero-content-bottom {
    position: relative;
    z-index: 3;
    max-width: 520px;
}

.hero-title {
    font-family: var(--heading-font);
    font-size: clamp(32px, 3.8vw, 48px);
    font-weight: 900;
    line-height: 1.12;
    text-transform: uppercase;
    letter-spacing: 0.04em;
    color: #ffffff;
    margin-bottom: 16px;
    text-shadow: 0 4px 20px rgba(0, 0, 0, 0.9);
}

.hero-title span {
    color: var(--accent-red);
    background: linear-gradient(135deg, #ff3b45 0%, var(--accent-gold) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.hero-subtitle {
    font-size: 15.5px;
    color: var(--text-muted);
    line-height: 1.65;
    margin-bottom: 28px;
}

/* Feature Chips */
.feature-chips {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
}

.chip {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: rgba(229, 9, 20, 0.18);
    border: 1px solid rgba(229, 9, 20, 0.4);
    padding: 9px 18px;
    border-radius: 999px;
    font-size: 12.5px;
    font-weight: 800;
    color: var(--text-white);
    backdrop-filter: blur(8px);
}

.chip.gold {
    background: rgba(255, 180, 0, 0.18);
    border-color: rgba(255, 180, 0, 0.4);
    color: var(--accent-gold);
}

/* ===== RIGHT FORM SECTION (Full Height) ===== */
.login-form-right {
    flex: 1;
    padding: 60px 80px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    position: relative;
    z-index: 3;
    background: var(--bg-card);
    min-height: 100vh;
    overflow-y: auto;
}

.form-header {
    text-align: left;
    margin-bottom: 32px;
}

.form-header h1 {
    font-family: var(--heading-font);
    font-size: clamp(28px, 3.2vw, 38px);
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    color: var(--text-white);
    margin-bottom: 8px;
    display: flex;
    align-items: center;
    gap: 12px;
}

.form-header h1::after {
    content: '';
    display: block;
    width: 44px;
    height: 4px;
    border-radius: 99px;
    background: linear-gradient(90deg, var(--accent-red), var(--accent-red-dark));
    box-shadow: 0 0 14px var(--accent-red-glow);
}

.subtitle {
    font-family: var(--main-font);
    font-size: 14.5px;
    color: var(--text-muted);
    line-height: 1.6;
}

/* ===== Form Controls ===== */
.login-form-right form {
    text-align: left;
    max-width: 480px;
}

.input-group {
    margin-bottom: 22px;
}

.input-group label {
    font-family: var(--main-font);
    display: block;
    font-size: 11.5px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    color: var(--text-label);
    margin-bottom: 8px;
    transition: color 0.3s ease;
}

.input-group:focus-within label {
    color: var(--accent-red);
}

.input-group input {
    width: 100%;
    padding: 15px 18px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 14px;
    font-size: 15px;
    outline: none;
    background: rgba(255, 255, 255, 0.04);
    color: var(--text-white);
    font-family: var(--main-font);
    font-weight: 600;
    transition: var(--transition);
}

.input-group input:focus {
    border-color: var(--accent-red);
    background: rgba(229, 9, 20, 0.05);
    box-shadow: 0 0 0 4px rgba(229, 9, 20, 0.14);
}

.input-group input::placeholder {
    color: #6d5d54;
    font-weight: 500;
}

/* ===== Buttons ===== */
.login-btn {
    font-family: var(--main-font);
    width: 100%;
    background: linear-gradient(135deg, var(--accent-red) 0%, var(--accent-red-dark) 100%);
    color: #ffffff;
    border: none;
    padding: 16px 20px;
    border-radius: 999px;
    font-size: 14px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    cursor: pointer;
    margin-top: 10px;
    transition: var(--transition-bounce);
    box-shadow: 0 8px 24px var(--accent-red-glow);
    position: relative;
    overflow: hidden;
}

/* Shimmer animation */
.login-btn::after {
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

.login-btn:hover::after {
    left: 100%;
}

.login-btn:hover {
    background: linear-gradient(135deg, var(--accent-red-hover) 0%, #d30812 100%);
    box-shadow: 0 14px 36px rgba(229, 9, 20, 0.55);
    transform: translateY(-2px);
}

.login-btn:active {
    transform: translateY(0);
}

/* ===== Divider ===== */
.divider {
    font-family: var(--main-font);
    display: flex;
    align-items: center;
    text-align: center;
    color: var(--text-muted);
    font-size: 10.5px;
    font-weight: 800;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    margin: 30px 0 20px;
    max-width: 480px;
}

.divider::before,
.divider::after {
    content: "";
    flex: 1;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(229, 9, 20, 0.25), transparent);
}

.divider::before {
    margin-right: 16px;
}

.divider::after {
    margin-left: 16px;
}

/* ===== Register Text Link ===== */
.register-text {
    font-family: var(--main-font);
    font-size: 14.5px;
    color: var(--text-white);
    text-align: left;
    max-width: 480px;
}

.register-text a {
    color: var(--accent-red);
    font-weight: 800;
    text-decoration: none;
    margin-left: 4px;
    position: relative;
    transition: color 0.25s ease;
}

.register-text a::after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 0;
    height: 2px;
    background: linear-gradient(90deg, var(--accent-red), var(--accent-gold));
    border-radius: 99px;
    transition: width 0.3s cubic-bezier(0.22, 1, 0.36, 1);
}

.register-text a:hover {
    color: var(--accent-red-hover);
}

.register-text a:hover::after {
    width: 100%;
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

/* ===== Responsive — Tablet (Stack columns) ===== */
@media (max-width: 992px) {
    .split-card {
        flex-direction: column;
        min-height: auto;
    }

    .login-hero-left {
        min-height: 340px;
        padding: 40px 30px;
    }

    .hero-title {
        font-size: 28px;
        margin-bottom: 8px;
    }

    .hero-subtitle {
        display: none;
    }

    .login-form-right {
        padding: 44px 30px;
        min-height: auto;
    }

    .login-form-right form,
    .divider,
    .register-text {
        max-width: 100%;
    }
}

/* ===== Responsive — Mobile ===== */
@media (max-width: 576px) {
    .login-hero-left {
        min-height: 280px;
        padding: 30px 20px;
    }

    .login-form-right {
        padding: 32px 20px;
    }

    .form-header h1 {
        font-size: 24px;
    }
}

</style>

<body>

<div class="page-wrapper">

    <!-- Full Page Split 2-Column Card -->
    <div class="split-card">

        <!-- LEFT HERO SECTION (Burgers & Fries Visual) -->
        <div class="login-hero-left">
            <div class="hero-overlay"></div>
            <div class="hero-glow-overlay"></div>

            <!-- Top Brand Badge -->
            <div class="hero-content-top">
                <div class="brand-badge">
                    🍔 Foodie Store
                </div>
            </div>

            <!-- Bottom Content & Feature Chips -->
            <div class="hero-content-bottom">
                <h2 class="hero-title">
                    Welcome Back <span>Delicious</span> Cravings Await 🍕
                </h2>
                <p class="hero-subtitle">
                    Log in to track your orders, reorder your favorite meals, and enjoy exclusive member rewards.
                </p>

                <div class="feature-chips">
                    <div class="chip">⚡ Live Tracking</div>
                    <div class="chip gold">🔥 Member Deals</div>
                    <div class="chip">⭐ Instant Reorder</div>
                </div>
            </div>
        </div>

        <!-- RIGHT FORM SECTION -->
        <div class="login-form-right">

            <div class="form-header">
                <h1>🔓 Login Account</h1>
                <p class="subtitle">
                    Welcome Back! Login to continue your delicious journey 🚀
                </p>
            </div>

            <form action="login" method="post">
                <input type="hidden" name="redirect" value="${param.redirect}">
                <input type="hidden" name="restaurantId" value="${param.restaurantId}">

                <div class="input-group">
                    <label for="email">Email</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="name@gmail.com"
                        required>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="••••••••"
                        required>
                </div>

                <button type="submit" class="login-btn">
                    🔓 Login
                </button>
            </form>

            <div class="divider">
                OR
            </div>

            <p class="register-text">
                Don't have an account?
                <a href="register.jsp">
                    Register Now
                </a>
            </p>

        </div>

    </div>

</div>

</body>

</html>
