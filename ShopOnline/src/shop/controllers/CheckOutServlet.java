package shop.controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.OrderDAO;
import shop.dao.OrderDetailDAO;
import shop.models.Cart;
import shop.models.Item;
import shop.models.Order;
import shop.models.OrderDetail;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String payment = request.getParameter("payment");
		Cart cart = (Cart) session.getAttribute("cart");
		System.out.println(cart);
		String url = "";
		if (name.equals("") || email.equals("") || address.equals("")) {
			session.setAttribute("error", "Missing information!");
			url = "/checkout.jsp";
		}
		else if (cart.countItem()<=0) {
			session.setAttribute("error", "Empty cart!");
			url = "/checkout.jsp";
		}
		else {
			try {
				Long id = new Date().getTime();
				Order order = new Order();
				order.setAddress(address);
				order.setDate(new Timestamp(new Date().getTime()));
				order.setEmail(email);
				order.setName(name);
				order.setOr_id(id);
				order.setPayment(payment);
				order.setTotal(cart.totalCart());
				OrderDAO.insertOder(order);
				for (Map.Entry<Long, Item> list : cart.getCartItem().entrySet()) {
					OrderDetailDAO.insertOderDetail(new OrderDetail(id, id, list.getValue().getProduct().getPro_id(),
							list.getValue().getProduct().getPrice(), list.getValue().getQuantity()));
				}
				cart = new Cart();
				session.setAttribute("cart", cart);
				session.setAttribute("error", "");
				url = "/index.jsp";
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
