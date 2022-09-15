package com.ncs.customerController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.adminModel.Admin;

/**
 * Servlet implementation class validateCustomerLogin
 */
public class validateCustomerLogin extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cusUserName = req.getParameter("username");
		String cusPassword = req.getParameter("password");
		
		int checkAdminExist = Admin.checkAccountExist(adminUserName, adminPassword);
		System.out.println(checkAdminExist);
		
		 if(checkAdminExist == 1) {
			HttpSession session = req.getSession(true);
			session.setAttribute("login", adminUserName);
			resp.sendRedirect("./adminLoginSuccess.jsp");
		} else if(checkAdminExist == 2){
			HttpSession session = req.getSession(true);
			session.setAttribute("login", null);
			resp.sendRedirect("./adminLoginFail.jsp");
		}
	}
}
