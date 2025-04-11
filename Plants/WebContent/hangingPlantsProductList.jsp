<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="plantsPackage.HangingPlantProducts"%>
<%@ page import="plantsPackage.HangingPlantProductsDAO"%>
<%@ page import="plantsPackage.HangingPlantsDbCon"%>
<%@ page import="plantsPackage.SearchProductDAO"%>
<%@ page import="java.sql.SQLException"%>

<%
    HangingPlantProductsDAO pd = new HangingPlantProductsDAO(HangingPlantsDbCon.getConnection());
    SearchProductDAO sd = new SearchProductDAO(HangingPlantsDbCon.getConnection());
    String bestSelling = request.getParameter("bestSelling");
    String pcategory = request.getParameter("cat");
    String priceRange = request.getParameter("priceRange");
    String squery = request.getParameter("query");
    if (squery == null) {
        squery = "";
    }
    List<HangingPlantProducts> hangProd;
    if ("true".equals(bestSelling)) {
        hangProd = pd.getBestSellingHangingPlantProducts();
    } else if (squery != null && !squery.isEmpty()) {
        hangProd = sd.searchProducts(squery);
    } else {
        hangProd = pd.getAllHangingPlantProducts(pcategory, priceRange);
    }
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/includes/headJSP/head.jsp"%>
<title><%=pcategory != null ? pcategory : "Plants"%></title>
</head>
<body>
    <%@ include file="/includes/headJSP/header.jsp"%>
    <ul class="breadcrumb">
        <li><a href="index.jsp">Home > </a></li>
        <li><%=pcategory != null ? pcategory : "Plants"%></li>
    </ul>
    <div class="section-image">
        <img src="https://images.herzindagi.info/image/2023/Oct/ornamental-plants-at-home.jpg" alt="Plants">
    </div>

    <div class="container">
        <div class="price-filter">
            <form method="GET" action="hangingPlantsProductList.jsp">
                <input type="hidden" name="cat" value="<%=pcategory%>"> 
                <label for="priceRange">Filter by price:</label> 
                <select name="priceRange" id="priceRange" onchange="this.form.submit()">
                    <option value="">Select Price Range</option>
                    <option value="0-500">&#8377;0 - &#8377;500</option>
                    <option value="500-1000">&#8377;500 - &#8377;1000</option>
                    <option value="1000-1500">&#8377;1000 - &#8377;1500</option>
                    <option value="1500-2000">&#8377;1500 - &#8377;2000</option>
                    <option value="2000-999999">&#8377;2000 and above</option>
                </select>
            </form>
        </div>
        <div class="row">
            <%
                if (!hangProd.isEmpty()) {
                    for (HangingPlantProducts p : hangProd) {
            %>
            <div class="product-card">
                <div class="product-image">
                    <a href="viewProduct.jsp?id=<%=p.getPid()%>" target="_blank"> 
                        <img src="view.jsp?id=<%=p.getPid()%>" alt="PlantImage">
                    </a>
                </div>
                <div>
                    <div class="product-info">
                        <h5><%=p.getPname() != null ? p.getPname() : "No Name Available"%></h5>
                    </div>
                    <div class="rating">
                        <%
                            int rating = p.getRating();
                            for (int i = 1; i <= 5; i++) {
                                if (i <= rating) {
                        %>
                        <i class="fa fa-star"></i>
                        <%
                                } else {
                        %>
                        <i class="fa fa-star" style="color: #d3d3d3;"></i>
                        <%
                                }
                            }
                        %>
                        <span>(<%=rating%>/5)</span>
                    </div>
                    <div class="prices-div">
                        <p class="prices">
                            <span><del>&#8377;<%=p.getOriginalprice()%></del></span> 
                            <span class="discount-price">&#8377;<%=p.getDiscountprice()%></span>
                        </p>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
                    out.println("There are no products");
                }
            %>
        </div>
    </div>
</body>
</html>
