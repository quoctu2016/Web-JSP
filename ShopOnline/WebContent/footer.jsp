<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Footer</title>
<style>
#back-to-top{
    position: fixed;
    bottom: 40px;
    right: 40px;
    background-color: #000000;
    box-shadow: 0px 5px 50px rgba(0, 0, 0, 0.64);
    color: #fff;
    display: block;
    width: 30px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    z-index: 99;
}

</style>

<script src="https://use.fontawesome.com/fa36195e80.js"></script>
</head>
<body>
		<!-- <div class="footer">
			<div class="footer-top">
				<div class="container">
					<div class="col-md-4 footer-in">
						<h4><i> </i>Suspendisse sed</h4>
						<p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam. Lorem ipsum dolor sit amet, consectetur.</p>
					</div>
					<div class="col-md-4 footer-in">
						<h4><i class="cross"> </i>Suspendisse sed</h4>
						<p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam. Lorem ipsum dolor sit amet, consectetur.</p>
					</div>
					<div class="col-md-4 footer-in">
						<h4><i class="down"> </i>Suspendisse sed</h4>
						<p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam. Lorem ipsum dolor sit amet, consectetur.</p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div> -->
			<!---->
			
			<p class="footer-class">Copyright &copy; 2017 <a href="#">MobileShop</a> </p>
			<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
					<script type="text/javascript">
					$(function(){
						$(window).scroll(function () {
						if ($(this).scrollTop() > 100) $('#toTop').fadeIn();
						else $('#toTop').fadeOut();
						});
						$('#goTop').click(function () {
						$('body,html').animate({scrollTop: 0}, 'slow');
						});
						});
					
					
					</script>
				<!-- <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a> -->
				
				<script type="text/javascript">
				$(window).scroll(function () {
				    var top=$(window).scrollTop();
				   if (top > 100) {
				     $("#back-to-top").addClass('active');
				   } else {
				     $("#back-to-top").removeClass('active');
				   }
				});
				$(document).ready(function(){
				    $("#back-to-top").click(function () {
				        $("html, body").animate({ scrollTop: 0 }, "slow");
				        return false;
				    });
				});
				</script>
				<a id="back-to-top" href="#"><i class="fa fa-angle-up"></i></a>
				

		</div>
</body>
</html>