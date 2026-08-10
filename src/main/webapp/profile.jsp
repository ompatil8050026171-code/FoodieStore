<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.FoodieStore.Model.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile - Foodie Store</title>

<link rel="stylesheet" href="profile.css">

<script>
function enableEdit() {
	document.getElementById("name").readOnly = false;
	document.getElementById("email").readOnly = false;
	document.getElementById("phone").readOnly = false;
	document.getElementById("address").readOnly = false;
	document.getElementById("password").readOnly = false;

	document.getElementById("editBtn").style.display = "none";
	document.getElementById("updateBtn").style.display = "inline-flex";

	// Highlight inputs for editing
	var inputs = document.querySelectorAll(".input-group input, .input-group textarea");
	inputs.forEach(function(input) {
		input.classList.add("editing");
	});
	
	// Focus first input
	document.getElementById("name").focus();
}

function togglePasswordVisibility() {
	var pwdInput = document.getElementById("password");
	var pwdIcon = document.getElementById("pwdToggleIcon");
	if (pwdInput.type === "password") {
		pwdInput.type = "text";
		pwdIcon.innerText = "👁️";
	} else {
		pwdInput.type = "password";
		pwdIcon.innerText = "🔒";
	}
}

function closeToast() {
	var toast = document.getElementById("hyperToastNotice");
	if (toast) {
		toast.classList.add("dismissing");
		setTimeout(function() {
			toast.remove();
		}, 400);
	}
}

// Auto dismiss hyper toast after 4.5 seconds
document.addEventListener("DOMContentLoaded", function() {
	var toast = document.getElementById("hyperToastNotice");
	if (toast) {
		setTimeout(function() {
			closeToast();
		}, 4500);
	}
});
</script>

