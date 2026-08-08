<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.FoodieStore.Model.Resturant"%>
<%
String username=(String)session.getAttribute("username");
List<Resturant> restaurants = (List<Resturant>) request.getAttribute("allresturants");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Foodie Store</title>

<style>
/* ==========================================================================
   HOME.CSS - FIXED CRIMSON DARK MODE UI (MATCHING SCREENSHOT FIXES)
   ========================================================================== */

/* ===== Custom Font Import ===== */
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap');
@import url('https://fonts.cdnfonts.com/css/minion-sc');

:root {
    --main-font: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Minion SC', sans-serif;
    --heading-font: 'Plus Jakarta Sans', 'Minion SC', serif;
    
    /* Crimson Dark Palette */
    --bg-dark: #090707;
    --bg-card: #140d0d;
    --bg-card-hover: #1c1313;
    --bg-navbar: rgba(15, 9, 9, 0.95);
    
    /* Red & Gold Accents */
    --accent-red: #e50914;
    --accent-red-hover: #ff1e27;
    --accent-red-dark: #b20710;
    --accent-red-glow: rgba(229, 9, 20, 0.45);
    --accent-gold: #ffb400;
    
    /* Text Colors */
    --text-white: #ffffff;
    --text-muted: #a09090;
    --text-subtle: #786a6a;
    
    /* Glass & Borders */
    --glass-border: rgba(229, 9, 20, 0.3);
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
    min-height: 100vh;
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
    background: none;
}

/* ===== Background Video (disabled) ===== */
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
    box-shadow: 0 16px 40px rgba(0, 0, 0, 0.6), 0 0 1px rgba(229, 9, 20, 0.3);
    border-bottom: 1px solid var(--glass-border);
    position: sticky;
    top: 0;
    z-index: 100;
    flex-wrap: wrap;
    gap: 14px;
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
}

/* ===== BRAND ===== */
.navbar-brand {
    font-family: var(--heading-font);
    font-size: 26px;
    font-weight: 900;
    text-transform: capitalize;
    letter-spacing: -0.02em;
    text-decoration: none;
    color: var(--text-white);
    display: flex;
    align-items: center;
    gap: 8px;
    transition: var(--transition-smooth);
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

.nav-btn.user-btn {
    background: rgba(255, 255, 255, 0.08);
    border-color: rgba(255, 255, 255, 0.15);
    color: #e0e0e0;
    cursor: default;
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

/* ===== Sort Dropdown Styling ===== */
.sort-form {
    display: flex;
    align-items: center;
    margin: 0;
}

.sort-dropdown {
    font-family: var(--main-font);
    padding: 9px 18px;
    border-radius: 999px;
    border: 1px solid rgba(229, 9, 20, 0.4);
    outline: none;
    font-size: 13px;
    font-weight: 700;
    color: var(--text-white);
    background: #1a1010 url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%23ffffff'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e") no-repeat right 12px center;
    background-size: 16px;
    padding-right: 36px;
    cursor: pointer;
    transition: var(--transition-bounce);
    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.4);
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}

.sort-dropdown:hover {
    border-color: var(--accent-red);
    box-shadow: 0 6px 20px var(--accent-red-glow);
    transform: translateY(-2px);
}

.sort-dropdown option {
    background: #181010;
    color: #ffffff;
    padding: 8px;
}

/* ===== Main Content Grid ===== */
.main-content {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 28px;
    padding: 40px 36px 90px;
    max-width: 1400px;
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

/* ===== Restaurant Card ===== */
.card {
    background: var(--bg-card);
    border: 1px solid var(--card-border);
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.6);
    transition: var(--transition-bounce);
    display: flex;
    flex-direction: column;
    position: relative;
}

.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 30px 60px rgba(0, 0, 0, 0.8), 0 0 25px rgba(229, 9, 20, 0.25);
    border-color: rgba(229, 9, 20, 0.4);
    background: var(--bg-card-hover);
}

/* ===== Card Image Container (Fixes logo distortion & checkerboards) ===== */
.card-image-wrap {
    position: relative;
    width: 100%;
    height: 185px;
    overflow: hidden;
    background: #ffffff;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 16px;
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
}

.card-image-wrap img {
    max-width: 100%;
    max-height: 100%;
    width: auto;
    height: auto;
    object-fit: contain;
    transition: transform 0.4s ease;
}

.card:hover .card-image-wrap img {
    transform: scale(1.08);
}

.status {
    font-family: var(--main-font);
    position: absolute;
    top: 12px;
    right: 12px;
    background: var(--accent-red);
    color: var(--text-white);
    padding: 4px 14px;
    border-radius: 999px;
    font-size: 11.5px;
    font-weight: 800;
    letter-spacing: 0.02em;
    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.35);
    z-index: 2;
}

/* ===== Card Body ===== */
.card-body {
    padding: 22px 24px 26px;
    display: flex;
    flex-direction: column;
    flex: 1;
}

/* ===== RESTAURANT NAME ===== */
.restaurant-name {
    font-family: var(--heading-font);
    font-size: 22px;
    font-weight: 800;
    color: var(--text-white);
    margin-bottom: 4px;
    line-height: 1.3;
}

.eta {
    font-family: var(--main-font);
    font-size: 12.5px;
    color: var(--text-muted);
    font-weight: 600;
    margin-bottom: 16px;
    display: flex;
    align-items: center;
    gap: 4px;
}

