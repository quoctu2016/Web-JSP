package shop.controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import shop.dao.ProductDAO;
import shop.models.Product;

/**
 * Servlet implementation class ManagerProServlet
 */
@WebServlet("/ManagerProServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class ManagerProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerProServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String command = request.getParameter("command");
		Long id_pro = Long.parseLong(request.getParameter("id_pro"));
		String url = "";
		switch (command) {
		case "delete":
			try {
				ProductDAO.delete(id_pro);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		default:
			break;
		}
		url = "/admin/product_manager.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		String url = "", error = "";
		PrintWriter out = response.getWriter();
		Long id = new Date().getTime();
		Part part = request.getPart("pro_image");
		String pro_img = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		Long cat_id = Long.parseLong(request.getParameter("cat_id"));
		String price = request.getParameter("price");
		String pro_name = request.getParameter("pro_name");
		String description = request.getParameter("description");
		String savePath1 = getServletContext().getRealPath("/").replace("\\", "/");

		switch (command) {
		case "insert":
				try {
					if (price.equals("") || pro_img.equals("") || pro_name.equals("") || description.equals("")) {
						error = "Missing information!";
						session.setAttribute("error", error);
						url = "/admin/insert_category.jsp";
					}
					else {
					String savePath = savePath1 + "images/" + pro_img;
					// System.out.println(savePath1);
					File fileSaveDir = new File(savePath);
					part.write(savePath);
					Product p = new Product(id, cat_id, pro_name, pro_img, description, Double.parseDouble(price));
					ProductDAO.insert(p);
					url = "/admin/product_manager.jsp";
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
					url = "/admin/insert_manager.jsp";
				}
			break;
		case "update":

			try {
				if (price.equals("") || pro_name.equals("") || description.equals("")) {
					error = "Missing information!";
					session.setAttribute("error", error);
					url = "/admin/update_product.jsp";
				} else {
					String id_pro = request.getParameter("id_pro");
					System.out.println("Image: " + pro_img + "/");
					if (pro_img.equals("")) {
						Product pro = ProductDAO.getProductByID(Long.parseLong(id_pro));
						pro_img = pro.getPro_image();
					} else {
						String savePath = savePath1 + "images/" + pro_img;
						System.out.println(savePath);
						File fileSaveDir = new File(savePath);
						part.write(savePath);
					}
					Product p = new Product(Long.parseLong(id_pro), cat_id, pro_name, pro_img, description,
							Double.parseDouble(price));
					System.out.println(p.getPro_id());
					ProductDAO.update(p);
					url = "/admin/product_manager.jsp";
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
				url = "/admin/update_manager.jsp";
			}
			break;
		default:
			break;
		}

		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
