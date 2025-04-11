<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="plantsPackage.HangingPlantProductsDAO"%>
<%@ page import="plantsPackage.HangingPlantsDbCon"%>
<%@ page import="plantsPackage.*"%>
<%@ page import="model.*"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
// Retrieve the product ID from the request
HangingPlantProductsDAO pd = new HangingPlantProductsDAO(HangingPlantsDbCon.getConnection());
String productIdStr = request.getParameter("id");

int productId = -1; // Default value if ID is not provided

if (productIdStr != null) {
    try {
        productId = Integer.parseInt(productIdStr);
    } catch (NumberFormatException e) {
        // Handle invalid number format
        out.println("Invalid product ID.");
    }
}

// Initialize variables
HangingPlantProducts product = null;
HangingPlantsDescription description = null;

// Fetch product details
if (productId != -1) {
    product = pd.getHangingPlantProductsById(productId);
    description = pd.getHangingPlantsDescriptionById(productId);
}
%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/includes/headJSP/head.jsp"%>
    <title><%= (product != null) ? product.getPname() : "Product Not Found" %></title>
    <style>
        /* Include your custom styles here */
        button.btn a {
            color: inherit; /* Use the button's text color */
            text-decoration: none; /* Remove underline */
        }

        button.btn a:hover {
            color: inherit; /* Prevent color change on hover */
            text-decoration: none; /* Ensure no underline on hover */
        }

        .buttons-descr .h-btn i {
            font-size: 2.5rem; /* Increase the size of the icon */
        }

        .h-btn i {
            margin: 0;
            padding: 0;
        }

        /* Additional styles for the added icon */
        .cart-button .fa-hand-holding-seedling {
            margin-left: 5px; /* Adjust spacing between text and icon */
        }
    </style>
</head>
<body>
    <%@ include file="/includes/headJSP/header.jsp"%>
    
    <ul class="breadcrumb">
        <li><a href="index.jsp">Home > </a></li>
        <li><a href="hangingPlantsProductList.jsp"><%= (product != null) ? product.getPname() : "Product Not Found" %></a></li>
        <li><%= (product != null) ? product.getPname() : "Product Not Found" %></li>
    </ul>
    
    <div class="container-descr">
        <div class="row">
            <% if (product != null && description != null) { %>
                <div class="product-detail-descr">
                    <div class="product-image-descr">
                        <img src="view.jsp?id=<%= product.getPid() %>" alt="<%= product.getPname() %>">
                    </div>
                    <div class="product-info-descr">
                        <h1><%= product.getPname() %></h1>
                        <div class="rating-descr">
                            <% int rating = product.getRating();
                            for (int i = 1; i <= 5; i++) { %>
                                <% if (i <= rating) { %>
                                    <i class="fa fa-star"></i>
                                <% } else { %>
                                    <i class="fa fa-star" style="color: #d3d3d3;"></i>
                                <% } %>
                            <% } %>
                            <span>(<%= rating %>/5)</span>
                        </div>
                        <div class="prices-div-descr">
                            <p class="prices-descr">
                                <span><del>&#8377;<%= product.getOriginalprice() %></del></span>
                                <span class="discount-price">&#8377;<%= product.getDiscountprice() %></span>
                            </p>
                        </div>
                        <div class="product-description-descr">
                            <p><%= description.getDescription() %></p>
                        </div>
                        
                        <div class="buttons-descr">
                            <form id="add-to-cart-form" action="add-to-cart" method="get" target="hidden_iframe">
                                <input type="hidden" name="id" value="<%= product.getPid() %>">
                                <button type="button" class="cart-button" onclick="document.getElementById('add-to-cart-form').submit();">
                                    <span class="add-to-cart">ADD TO CART</span>
                                    <span class="added">PLANT ADDED <i class="fas fa-hand-holding-seedling"></i></span>
                                    <i class="fas fa-shopping-cart"></i>
                                    <i class="fas fa-seedling"></i>
                                </button>
                            </form>
                            
                            <iframe name="hidden_iframe" style="display:none;"></iframe>
                            <div id="cart-message"></div>
                            
                            <form action="order-now" method="post">
                                <input type="hidden" name="id" value="<%= product.getPid() %>">
                                <input type="hidden" name="quantity" value="1"> <!-- Assuming default quantity is 1 -->
                                <button type="submit" class="h-btn"><i class="fa-solid fa-heart fa-2x"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            <% } else { %>
                <div class="no-product-descr">
                    <h2>Product Not Found</h2>
                    <p>Sorry, the product you are looking for is not available.</p>
                </div>
            <% } %>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cartBtn = document.querySelector('.cart-button');
        
            cartBtn.addEventListener('click', () => {
                cartBtn.classList.add('clicked');
        
                // Optional: remove the clicked class after 3 seconds
                // setTimeout(() => {
                //     cartBtn.classList.remove('clicked');
                // }, 3000);
            });
        });
    </script>
</body>
</html>
