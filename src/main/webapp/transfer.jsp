<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="app.css" />
  </head>
  <body>
 	<jsp:include page='navbar.jsp'>
    <jsp:param name="login" value=""/>
	</jsp:include>
	
	<div class="modal fade" id="onLoad" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Recipient Added!</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Click the cross to view your changes
		  </div>
		</div>
	  </div>
	</div>
	
	<div class="modal fade" id="onFail" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Unable to add Recipient</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Recipient username is invalid, please try again.
		  </div>
		</div>
	  </div>
	</div>
	
	<div id="login-container" class="container w-50 mt-5 mx-auto">
		<h3>To</h3>
		<hr>
		<form action="/capstone/transfer" 
		oninput='transferAmount.setCustomValidity(transferAmount.value < <% session.getAttribute("cusBalance"); %> ? "Your transfer amount exceeds your current account balance." : "")'>
			<select class="form-select mb-3 selectpicker" aria-label="Default select example">
			  <option>Choose an option</option>
			  <option value="1">Choose an existing recipient</option>
			  <option value="2">Transfer to a new recipient</option>
			</select>
			<select id="picker1" class="form-select mb-5 d-none" name="rUserName" aria-label="Default select example">
			  <option id="picker1-selected" selected>Choose a recipient</option>
				<%@ page import = "com.ncs.customerModel.Customer" %>
				<%@ page import = "java.util.ArrayList" %>
			
				<% ArrayList<Customer> recipientList = (ArrayList<Customer>)session.getAttribute("recipientList"); %>
				<%
					for(int i=0; i<recipientList.size(); i++) {
						Customer recipient = recipientList.get(i);
				%>
					<option value="<%=recipient.getRecipientUserName()%>"><%=recipient.getRecipientUserName()%></option>
				<% } %>
			</select>
			<div id="picker2" class="mb-5 d-none">
				<label for="recipient_name" class="form-label">Recipient's Username</label>
				<input type="text" class="form-control" placeholder="Recipient's Username" name="rUserName">
			 </div>
			<h3>From</h3>
			<hr>
			<div style="font-size:18px;" class="mb-3">
				<% out.println("From your account: " + session.getAttribute("cusUserName")); %>
			</div>
			<div style="font-size:18px;" class="mb-3">
				<% out.println("Your balance: $ " + session.getAttribute("cusBalance")); %>
			</div>
  			<div class="mb-3">
				<label for="recipient_name" class="form-label">Transfer Amount</label>
				<input type="text" class="form-control" placeholder="$" name="transferAmount" required>
			 </div>
			  <button type="submit" class="btn btn-primary">submit</button>
		</form>
	</div>
	
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
	<script>

		 $('.selectpicker').change(function () {
		        var selectedItem = $('.selectpicker').val();
		        if(selectedItem == 1) {
		        	$("#picker2").addClass("d-none");
		        	$("#picker-1").prop("disabled", false);
		        	$("#picker1").removeClass("d-none");
		        } else if(selectedItem == 2) {
		        	$("#picker1").prop("disabled", true);
		        	$("#picker1").addClass("d-none"); 
		        	$("#picker2").removeClass("d-none");
		        } else {
		        	$("#picker1").addClass("d-none");
		        	$("#picker2").addClass("d-none");
		        }
		    });
		 
		 $(window).bind('beforeunload', function(){
			  <% recipientList.clear(); %>
			});
		 
		<% if(session.getAttribute("recipient") != null) { %>
		    $(document).ready(function(){
		        $("#onLoad").modal('show');
		    });
		<% } %>
		<% request.getSession().setAttribute("recipient", null);%>
		
		<% if(session.getAttribute("recipientFail") != null) { %>
	    	$(document).ready(function(){
	        $("#onFail").modal('show');
	    });
		<% } %>
		<% request.getSession().setAttribute("recipientFail", null);%>
		
    </script>
  </body>
</html>
    