</head>
<style>
/* ==========================================================================
   PROFILE.CSS - HYPER CRIMSON DARK MODE (PROFILE PAGE)
   Matches home.css, menu.css, order.css, orderDetails.css & orderHistory.css
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
    --accent-red-deeper: #9f0710;
    --accent-red-glow: rgba(229, 9, 20, 0.45);
    --accent-gold: #ffb400;
    --accent-gold-glow: rgba(255, 180, 0, 0.4);

    /* Greens for success */
    --accent-green: #22c55e;
    --accent-green-dark: #16a34a;
    --accent-green-glow: rgba(34, 197, 94, 0.4);

    /* Text Colors */
    --text-white: #f5ede4;
    --text-muted: #c8b39f;
    --text-soft: #b39b91;
    --text-label: #a08d7a;

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
    /* Dark Gourmet Food Background overlay */
    background-image:
        linear-gradient(rgba(9, 7, 7, 0.84), rgba(9, 7, 7, 0.88)),
        radial-gradient(circle at 12% 15%, rgba(229, 9, 20, 0.32) 0%, transparent 45%),
        radial-gradient(circle at 88% 85%, rgba(178, 7, 16, 0.28) 0%, transparent 50%),
        url('images/bg_profile.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

body {
    background: transparent;
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

/* ===== Main Content ===== */
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

/* ===== Profile Card ===== */
.profile-card {
    background: var(--bg-card);
    border: 1px solid var(--card-border);
    border-radius: 28px;
    padding: 46px 42px;
    max-width: 560px;
    width: 100%;
    position: relative;
    overflow: hidden;
    box-shadow:
        0 30px 80px rgba(0, 0, 0, 0.7),
        0 0 0 1px rgba(229, 9, 20, 0.12);
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
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

/* Top gradient accent bar */
.profile-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 5px;
    background: linear-gradient(90deg, var(--accent-red-dark), var(--accent-red), var(--accent-gold), var(--accent-red));
    box-shadow: 0 0 24px var(--accent-red-glow);
}

/* Subtle radial glow */
.profile-card::after {
    content: '';
    position: absolute;
    top: -40%;
    left: 50%;
    transform: translateX(-50%);
    width: 340px;
    height: 340px;
    background: radial-gradient(circle, rgba(229, 9, 20, 0.09), transparent 70%);
    border-radius: 50%;
    pointer-events: none;
    z-index: 0;
}

/* ===== FIXED EMBLEM HEADER SECTION ===== */
.avatar-header-section {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-bottom: 24px;
    position: relative;
    z-index: 2;
}

.avatar-wrapper {
    position: relative;
    width: 124px;
    height: 124px;
    margin-bottom: 14px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Outer Animated Ring */
.avatar-ring {
    position: absolute;
    inset: -6px;
    border-radius: 50%;
    background: conic-gradient(from 0deg, var(--accent-red), var(--accent-gold), var(--accent-red-dark), var(--accent-red));
    animation: ringRotate 8s linear infinite;
    filter: drop-shadow(0 0 14px var(--accent-red-glow));
}

@keyframes ringRotate {
    100% { transform: rotate(360deg); }
}

.avatar-inner {
    position: relative;
    width: 100%;
    height: 100%;
    border-radius: 50%;
    overflow: hidden;
    border: 3px solid var(--bg-dark);
    background: #150c0c;
    box-shadow: inset 0 0 20px rgba(0, 0, 0, 0.8);
    display: flex;
    align-items: center;
    justify-content: center;
}

.avatar-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: var(--transition-bounce);
}

.avatar-wrapper:hover .avatar-img {
    transform: scale(1.06);
}

/* Foodie Store Project Badge */
.user-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: rgba(229, 9, 20, 0.14);
    border: 1px solid rgba(229, 9, 20, 0.4);
    color: var(--text-white);
    padding: 5px 16px;
    border-radius: 999px;
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    box-shadow: 0 0 16px var(--accent-red-glow);
    margin-top: 4px;
}

/* ===== Profile Heading ===== */
.profile-card h2 {
    text-align: center;
    font-family: var(--heading-font);
    font-size: clamp(24px, 4vw, 30px);
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    color: var(--text-white);
    margin-bottom: 4px;
    position: relative;
    z-index: 1;
}

/* Red underline accent */
.profile-card h2::after {
    content: '';
    display: block;
    width: 45px;
    height: 4px;
    margin: 10px auto 20px;
    border-radius: 99px;
    background: linear-gradient(90deg, var(--accent-red), var(--accent-gold), var(--accent-red));
    box-shadow: 0 0 14px var(--accent-red-glow);
}

/* ===== Form Layout & Fields ===== */
.profile-card form {
    text-align: left;
    position: relative;
    z-index: 1;
}

.input-group {
    margin-bottom: 20px;
}

.input-group label {
    font-family: var(--main-font);
    display: block;
    font-size: 11px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.12em;
    color: var(--text-label);
    margin-bottom: 7px;
}

.input-wrapper {
    position: relative;
    display: flex;
    align-items: center;
}

.input-icon {
    position: absolute;
    left: 16px;
    font-size: 15px;
    color: var(--accent-red);
    pointer-events: none;
    z-index: 2;
    opacity: 0.85;
    transition: var(--transition);
}

.input-group input,
.input-group textarea {
    width: 100%;
    padding: 13px 18px 13px 44px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 14px;
    font-size: 14.5px;
    outline: none;
    background: rgba(255, 255, 255, 0.04);
    color: var(--text-white);
    font-family: var(--main-font);
    font-weight: 600;
    transition: var(--transition);
}

.input-group textarea {
    resize: vertical;
    padding-top: 13px;
    line-height: 1.5;
}

/* Password Toggle Icon */
.pwd-toggle-btn {
    position: absolute;
    right: 14px;
    background: none;
    border: none;
    color: var(--text-muted);
    font-size: 15px;
    cursor: pointer;
    padding: 4px;
    transition: var(--transition);
}

.pwd-toggle-btn:hover {
    color: var(--text-white);
}

/* Readonly state */
.input-group input[readonly],
.input-group textarea[readonly] {
    color: var(--text-muted);
    background: rgba(255, 255, 255, 0.025);
    cursor: not-allowed;
    border-color: rgba(255, 255, 255, 0.06);
}

/* Editable (focus) state */
.input-group input:not([readonly]):focus,
.input-group textarea:not([readonly]):focus {
    border-color: var(--accent-red);
    background: rgba(229, 9, 20, 0.06);
    box-shadow: 0 0 0 4px rgba(229, 9, 20, 0.14), 0 0 20px rgba(229, 9, 20, 0.2);
}

.input-group input:not([readonly]):focus + .input-icon,
.input-group textarea:not([readonly]):focus ~ .input-icon {
    transform: scale(1.15);
    color: #ffffff;
}

/* Editable (not readonly) idle state — subtle highlight */
.input-group input:not([readonly]),
.input-group textarea:not([readonly]) {
    border-color: rgba(229, 9, 20, 0.35);
    background: rgba(255, 255, 255, 0.06);
    color: var(--text-white);
}

.input-group input::placeholder {
    color: var(--text-muted);
}

/* ===== Buttons ===== */
.btn-group {
    display: flex;
    gap: 14px;
    margin-top: 24px;
    flex-wrap: wrap;
    position: relative;
    z-index: 1;
}

.edit-btn,
.update-btn {
    font-family: var(--main-font);
    flex: 1;
    min-width: 150px;
    background: linear-gradient(135deg, var(--accent-red) 0%, var(--accent-red-dark) 100%);
    color: #ffffff;
    border: none;
    padding: 15px 20px;
    border-radius: 999px;
    font-size: 13px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    cursor: pointer;
    transition: var(--transition-bounce);
    box-shadow: 0 8px 24px var(--accent-red-glow);
    position: relative;
    overflow: hidden;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
}

/* Shimmer sweep */
.edit-btn::after,
.update-btn::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        90deg,
        transparent,
        rgba(255, 255, 255, 0.2),
        transparent
    );
    transition: left 0.5s ease;
}

