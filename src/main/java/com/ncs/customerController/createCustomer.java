package com.ncs.customerController;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.adminModel.Admin;
import com.ncs.customerModel.Customer;

/**
 * Servlet implementation class createCustomer
 */
public class createCustomer extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cusFirstName = req.getParameter("firstName");
		String cusLastName = req.getParameter("lastName");
		String cusUserName = req.getParameter("userName");
		String cusPassword = req.getParameter("password");
		String cusAddress = req.getParameter("address");
		String cusNumber = req.getParameter("number");
		String cusEmail = req.getParameter("email");
		String cusBalance = req.getParameter("deposit");
		
//		int checkAdminExist = Admin.checkAccountExist(adminUserName, adminPassword);
		int addCustomer = Customer.addCustomer(cusFirstName, cusLastName, cusUserName, cusPassword, cusAddress, cusNumber, cusEmail, cusBalance);
		
		 if(addCustomer == 1) {
			HttpSession session = req.getSession(true);
			session.setAttribute("login", cusFirstName);
			resp.sendRedirect("./customerLoginSuccess.jsp");
		} else if(addCustomer == 0) {
			HttpSession session = req.getSession(true);
			session.setAttribute("login", null);
			session.setAttribute("fail", "userExist");
			resp.sendRedirect("./customerRegisterFail.jsp");
		}
	}
}
