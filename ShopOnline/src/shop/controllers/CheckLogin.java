package shop.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.UserDAO;
import shop.models.User;

/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/login")
public class CheckLogin extends HttpServlet {
	UserDAO userDao = new UserDAO();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(UserDAO.checkLogin(request.getParameter("username"), request.getParameter("password"))){
				User user = new User();
				user.setUser_id(new Date().getTime());
				user.setUsername(request.getParameter("username"));
				user.setPassword(request.getParameter("password"));
				HttpSession session = request.getSession();
				session.setAttribute("username", user);
				response.sendRedirect("admin/index.jsp");
			}
			else {
				response.getWriter().append("Failed");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
