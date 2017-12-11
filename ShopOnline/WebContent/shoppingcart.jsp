<%@page import="shop.models.Item"%>
<%@page import="java.util.Map"%>
<%@page import="shop.models.Cart"%>
<%@page import="shop.dao.OrderDAO"%>
<%@page import="shop.models.Order"%>
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

	Cart cart = new Cart();
	if(session.getAttribute("cart")!=null){
		cart = (Cart) session.getAttribute("cart");
	}
	Double total = 0.0;

%>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="page-wrapper">

            <div class="container">
            <div class="row myshoppingcart">
                    <div class="col-lg-12">
                        <h2 style="margin: 20px;">Your Cart</h2>
                        <hr>
                        <div class="table-responsive">
                        <form action="CartServlet" method="post">
                        <input type="hidden" name="command" value="update" > 
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th width="50px"></th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                               	<% for(Map.Entry<Long, Item> list : cart.getCartItem().entrySet()){
                               		total = list.getValue().getQuantity() * list.getValue().getProduct().getPrice();
                               		%>
                                    <tr>
                               			
                                        <td><img alt="IMG" width="70" height="70" src="images/<%= list.getValue().getProduct().getPro_image() %>"></td>
                                        <td><%= list.getValue().getProduct().getPro_name() %></td>
                                        <td><%= list.getValue().getProduct().getPrice() %> $</td>
                                        <td><input style="width: 100%;" type="number" name="quantity" value="<%= list.getValue().getQuantity() %>">
                                        <input name="ProId" type="hidden" value="<%= list.getValue().getProduct().getPro_id() %>">
                                        </td>
                                        <td><%= total %> $</td>
                                        <td>
                                        <button type="submit">Update</button>
                                        <a href="/ShopOnline/CartServlet?command=remove&id_pro=<%= list.getValue().getProduct().getPro_id() %>"><span style="padding: 20px;font-size: 20px" class="glyphicon glyphicon-remove"></span></a>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                            </form>
                        </div>
                    </div>
                </div>
</div></div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>