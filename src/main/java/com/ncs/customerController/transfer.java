package com.ncs.customerController;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.customerModel.Customer;

/**
 * Servlet implementation class transfer
 */
public class transfer extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String transferAmount = req.getParameter("transferAmount");
		String rUserName = req.getParameter("rUserName");
		System.out.println("in transfer.java " + rUserName);
//		System.out.println("in transfer.java " + transferAmount);
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
	
		boolean fetchCustomer = Customer.transfer(cusUserName, rUserName, transferAmount);
		
		System.out.println(fetchCustomer);
//		if(fetchCustomer != null) {
//			session.setAttribute("update", "success");
//			session.setAttribute("login", cusFirstName);
//			session.setAttribute("customerDetails", fetchCustomer);
//			resp.sendRedirect("/capstone/edit.jsp");
//		} else {
//			resp.sendRedirect("/capstone/editFail.jsp");
//		}
	}
}
