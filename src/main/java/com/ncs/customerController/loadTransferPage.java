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
 * Servlet implementation class loadTransferPage
 */
public class loadTransferPage extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
		
		System.out.println(cusUserName);

		ArrayList<Customer> addRecipient = Customer.fetchAllRecipient(cusUserName);
		BigDecimal cusBalance = Customer.fetchBalance(cusUserName);
		
		System.out.println(addRecipient.get(0).getRecipientUserName());
		
		 if(addRecipient.size() > 0 && cusBalance != null) {
			session.setAttribute("recipientList", addRecipient);
			session.setAttribute("cusBalance", cusBalance);
			resp.sendRedirect("./transfer.jsp");
		} else {
			session.setAttribute("recipientList", null);
			resp.sendRedirect("./transfer.jsp");
		}
	}
}
