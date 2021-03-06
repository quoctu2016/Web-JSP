<%@page import="shop.models.User"%>
<%@page import="shop.dao.ProductDAO"%>
<%@page import="shop.models.Product"%>
<%@page import="shop.dao.CategoryDAO"%>
<%@page import="shop.models.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<% 
	String error = "";
	String id_pro = "";
	if(session.getAttribute("error")!=null){
		error = (String) session.getAttribute("error");
		session.setAttribute("error","");
	}
	if(request.getParameter("id_pro")!=null){
		id_pro = request.getParameter("id_pro");
	}
	Product pro = ProductDAO.getProductByID(Long.parseLong(id_pro));
	User user = null;
	if(session.getAttribute("username")==null){
		response.sendRedirect("/ShopOnline/index.jsp");
	}
%>
	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>

		<div id="page-wrapper" style="min-height: 500px;">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h2>Update Product</h2>
						<h4 style="color: red"><%= error %></h4>
						<div class="table-responsive">
							<form action="/ShopOnline/ManagerProServlet" method="post" enctype="multipart/form-data">
							<div class="input-group input-group-lg">
								<span class="input-group-addon text-pro" id="sizing-addon1">Name
									Product</span>
									 <input type="text" value="<%=pro.getPro_name() %>" class="form-control"
									placeholder="Name Product" name="pro_name" aria-describedby="sizing-addon1">
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-addon" id="sizing-addon1">Type
									Category</span> 
									<select name="cat_id" class="form-control" >
										<% for(Category cat : CategoryDAO.getCategory()){ %>
										<option value="<%= cat.getCat_id()%>" <% if(pro.getCat_id()==cat.getCat_id()){out.print("selected");} %> ><%= cat.getCat_name() %></option>
										<% } %>
									</select>
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-addon" id="sizing-addon1">$
								</span> <input type="number" class="form-control" value="<%=pro.getPrice() %>" min="0" placeholder="Price" name="price" aria-describedby="sizing-addon1">
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-addon" id="sizing-addon1">Description</span> 
									<textarea class="form-control" placeholder="Description" name="description"><%= pro.getDescription().trim() %></textarea>
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-addon" id="sizing-addon1">Image</span> 
									<input class="form-control" type="file" value="<%= pro.getPro_image() %>" id="fileInput" name="pro_image">
							</div>
							<p></p>
							<input type="hidden" name="command" value="update">
							<input type="hidden" name="id_pro" value="<%= id_pro%>">
							<img src="/ShopOnline/images/<%=pro.getPro_image() %>" width="200" height="150" class="img-rounded" alt="Cinque Terre">
							<br>
							<button type="submit" class="btn btn-primary">Save product</button>
							</form>
							<p></p>
							<p></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		document.getElementById('fileInput').onchange = function () {
			var file = this.value;
			file = file.replace(/^.*\\/, "");
			var element = document.getElementById("name_img");
			element.innerHTML = file;
			};
		</script>
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
</body>
</html>