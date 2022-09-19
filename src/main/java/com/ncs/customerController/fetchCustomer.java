package com.ncs.customerController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.customerModel.Customer;

/**
 * Servlet implementation class fetchCustomer
 */
public class fetchCustomer extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
	
		Customer fetchCustomer = Customer.fetchCustomerDetails(cusUserName);
		System.out.println(cusUserName);
		if(fetchCustomer != null) {
			session.setAttribute("customerDetails", fetchCustomer);
			resp.sendRedirect("/capstone/edit.jsp");
		} else {
			System.out.println("cannot find username");
			resp.sendRedirect("/capstone/index.jsp");
		}
	}
}
