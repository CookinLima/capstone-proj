package com.ncs.adminController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.adminModel.Admin;
import com.ncs.customerModel.Loan;

/**
 * Servlet implementation class approveLoan
 */
public class approveLoan extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String loanId = req.getParameter("loanId");
		
		boolean approveLoan = Loan.approveLoan(loanId);
		int[] countLoans = Loan.countLoans();
		
		if(approveLoan) {
			ArrayList<Loan> fetchAllLoans = Loan.fetchAllLoans();
			 if(fetchAllLoans != null) {
					HttpSession session = req.getSession(true);
					session.setAttribute("fetchLoans", fetchAllLoans);
					session.setAttribute("countLoans", countLoans);
					resp.sendRedirect("./adminLoginSuccess.jsp");
				} else {
					System.out.println("arraylist null");
					}
		} else {
			System.out.println("admin invalid");
			resp.sendRedirect("./adminLoginFail.jsp");
		}
	}
}
