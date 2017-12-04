<%@page import="shop.dao.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.models.Cart"%>
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
	String cat_id = "";
	if(request.getParameter("cat_id")!=null){
		cat_id = request.getParameter("cat_id");
	}
	Cart cart = (Cart) session.getAttribute("cart");
	if(cart==null){
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
	int pages =0, fisrtResult=0, maxResult=0,total = 0;
	if(request.getParameter("pages")!=null){
		pages = Integer.parseInt(request.getParameter("pages"));
	}
	
	total = ProductDAO.countProductByCat(Long.parseLong(cat_id));
	
	if(total<=12){
		fisrtResult = 0;
		maxResult = total;
	}
	else{
		fisrtResult = (pages - 1) * 12;
		maxResult = 12;
	}
	ArrayList<Product> listPro = ProductDAO.getProductNav(Long.parseLong(cat_id), fisrtResult, maxResult);
	
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
			<div class="content">
				<div class="content-top">
					<br>
					<h3 class="future"><%= CategoryDAO.getNamebyId(Long.parseLong(cat_id)) %></h3>
					<div class="content-top-in">
						<div class="row">
						<% for(Product pro : listPro){ %>
							<div class="col-md-3 md-col">
							<div class="col-md">
								<a href="/ShopOnline/detail.jsp?id_pro=<%= pro.getPro_id() %>"><img height="200" src="images/<%= pro.getPro_image() %>" alt="" /></a>	
								<div class="top-content">
									<h5><a href="detail.jsp?id_pro=<%= pro.getPro_id() %>"><%= pro.getPro_name() %></a></h5>
									<div class="white">
										<a href="/ShopOnline/CartServlet?command=plus&id_pro=<%= pro.getPro_id() %>&cat_id=<%= request.getParameter("cat_id") %>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
										<p class="dollar"><span class="in-dollar">$</span><%= pro.getPrice() %></span></p>
										<div class="clearfix"></div>
									</div>
								</div>							
							</div>
						</div>
						<% } %>
						</div>
					<div class="clearfix"></div>
					</div>
					<ul class="start">
					<%for(int i =1 ;i<=Math.ceil(total/12.0);i++){ 
						if(Math.ceil(total/12.0)>1){
					%>
					<li class="arrow"><a href="products.jsp?cat_id=<%= cat_id %>&pages=<%=i%>"><%= i %></a></li>
					<%}}%>
				</ul>
				</div>
				</div></div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>