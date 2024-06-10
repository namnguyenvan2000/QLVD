package com.poly.Controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.Constant.SessionAtt;
import com.poly.Entity.User;
import com.poly.Service.StatsService;
import com.poly.Service.StatsServiceImpl;
import com.poly.Service.UserService;
import com.poly.Service.UserServiceImpl;
import com.poly.Storage.VideoLikedInfo;

@WebServlet(urlPatterns = { "/admin", "/admin/favorites" }, name = "HomeControllerOfAdmin")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StatsService statsService = new StatsServiceImpl();
	private UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAtt.CURRENT_USER);
		if (currentUser != null & currentUser.getIsAdmin() == true) {

			String path = req.getServletPath(); //localhost/Asm-Java4/login - Path re nhanh phia sau ten Project
			switch (path) {
			case "/admin":
				doGetHome(req, resp);
				break;
			case "/admin/favorites":
				doGetFavorites(req, resp);
				break;
			}

		} else {
			resp.sendRedirect("index");
		}

	}

	private void doGetHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
		req.setAttribute("videos", videos);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/home.jsp");
		dispatcher.forward(req, resp);
	}

	
	private void doGetFavorites(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Set data thay doi theo CheckBox
		PrintWriter out = resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");// Set kieu tra ve la JSON
		String videoHref = req.getParameter("href");
		List<User> users = userService.findUsersLikedByVideoHref(videoHref);
		if (users.isEmpty()) {
			resp.setStatus(400);
		} else {
			// Phai map User tu Object sang Json
			ObjectMapper mapper = new ObjectMapper();
			String dataResponse = mapper.writeValueAsString(users);
			//
			resp.setStatus(200); // co tra ve data json
			out.print(dataResponse); // in ra mang Users vua dc convert sang Json
			out.flush(); // xả stream - day ra

		}

	}

}
