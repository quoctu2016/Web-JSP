<%@page import="shop.models.User"%>
<%@page import="shop.dao.OrderDAO"%>
<%@page import="shop.models.Order"%>
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
	ArrayList<Order> list = OrderDAO.getListOrder();
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
                        <h2>List Order</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th width="50px">ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>Date</th>
                                        <th>Total</th>
                                        <th width="150px">Payment</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                               	<% for(Order o : OrderDAO.getListOrder()){ %>
                                    <tr>
                                        <td><%= o.getOr_id() %></td>
                                        <td><%= o.getName() %></td>
                                        <td><%= o.getEmail() %></td>
                                        <td><%= o.getAddress() %></td>
                                        <td><%= o.getDate() %></td>
                                        <td><%= o.getTotal() %> $</td>
                                        <td><%= o.getPayment() %></td>
                                        <td><a href="/ShopOnline/admin/orderdetail.jsp?or_id=<%= o.getOr_id() %>"><span class="glyphicon glyphicon-eye-open"></span></a></td>
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