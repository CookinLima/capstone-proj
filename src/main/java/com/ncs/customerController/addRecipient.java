package com.ncs.customerController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ncs.customerModel.Customer;

/**
 * Servlet implementation class addRecipient
 */
public class addRecipient extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String recipientName = req.getParameter("recipient_name");
		String recipientUserName = req.getParameter("recipient_username");
		
		HttpSession session = req.getSession(true);
		String cusUserName = (String) session.getAttribute("cusUserName");
		
//		System.out.println(recipientUserName);
//		System.out.println(cusUserName);
//		int checkAdminExist = Admin.checkAccountExist(adminUserName, adminPassword);
		boolean addRecipient = Customer.addRecipient(recipientName, recipientUserName, cusUserName);
		
		 if(addRecipient) {
			session.setAttribute("recipient", "success");
			resp.sendRedirect("./addRecipient.jsp");
		} else {
			session.setAttribute("recipientFail", "fail");
			resp.sendRedirect("./addRecipient.jsp");
		}
	}

}
