<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="com.FoodieStore.Model.Cart,com.FoodieStore.Model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart- Foodie Store</title>
</head>
<style>
/* ==========================================================================
   CART.CSS - CRIMSON DARK MODE UI (FOODIE LUXURY DESIGN SYSTEM)
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
    --bg-item: #1f1616;
    --bg-item-hover: #281d1d;
    --bg-header: #120c0c;
    
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
    --item-border: rgba(255, 255, 255, 0.06);
    
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

.bg-video-wrap,
.bg-overlay {
    display: none;
}

body {
    padding: 50px 18px 80px;
}

.cart-page {
    max-width: 960px;
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
.cart-page h2 {
    text-align: center;
    font-family: var(--heading-font);
    font-size: clamp(32px, 5vw, 44px);
    font-weight: 900;
    text-transform: capitalize;
    letter-spacing: -0.02em;
    margin-bottom: 32px;
    background: linear-gradient(135deg, #ffffff 30%, #ff3b30 70%, var(--accent-red) 100%);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    color: transparent;
    position: relative;
}

.cart-page h2::after {
    content: '';
    display: block;
    width: 60px;
    height: 3px;
    background: var(--accent-red);
    margin: 12px auto 0;
    border-radius: 999px;
    box-shadow: 0 0 12px var(--accent-red-glow);
}

/* ===== TABLE CONTAINER ===== */
.cart-table {
    background: var(--bg-card);
    border: 1px solid var(--glass-border);
    border-radius: 24px;
    box-shadow: 0 24px 60px rgba(0, 0, 0, 0.6);
    margin-bottom: 28px;
    overflow: hidden;
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
    transition: var(--transition-smooth);
}

.cart-table:hover {
    border-color: rgba(229, 9, 20, 0.4);
    box-shadow: 0 30px 70px rgba(0, 0, 0, 0.7), 0 0 20px rgba(229, 9, 20, 0.2);
}

/* ===== TABLE HEADER ===== */
.cart-table-header {
    display: grid;
    grid-template-columns: 2fr 1fr 1.2fr 1fr 50px;
    align-items: center;
    gap: 10px;
    padding: 22px 28px;
    background: var(--bg-header);
    border-bottom: 1px solid rgba(229, 9, 20, 0.3);
}

.cart-table-header span {
    font-family: var(--main-font);
    font-size: 12px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.12em;
    color: #ff3b30;
}

.cart-table-header span.col-name {
    text-align: left;
}

.cart-table-header span.col-price,
.cart-table-header span.col-qty,
.cart-table-header span.col-total {
    text-align: center;
}

/* ===== CART ITEM ROW ===== */
.cart-item {
    display: grid;
    grid-template-columns: 2fr 1fr 1.2fr 1fr 50px;
    align-items: center;
    gap: 10px;
    padding: 22px 28px;
    border-bottom: 1px solid var(--item-border);
    transition: var(--transition-smooth);
    background: var(--bg-item);
    position: relative;
}

.cart-item:last-child {
    border-bottom: none;
}

.cart-item:hover {
    background: var(--bg-item-hover);
    transform: translateY(-1px);
}

.cart-item::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background: var(--accent-red);
    opacity: 0;
    transition: opacity 0.25s ease;
}

.cart-item:hover::before {
    opacity: 1;
}

