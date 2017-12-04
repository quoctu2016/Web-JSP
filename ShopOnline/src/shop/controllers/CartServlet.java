package shop.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.ProductDAO;
import shop.models.Cart;
import shop.models.Item;
import shop.models.Product;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		String idPro = request.getParameter("id_pro");
		String cat_id = request.getParameter("cat_id");
		Cart cart = (Cart) session.getAttribute("cart");
		Long ProId = Long.parseLong(idPro);
		String url="";
			try {
				Product product = ProductDAO.getProductByID(ProId);
				switch (command) {
				case "plus":
					if(cart.getCartItem().containsKey(ProId)) {
						Item item = new Item(product,cart.getCartItem().get(ProId).getQuantity());
						System.out.println(item.getProduct().getPro_name());
						cart.plusCart(ProId, item);
					}
					else {
						Item item = new Item(product,1);
						System.out.println(product.getPro_id());
						cart.plusCart(ProId, item);
					}
					url = "/ShopOnline/products.jsp?cat_id="+cat_id+"&pages=1";
					break;
				case "remove":
					cart.removeCart(ProId);
					url = "/ShopOnline/shoppingcart.jsp";
					break;
				case "update":
					if(cart.getCartItem().containsKey(ProId)) {
						Item item = new Item(product,cart.getCartItem().get(ProId).getQuantity());
						System.out.println(item.getProduct().getPro_name());
						cart.plusCart(ProId, item);
					}
					else {
						Item item = new Item(product,1);
						System.out.println(product.getPro_id());
						cart.plusCart(ProId, item);
					}
					url = "/ShopOnline/shoppingcart.jsp";
					break;
				default:
					break;
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		session.setAttribute("cart", cart);
		response.sendRedirect(url);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String []quantity = request.getParameterValues("quantity");
		String [] ProId = request.getParameterValues("ProId");
		for(int i=0;i<cart.getCartItem().size();i++) {
			cart.getCartItem().get(Long.parseLong(ProId[i])).setQantity(Integer.parseInt(quantity[i]));
		}
		session.setAttribute("cart", cart);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/shoppingcart.jsp");
		rd.forward(request, response);
	}


}
