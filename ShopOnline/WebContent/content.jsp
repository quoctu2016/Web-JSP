<%@page import="shop.dao.ProductDAO"%>
<%@page import="shop.models.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Content</title>
</head>
<body>
<div class="container">
			<div class="content">
				<div class="content-top">
					<h3 class="future">FEATURED</h3>
					<div class="content-top-in">
					<% for(Product p : ProductDAO.getTop4FromOrderDetail()){ %>
						<div class="col-md-3 md-col">
							<div class="col-md">
								<a href="detail.jsp?id_pro=<%= p.getPro_id() %>"><img height="200" src="images/<%=p.getPro_image() %>" alt="" /></a>	
								<div class="top-content">
									<h5><a href="detail.jsp?id_pro=<%= p.getPro_id() %>"><%= p.getPro_name() %></a></h5>
									<div class="white">
										<a href="/ShopOnline/CartServlet?command=plus&id_pro=<%= p.getPro_id() %>&cat_id=<%= p.getCat_id() %>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">ADD TO CART</a>
										<p class="dollar"><span class="in-dollar">$<%=p.getPrice() %></span></p>
										<div class="clearfix"></div>
									</div>

								</div>							
							</div>
						</div>
						<%} %>
					<div class="clearfix"></div>
					</div>
				</div>
				<!---->
				<div class="content-middle">
					<h3 class="future">BRANDS</h3>
					<div class="content-middle-in">
					<ul id="flexiselDemo1">			
						<li><img src="images/ap.png"/></li>
						<li><img src="images/ap1.png"/></li>
						<li><img src="images/ap2.png"/></li>
						<li><img src="images/ap3.png"/></li>
					
					</ul>
            		<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems: 4,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>

					</div>
				</div>
				<!---->
				<div class="content-bottom">
					<h3 class="future">LATEST</h3>
					<div class="content-bottom-in">
					<ul id="flexiselDemo2">
					<% for(Product p : ProductDAO.getTop8Lastest()){ %>		
						<li><div class="col-md men">
								<a href="detail.jsp?id_pro=<%= p.getPro_id() %>" class="compare-in "><img height="200" src="images/<%=p.getPro_image() %>" alt="" />
								</a>
								<div class="top-content bag">
									<h5><a href="detail.jsp?id_pro=<%= p.getPro_id() %>"><%= p.getPro_name() %></a></h5>
									<div class="white">
										<a href="/ShopOnline/CartServlet?command=plus&id_pro=<%= p.getPro_id() %>&cat_id=<%= p.getCat_id() %>" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>
										<p class="dollar"><span class="in-dollar">$<%=p.getPrice() %></span></p>
										<div class="clearfix"></div>
									</div>
								</div>							
							</div>
							</li>
							<%} %>
					</ul>
					<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo2").flexisel({
				visibleItems: 4,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
					</div>
				</div>
			</div>
		</div>
</body>
</html>