package com.ncs.customerController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.customerModel.Customer;

/**
 * Servlet implementation class deleteCustomer
 */
public class deleteCustomer extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
		
		String cusPassword = req.getParameter("password");
		
		boolean checkDeleteUser = Customer.deleteCustomer(cusUserName, cusPassword);
		
		if(checkDeleteUser) {
			resp.sendRedirect("./logout.jsp");
		} else {
			session.setAttribute("delete", "fail");
			resp.sendRedirect("./edit.jsp");
		}
	}
}
