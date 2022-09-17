package com.ncs.customerController;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.customerModel.Customer;

/**
 * Servlet implementation class Loan
 */
public class getLoan extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
	
		boolean fetchCustomer = getLoan.getLoan(cusUserName, rUserName, transferAmount);
		
		if(fetchCustomer) {
			BigDecimal cusBalance = Customer.fetchBalance(cusUserName);
			ArrayList<Customer> addRecipient = Customer.fetchAllRecipient(cusUserName);
			session.setAttribute("recipientList", addRecipient);
			session.setAttribute("transfer", "success");
			session.setAttribute("cusBalance", cusBalance);
			resp.sendRedirect("/capstone/transfer.jsp");
		} else {
			session.setAttribute("transferFail", "fail");
			resp.sendRedirect("/capstone/transfer.jsp");
		}
	}
}
