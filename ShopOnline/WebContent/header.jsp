<%@page import="shop.models.Item"%>
<%@page import="java.util.Map"%>
<%@page import="shop.models.Cart"%>
<%@page import="shop.dao.CategoryDAO"%>
<%@page import="shop.models.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Cart cart = (Cart) session.getAttribute("cart");
if(cart==null){
	cart = new Cart();
	session.setAttribute("cart",cart);
}
%>
<div class="header">
		<div class="header-top">
			<div class="container">	
			<div class="header-top-in row">			
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.png" alt=" " ></a>
				</div>
				<div class="header-in">
					<ul class="icon1 sub-icon1">
							<% if(session.getAttribute("username")==null){ %>
							<li  ><a href="login.jsp">  LOG IN</a></li>
							<%}else{ %>
							<li  ><a href="/ShopOnline/admin">  Admin</a></li>
							<%} %>
							<li ><a href="shoppingcart.jsp" > SHOPPING CART</a></li>
							<li > <a href="checkout.jsp" >CHECKOUT</a> </li>	
							<li><div class="cart">
									<a href="#" class="cart-in"> </a>
									<span><%= cart.countItem() %></span>
								</div>
								<ul class="sub-icon1 list">
						  <h3>Recently added items<%= cart.getCartItem().size() %></h3>
						  <div class="shopping_cart">
							  <% for(Map.Entry<Long, Item> list: cart.getCartItem().entrySet()){ %>
							  <div class="cart_box">
							   	 <div class="message">
							   	     <div class="alert-close"><a href="/ShopOnline/CartServlet?command=remove&id_pro=<%= list.getValue().getProduct().getPro_id() %>"></a></div> 
					                <div class="list_img"><img src="images/<%= list.getValue().getProduct().getPro_image() %>" class="img-responsive" alt=""></div>
								    <div class="list_desc"><h4><a href="/ShopOnline/detail.jsp?id_pro=<%= list.getValue().getProduct().getPro_id()%>"><%= list.getValue().getProduct().getPro_name() %></a></h4><%= list.getValue().getQuantity()%> x<span class="actual">
		                             $<%= list.getValue().getProduct().getPrice() %></span></div>
		                              <div class="clearfix"></div>
	                              </div>
	                            </div>
	                            <%} %>
	                        </div>
	                        <div class="total">
	                        	<div class="total_left">CartSubtotal : </div>
	                        	<div class="total_right">$<%= cart.totalCart()%></div>
	                        	<div class="clearfix"> </div>
	                        </div>
                            <div class="login_buttons">
							  <div class="check_button"><a href="checkout.jsp">Check out</a></div>
							  <div class="clearfix"></div>
						    </div>
					      <div class="clearfix"></div>
						</ul>
							</li>
						</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			</div>
		</div>
		<div class="header-bottom">
		<div class="container">
			<div class="h_menu4">
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li class="active"><a href="index.jsp"><i> </i>Desktops</a></li>
					<li ><a href="#" >Category</a>
						<ul class="drop">
						<% for(Category cat : CategoryDAO.getCategory()){ %>
							<li><a href="products.jsp?cat_id=<%= cat.getCat_id()%>&pages=1"><%= cat.getCat_name() %></a></li>
							<%} %>
						</ul>
						</li>
						<li><a href="contact.jsp" >Contact </a></li>
					
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
			</div>
		</div>
		</div>
	</div>
</body>
</html>