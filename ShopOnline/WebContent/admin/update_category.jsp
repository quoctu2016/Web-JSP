<%@page import="shop.models.User"%>
<%@page import="shop.dao.CategoryDAO"%>
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
	String error = "",cat_name = "",cat_id = "";
if(session.getAttribute("error")!=null){
	error = (String) session.getAttribute("error");
	session.setAttribute("error","");
}
	if(request.getParameter("cat_id")!=null){
		cat_id = request.getParameter("cat_id");
		cat_name = CategoryDAO.getNamebyId(Long.parseLong(request.getParameter("cat_id")));
	}
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
						<h2>Update Category</h2>
						
						<h4 style="color: red"><%= error %></h4>
						<div class="table-responsive">
							<form action="/ShopOnline/ManagerCatServlet" method="post">
							<div class="input-group input-group-lg">
								<span class="input-group-addon" id="sizing-addon1">Name
									Category</span> <input type="text" class="form-control"
									placeholder="Name Category" name="cat_name" value="<%= cat_name %>" aria-describedby="sizing-addon1">
							</div>
							<p></p>
							<input type="hidden" name="command" value="update">
							<input type="hidden" name="cat_id" value="<%= cat_id %>">
							<button type="submit" class="btn btn-primary">Save Category</button>
							</form>
							<p></p>
							<p></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
</body>
</html>