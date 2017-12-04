package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import shop.models.Category;
import shop.models.Value;

public class ChartDAO {
	public static ArrayList<Value> getAll() throws ClassNotFoundException {
	     try {
	          ArrayList<Value> list = new ArrayList<>();
	          for (Category category : CategoryDAO.getCategory()) {
	              list.add(new Value(category.getCat_name(),
	                   ProductDAO.getProduct(category.getCat_id()).size()));
	          }
	          return list;
	     } catch (SQLException ex) {
	          Logger.getLogger(ChartDAO.class.getName()).log(Level.SEVERE, null, ex);
	     }
	     return null;
	}
	public static void main(String[] args) throws ClassNotFoundException {
		for(Value v : getAll()) {
			System.out.println(v.getName()+"-"+v.getValue());
		}
	}
}
