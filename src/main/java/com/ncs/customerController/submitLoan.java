package com.ncs.customerController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.customerModel.Customer;
import com.ncs.customerModel.Loan;

/**
 * Servlet implementation class submitLoan
 */
public class submitLoan extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String occupation = req.getParameter("occupation");
		String income = req.getParameter("income");
		String loanName = req.getParameter("loanName");
		String principal = req.getParameter("principal");
		String duration = req.getParameter("duration");
		String annualInterest = req.getParameter("annualInterest");
		String totalInterest = req.getParameter("totalInterest");
		
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
		
		System.out.println(annualInterest); 
		System.out.println(totalInterest);
	
		int getLoan = Loan.getLoan(cusUserName, loanName, principal, duration, annualInterest, totalInterest, occupation, income);
		System.out.println(getLoan);
		if( getLoan == 1 ) {
			boolean updateUserProfile = Customer.updateLoanProfile(cusUserName, occupation, income);
			if(updateUserProfile) {
				session.setAttribute("loan", "success");
				resp.sendRedirect("/capstone/loan.jsp");
			}
		} else {
			session.setAttribute("loanFail", "fail");
			resp.sendRedirect("/capstone/loan.jsp");
		}
	}
}
