<%@page import="java.text.DecimalFormat"%>
<%@page import="model.*"%>
<%@page import="plantsPackage.HangingPlantsDbCon"%>
<%@page import="plantsPackage.HangingPlantProductsDAO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);

	OrderDao orderDao = new OrderDao(HangingPlantsDbCon.getConnection());
	List<Order> orders = orderDao.getAllOrders(); 
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/headJSP/head.jsp"%>
<title>Cart</title>
</head>
<body>
	<%@include file="/includes/headJSP/header.jsp"%>
	<div class="container">
		<div class="card-header my-3">
			<h2
				style="font-family: 'Playfair Display', cursive; font-weight: bold; color: #333; text-align: center;">
				<span style="color: #048011">Your Wishlist</span>
			</h2>
		</div>

		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					
					<!-- <th scope="col">Quantity</th> -->
					<th scope="col">Price</th>
					<th scope="col">Back to Cart</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>

				<%
					if (orders != null) {
						for (Order o : orders) {
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><%=o.getName()%></td>
					
					<!-- <td><%=o.getQunatity()%></td>  -->
					<td><%=dcf.format(o.getPrice())%></td>
					<td class="text-center"><a class="btn btn-sm btn-primary"
						style="background-color: green; border-color: green;"
						href="add-to-cart?id=<%=o.getId()%>">Add to Cart</a></td>
					<td class="text-center"><a
						href="cancel-order?id=<%=o.getOrderId()%>"> <i class="fa-solid fa-trash-can" style="font-size: 30px; color : grey;"></i></a></td>



				</tr>
				<%
					}
					}
				%>

			</tbody>
		</table>
	</div>
</body>
</html>