.edit-btn:hover::after,
.update-btn:hover::after {
    left: 100%;
}

.edit-btn:hover,
.update-btn:hover {
    background: linear-gradient(135deg, var(--accent-red-hover) 0%, #d30812 100%);
    box-shadow: 0 14px 36px rgba(229, 9, 20, 0.6);
    transform: translateY(-3px);
}

.edit-btn:active,
.update-btn:active {
    transform: translateY(0);
    box-shadow: 0 6px 16px rgba(229, 9, 20, 0.3);
}

/* ===== Login Required Message ===== */
.login-message {
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
        0 30px 80px rgba(0, 0, 0, 0.6),
        0 0 0 1px rgba(229, 9, 20, 0.08);
    animation: cardPop 0.7s 0.15s cubic-bezier(0.16, 1, 0.3, 1) both;
}

/* Top gradient bar */
.login-message::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 5px;
    background: linear-gradient(90deg, var(--accent-red-dark), var(--accent-red), var(--accent-red-dark));
    box-shadow: 0 0 24px var(--accent-red-glow);
}

/* Radial glow */
.login-message::after {
    content: '';
    position: absolute;
    top: -30%;
    left: 50%;
    transform: translateX(-50%);
    width: 280px;
    height: 280px;
    background: radial-gradient(circle, rgba(229, 9, 20, 0.06), transparent 70%);
    border-radius: 50%;
    pointer-events: none;
}

.login-message b {
    font-family: var(--heading-font);
    font-size: 28px;
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    color: var(--text-white);
    display: block;
    margin-bottom: 18px;
    position: relative;
    z-index: 1;
}

.login-message .sub-text {
    font-family: var(--main-font);
    font-size: 15.5px;
    line-height: 1.8;
    color: var(--text-muted);
    position: relative;
    z-index: 1;
}

.login-message .sub-text .nav-btn {
    display: inline-flex;
    background: linear-gradient(135deg, var(--accent-red) 0%, var(--accent-red-dark) 100%);
    color: #ffffff;
    border-color: transparent;
    margin-top: 18px;
    padding: 13px 28px;
    box-shadow: 0 8px 22px var(--accent-red-glow);
}

