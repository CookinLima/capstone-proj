package com.ncs.adminController;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.customerModel.Customer;
import com.ncs.customerModel.Loan;

/**
 * Servlet implementation class fetchLoanCustomerDetails
 */
public class fetchLoanCustomerDetails extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String loanId = req.getParameter("loanId");
		String userName = req.getParameter("userName");

		System.out.println("in fetchloancustoemr.java " + loanId);
		System.out.println("in transfer.java " + userName);

		Customer fetchCustomer = Customer.CustomerDetails(userName);
		
		int loanIdToInt = Integer.parseInt(loanId); 
		Loan fetchLoan = Loan.fetchLoan(loanIdToInt);
		
//		System.out.println(fetchCustomer);
		if(fetchCustomer != null && fetchLoan != null) {
			HttpSession session = req.getSession(true);
			session.setAttribute("fetchCustomer", fetchCustomer);
			session.setAttribute("fetchLoan", fetchLoan);
			resp.sendRedirect("/capstone/showLoanApplication.jsp");
		} else {
//			HttpSession session = req.getSession(true);
//			session.setAttribute("transferFail", "fail");
			resp.sendRedirect("/capstone/adminLoginSuccess.jsp");
		}
	}
}
