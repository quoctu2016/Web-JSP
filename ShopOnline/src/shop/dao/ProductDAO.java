package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.MySQLConnUtils;
import shop.models.Category;
import shop.models.Product;

public class ProductDAO {
	public static ArrayList<Product> getProduct(long id_cat) throws ClassNotFoundException, SQLException{
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String sql = "select * from product where cat_id = "+id_cat+"";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<Product>();
		while(rs.next()) {
			Product pro = new Product();
			pro.setCat_id(rs.getLong("cat_id"));
			pro.setDescription(rs.getString("description"));
			pro.setPro_id(rs.getLong("pro_id"));
			pro.setPro_image(rs.getString("pro_image"));
			pro.setPro_name(rs.getString("pro_name"));
			pro.setPrice(rs.getDouble("price"));
			list.add(pro);
		}
		return list;
	}
	public static Product getProductByID(long id_pro) throws ClassNotFoundException, SQLException{
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String sql = "select * from product where pro_id = "+id_pro+"";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Product product = new Product();
		while(rs.next()) {
			product.setCat_id(rs.getLong("cat_id"));
			product.setDescription(rs.getString("description"));
			product.setPro_id(rs.getLong("pro_id"));
			product.setPro_image(rs.getString("pro_image"));
			product.setPro_name(rs.getString("pro_name"));
			product.setPrice(rs.getDouble("price"));
		}
		return product;
	}
	public static ArrayList<Product> getProductNav(long catId,int firstResult,int maxResult) throws SQLException, ClassNotFoundException{
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String sql = "select * from shoponline.product where cat_id = "+catId+" limit ? , ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setLong(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<Product>();
		while(rs.next()) {
			Product pro = new Product();
			pro.setCat_id(rs.getLong("cat_id"));
			pro.setDescription(rs.getString("description"));
			pro.setPrice(rs.getDouble("price"));
			pro.setPro_id(rs.getLong("pro_id"));
			pro.setPro_image(rs.getString("pro_image"));
			pro.setPro_name(rs.getString("pro_name"));
			list.add(pro);
		}
		return list;
	}
	public static int countProductByCat(long carId) throws ClassNotFoundException, SQLException {
		
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String sql = "select count(pro_id) from shoponline.product where cat_id = "+carId+"";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		int result = 0;
		while(rs.next()) {
			result = rs.getInt(1);
		}
		return result;
		
	}
	public static ArrayList<Product> getProductAndNameCat() throws ClassNotFoundException, SQLException{
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String sql = "SELECT * FROM shoponline.product a inner join shoponline.category b on a.cat_id = b.cat_id;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<Product>();
		while(rs.next()) {
			Product pro = new Product();
			pro.setCat_id(rs.getLong("cat_id"));
			pro.setDescription(rs.getString("description"));
			pro.setPro_id(rs.getLong("pro_id"));
			pro.setPro_image(rs.getString("pro_image"));
			pro.setPro_name(rs.getString("pro_name"));
			pro.setPrice(rs.getDouble("price"));
			pro.setCat_name(rs.getString("cat_name"));
			list.add(pro);
		}
		return list;
	}
	public static boolean insert(Product p) throws SQLException {
	    try {
	    	Connection connection = MySQLConnUtils.getMySQLConnection();
	         String sql = "INSERT INTO shoponline.product VALUES(?,?,?,?,?,?)";
	         PreparedStatement ps = connection.prepareCall(sql);
	         ps.setLong(1, p.getPro_id());
	         ps.setString(2, p.getPro_name());
	         ps.setString(3, p.getPro_image());
	         ps.setLong(4, p.getCat_id());
	         ps.setString(5, p.getDescription());
	         ps.setDouble(6, p.getPrice());
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	         return false;
	    }
	}
	public static boolean update(Product p) throws SQLException {
	    try {
	    	Connection connection = MySQLConnUtils.getMySQLConnection();
	         String sql = "update shoponline.product set pro_name = ?,pro_image = ?, cat_id = ?,description=?,price = ? where pro_id = ?";
	         PreparedStatement ps = connection.prepareCall(sql);
	         ps.setLong(6, p.getPro_id());
	         ps.setString(1, p.getPro_name());
	         ps.setString(2, p.getPro_image());
	         ps.setLong(3, p.getCat_id());
	         ps.setString(4, p.getDescription());
	         ps.setDouble(5, p.getPrice());
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	         return false;
	    }
	}
	public static boolean delete(Long id_pro) throws SQLException {
	    try {
	    	Connection connection = MySQLConnUtils.getMySQLConnection();
	         String sql = "delete from shoponline.product where pro_id="+id_pro;
	         PreparedStatement ps = connection.prepareCall(sql);
	         int temp = ps.executeUpdate();
	         return temp == 1;
	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	         return false;
	    }
	}
	public static ArrayList<Product> getTop4FromOrderDetail() throws ClassNotFoundException, SQLException{
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String sql = "SELECT sum(quantity), b.* FROM shoponline.order_detail a inner join shoponline.product b on a.proId = b.pro_id group by proId order by quantity desc limit 4";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<Product>();
		while(rs.next()) {
			Product pro = new Product();
			pro.setCat_id(rs.getLong("cat_id"));
			pro.setDescription(rs.getString("description"));
			pro.setPro_id(rs.getLong("pro_id"));
			pro.setPro_image(rs.getString("pro_image"));
			pro.setPro_name(rs.getString("pro_name"));
			pro.setPrice(rs.getDouble("price"));
			list.add(pro);
		}
		return list;
	}
	public static ArrayList<Product> getTop8Lastest() throws ClassNotFoundException, SQLException{
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String sql = "select * from shoponline.product order by pro_id desc limit 8";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<Product>();
		while(rs.next()) {
			Product pro = new Product();
			pro.setCat_id(rs.getLong("cat_id"));
			pro.setDescription(rs.getString("description"));
			pro.setPro_id(rs.getLong("pro_id"));
			pro.setPro_image(rs.getString("pro_image"));
			pro.setPro_name(rs.getString("pro_name"));
			pro.setPrice(rs.getDouble("price"));
			list.add(pro);
		}
		return list;
	}
	public static ArrayList<Product> getTop3Lastest() throws ClassNotFoundException, SQLException{
		Connection conn = MySQLConnUtils.getMySQLConnection();
		String sql = "select * from shoponline.product order by pro_id desc limit 3";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<Product>();
		while(rs.next()) {
			Product pro = new Product();
			pro.setCat_id(rs.getLong("cat_id"));
			pro.setDescription(rs.getString("description"));
			pro.setPro_id(rs.getLong("pro_id"));
			pro.setPro_image(rs.getString("pro_image"));
			pro.setPro_name(rs.getString("pro_name"));
			pro.setPrice(rs.getDouble("price"));
			list.add(pro);
		}
		return list;
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		Product p = new Product(1518912l,1511360288320l,"GM11","SomicG9.jpg","s",12.0);
		update(p);
		System.out.println(countProductByCat(1));
		
	}
}
