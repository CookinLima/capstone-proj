package com.ncs.customerController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.adminModel.Admin;
import com.ncs.customerModel.Customer;

/**
 * Servlet implementation class validateCustomerLogin
 */
public class validateCustomerLogin extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cusUserName = req.getParameter("username");
		String cusPassword = req.getParameter("password");
		
		String checkCusExist = Customer.checkAccountExist(cusUserName, cusPassword);
		
		 if(checkCusExist == "wp" || checkCusExist == "wu") {
			HttpSession session = req.getSession(true);
			session.setAttribute("login", null);
			session.setAttribute("fail", "wp");
			resp.sendRedirect("./customerLoginFail.jsp");
		} else {
			HttpSession session = req.getSession(true);
			session.setAttribute("login", checkCusExist);
			session.setAttribute("cusUserName", cusUserName);
			resp.sendRedirect("./customerLoginSuccess.jsp");
		}
	}
}
