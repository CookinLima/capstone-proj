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
 * Servlet implementation class transaction
 */
public class transaction extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
	
		ArrayList<Customer> fetchAllTransaction = Customer.fetchAllTransaction(cusUserName);

		if(fetchAllTransaction != null) {
			session.setAttribute("transactionList", fetchAllTransaction);
			session.setAttribute("transaction", "success");
			resp.sendRedirect("/capstone/transaction.jsp");
		} else {
			session.setAttribute("transactionFail", "fail");
			resp.sendRedirect("/capstone/transaction.jsp");
		}
	}
}
