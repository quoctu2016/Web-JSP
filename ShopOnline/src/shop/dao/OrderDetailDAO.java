package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.MySQLConnUtils;
import shop.models.Order;
import shop.models.OrderDetail;
import shop.models.Product;

public class OrderDetailDAO {
	public static void insertOderDetail(OrderDetail od) throws ClassNotFoundException, SQLException {
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String query = " insert into shoponline.order_detail(orderId,proId,price,quantity) values ( ?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareCall(query);
		ps.setLong(1, od.getOrderId());
		ps.setLong(2, od.getProId());
		ps.setDouble(3, od.getPrice());
		ps.setInt(4,od.getQuantity());
		ps.execute();
	}
	public static ArrayList<Product> getOrderDetailById(Long or_id) throws ClassNotFoundException, SQLException{
		Connection conn = MySQLConnUtils.getMySQLConnection();
        String sql = "SELECT b.*,c.cat_name FROM shoponline.order_detail a inner join shoponline.product b on a.proId = b.pro_id inner join category c on b.cat_id = c.cat_id where a.orderId = "+or_id;
        PreparedStatement ps = conn.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	Product pro = new Product();
        	pro.setPro_name(rs.getString("pro_name"));
        	pro.setCat_name(rs.getString("cat_name"));
        	pro.setPrice(rs.getDouble("price"));
       	 	list.add(pro);
       }
        return list;
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		OrderDetail od = new OrderDetail();
		od.setOrderDetailId(1);
		od.setOrderId(1);
		od.setPrice(10);
		od.setProId(1);
		od.setQuantity(1);
		insertOderDetail(od);
	}
}
