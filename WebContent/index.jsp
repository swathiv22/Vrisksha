<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<%@ include file = "/includes/headJSP/head.jsp"%>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://kit.fontawesome.com/a076d05399.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>Vriksha</title>
    <style>
        .slideshow-container {
            max-width: 100%;
            position: relative;
            margin: auto;
            height: 500px;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .mySlides {
            display: none;
        }

        .fade {
            animation: fadeEffect 3s infinite;
        }

        @keyframes fadeEffect {
            0% { opacity: 0; }
            25% { opacity: 1; }
            75% { opacity: 1; }
            100% { opacity: 0; }
        }

        .slideshow-container img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
		.must-haves-text{
		margin: 30px 0 0 0;
		}
        .must-have img {
            width: 100%;
            height: auto;
            padding: 0;
            margin: 0 0px;
            object-fit: cover;
            transition: transform 0.3s ease-in-out;
        }

        .must-have img:hover {
            transform: scale(1.05);
        }

        .must-have p {
            font-size: 1.1em;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }

        .must-have .col-md-3, .must-have .col-sm-6 {
            margin-bottom: 20px;
        }

        .must-have .image-container {
            width: 100%;
            height: 250px; /* Fixed height for all images */
            overflow: hidden;
        }
    </style>
</head>
<body>
	<%@ include file = "/includes/headJSP/header.jsp"%>
	<div class = "homepage"style="margin-top:10px;width:auto">
        <img src="https://www.gharjunction.com/img/blog/296.jpg" style="height:500px;width:100%;">
	</div>
	<!-- <div class="slideshow-container">
    <div class="mySlides fade">
        <img src="https://i0.wp.com/boomerecocrusader.com/wp-content/uploads/2020/12/The-surprising-health-benefits-of-house-plants.png?resize=1160%2C628&ssl=1" alt="Plant Image 1">
    </div>

    <div class="mySlides fade">
        <img src="https://startupbiz.co.zw/wp-content/uploads/2022/08/Indoor-plant-selling-business-idea-for-Zimbabwe.webp" alt="Plant Image 2">
    </div>

    <div class="mySlides fade">
        <img src="https://cdn.shopify.com/s/files/1/0579/7924/0580/files/monsoonPlanters.jpg?v=1718193530" alt="Plant Image 3">
    </div>
</div> -->
<!-- Must haves Section -->
<div class="must-haves-text">
<h1 class="text-center"><b>Must haves</b></h1></div>
<br>
<div class="container"style="padding-top:0;">
    <div class="row must-have">
        <div class="col-md-3 col-sm-6">
            <div class="image-container">
            <a href="hangingPlantsProductList.jsp?bestSelling=true">
                <img src="https://cdn.shopify.com/s/files/1/0507/3754/5401/t/1/assets/P1496_LOL_preset_ftd-mx-tile-wide-lv-new.jpeg?v=1674658505&width=1920" alt="Best Selling Plant">
            </a>
            </div>
            <p>Best Selling Plants</p>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="image-container">
                <a href="hangingPlantsProductList.jsp?cat=FloweringPlants">
                <img src="https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-g-african-marigold-orange-plant-153227_250x250.jpg?v=1679749014" alt="Flowering Image">
                </a>
            </div>
            <p>Flowering Plants</p>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="image-container">
            <a href="hangingPlantsProductList.jsp?cat=HangingPlants">
                <img src="https://nurserylive.com/cdn/shop/products/nurserylive-combo-packs-plants-4-money-plants-in-hanging-baskets-16969034170508_512x512.jpg?v=1634208336" alt="Hanging Plants">
            </a>
            </div>
            <p>Hanging Plants</p>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="image-container">
            <a href="hangingPlantsProductList.jsp?cat=AirPurifierPlants">
                <img src="https://hips.hearstapps.com/hmg-prod/images/calathea-cv-sanderiana-in-a-black-pot-white-royalty-free-image-1661185273.jpg?crop=0.665xw:1.00xh;0.257xw,0&resize=980:*" alt="Air Purifying Plants">
            </a>
            </div>
            <p>Air Purifying Plants</p>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="image-container"> 
                <img src="https://vijayaquarium.com/wp-content/uploads/2024/04/money-plant.jpg"alt="Money Plant">
            </div>
            <p>Money Plant</p>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="image-container">
                <img src="https://m.media-amazon.com/images/I/515pRZ7nZ1L.AC_UF1000,1000_QL80.jpg" alt="Bamboo Palm Plant">
            </div>
            <p>Bamboo Palm Plant</p>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="image-container">
                <img src="https://5.imimg.com/data5/SELLER/Default/2023/10/353694766/SA/PL/QL/199530520/mini-jade-plant-1000x1000.jpg" alt="Jade Plant Mini">
            </div>
            <p>Jade Plant Mini</p>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="image-container">
                <img src="https://static.tnn.in/photo/104440051/104440051.jpg" alt="Cactus">
            </div>
            <p>Christmas Cactus</p>
        </div>
    </div>
</div>
	
	
	
	
	
	
	
	
	
	
	<script>
	let slideIndex = 0;
    showSlides();

    function showSlides() {
        let slides = document.getElementsByClassName("mySlides");

        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }

        slideIndex++;

        if (slideIndex > slides.length) {
            slideIndex = 1;
        }

        slides[slideIndex - 1].style.display = "block";
        setTimeout(showSlides, 3000);
    }
    
    document.addEventListener('DOMContentLoaded', function() {
        const deliveryLocationBtn = document.getElementById('deliveryLocationBtn');
        const selectedCity = localStorage.getItem('selectedCity');

        if (selectedCity) {
            deliveryLocationBtn.textContent = selectedCity;
        } else {
            deliveryLocationBtn.textContent = 'Select City';
        }
    });
</script>
</body>

</html>