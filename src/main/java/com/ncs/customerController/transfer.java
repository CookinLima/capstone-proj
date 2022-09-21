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
 * Servlet implementation class transfer
 */
public class transfer extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String transferAmount = req.getParameter("transferAmount");
		String rUserName = req.getParameter("rUserName");
//		System.out.println("in transfer.java " + rUserName);
//		System.out.println("in transfer.java " + transferAmount);
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
	
		int fetchCustomer = Customer.transfer(cusUserName, rUserName, transferAmount);
		System.out.println("in transfer.java: " + fetchCustomer);
//		System.out.println(fetchCustomer);
		if(fetchCustomer == 1) {
			BigDecimal cusBalance = Customer.fetchBalance(cusUserName);
			ArrayList<Customer> addRecipient = Customer.fetchAllRecipient(cusUserName);
			session.setAttribute("recipientList", addRecipient);
			session.setAttribute("transfer", "success");
			session.setAttribute("cusBalance", cusBalance);
			resp.sendRedirect("/capstone/transfer.jsp");
		} else if(fetchCustomer == 3){
			session.setAttribute("balanceLow", "low");
			resp.sendRedirect("/capstone/transfer.jsp");
		} else {
			session.setAttribute("transferFail", "fail");
			resp.sendRedirect("/capstone/transfer.jsp");			
		}
	}
}