.detail-block {
    margin-bottom: 10px;
}

.detail-label {
    font-family: var(--main-font);
    font-size: 10.5px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: #8e8080;
    margin-bottom: 2px;
}

.detail-value {
    font-family: var(--main-font);
    font-size: 14px;
    color: #ffffff;
    line-height: 1.4;
    font-weight: 600;
    word-break: break-word;
}

.detail-value .star {
    color: var(--accent-gold);
    font-weight: 800;
}

/* ===== Menu Button (Fixes bottom cut-off) ===== */
.menu-btn {
    font-family: var(--main-font);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    background: linear-gradient(135deg, #e50914 0%, #b20710 100%);
    color: var(--text-white);
    text-align: center;
    padding: 13px 20px;
    border-radius: 999px;
    font-size: 13.5px;
    font-weight: 800;
    margin-top: auto;
    width: 100%;
    transition: var(--transition-bounce);
    box-shadow: 0 8px 24px var(--accent-red-glow);
    outline: none;
    border: none;
}

.menu-btn:hover {
    background: linear-gradient(135deg, #ff1e27 0%, #d30812 100%);
    box-shadow: 0 14px 32px rgba(229, 9, 20, 0.6);
    transform: translateY(-2px);
    color: #ffffff;
}

.menu-btn:active {
    transform: translateY(0);
}

/* ===== No Restaurants Message ===== */
main.main-content h2 {
    grid-column: 1 / -1;
    font-family: var(--heading-font);
    color: var(--text-white) !important;
    background: var(--bg-card);
    border: 1px solid var(--glass-border);
    padding: 48px 30px;
    border-radius: 20px;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.6);
    text-align: center;
    font-size: 24px;
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

    .main-content {
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        padding: 30px 18px 80px;
        gap: 20px;
    }
}

@media (max-width: 600px) {
    .card-image-wrap {
        height: 165px;
        padding: 12px;
    }

    .navbar {
        padding: 14px;
    }

    .sort-dropdown,
    .nav-btn {
        width: 100%;
    }

    .navbar-links {
        flex-direction: column;
        align-items: stretch;
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
	Object user = session.getAttribute("user");

	String sort = request.getParameter("sort");
	if (sort == null) {
		sort = "";
	}
	%>

	<nav class="navbar">

		<a href="#" class="navbar-brand"> Foodie Store </a>

		<ul class="navbar-links">

			<li><a href="index.jsp" class="nav-btn active"> Home </a></li>

			<li>

				<form action="home" method="get" class="sort-form">

					<select name="sort" class="sort-dropdown"
						onchange="this.form.submit();">

						<option value="">Sort Restaurants</option>

						<option value="nameAsc" <%=sort.equals("nameAsc") ? "selected" : ""%>>
							Name (A-Z)</option>

						<option value="nameDesc"
							<%=sort.equals("nameDesc") ? "selected" : ""%>>Name (Z-A)</option>

						

						<option value="ratingDesc"
							<%=sort.equals("ratingDesc") ? "selected" : ""%>>Rating
							(High-Low)</option>

					</select>

				</form>

			</li>

			<%
			if (user != null) {
			%>
			<li><a href="ProfileServlet" class="nav-btn"> <%=username%> </a></li>
			<li><a href="cart.jsp" class="nav-btn"> Cart </a></li>

			
			 <li><a href="orderHistory" class="nav-btn">Orders</a></li>

			<li><a href="LogoutServlet" class="nav-btn logout"> Logout </a>
			</li>

			<%
			} else {
			%>

			<li><a href="login.jsp" class="nav-btn"> Login </a></li>

			<li><a href="register.jsp" class="nav-btn"> Register </a></li>

			<%
			}
			%>

		</ul>

	</nav>

	<main class="main-content">
		<%
		if (restaurants != null && !restaurants.isEmpty()) {

			for (Resturant resturant : restaurants) {
		%>

		<article class="card">

			<div class="card-image-wrap">

				<img src="<%=resturant.getImage()%>"
					alt="<%=resturant.getResturant_name()%>"> <span
					class="status"> <%=resturant.getStatus()%>
				</span>

			</div>

			<div class="card-body">

				<h2 class="restaurant-name">
					<%=resturant.getResturant_name()%>
				</h2>

				<p class="eta">
					Estimated Time :
					<%=resturant.getETA()%>
					
				</p>

				<div class="detail-block">

					<p class="detail-label">Ratings</p>

					<p class="detail-value">
						⭐
						<%=resturant.getRatings()%>/5
					</p>

				</div>

				<div class="detail-block">

					<p class="detail-label">Address</p>

					<p class="detail-value">
						<%=resturant.getAddress()%>
					</p>

				</div>

				<div class="detail-block">

					<p class="detail-label">Email</p>

					<p class="detail-value">
						<%=resturant.getResturant_email()%>
					</p>

				</div>

				<div class="detail-block">

					<a
						href="<%=request.getContextPath()%>/menuss?restaurantId=<%=resturant.getResturant_id()%>"
						class="menu-btn"> 🍽 View Menu </a>

				</div>

			</div>

		</article>

		<%
	}
}
else{
%>
		<h2 style="color: white; text-align: center; width: 100%;">No
			Restaurants Available</h2>

		<%
}
%>

	</main>

</body>

</html>