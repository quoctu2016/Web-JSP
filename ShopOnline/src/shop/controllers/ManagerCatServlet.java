package shop.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.CategoryDAO;
import shop.models.Category;

/**
 * Servlet implementation class ManagerCatServlet
 */
@WebServlet("/ManagerCatServlet")
public class ManagerCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerCatServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		String cat_id = request.getParameter("cat_id");
		switch (command) {
		case "delete":
			try {
				CategoryDAO.delete(Long.parseLong(cat_id));
				System.out.println("ok");
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		default:
			break;
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/category_manager.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String command = req.getParameter("command");
		String cat_name = req.getParameter("cat_name");
		String cat_id = req.getParameter("cat_id");
		String url = "", error = "";
		
		try {
			
				switch (command) {
				case "insert":
					if (cat_name.equals("")) {
						error = "Missing information!";
						session.setAttribute("error", error);
						url = "/admin/insert_category.jsp";
					}
					else {
					Category cat = new Category();
					cat.setCat_id(new Date().getTime());
					cat.setCat_name(cat_name);
					CategoryDAO.insert(cat);
					session.setAttribute("error", "");
					url = "/admin/category_manager.jsp";
					}
					break;
				case "update":
					if (cat_name.equals("")) {
						error = "Missing information!";
						session.setAttribute("error", error);
						url = "/admin/update_category.jsp";
					}
					else {
					Category cat1 = new Category();
					cat1.setCat_id(Long.parseLong(cat_id));
					cat1.setCat_name(cat_name);
					CategoryDAO.update(cat1);
					session.setAttribute("error", "");
					url = "/admin/category_manager.jsp";
					}
					break;
				default:
					break;
				}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(req, resp);
	}

}
