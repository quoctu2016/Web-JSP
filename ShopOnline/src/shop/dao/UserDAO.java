package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.catalina.User;

import connection.MySQLConnUtils;

public class UserDAO {
	public static boolean checkLogin(String username, String password) throws ClassNotFoundException, SQLException {
		Connection con = MySQLConnUtils.getMySQLConnection();
		String sql = "select * from shoponline.user where username='" + username + "' and password='" + password + "'";
		PreparedStatement ps;
		try {
			ps = con.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				con.close();
				return true;
			}
		} catch (SQLException e) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE,null,e);
		}
		return false;
	}
}