.login-message .sub-text .nav-btn:hover {
    background: linear-gradient(135deg, var(--accent-red-hover) 0%, #d30812 100%);
    color: #ffffff;
    transform: translateY(-3px);
    box-shadow: 0 14px 32px rgba(229, 9, 20, 0.5);
}

/* ==========================================================================
   HYPER HYPER TOAST NOTIFICATIONS (NEXT-GEN FUTURISTIC DESIGN)
   ========================================================================== */

.hyper-toast {
    position: fixed;
    top: 92px;
    right: 32px;
    min-width: 360px;
    max-width: 440px;
    width: calc(100% - 48px);
    padding: 16px 20px 18px 18px;
    display: flex;
    align-items: center;
    gap: 16px;
    background: rgba(12, 6, 6, 0.94);
    border-radius: 20px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    z-index: 99999;
    overflow: hidden;
    backdrop-filter: blur(24px) saturate(1.8);
    -webkit-backdrop-filter: blur(24px) saturate(1.8);
    box-shadow:
        0 24px 60px rgba(0, 0, 0, 0.75),
        inset 0 1px 0 rgba(255, 255, 255, 0.15);
    animation:
        hyperToastEnter 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) forwards,
        hyperToastPulse 3s 0.6s ease-in-out infinite alternate;
    transition: transform 0.4s ease, opacity 0.4s ease;
}

@keyframes hyperToastEnter {
    0% {
        opacity: 0;
        transform: translateX(120%) scale(0.8) rotate(3deg);
    }
    70% {
        transform: translateX(-10px) scale(1.02) rotate(-1deg);
    }
    100% {
        opacity: 1;
        transform: translateX(0) scale(1) rotate(0deg);
    }
}

.hyper-toast.dismissing {
    animation: hyperToastExit 0.45s cubic-bezier(0.5, 0, 0.75, 0) forwards !important;
}

@keyframes hyperToastExit {
    0% {
        opacity: 1;
        transform: translateX(0) scale(1);
    }
    100% {
        opacity: 0;
        transform: translateX(120%) scale(0.85);
    }
}

/* Toast Ambient Glow Backdrop */
.toast-glow-bg {
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    pointer-events: none;
    z-index: 0;
    opacity: 0.18;
}

/* SUCCESS HYPER TOAST */
.hyper-toast.success-toast {
    border-color: rgba(34, 197, 94, 0.4);
    box-shadow:
        0 20px 50px rgba(0, 0, 0, 0.7),
        0 0 35px rgba(34, 197, 94, 0.25),
        inset 0 1px 0 rgba(34, 197, 94, 0.4);
}

.hyper-toast.success-toast .toast-glow-bg {
    background: radial-gradient(circle at 20% 50%, var(--accent-green), transparent 70%);
}

