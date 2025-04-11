<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vriksha</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

.header-top {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 5px 20px;
	background-color: #fff6f4; /* Updated background color */
}

.header-top a {
	margin: 0 10px;
	color: #149253; /* Updated text color */
	text-decoration: none;
	position: relative;
}

.header-top a::after {
	content: '|';
	position: absolute;
	right: -10px;
	color: #0F4C63; /* Updated separator color */
}

.header-top a:last-child::after {
	content: '';
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: #fff6f4; /* Updated background color */
}

.dropdown a .cart-count {
	position: absolute;
	top: -5px;
	right: -10px;
	background-color: #d9534f;
	color: #fff;
	border-radius: 50%;
	padding: 2px 5px;
	font-size: 10px;
	transition: background-color 0.3s ease;
	/* Smooth transition for badge background color */
}

.navigation {
	display: flex;
	justify-content: space-around;
	width: 100%;
	background-color: #fff6f4; /* Updated background color */
	padding: 10px 0;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Adding shadow */
	position: relative;
}

.navigation ul {
	list-style-type: none; /* Remove default list styling */
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: space-around; /* Adjust as needed */
}

.navigation li {
	position: relative;
}

.navigation li:not(:last-child)::after {
	content: '|';
	margin-left: 10px; /* Adjust the space between items */
	margin-right: 10px; /* Adjust the space between items */
	color: #149253; /* Color of the separator */
}

.navigation a {
	color: #149253; /* Updated text color */
	text-decoration: none;
	padding: 5px 10px; /* Adjust padding as needed */
	position: relative;
}

.navigation a:hover {
	color: #0F4C63; /* Color on hover */
}

.navigation a::after {
	content: '';
	position: absolute;
	left: 0;
	bottom: -10px; /* Adjust based on the distance from the text */
	width: 100%;
	height: 2px; /* Thickness of the underline */
	background-color: #0F4C63; /* Updated underline color */
	transform: scaleX(0);
	transform-origin: center;
	transition: transform 0.3s ease;
}

.navigation a:hover::after {
	transform: scaleX(1);
}

.user-options a {
	display: inline-block;
	margin: 0 12px;
	position: relative;
	color: #149253; /* Updated text color */
	transition: color 0.3s ease; /* Smooth transition for color change */
}

.user-options a:hover {
	color: #0F4C63; /* Change text color on hover */
}

.user-options a:hover .badge {
	background-color: #149253; /* Change badge background color on hover */
}

.user-options a i {
	font-size: 24px; /* Increased size */
}

.user-options .dropdown {
	position: relative;
	display: inline-block;
	margin-left: 10px; /* Adjust spacing between dropdowns */
}

.user-options .dropdown-content {
	display: none;
	position: absolute;
	background-color: #fff;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
	z-index: 1;
	top: 40px; /* Adjust the distance from the icon */
	right: 0; /* Align with the user icon */
	min-width: 180px; /* Adjust the minimum width as needed */
	border-radius: 8px; /* Rounded corners */
	overflow: hidden; /* Ensure contents don't overflow rounded corners */
	opacity: 0; /* Start with opacity set to 0 for fade-in effect */
	transition: opacity 0.3s ease; /* Fade-in effect */
}

.user-options .dropdown.open .dropdown-content {
	display: block;
	opacity: 1; /* Ensure opacity is set to 1 when visible */
}

.search-btn {
	position: relative;
}

.search {
	padding: 12px;
	width: max-content;
	display: flex;
	align-items: center;
	padding: var(- -padding);
	border-radius: 28px;
	background: #ffffff;
	transition: box-shadow 0.25s;
}

.search:focus-within {
	box-shadow: 0 0 2px rgba(0, 0, 0, 0.75);
}

.search-input {
	font-size: 16px;
	font-family: 'Lexsed', sans-serif;
	color: #333333;
	margin-left: var(- -padding);
	outline: none;
	border: none;
	width: 300px;
}

.d-btn {
	position: relative;
	font-family: 'Lexsed', sans-serif;
	font-size: 16px;
	font-weight: bold;
	padding: 12px 20px;
	background: linear-gradient(180deg, rgba(174, 215, 201, 1) 0%,
		rgba(0, 128, 96, 1) 100%);
	color: #000000;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s, transform 0.3s;
}

.d-btn:hover, .d-btn:focus {
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	transform: translateY(-2px);
}

.logo {
	display: flex;
	align-items: center;
}

.logo-img {
	height: auto;
	max-height: 60px;
	margin-right: 10px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 800px;
	z-index: 1;
	padding: 5px;
}

