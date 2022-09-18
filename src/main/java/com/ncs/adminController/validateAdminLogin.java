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
 * Servlet implementation class validateAdminLogin
 */
public class validateAdminLogin extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String adminUserName = req.getParameter("username");
		String adminPassword = req.getParameter("password");
		
		int checkAdminExist = Admin.checkAccountExist(adminUserName, adminPassword);
		
		if(checkAdminExist == 1) {
			ArrayList<Loan> fetchAllLoans = Loan.fetchAllLoans();
//			System.out.println(fetchAllLoans.get(1).getLoanName());
			 if(fetchAllLoans != null) {
					HttpSession session = req.getSession(true);
					session.setAttribute("fetchLoans", fetchAllLoans);
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
