package com.ncs.customerController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.customerModel.Customer;
import com.ncs.customerModel.Loan;

/**
 * Servlet implementation class viewLoan
 */
public class viewLoan extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
		System.out.println(cusUserName);
		ArrayList<Loan> fetchCustomer = Loan.fetchAllUserLoans(cusUserName);
		System.out.println(fetchCustomer.size());
//		System.out.println(fetchCustomer);
		if(fetchCustomer.size() > 0) {
			session.setAttribute("userLoans", fetchCustomer);
			session.setAttribute("fetchLoanSuccess", "success");
			resp.sendRedirect("/capstone/viewLoan.jsp");
		} else {
//			HttpSession session = req.getSession(true);
//			session.setAttribute("transferFail", "fail");
			resp.sendRedirect("/capstone/viewLoan.jsp");
		}
	}
}
