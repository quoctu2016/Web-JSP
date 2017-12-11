package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import connection.MySQLConnUtils;
import shop.models.Category;

public class CategoryDAO {
	public static ArrayList<Category> getCategory() throws SQLException, ClassNotFoundException{
		Connection conn = MySQLConnUtils.getMySQLConnection();
		
		String sql = "Select * from category";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Category> list = new ArrayList<Category>();
		while(rs.next())
		{
			Category cat = new Category();
			cat.setCat_id(rs.getLong("cat_id"));
			cat.setCat_name(rs.getString("cat_name"));
			list.add(cat);
		}
		return list;
		
	}
	public static boolean insert(Category c) throws SQLException {
	    try {
	    	Connection connection = MySQLConnUtils.getMySQLConnection();
	         String sql = "INSERT INTO shoponline.category VALUEs(?,?)";
	         PreparedStatement ps = connection.prepareCall(sql);
	         ps.setLong(1, c.getCat_id());
	         ps.setString(2, c.getCat_name());
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	         return false;
	    }
	}

	public static boolean update(Category c) throws SQLException {
	    try {
	    	Connection connection = MySQLConnUtils.getMySQLConnection();
	         String sql = "UPDATE category SET cat_name = ? WHERE cat_id = ?";
	         PreparedStatement ps = connection.prepareCall(sql);
	         ps.setLong(2, c.getCat_id());
	         ps.setString(1, c.getCat_name());
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	         return false;
	    }
	}
	public static boolean delete(long category_id) throws SQLException {
	    try {
	    	Connection connection = MySQLConnUtils.getMySQLConnection();
	        String sql = "DELETE FROM category WHERE cat_id = ?";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ps.setLong(1, category_id);
	        int temp = ps.executeUpdate();
	            return temp == 1;
	    } catch (Exception e) {
	        return false;
	    }
	}
	public static String getNamebyId(long id) throws SQLException {
		String result = "";
		try {
	    	Connection connection = MySQLConnUtils.getMySQLConnection();
	         String sql = "select * from shoponline.category a where a.cat_id = ?";
	         PreparedStatement ps = connection.prepareCall(sql);
	         ps.setLong(1, id);
	         ResultSet rs = ps.executeQuery();
	         if(rs.next()) { 
	        	 result = rs.getString("cat_name");
	        }
	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	    }
    	return result;
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		System.out.println(getCategory().size());
		
	}
	
}
