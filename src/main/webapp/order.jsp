<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.FoodieStore.Model.Cart"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmed - Foodie Store</title>

<style>
/* ==========================================================================
   ORDER.CSS - PREMIUM CRIMSON DARK MODE (ORDER CONFIRMATION PAGE)
   Matches home.css & menu.css theme
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
    --bg-card: #0e0808;
    --bg-card-hover: #1c1313;

    /* Red & Gold Accents */
    --accent-red: #e50914;
    --accent-red-hover: #ff1e27;
    --accent-red-dark: #b20710;
    --accent-red-deeper: #9f0710;
    --accent-red-glow: rgba(229, 9, 20, 0.45);
    --accent-gold: #ffb400;

    /* Text Colors */
    --text-white: #f5ede4;
    --text-muted: #b39b91;
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
    padding: 40px 20px;
}

/* Background video disabled in this theme */
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
    background: radial-gradient(circle, rgba(229, 9, 20, 0.2), transparent 70%);
    animation: orbDrift 20s ease-in-out infinite alternate;
}

html::after {
    width: 400px;
    height: 400px;
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

/* ===== Page Wrapper ===== */
.orders-page {
    max-width: 720px;
    margin: 0 auto;
    min-height: calc(100vh - 80px);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    z-index: 1;
    animation: pageReveal 0.9s cubic-bezier(0.16, 1, 0.3, 1) both;
}

@keyframes pageReveal {
    from {
        opacity: 0;
        transform: translateY(30px) scale(0.97);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

/* ===== Confirmation Card ===== */
.confirm-card {
    background: rgba(14, 8, 8, 0.96);
    border: 1px solid var(--card-border);
    border-radius: 28px;
    padding: 60px 48px;
    text-align: center;
    width: 100%;
    position: relative;
    overflow: hidden;
    box-shadow:
        0 30px 80px rgba(0, 0, 0, 0.6),
        0 0 0 1px rgba(229, 9, 20, 0.08);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
}

/* Top crimson accent bar — gradient with glow */
.confirm-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 5px;
    background: linear-gradient(90deg, var(--accent-red-dark), var(--accent-red), var(--accent-red-dark));
    box-shadow: 0 0 24px var(--accent-red-glow);
}

/* Subtle radial glow behind the card content */
.confirm-card::after {
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

/* ===== Confirmation Icon ===== */
.confirm-icon {
    width: 78px;
    height: 78px;
    background: linear-gradient(135deg, var(--accent-red) 0%, var(--accent-red-dark) 55%, var(--accent-red-deeper) 100%);
    color: #ffffff;
    font-size: 36px;
    font-weight: 900;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 26px;
    box-shadow:
        0 14px 32px rgba(229, 9, 20, 0.4),
        0 0 0 8px rgba(229, 9, 20, 0.08),
        0 0 0 16px rgba(229, 9, 20, 0.04);
    position: relative;
    z-index: 1;
    animation: iconPop 0.6s 0.3s cubic-bezier(0.34, 1.56, 0.64, 1) both;
}

@keyframes iconPop {
    from {
        opacity: 0;
        transform: scale(0.3) rotate(-20deg);
    }
    to {
        opacity: 1;
        transform: scale(1) rotate(0);
    }
}

/* Pulsing ring around icon */
.confirm-icon::after {
    content: '';
    position: absolute;
    inset: -12px;
    border-radius: 50%;
    border: 2px solid rgba(229, 9, 20, 0.25);
    animation: ringPulse 2.5s ease-in-out infinite;
}

@keyframes ringPulse {
    0%, 100% {
        transform: scale(1);
        opacity: 0.4;
    }
    50% {
        transform: scale(1.18);
        opacity: 0;
    }
}

/* ===== Main Heading ===== */
.confirm-card h2 {
    font-family: var(--heading-font);
    font-size: clamp(28px, 5vw, 38px);
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: var(--text-white);
    margin-bottom: 14px;
    line-height: 1.15;
    position: relative;
    z-index: 1;
    animation: textSlide 0.7s 0.45s cubic-bezier(0.16, 1, 0.3, 1) both;
}

@keyframes textSlide {
    from {
        opacity: 0;
        transform: translateY(14px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== Description Text ===== */
.confirm-card p {
    font-family: var(--main-font);
    font-size: 15.5px;
    color: var(--text-muted);
    line-height: 1.8;
    margin-bottom: 34px;
    max-width: 480px;
    margin-left: auto;
    margin-right: auto;
    position: relative;
    z-index: 1;
    animation: textSlide 0.7s 0.55s cubic-bezier(0.16, 1, 0.3, 1) both;
}

/* ===== Button Row ===== */
.confirm-btn-row {
    display: flex;
    gap: 14px;
    justify-content: center;
    flex-wrap: wrap;
    position: relative;
    z-index: 1;
    animation: textSlide 0.7s 0.65s cubic-bezier(0.16, 1, 0.3, 1) both;
}

/* ===== Shared Button Base ===== */
.confirm-btn {
    font-family: var(--main-font);
    text-decoration: none;
    padding: 15px 32px;
    border-radius: 999px;
    font-size: 13px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    transition: var(--transition-bounce);
    position: relative;
    overflow: hidden;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
}

/* ===== Primary Button ===== */
.confirm-btn.primary {
    background: linear-gradient(135deg, var(--accent-red) 0%, var(--accent-red-dark) 65%, var(--accent-red-deeper) 100%);
    color: #ffffff;
    border: none;
    box-shadow: 0 8px 24px var(--accent-red-glow);
}

/* Shimmer sweep */
.confirm-btn.primary::after {
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

.confirm-btn.primary:hover::after {
    left: 100%;
}

.confirm-btn.primary:hover {
    background: linear-gradient(135deg, var(--accent-red-hover) 0%, #d30812 100%);
    box-shadow: 0 16px 40px rgba(229, 9, 20, 0.55);
    transform: translateY(-3px);
}

.confirm-btn.primary:active {
    transform: translateY(0);
    box-shadow: 0 6px 16px rgba(229, 9, 20, 0.3);
}

/* ===== Secondary Button ===== */
.confirm-btn.secondary {
    background: rgba(255, 255, 255, 0.04);
    color: var(--text-white);
    border: 1px solid rgba(255, 255, 255, 0.12);
    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.3);
}

.confirm-btn.secondary:hover {
    background: rgba(229, 9, 20, 0.12);
    border-color: rgba(229, 9, 20, 0.45);
    color: var(--text-white);
    transform: translateY(-3px);
    box-shadow: 0 10px 28px rgba(229, 9, 20, 0.2);
}

.confirm-btn.secondary:active {
    transform: translateY(0);
}

/* ===== Confetti Canvas ===== */
#confettiCanvas {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
    z-index: 9999;
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

/* ===== Responsive — Mobile ===== */
@media (max-width: 600px) {
    body {
        padding: 24px 14px;
    }

    .confirm-card {
        padding: 42px 24px;
        border-radius: 22px;
    }

    .confirm-card h2 {
        font-size: 26px;
        letter-spacing: 0.05em;
    }

    .confirm-card p {
        font-size: 14px;
        margin-bottom: 26px;
    }

    .confirm-icon {
        width: 66px;
        height: 66px;
        font-size: 30px;
    }

    .confirm-btn-row {
        flex-direction: column;
    }

    .confirm-btn {
        text-align: center;
        width: 100%;
    }
}

/* ===== Responsive — Small Tablets ===== */
@media (max-width: 480px) {
    .confirm-card {
        padding: 36px 18px;
    }

    .confirm-card h2 {
        font-size: 22px;
    }
}

</style>

</head>
<body>

<%
String custName = request.getParameter("username");
%>

<!-- ===== Background Video ===== -->
<div class="bg-video-wrap">
    <video autoplay muted loop playsinline>
        <source src="videos/display.mp4" type="video/mp4">
    </video>
</div>
<div class="bg-overlay"></div>

<!-- ===== Confetti Canvas (sits above everything) ===== -->
<canvas id="confettiCanvas"></canvas>

<div class="orders-page">

    <div class="confirm-card">

        <div class="confirm-icon">✓</div>

        <h2>Order Confirmed!</h2>
        <p>
            Thank you<% if(custName != null && !custName.isEmpty()){ %>, <%=custName%><% } %>!
            Your order has been placed successfully. 🍽
        </p>

        <div class="confirm-btn-row">
            <a href="home" class="confirm-btn primary">🍽 Back to Restaurants</a>
            <a href="orderHistory" class="confirm-btn secondary">📦 Order History</a>
        </div>

    </div>

</div>

<script>
(function () {

    var canvas = document.getElementById('confettiCanvas');
    var ctx = canvas.getContext('2d');

    function resizeCanvas() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }
    resizeCanvas();
    window.addEventListener('resize', resizeCanvas);

    var colors = ['#e0392b', '#f5821f', '#f2b90f', '#ffffff', '#3f7a37', '#b5342a'];
    var particles = [];

    function randomBetween(min, max) {
        return Math.random() * (max - min) + min;
    }

    function createParticle() {
        var isRect = Math.random() > 0.5;
        return {
            x: randomBetween(0, canvas.width),
            y: randomBetween(-canvas.height, 0),
            size: randomBetween(6, 12),
            color: colors[Math.floor(Math.random() * colors.length)],
            rotation: randomBetween(0, 360),
            rotationSpeed: randomBetween(-4, 4),
            shape: isRect ? 'rect' : 'circle',
            speedY: randomBetween(1.4, 2.8),
            speedX: randomBetween(-0.6, 0.6),
            sway: randomBetween(0, Math.PI * 2),
            swaySpeed: randomBetween(0.01, 0.03)
        };
    }

    var particleCount = 90;
    for (var i = 0; i < particleCount; i++) {
        particles.push(createParticle());
    }

    function updateParticles() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        for (var i = 0; i < particles.length; i++) {
            var p = particles[i];

            p.sway += p.swaySpeed;
            p.y += p.speedY;
            p.x += p.speedX + Math.sin(p.sway) * 0.6;
            p.rotation += p.rotationSpeed;

            if (p.y > canvas.height + 20) {
                p.y = randomBetween(-40, -10);
                p.x = randomBetween(0, canvas.width);
            }

            if (p.x < -20) p.x = canvas.width + 20;
            if (p.x > canvas.width + 20) p.x = -20;

            ctx.save();
            ctx.translate(p.x, p.y);
            ctx.rotate((p.rotation * Math.PI) / 180);
            ctx.fillStyle = p.color;

            if (p.shape === 'rect') {
                ctx.fillRect(-p.size / 2, -p.size / 4, p.size, p.size / 2);
            } else {
                ctx.beginPath();
                ctx.arc(0, 0, p.size / 2, 0, Math.PI * 2);
                ctx.fill();
            }

            ctx.restore();
        }

        requestAnimationFrame(updateParticles);
    }

    requestAnimationFrame(updateParticles);

})();
</script>

</body>
</html>