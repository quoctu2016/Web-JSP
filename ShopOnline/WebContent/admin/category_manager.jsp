<%@page import="shop.models.User"%>
<%@page import="shop.dao.CategoryDAO"%>
<%@page import="shop.models.Category"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<Category> list = CategoryDAO.getCategory();
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
                        <h2>Category</h2>
                         <a href="/ShopOnline/admin/insert_category.jsp" class="btn btn-default">Add new Category</a><p></p>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th style="text-align: center" width="100px">Id</th>
                                        <th style="text-align: center">Category Name</th>
                                        <th  width="70px"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% for(Category cat : list){ %>
                                    <tr>
                                        <td style="text-align: center"><%= cat.getCat_id() %></td>
                                        <td><%= cat.getCat_name() %></td>
                                        <td style="text-align: center">
                                        <a href="/ShopOnline/admin/update_category.jsp?command=update&cat_id=<%= cat.getCat_id() %>"><span class="glyphicon glyphicon-edit action"></span></a>&nbsp|
                                        <a href="/ShopOnline/ManagerCatServlet?command=delete&cat_id=<%= cat.getCat_id() %>"><span class="glyphicon glyphicon-remove action"></span></a>
                                        </td>
                                    </tr>
                                    <% } %>
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