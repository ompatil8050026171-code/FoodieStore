<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.FoodieStore.Model.Cart,com.FoodieStore.Model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout - Foodie Store</title>

<style>
/* ==========================================================================
   CHECKOUT.CSS - CRIMSON DARK MODE UI (FOODIE LUXURY DESIGN SYSTEM)
   ========================================================================== */

/* ===== Custom Font Import ===== */
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap');
@import url('https://fonts.cdnfonts.com/css/minion-sc');

:root {
    --main-font: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Minion SC', sans-serif;
    --heading-font: 'Plus Jakarta Sans', 'Minion SC', serif;
    
    /* Crimson Dark Palette */
    --bg-dark: #0b0909;
    --bg-card: #161010;
    --bg-input: #1c1414;
    --bg-item: #1f1616;
    
    /* Crimson Accents */
    --accent-red: #e50914;
    --accent-red-hover: #ff1e27;
    --accent-red-dark: #b20710;
    --accent-red-glow: rgba(229, 9, 20, 0.4);
    
    /* Text Colors */
    --text-white: #ffffff;
    --text-muted: #a09090;
    --text-subtle: #786a6a;
    
    /* Glass & Borders */
    --glass-border: rgba(229, 9, 20, 0.25);
    --card-border: rgba(255, 255, 255, 0.08);
    
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
}

html, body {
    min-height: 100%;
    font-family: var(--main-font);
    background-color: var(--bg-dark);
    background-image: 
        radial-gradient(circle at 10% 15%, rgba(229, 9, 20, 0.22) 0%, transparent 40%),
        radial-gradient(circle at 90% 85%, rgba(178, 7, 16, 0.16) 0%, transparent 45%),
        radial-gradient(circle at 50% 50%, rgba(20, 10, 10, 0.8) 0%, transparent 80%);
    background-attachment: fixed;
    color: var(--text-white);
    overflow-x: hidden;
    line-height: 1.5;
    -webkit-font-smoothing: antialiased;
}

body {
    padding: 60px 20px 80px;
}

/* ===== Background Video ===== */
.bg-video-wrap,
.bg-overlay {
    display: none;
}