/* ===== ITEM NAME ===== */
.item-name {
    font-family: var(--main-font);
    font-size: 17px;
    font-weight: 800;
    color: var(--text-white);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

/* ===== PRICE & TOTAL ===== */
.item-price {
    font-family: var(--main-font);
    font-size: 15px;
    color: var(--text-muted);
    font-weight: 700;
    text-align: center;
}

.item-total {
    font-family: var(--main-font);
    font-size: 16px;
    font-weight: 800;
    color: #ff3b30;
    text-align: center;
}

/* ===== QUANTITY CONTROL ===== */
.qty-control {
    display: flex;
    align-items: center;
    justify-content: center;
    background: #120b0b;
    border-radius: 999px;
    border: 1px solid rgba(229, 9, 20, 0.35);
    overflow: hidden;
    width: fit-content;
    margin: 0 auto;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.qty-control form {
    margin: 0;
    display: flex;
    align-items: center;
}

.qty-btn {
    font-family: var(--main-font);
    width: 34px;
    height: 34px;
    border: none;
    background: transparent;
    color: #ff3b30;
    font-size: 18px;
    font-weight: 900;
    cursor: pointer;
    transition: var(--transition-bounce);
    display: flex;
    align-items: center;
    justify-content: center;
    outline: none;
}

.qty-btn:hover {
    background: var(--accent-red);
    color: #ffffff;
}

.qty-btn:active {
    transform: scale(0.85);
}

.qty-value {
    font-family: var(--main-font);
    width: 38px;
    text-align: center;
    font-size: 15px;
    font-weight: 800;
    color: var(--text-white);
}

/* ===== DELETE BUTTON ===== */
.delete-btn {
    font-family: var(--main-font);
    width: 36px;
    height: 36px;
    border-radius: 12px;
    border: 1px solid rgba(229, 9, 20, 0.35);
    background: rgba(229, 9, 20, 0.12);
    color: #ff3b30;
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
    transition: var(--transition-bounce);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    outline: none;
}

.delete-btn:hover {
    background: var(--accent-red);
    color: #ffffff;
    border-color: var(--accent-red);
    transform: scale(1.1) rotate(6deg);
    box-shadow: 0 6px 18px var(--accent-red-glow);
}

/* ===== CART FOOTER ===== */
.cart-footer {
    background: var(--bg-card);
    border: 1px solid var(--glass-border);
    border-radius: 24px;
    padding: 28px 34px;
    box-shadow: 0 24px 60px rgba(0, 0, 0, 0.6);
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 20px;
    backdrop-filter: blur(16px);
}

.add-more-btn {
    font-family: var(--main-font);
    text-decoration: none;
    color: var(--text-white);
    font-weight: 800;
    font-size: 13px;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    padding: 14px 26px;
    border: 1.5px solid rgba(255, 255, 255, 0.2);
    background: rgba(255, 255, 255, 0.05);
    border-radius: 999px;
    transition: var(--transition-bounce);
    display: inline-flex;
    align-items: center;
    justify-content: center;
}

.add-more-btn:hover {
    background: rgba(229, 9, 20, 0.2);
    color: var(--text-white);
    border-color: var(--accent-red);
    transform: translateY(-2px);
    box-shadow: 0 8px 22px var(--accent-red-glow);
}

.cart-summary {
    text-align: center;
}

.summary-label {
    font-family: var(--main-font);
    font-size: 11px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    color: var(--text-muted);
    margin-bottom: 4px;
}

.summary-value {
    font-family: var(--main-font);
    font-size: 30px;
    font-weight: 900;
    color: #ff3b30;
    letter-spacing: -0.02em;
}

.checkout-btn {
    font-family: var(--main-font);
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #e50914 0%, #b20710 100%);
    color: var(--text-white);
    font-weight: 800;
    font-size: 13.5px;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    padding: 16px 34px;
    border-radius: 999px;
    transition: var(--transition-bounce);
    box-shadow: 0 10px 25px var(--accent-red-glow);
    border: none;
}

.checkout-btn:hover {
    background: linear-gradient(135deg, #ff1e27 0%, #d30812 100%);
    transform: translateY(-2px);
    box-shadow: 0 16px 35px rgba(229, 9, 20, 0.6);
    color: #ffffff;
}

/* ===== EMPTY CART STATE ===== */
.empty-cart {
    font-family: var(--main-font);
    text-align: center;
    color: #ff3b30 !important;
    background: var(--bg-card);
    border: 1px dashed var(--glass-border);
    padding: 56px 30px;
    border-radius: 24px;
    box-shadow: 0 24px 60px rgba(0, 0, 0, 0.5);
    font-weight: 700;
    backdrop-filter: blur(16px);
}

.empty-footer {
    justify-content: center;
    text-align: center;
    background: var(--bg-card);
    border: 1px solid var(--glass-border);
    border-radius: 24px;
    padding: 28px 32px;
    box-shadow: 0 24px 60px rgba(0, 0, 0, 0.5);
    display: flex;
    margin-top: 20px;
}

.empty-footer .add-more-btn {
    margin: auto;
}

/* ===== RESPONSIVE MEDIA QUERIES ===== */
@media (max-width: 780px) {
    .cart-table-header {
        display: none;
    }

    .cart-item {
        grid-template-columns: 1fr 1fr;
        grid-template-areas:
            "name name"
            "price qty"
            "total delete";
        gap: 14px;
        padding: 20px 22px;
    }

    .item-name {
        grid-area: name;
    }

    .item-price {
        grid-area: price;
        text-align: left;
    }

    .qty-control {
        grid-area: qty;
        margin: 0 auto;
    }

    .item-total {
        grid-area: total;
        text-align: left;
    }

    .delete-btn {
        grid-area: delete;
        margin: 0 auto;
    }
}

@media (max-width: 620px) {
    .cart-footer {
        flex-direction: column;
        align-items: stretch;
        text-align: center;
    }

    .checkout-btn,
    .add-more-btn {
        width: 100%;
    }
}

</style>
<body>


<div class="bg-overlay"></div>

<div class="cart-page">

    <h2>🛒 Your Cart</h2>

    <%
        Cart cart=(Cart) session.getAttribute("cart");
        Integer restaurantId=(Integer) session.getAttribute("restaurantId");

        double grandTotal=0;

        if(cart!=null && !cart.getItems().isEmpty())
        {
    %>

    <div class="cart-table">

        <!-- ===== Header Row ===== -->
        <div class="cart-table-header">
            <span class="col-name">Name</span>
            <span class="col-price">Price</span>
            <span class="col-qty">Quantity</span>
            <span class="col-total">Item Total</span>
            <span></span>
        </div>

        <%
            for(CartItem items : cart.getItems().values()){

                grandTotal += items.getTotalPrice();
        %>

        <!-- ===== Single Cart Item Row ===== -->
        <div class="cart-item">

            <h3 class="item-name"><%= items.getName() %></h3>

            <p class="item-price">₹ <%=items.getPrice()%></p>

            <div class="qty-control">

                <form action="CartServlet" method="post">
                    <input type="hidden" name="menuId" value="<%=items.getMenuId()%>">
                    <input type="hidden" name="restaurantId" value="<%=restaurantId%>">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="quantity" value="<%=items.getQty()-1%>">
                    <button type="submit" class="qty-btn minus">−</button>
                </form>

                <span class="qty-value"><%=items.getQty()%></span>

                <form action="CartServlet" method="post">
                    <input type="hidden" name="menuId" value="<%=items.getMenuId()%>">
                    <input type="hidden" name="restaurantId" value="<%=restaurantId%>">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="quantity" value="<%=items.getQty()+1%>">
                    <button type="submit" class="qty-btn plus">+</button>
                </form>

            </div>

            <div class="item-total">
                ₹<%=items.getTotalPrice()%>
            </div>

            <form action="CartServlet" method="post">
                <input type="hidden" name="menuId" value="<%=items.getMenuId()%>">
                <input type="hidden" name="restaurantId" value="<%=restaurantId%>">
                <input type="hidden" name="action" value="delete">
                <button type="submit" class="delete-btn">🗑</button>
            </form>

        </div>

        <%
            }
        %>

    </div>

    <%
        } else {
    %>

    <h2 class="empty-cart">Your cart is empty</h2>

    <%
        }
    %>

    <div class="cart-footer <%= grandTotal==0 ? "empty-footer" : "" %>">

        <%
        if(restaurantId != null){
        %>

            <a href="menuss?restaurantId=<%=restaurantId%>" class="add-more-btn">
                ➕ Add More Items
            </a>

        <%
        } else {
        %>

            <a href="home" class="add-more-btn">
                ⬅ Back to Restaurants
            </a>

        <%
        }
        %>

        <% if(grandTotal > 0){ %>

            <div class="cart-summary">

                <p class="summary-label">Grand Total Amount</p>
                <p class="summary-value">₹ <%=grandTotal + 30 + 12%></p>

            </div>

            <a href="checkout.jsp" class="checkout-btn">
                Proceed to Checkout →
            </a>

        <% } %>

    </div>

</div>

</body>
</html>