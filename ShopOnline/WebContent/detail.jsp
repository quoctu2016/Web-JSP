<%@page import="java.util.ArrayList"%>
<%@page import="shop.dao.CategoryDAO"%>
<%@page import="shop.models.Category"%>
<%@page import="shop.dao.ProductDAO"%>
<%@page import="shop.models.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>My Web</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<!--//fonts-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
				<script type="text/javascript">
					jQuery(document).ready(function($) {
						$(".scroll").click(function(event){		
							event.preventDefault();
							$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
						});
					});
				</script>
<!--slider-script-->
		<script src="js/responsiveslides.min.js"></script>
			<script>
				$(function () {
				  $("#slider1").responsiveSlides({
					auto: true,
					speed: 500,
					namespace: "callbacks",
					pager: true,
				  });
				});
			</script>
<!--//slider-script-->
<script>$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.message').fadeOut('slow', function(c){
	  		$('.message').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close1').on('click', function(c){
		$('.message1').fadeOut('slow', function(c){
	  		$('.message1').remove();
		});
	});	  
});
</script>
</head>
<body>
<%
	String id_pro = "";
	Product p = new Product();
	if(request.getParameter("id_pro")!=null){
		id_pro = request.getParameter("id_pro");
		p = ProductDAO.getProductByID(Long.parseLong(id_pro));
	}
%>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
			<div class="single">
				<div class="col-md-9 top-in-single">
					<div class="col-md-5 single-top">	
						<img class="etalage_thumb_image img-responsive" width="1080px" height="1440px" src="images/<%=p.getPro_image() %>" alt="" >
					</div>	
					<div class="col-md-7 single-top-in">
						<div class="single-para">
							<h4><%=p.getPro_name() %></h4>
							 <hr>
							<div class="para-grid">
								<span  class="add-to">$<%=p.getPrice() %></span>
								<a href="/ShopOnline/CartServlet?command=plus&id_pro=<%= p.getPro_id() %>&cat_id=<%= p.getCat_id() %>" class="hvr-shutter-in-vertical cart-to">Add to Cart</a>					
								<div class="clearfix"></div>
							 </div>
							 <hr>
						<h4 style="color: #f95a32">Description</h4>
							<p><%= p.getDescription() %></p>
							
							
						</div>
					</div>
				<div class="clearfix"> </div>
				<div class="content-top-in">
						<% for(Product p3 : ProductDAO.getTop3Lastest()){ %>
						<div class="col-md-4 top-single">
							<div class="col-md">
								<a href="/ShopOnline/detail.jsp?id_pro=<%= p3.getPro_id() %>"><img height="200"  src="images/<%= p3.getPro_image() %>" alt="" /></a>	
								<div class="top-content">
									<h5><a href="detail.jsp?id_pro=<%= p3.getPro_id() %>"><%= p3.getPro_name() %></a></h5>
									<div class="white">
										<a href="/ShopOnline/CartServlet?command=plus&id_pro=<%= p3.getPro_id() %>&cat_id=<%= p3.getCat_id() %>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
										<p class="dollar"><span class="in-dollar">$<%= p3.getPrice() %></span></p>
										<div class="clearfix"></div>
									</div>
								</div>							
							</div>
						</div>
						<%} %>
						
					<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="single-bottom">
						<h4>Categories</h4>
						<ul>
						<% for(Category cat : CategoryDAO.getCategory()){ %>
						<li><a href="/ShopOnline/products.jsp?cat_id=<%= cat.getCat_id() %>&pages=1"><i> </i><%= cat.getCat_name() %></a></li>
						<%} %>
						</ul>
					</div>
					
				</div>
				</div>
				<div class="clearfix"> </div>
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>