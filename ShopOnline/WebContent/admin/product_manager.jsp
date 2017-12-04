<%@page import="shop.models.User"%>
<%@page import="shop.dao.CategoryDAO"%>
<%@page import="shop.models.Category"%>
<%@page import="shop.dao.ProductDAO"%>
<%@page import="shop.models.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
</head>
<body>
<%
User user = null;
if(session.getAttribute("username")==null){
	response.sendRedirect("/ShopOnline/index.jsp");
}
%>
<div id="wrapper">
	<jsp:include page="header.jsp"></jsp:include>
	<div id="page-wrapper">

            <div class="container-fluid">
            <div class="row">
                    <div class="col-lg-12">
                        <h2>Product</h2>
                        <a href="/ShopOnline/admin/insert_product.jsp" class="btn btn-default">Add new Product</a><p></p>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th width="50px"></th>
                                        <th>Name</th>
                                        <th>Category</th>
                                        <th>Price</th>
                                        <th>Description</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%for(Product p : ProductDAO.getProductAndNameCat() ){ %>
                                    <tr>
                                    <td><img alt="img" width="50" height="50" src="/ShopOnline/images/<%= p.getPro_image() %>"></td>
                                    <td><%= p.getPro_name() %></td>
                                    <td><%= p.getCat_name() %></td>
                                    <td><%= p.getPrice() %> $</td>
                                    <td><%= p.getDescription() %></td>
                                    <td  width="70px">
                                    	<a href="/ShopOnline/admin/update_product.jsp?id_pro=<%=p.getPro_id()%>"><span class="glyphicon glyphicon-edit action"></span></a>&nbsp|
                                    	<a href="/ShopOnline/ManagerProServlet?command=delete&id_pro=<%= p.getPro_id() %>"><span class="glyphicon glyphicon-remove action"></span></a>
                                    </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
</div></div>
	
	<jsp:include page="menu.jsp"></jsp:include>
</div>
</body>
</html>