/* ===== Checkout Page Wrapper ===== */
.checkout-page {
    max-width: 1100px;
    margin: 0 auto;
    position: relative;
    z-index: 1;
    animation: fadeInPage 0.8s cubic-bezier(0.16, 1, 0.3, 1);
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

/* ===== MAIN HEADING ===== */
.checkout-page h2 {
    text-align: center;
    font-family: var(--heading-font);
    font-size: clamp(34px, 5vw, 44px);
    font-weight: 900;
    text-transform: capitalize;
    letter-spacing: -0.02em;
    margin-bottom: 40px;

    background: linear-gradient(135deg, #ffffff 30%, #ff3b30 70%, var(--accent-red) 100%);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    color: transparent;
    position: relative;
}

.checkout-page h2::after {
    content: '';
    display: block;
    width: 60px;
    height: 3px;
    background: var(--accent-red);
    margin: 12px auto 0;
    border-radius: 999px;
    box-shadow: 0 0 12px var(--accent-red-glow);
}

/* ===== Two Column Layout ===== */
.checkout-layout {
    display: grid;
    grid-template-columns: 1.3fr 1fr;
    gap: 28px;
    align-items: start;
}

/* ===== Shared Card Style ===== */
.checkout-card,
.order-card {
    background: var(--bg-card);
    border: 1px solid var(--glass-border);
    border-radius: 24px;
    box-shadow: 0 24px 60px rgba(0, 0, 0, 0.6);
    border-top: 4px solid var(--accent-red);
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
    transition: var(--transition-smooth);
}

.checkout-card:hover,
.order-card:hover {
    border-color: rgba(229, 9, 20, 0.4);
    box-shadow: 0 30px 70px rgba(0, 0, 0, 0.7), 0 0 20px rgba(229, 9, 20, 0.2);
}

/* ===== LEFT: Form Card ===== */
.checkout-card {
    padding: 40px 36px;
}

/* ===== Section Titles ===== */
.section-title {
    font-family: var(--heading-font);
    font-size: 14px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    color: #ff3b30;
    margin-bottom: 18px;
    margin-top: 32px;
    padding-bottom: 10px;
    border-bottom: 1px solid rgba(229, 9, 20, 0.3);
}

.section-title:first-of-type {
    margin-top: 0;
}

/* ===== Input Groups ===== */
.input-group {
    margin-bottom: 20px;
}

.input-group label {
    font-family: var(--main-font);
    display: block;
    font-size: 12px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.04em;
    color: var(--text-muted);
    margin-bottom: 8px;
}

.input-group input,
.input-group textarea {
    width: 100%;
    padding: 14px 18px;
    border: 1px solid rgba(255, 255, 255, 0.12);
    border-radius: 12px;
    font-size: 14.5px;
    outline: none;
    background: var(--bg-input);
    color: var(--text-white);
    font-family: var(--main-font);
    font-weight: 500;
    transition: var(--transition-smooth);
}

.input-group textarea {
    resize: vertical;
}

.input-group input::placeholder,
.input-group textarea::placeholder {
    color: var(--text-subtle);
}

.input-group input:focus,
.input-group textarea:focus {
    border-color: var(--accent-red);
    background: #221818;
    box-shadow: 0 0 0 3px rgba(229, 9, 20, 0.3);
}

/* ===== Payment Mode Options ===== */
.payment-options {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px;
    margin-bottom: 10px;
}

.payment-option {
    position: relative;
}

.payment-option input[type="radio"] {
    position: absolute;
    opacity: 0;
    width: 100%;
    height: 100%;
    margin: 0;
    cursor: pointer;
    z-index: 2;
}

.payment-option label {
    font-family: var(--main-font);
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 15px 18px;
    border: 1px solid rgba(255, 255, 255, 0.12);
    border-radius: 12px;
    background: var(--bg-input);
    font-size: 14px;
    font-weight: 700;
    color: var(--text-white);
    cursor: pointer;
    transition: var(--transition-bounce);
}

.payment-option input[type="radio"]:checked + label {
    border-color: var(--accent-red);
    background: #2a1616;
    color: #ffffff;
    box-shadow: 0 0 0 2px rgba(229, 9, 20, 0.4), 0 6px 18px rgba(229, 9, 20, 0.2);
}

.payment-option label .icon {
    font-size: 20px;
}

/* ===== Place Order Button ===== */
.place-order-btn {
    font-family: var(--main-font);
    width: 100%;
    background: linear-gradient(135deg, #e50914 0%, #b20710 100%);
    color: var(--text-white);
    border: none;
    padding: 16px 28px;
    border-radius: 999px;
    font-size: 14px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    cursor: pointer;
    margin-top: 28px;
    transition: var(--transition-bounce);
    box-shadow: 0 10px 25px var(--accent-red-glow);
    outline: none;
}

.place-order-btn:hover {
    background: linear-gradient(135deg, #ff1e27 0%, #d30812 100%);
    box-shadow: 0 16px 35px rgba(229, 9, 20, 0.6);
    transform: translateY(-2px);
    color: #ffffff;
}

.place-order-btn:active {
    transform: translateY(0);
}

/* ===== RIGHT: Order Summary Card ===== */
.order-card {
    padding: 36px 32px;
    position: sticky;
    top: 30px;
}

/* ===== SUBHEADING ===== */
.order-card h3 {
    font-family: var(--heading-font);
    font-size: 22px;
    font-weight: 800;
    color: var(--text-white);
    margin-bottom: 24px;
    position: relative;
}

.order-card h3::after {
    content: '';
    display: block;
    width: 40px;
    height: 2px;
    background: var(--accent-red);
    margin-top: 8px;
}

/* ===== Order Items Header ===== */
.order-items-header {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 0 14px 12px;
    border-bottom: 1px solid rgba(229, 9, 20, 0.3);
    margin-bottom: 14px;
}

.order-items-header span {
    font-family: var(--main-font);
    font-size: 11px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    color: #ff3b30;
}

.order-items-header .col-item {
    flex: 1;
}

.order-items-header .col-qty {
    flex-shrink: 0;
    width: 70px;
    text-align: center;
}

.order-items-header .col-total {
    flex-shrink: 0;
    width: 60px;
    text-align: right;
}

.order-items {
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-bottom: 20px;
    max-height: 320px;
    overflow-y: auto;
    padding-right: 4px;
}

.order-items::-webkit-scrollbar {
    width: 6px;
}

.order-items::-webkit-scrollbar-thumb {
    background: rgba(229, 9, 20, 0.4);
    border-radius: 10px;
}

.order-item {
    display: flex;
    align-items: center;
    gap: 12px;
    background: var(--bg-item);
    border: 1px solid var(--card-border);
    border-radius: 12px;
    padding: 12px 14px;
    transition: var(--transition-smooth);
}

.order-item:hover {
    background: #281d1d;
    transform: translateY(-1px);
}

.order-item-img {
    width: 46px;
    height: 46px;
    border-radius: 8px;
    object-fit: cover;
    flex-shrink: 0;
}

.order-item-info {
    flex: 1;
    min-width: 0;
}

.order-item-name {
    font-family: var(--main-font);
    font-size: 15px;
    font-weight: 700;
    color: var(--text-white);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.order-item-qty {
    font-family: var(--main-font);
    font-size: 12px;
    color: var(--text-muted);
    font-weight: 600;
}

.order-item-price {
    font-family: var(--main-font);
    font-size: 14px;
    font-weight: 800;
    color: #ff3b30;
    flex-shrink: 0;
    width: 60px;
    text-align: right;
    box-sizing: border-box;
}

/* ===== Bill Breakdown ===== */
.order-bill {
    border-top: 1px solid rgba(229, 9, 20, 0.3);
    padding-top: 16px;
}

.order-row {
    font-family: var(--main-font);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 8px 0;
    font-size: 14.5px;
    color: var(--text-white);
}

.order-row span:first-child {
    color: var(--text-muted);
}

/* ===== Grand Total ===== */
.order-row.total-row {
    border-top: 1px solid rgba(229, 9, 20, 0.3);
    margin-top: 8px;
    padding-top: 16px;
    font-family: var(--main-font);
    font-size: 25px;
    font-weight: 800;
    color: #ff3b30;
}

.order-row.total-row span:first-child {
    font-family: var(--main-font);
    font-weight: 800;
    text-transform: uppercase;
    font-size: 13px;
    color: var(--text-white);
}

/* ===== Quantity Badge ===== */
.order-item-qty-badge {
    font-family: var(--main-font);
    background: rgba(229, 9, 20, 0.15);
    border: 1px solid rgba(229, 9, 20, 0.3);
    color: #ff3b30;
    font-size: 12px;
    font-weight: 800;
    padding: 3px 9px;
    border-radius: 20px;
    flex-shrink: 0;
    width: 70px;
    text-align: center;
    box-sizing: border-box;
}

/* ===== Button Row ===== */
.btn-row {
    display: flex;
    gap: 14px;
    margin-top: 28px;
}

.back-to-cart-btn {
    font-family: var(--main-font);
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    background: rgba(255, 255, 255, 0.05);
    color: var(--text-white);
    border: 1.5px solid rgba(255, 255, 255, 0.2);
    padding: 16px;
    border-radius: 999px;
    font-size: 13px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    transition: var(--transition-bounce);
}

.back-to-cart-btn:hover {
    background: rgba(229, 9, 20, 0.2);
    color: var(--text-white);
    border-color: var(--accent-red);
    transform: translateY(-2px);
    box-shadow: 0 8px 22px var(--accent-red-glow);
}

.place-order-btn {
    flex: 2;
    margin-top: 0;
}

/* ===== Responsive ===== */
@media (max-width: 900px) {
    .checkout-layout {
        grid-template-columns: 1fr;
    }

    .order-card {
        position: static;
        order: -1;
    }
}

@media (max-width: 600px) {
    .checkout-card,
    .order-card {
        padding: 28px 22px;
    }

    .payment-options {
        grid-template-columns: 1fr;
    }

    .btn-row {
        flex-direction: column;
    }

    .back-to-cart-btn,
    .place-order-btn {
        width: 100%;
    }
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

/* ===== Disabled Place Order state during animation ===== */
.place-order-btn:disabled {
    opacity: 0.85;
    cursor: not-allowed;
    filter: brightness(0.95);
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

<!-- ===== Confetti Canvas (sits above everything) ===== -->
<canvas id="confettiCanvas"></canvas>

<div class="checkout-page">

    <h2>🧾 Checkout</h2>

    <div class="checkout-layout">

        <!-- ===== LEFT: Delivery + Payment Form ===== -->
        <div class="checkout-card">

            <form action="checkoutServlet" method="post" id="checkoutForm">

                <div class="section-title">Delivery Details</div>

                <div class="input-group">
                    <label for="username">Full Name</label>
                    <input type="text" id="username" name="username" placeholder="John Doe" required>
                </div>

                <div class="input-group">
                    <label for="address">Delivery Address</label>
                    <textarea id="address" name="address" rows="3" placeholder="House no, Street, City, Pincode" required></textarea>
                </div>

                <div class="input-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" placeholder="9876543210" required>
                </div>

                <div class="section-title">Payment Mode</div>

                <div class="payment-options">

                    <div class="payment-option">
                        <input type="radio" id="cod" name="paymentMode" value="COD" checked>
                        <label for="cod"><span class="icon">💵</span> Cash on Delivery</label>
                    </div>

                    <div class="payment-option">
                        <input type="radio" id="upi" name="paymentMode" value="UPI">
                        <label for="upi"><span class="icon">📱</span> UPI</label>
                    </div>

                    <div class="payment-option">
                        <input type="radio" id="card" name="paymentMode" value="CARD">
                        <label for="card"><span class="icon">💳</span> Credit / Debit Card</label>
                    </div>

                    <div class="payment-option">
                        <input type="radio" id="wallet" name="paymentMode" value="WALLET">
                        <label for="wallet"><span class="icon">👛</span> Wallet</label>
                    </div>

                </div>

					<div class="btn-row">

						<a href="cart.jsp" class="back-to-cart-btn"> ⬅ Back to Cart </a>

						<button type="submit" class="place-order-btn" id="placeOrderBtn">✅ Place
							Order</button>

					</div>


				</form>

        </div>

        <!-- ===== RIGHT: Cart Items + Bill Summary ===== -->
        <div class="order-card">

            <h3>📦 Order Details</h3>

			<!-- ===== Header Row ===== -->
			<div class="order-items-header">
				<span class="col-item">Item</span>
				<span class="col-qty">Qty</span>
				<span class="col-total">Total</span>
			</div>

            <div class="order-items">
				<%
				double grandTotal=0;
				Cart cart=(Cart)session.getAttribute("cart");
				if(cart!=null && !cart.getItems().isEmpty())
				{
					for(CartItem items : cart.getItems().values())
					{
				%>	
				
                <div class="order-item">
	    				<div class="order-item-info">
      					  <div class="order-item-name"><%=items.getName() %></div>
      						  <div class="order-item-qty">₹<%=items.getPrice() %></div>
   			 	</div>
   			 	<span class="order-item-qty-badge"><%=items.getQty() %></span>
   			 <div class="order-item-price">₹<%=items.getTotalPrice() %></div>
		</div>
			<%
			 	grandTotal=items.getTotalPrice()+grandTotal;
					}
				}
				 grandTotal=grandTotal+30+12;
				 
				 session.setAttribute("grandTotal", grandTotal);
				%>
                <div class="order-row">
                    <span>Delivery Fee</span>
                    <span>₹ 30</span>
                </div>

                <div class="order-row">
                    <span>Taxes & Charges</span>
                    <span>₹ 12</span>
                </div>
				
                <div class="order-row total-row">
                    <span>Grand Total</span>
                    <span>₹<%=grandTotal %></span>
                </div>

            </div>

        </div>

    </div>

</div>

<script>
(function () {

    var canvas = document.getElementById('confettiCanvas');
    var ctx = canvas.getContext('2d');
    var form = document.getElementById('checkoutForm');
    var btn = document.getElementById('placeOrderBtn');

    function resizeCanvas() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }
    resizeCanvas();
    window.addEventListener('resize', resizeCanvas);

    var colors = ['#e0392b', '#f5821f', '#f2b90f', '#ffffff', '#3f7a37', '#b5342a'];
    var particles = [];
    var gravity = 0.14;
    var animationId = null;

    function randomBetween(min, max) {
        return Math.random() * (max - min) + min;
    }

    function createParticle(x, y, angle, speed) {
        var isRect = Math.random() > 0.5;
        return {
            x: x,
            y: y,
            vx: Math.cos(angle) * speed,
            vy: Math.sin(angle) * speed,
            size: randomBetween(6, 12),
            color: colors[Math.floor(Math.random() * colors.length)],
            rotation: randomBetween(0, 360),
            rotationSpeed: randomBetween(-5, 5),
            shape: isRect ? 'rect' : 'circle',
            opacity: 1,
            drag: randomBetween(0.985, 0.995)
        };
    }

    function fireCannon(originX, originY, directionAngle, count) {
        for (var i = 0; i < count; i++) {
            var spread = randomBetween(-0.5, 0.5);
            var angle = directionAngle + spread;
            var speed = randomBetween(7, 12);
            particles.push(createParticle(originX, originY, angle, speed));
        }
    }

    function updateParticles() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        for (var i = particles.length - 1; i >= 0; i--) {
            var p = particles[i];

            p.vx *= p.drag;
            p.vy += gravity;
            p.x += p.vx;
            p.y += p.vy;
            p.rotation += p.rotationSpeed;

            if (p.y > canvas.height + 40) {
                p.opacity -= 0.015;
            }

            ctx.save();
            ctx.translate(p.x, p.y);
            ctx.rotate((p.rotation * Math.PI) / 180);
            ctx.globalAlpha = Math.max(p.opacity, 0);
            ctx.fillStyle = p.color;

            if (p.shape === 'rect') {
                ctx.fillRect(-p.size / 2, -p.size / 4, p.size, p.size / 2);
            } else {
                ctx.beginPath();
                ctx.arc(0, 0, p.size / 2, 0, Math.PI * 2);
                ctx.fill();
            }

            ctx.restore();

            if (p.opacity <= 0 || p.y > canvas.height + 200) {
                particles.splice(i, 1);
            }
        }

        if (particles.length > 0) {
            animationId = requestAnimationFrame(updateParticles);
        } else {
            animationId = null;
        }
    }

    function launchBlasters() {
        var leftX = 0;
        var rightX = canvas.width;
        var originY = canvas.height;

        // Left cannon fires up-right
        fireCannon(leftX, originY, -Math.PI / 3.2, 60);
        // Right cannon fires up-left
        fireCannon(rightX, originY, -Math.PI + Math.PI / 3.2, 60);

        // Second burst slightly delayed for a fuller effect
        setTimeout(function () {
            fireCannon(leftX, originY, -Math.PI / 2.6, 45);
            fireCannon(rightX, originY, -Math.PI + Math.PI / 2.6, 45);
        }, 300);

        if (!animationId) {
            animationId = requestAnimationFrame(updateParticles);
        }
    }

    form.addEventListener('submit', function (e) {
        e.preventDefault();

        btn.disabled = true;
        btn.textContent = '🎉 Placing Order...';

        launchBlasters();

        setTimeout(function () {
            form.submit();
        }, 2400);
    });

})();
</script>

</body>
</html> 