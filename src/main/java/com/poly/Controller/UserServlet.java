package com.poly.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.Constant.SessionAtt;
import com.poly.Entity.User;
import com.poly.Service.EmailService;
import com.poly.Service.EmailServiceImpl;
import com.poly.Service.UserService;
import com.poly.Service.UserServiceImpl;

@WebServlet(urlPatterns = { "/login", "/logout", "/register", "/forgotPass","/changePass" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl();
	private EmailService emailService = new EmailServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath(); // localhost/asm/login - Path is Login - know? - re~ nhanh'
		switch (path) {
		case "/login":
			doGetLogin(req, res);
			break;
		case "/register":
			doGetRegister(req, res);
			break;
		case "/logout":
			doGetLogout(session, req, res);
			break;
		case "/forgotPass":
			doGetForgotPass(req, res);
			break;
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();

		String path = req.getServletPath(); // localhost/asm/login - Path is Login - know? - re~ nhanh'
		switch (path) {
		case "/login":
			doPostLogin(session, req, res);
			break;
		case "/register":
			doPostRegister(session, req, res);
			break;
		case "/forgotPass":
			doPostForgotPass(req, res);
			break;
		case "/changePass":
			doPostChangePass(session,req, res);
			break;
//		case "/shareVideo":
//			doPostShareVideo(session,req, res);
//			break;
		}
	}

	private void doGetLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/login.jsp");
		requestDispatcher.forward(req, res);
	}

	private void doGetRegister(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/register.jsp");
		requestDispatcher.forward(req, res);
	}

	private void doGetForgotPass(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/forgot-pass.jsp");
		requestDispatcher.forward(req, res);
	}

	private void doGetLogout(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		session.removeAttribute(SessionAtt.CURRENT_USER);
		res.sendRedirect("index");
	}

	private void doPostLogin(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String errorBtn = req.getParameter("errorBtn");
		
		User user = userService.login(username, password);
		if (user != null) {
			session.setAttribute(SessionAtt.CURRENT_USER, user);
			res.sendRedirect("index");
		} else {
			res.sendRedirect("login");	
		}
	}
	
	private void doPostRegister(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");

		User user = userService.create(username, password, email);

		if (user != null) {
			emailService.sendMail(getServletContext(), user, "welcome");
			session.setAttribute(SessionAtt.CURRENT_USER, user);
			res.sendRedirect("index");

		} else {
			res.sendRedirect("register");
		}
	}

	private void doPostForgotPass(HttpServletRequest req, HttpServletResponse res) {
			res.setContentType("application/json");
			String email = req.getParameter("email");
			User userWithNewPass = userService.resetPassword(email);
			
			if(userWithNewPass != null) {
				emailService.sendMail(getServletContext(), userWithNewPass, "forgot");
				res.setStatus(204); // Gui Mail thanh cong!!
			}else {
				res.setStatus(400);
			}
	}
	private void doPostChangePass(HttpSession session, HttpServletRequest  req, HttpServletResponse res) {
			res.setContentType("application/json"); //
			String currentPass = req.getParameter("currentPass");
			String newPass = req.getParameter("newPass");
			
			User currentUser = (User) session.getAttribute(SessionAtt.CURRENT_USER);
			
			if(currentUser.getPassword().equals(currentPass)) { // so sanh chuoi Pass cu va Pass cu da nhap
				currentUser.setPassword(newPass);
				User updateUser = userService.update(currentUser);
				if(updateUser != null) {
					session.setAttribute(SessionAtt.CURRENT_USER, updateUser); //Push pass cua user mo vao session tranh xung dot
					res.setStatus(204);
				}else {
					res.setStatus(400);
					//Xu li ajax o Footer.jsp
				}
			}else {
				res.setStatus(400);
			}		
		}
		
}
