package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.MySQLConnUtils;
import shop.models.Order;

public class OrderDAO {
	public static void insertOder(Order order) throws ClassNotFoundException, SQLException {
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String query = " insert into shoponline.order values (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareCall(query);
		ps.setLong(1, order.getOr_id());
		ps.setDouble(2, order.getTotal());
		ps.setString(3, order.getPayment());
		ps.setString(4, order.getAddress());
		ps.setString(5, order.getName());
		ps.setString(6, order.getEmail());
		ps.setTimestamp(7,order.getDate());
		ps.execute();
	}
	public static ArrayList<Order> getListOrder() throws ClassNotFoundException {
	    try {
	    	Connection conn = MySQLConnUtils.getMySQLConnection();
	         String sql = "SELECT * FROM shoponline.order";
	         PreparedStatement ps = conn.prepareCall(sql);
	         ResultSet rs = ps.executeQuery();
	         ArrayList<Order> list = new ArrayList<Order>();
	         while (rs.next()) {
	        	 Order order = new Order();
	        	 order.setOr_id(rs.getLong("or_id"));
	        	 order.setTotal(rs.getInt("total"));
	        	 order.setPayment(rs.getString("payment"));
	        	 order.setAddress(rs.getString("address"));
	        	 order.setName(rs.getString("name"));
	        	 order.setEmail(rs.getString("email"));
	        	 order.setDate(rs.getTimestamp("date"));
	        	 list.add(order);
	        }
	        return list;
	    } catch (SQLException ex) {
	    	System.out.println(ex.getMessage());
	    }
	    return null;
	}
	public static void main(String[] args) throws ClassNotFoundException {
		System.out.println(getListOrder().size());
	}
}