.hyper-toast.success-toast .toast-icon-wrap {
    background: linear-gradient(135deg, #22c55e, #15803d);
    box-shadow: 0 0 20px rgba(34, 197, 94, 0.5);
}

.hyper-toast.success-toast .toast-progress-bar {
    background: linear-gradient(90deg, #22c55e, #4ade80);
    box-shadow: 0 0 10px rgba(34, 197, 94, 0.8);
}

/* ERROR HYPER TOAST */
.hyper-toast.error-toast {
    border-color: rgba(229, 9, 20, 0.45);
    box-shadow:
        0 20px 50px rgba(0, 0, 0, 0.7),
        0 0 35px rgba(229, 9, 20, 0.3),
        inset 0 1px 0 rgba(229, 9, 20, 0.4);
}

.hyper-toast.error-toast .toast-glow-bg {
    background: radial-gradient(circle at 20% 50%, var(--accent-red), transparent 70%);
}

.hyper-toast.error-toast .toast-icon-wrap {
    background: linear-gradient(135deg, #e50914, #b20710);
    box-shadow: 0 0 20px rgba(229, 9, 20, 0.6);
}

.hyper-toast.error-toast .toast-progress-bar {
    background: linear-gradient(90deg, #e50914, #ff4d4d);
    box-shadow: 0 0 10px rgba(229, 9, 20, 0.8);
}

/* Icon Container & Expanding Pulse */
.toast-icon-wrap {
    position: relative;
    width: 44px;
    height: 44px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    color: #ffffff;
    font-size: 20px;
    font-weight: 900;
    z-index: 2;
}

.toast-pulse {
    position: absolute;
    inset: -4px;
    border-radius: 16px;
    border: 2px solid currentColor;
    opacity: 0.6;
    animation: toastPulseExpand 2s cubic-bezier(0, 0.2, 0.8, 1) infinite;
}

@keyframes toastPulseExpand {
    0% { transform: scale(0.9); opacity: 0.8; }
    100% { transform: scale(1.35); opacity: 0; }
}

/* Toast Text Body */
.toast-body {
    flex: 1;
    display: flex;
    flex-direction: column;
    z-index: 2;
}

.toast-title {
    font-family: var(--heading-font);
    font-size: 13px;
    font-weight: 800;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    color: var(--text-white);
    margin-bottom: 2px;
}

.toast-text {
    font-family: var(--main-font);
    font-size: 13.5px;
    font-weight: 600;
    color: var(--text-muted);
    line-height: 1.4;
}

/* Close Button */
.toast-close {
    position: relative;
    z-index: 2;
    background: rgba(255, 255, 255, 0.06);
    border: 1px solid rgba(255, 255, 255, 0.12);
    color: var(--text-muted);
    width: 28px;
    height: 28px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    font-size: 12px;
    font-weight: 700;
    transition: var(--transition-bounce);
}

.toast-close:hover {
    background: rgba(255, 255, 255, 0.2);
    color: #ffffff;
    transform: scale(1.15) rotate(90deg);
}

/* Animated Progress Bar Line */
.toast-progress-bar {
    position: absolute;
    bottom: 0;
    left: 0;
    height: 3.5px;
    width: 100%;
    border-radius: 0 0 20px 20px;
    animation: hyperProgress 4.5s linear forwards;
    z-index: 3;
}

@keyframes hyperProgress {
    from { width: 100%; }
    to { width: 0%; }
}

/* Legacy Support Toast Classes fallback */
.success-message,
.error-message {
    position: fixed;
    top: 92px;
    right: 32px;
    padding: 16px 24px;
    background: rgba(12, 6, 6, 0.94);
    border-radius: 16px;
    color: var(--text-white);
    font-family: var(--main-font);
    font-size: 14px;
    font-weight: 700;
    z-index: 9999;
    backdrop-filter: blur(20px);
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.7);
    animation: hyperToastEnter 0.55s ease forwards;
}

.success-message { border: 1px solid var(--accent-green); box-shadow: 0 0 25px rgba(34, 197, 94, 0.3); }
.error-message { border: 1px solid var(--accent-red); box-shadow: 0 0 25px rgba(229, 9, 20, 0.3); }

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

    .profile-card {
        padding: 40px 32px;
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

    .profile-card,
    .login-message {
        padding: 34px 20px;
        border-radius: 22px;
    }

    .profile-card h2 {
        font-size: 22px;
    }

    .avatar-wrapper {
        width: 104px;
        height: 104px;
    }

    .btn-group {
        flex-direction: column;
    }

    .edit-btn,
    .update-btn {
        width: 100%;
    }

    .hyper-toast {
        min-width: unset;
        width: calc(100% - 24px);
        right: 12px;
        top: 80px;
        padding: 14px 16px;
    }
}

/* ===== Responsive — Small Phones ===== */
@media (max-width: 400px) {
    .profile-card,
    .login-message {
        padding: 28px 16px;
    }

    .main-content {
        padding: 24px 10px;
    }
}

</style>

<body>

	<%
User user = (User)session.getAttribute("user");
%>

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

			<% if(user == null){ %>

			<li><a href="login.jsp" class="nav-btn">Login</a></li>
			<li><a href="register.jsp" class="nav-btn">Register</a></li>
			<li><a href="home" class="nav-btn">Restaurants</a></li>

			<% } else { %>

			<li><a href="ProfileServlet" class="nav-btn active"><%=user.getName()%></a></li>
			<li><a href="home" class="nav-btn">Home</a></li>
			<li><a href="cart.jsp" class="nav-btn">Cart</a></li>
			<li><a href="orders" class="nav-btn">Orders</a></li>
			<li><a href="LogoutServlet" class="nav-btn logout">Logout</a></li>

			<% } %>

		</ul>

	</nav>

	<!-- ===== Main Content ===== -->
	<div class="main-content">
		<%
String success = (String)session.getAttribute("success");
String error = (String)session.getAttribute("error");

if(success != null){
%>

		<div class="hyper-toast success-toast" id="hyperToastNotice">
			<div class="toast-glow-bg"></div>
			<div class="toast-icon-wrap">
				<span>✓</span>
				<div class="toast-pulse"></div>
			</div>
			<div class="toast-body">
				<span class="toast-title">Profile Updated</span> <span
					class="toast-text"><%=success%></span>
			</div>
			<button type="button" class="toast-close" onclick="closeToast()"
				aria-label="Close notification">✕</button>
			<div class="toast-progress-bar"></div>
		</div>

		<%
session.removeAttribute("success");
}

if(error != null){
%>

		<div class="hyper-toast error-toast" id="hyperToastNotice">
			<div class="toast-glow-bg"></div>
			<div class="toast-icon-wrap">
				<span>✕</span>
				<div class="toast-pulse"></div>
			</div>
			<div class="toast-body">
				<span class="toast-title">Action Failed</span> <span
					class="toast-text"><%=error%></span>
			</div>
			<button type="button" class="toast-close" onclick="closeToast()"
				aria-label="Close notification">✕</button>
			<div class="toast-progress-bar"></div>
		</div>

		<%
session.removeAttribute("error");
}
%>

		<%
if(user != null){
%>

		<div class="profile-card">

			<!-- ===== FIXED EMBLEM & PROJECT NAME BADGE ===== -->
			<div class="avatar-header-section">
				<div class="avatar-wrapper">
					<div class="avatar-ring"></div>
					<div class="avatar-inner">
						<img src="images/profile_avatar.jpg" alt="Foodie Store Emblem"
							class="avatar-img">
					</div>
				</div>
				<span class="user-badge">🍔 FOODIE STORE MEMBER</span>
			</div>

			<h2><%=user.getName()%></h2>

			<form action="ProfileServlet" method="post">

				<input type="hidden" name="id" value="<%=user.getId()%>">

				<div class="input-group">
					<label for="name">Name</label>
					<div class="input-wrapper">
						<span class="input-icon">👤</span> <input type="text" id="name"
							name="name" value="<%=user.getName()%>" readonly>
					</div>
				</div>

				<div class="input-group">
					<label for="email">Email</label>
					<div class="input-wrapper">
						<span class="input-icon">✉️</span> <input type="email" id="email"
							name="email" value="<%=user.getEmail()%>" readonly>
					</div>
				</div>

				<div class="input-group">
					<label for="phone">Phone</label>
					<div class="input-wrapper">
						<span class="input-icon">📞</span> <input type="number" id="phone"
							name="phone" value="<%=user.getPhone()%>" readonly>
					</div>
				</div>

				<div class="input-group">
					<label for="address">Address</label>
					<div class="input-wrapper">
						<span class="input-icon" style="top: 14px;">📍</span>
						<textarea id="address" name="address" rows="4" readonly><%=user.getAddress()%></textarea>
					</div>
				</div>

				

				<div class="btn-group">

					<input type="button" id="editBtn" class="edit-btn"
						value="✏️ Edit Profile" onclick="enableEdit()"> <input
						type="submit" id="updateBtn" class="update-btn"
						value="✅ Update Profile" style="display: none;">

				</div>

			</form>

		</div>

		<%
}
else{
%>

		<div class="login-message">

			<b>🔒 NOT LOGGED IN</b>

			<div class="sub-text">

				Please login to view and manage your profile 🍔<br>
				<br> <a href="login.jsp" class="nav-btn">Login</a>

			</div>

		</div>

		<%
}
%>

	</div>

</body>
</html>