.dropdown-content h6 {
	font-size: 15px;
	font-weight: bold;
	color: #0F4C63;
	margin-bottom: 5px;
	padding: 4px 7px;
}

.dropdown-content a {
	color: #149253;
	font-size: 12px;
	font-weight: bold;
	padding: 4px 7px;
	text-decoration: none;
	display: block;
	margin-bottom: 5px;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	color: #0F4C63;
}

.dropdown-column {
	float: left;
	width: 25%;
	padding: 5px;
}

.dropdown-row:after {
	content: "";
	display: table;
	clear: both;
}

.hamburger-menu {
	display: none;
	font-size: 24px;
	cursor: pointer;
}

@media (max-width: 1000px) {
	.hamburger-menu {
		display: block;
	}
	.mobile-nav .navigation {
		display: none;
		flex-direction: column;
		position: absolute;
		width: 100%;
		top: 100px; /* Adjust based on header height */
		left: 0;
		background-color: #fff6f4; /* Updated background color */
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.312);
	}
	.mobile-nav .navigation ul {
		flex-direction: column;
		align-items: flex-start;
	}
	.mobile-nav .navigation li {
		width: 100%;
	}
	.header .search-btn, .header .delivery-location, .header .user-options {
		display: flex;
	}
	.header .user-options {
		display: flex;
		flex-direction: row;
	}
}

@media (max-width: 768px) {
	.mobile-nav .navigation ul {
		flex-direction: column;
		align-items: center; /* Center-align all items vertically */
	}

	.mobile-nav .navigation li {
		margin-bottom: 10px; /* Add spacing between items */
	}

	.mobile-nav .navigation li:not(:last-child)::after {
		content: none; /* Remove separators */
	}

	/* Center-align and reduce icon size */
	.user-options a {
		margin: 0 5px;
		color: #149253;
	}

	.user-options a i {
		font-size: 20px;
	}

	.logo-img {
		max-height: 50px;
		margin-right: 5px;
	}
}
</style>
</head>
<body>
	<!-- Header -->
    <div class="header-top">
        <a href="help/help.html">Help</a>

    </div>
	<div class="header">
		<div class="logo">
            <a href="index.jsp"> <img src="includes/css/logo1.jpg"
                alt="Logo" class="logo-img">
            </a>
		</div>
        <div class="search-btn">
				<form action="search-servlet" method="post">
					<div class="search">
						<span class="search-icon material-symbols-outlined">search</span>
						<input class="search-input" type="search" name="query" placeholder="Search By Plant Name">					</div>
				</form>
			</div>
		<div class="hamburger-menu" onclick="toggleMobileMenu()">&#9776;</div>
		<div class="user-options">
			<div class="dropdown">
				<a href="#" onclick="toggleDropdown(event)"><i class="fas fa-user"></i></a>
				<div class="dropdown-content">
					<a href="Register.jsp">Signup</a> <a href="login.jsp">Login</a> <a
							href="log-out">Logout</a>
					</div>
				</div>

				<div class="dropdown">
					<a href="orders.jsp"><i class="fas fa-heart" style="margin: 0; padding: 0;"></i></a>

					<div class="dropdown-content">
						<a href="orders.jsp">Wishlist</a>
					</div>
				</div>

				<div class="dropdown">
					<a href="cart.jsp"> <i class="fas fa-shopping-cart"></i> <span
						class="cart-count">${cart_list.size()}</span>
					</a>
					<div class="dropdown-content">
						<a href="cart.jsp">Cart</a>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mobile-nav">
        <nav class="navigation">
            <ul>
                <li><a href="hangingPlantsProductList.jsp?cat=HangingPlants">HANGING
                        PLANTS</a></li>
                <li><a href="hangingPlantsProductList.jsp?cat=CactusPlants">CACTUS
                        PLANTS</a></li>
                <li><a href="hangingPlantsProductList.jsp?cat=FloweringPlants">FLOWERING
                        PLANTS</a></li>
                <li><a
                    href="hangingPlantsProductList.jsp?cat=LowMaintenancePlants">LOW
                        MAINTENANCE PLANTS</a></li>
                <li><a
                    href="hangingPlantsProductList.jsp?cat=AirPurifierPlants">AIR
                        PURIFIER PLANTS</a></li>
            </ul>
        </nav>
    </div>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script>
function toggleDropdown(event) {
	event.preventDefault();
	const dropdown = event.currentTarget.closest('.dropdown');
	dropdown.classList.toggle('open');
}

function toggleMobileMenu() {
	const mobileNav = document.querySelector('.mobile-nav .navigation');
	mobileNav.style.display = mobileNav.style.display === 'flex' ? 'none' : 'flex';
}
	</script>
</body>
</html>