package com.ncs.customerController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.customerModel.Customer;

/**
 * Servlet implementation class updateCustomer
 */
public class updateCustomer extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cusFirstName = req.getParameter("firstName");
		String cusLastName = req.getParameter("lastName");
		String cusPassword = req.getParameter("password");
		String cusAddress = req.getParameter("address");
		String cusNumber = req.getParameter("number");
		String cusEmail = req.getParameter("email");
		
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
	
		Customer fetchCustomer = Customer.updateCustomerDetails(cusUserName, cusFirstName, cusLastName, cusPassword, cusAddress,cusNumber,cusEmail);
		
		if(fetchCustomer != null) {
			session.setAttribute("customerDetails", fetchCustomer);
			resp.sendRedirect("/capstone/edit.jsp");
		}
	}
}
