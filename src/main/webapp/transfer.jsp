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
  <body style="background-image:url(./images/building1.jpeg); background-repeat:no-repeat; background-size:cover;">
 	<jsp:include page='navbar.jsp'>
    <jsp:param name="login" value=""/>
	</jsp:include>
	
	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
	  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
	    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
	  </symbol>
	  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
	    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
	  </symbol>
	  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
	    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
	  </symbol>
	</svg>
	
	<div class="modal fade" id="onLoad" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header alert alert-success" role="alert">
		  	<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
			<h5 class="modal-title" id="exampleModalLabel">Transfer Success</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
		  	<span>Click </span><a href="/capstone/transaction">here</a><span> to view your transaction.</span>
		  </div>
		</div>
	  </div>
	</div>
	
	<div class="modal fade" id="onBalanceLow" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header alert alert-danger" role="alert">
		  	<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
			<h5 class="modal-title" id="exampleModalLabel">Your Balance is too low</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Please transfer an amount that is equal to or lesser than your balance.
		  </div>
		</div>
	  </div>
	</div>
	
	<div class="modal fade" id="onFail" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header alert alert-danger" role="alert">
		  	<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
			<h5 class="modal-title" id="exampleModalLabel">Transfer Failed</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Invalid recipient, please use a valid username.
		  </div>
		</div>
	  </div>
	</div>
	
	<div id="login-container" class="container w-50 mt-3 mx-auto">
		<h3>To</h3>
		<hr>
		<form action="/capstone/transfer">
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
				<%	if(recipientList != null)  { %>
					<%
						for(int i=0; i<recipientList.size(); i++) {
							Customer recipient = recipientList.get(i);
					%>
						<option value="<%=recipient.getRecipientUserName()%>"><%=recipient.getRecipientUserName()%></option>
					<% } }%>
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
				<% out.println("Your Balance: $" + session.getAttribute("cusBalance")); %>
			</div>
  			<div class="mb-3">
				<label for="recipient_name" class="form-label">Transfer Amount</label>
				<input id="amount" type="text" class="form-control" placeholder="$" name="transferAmount" required>
			 </div>
			  <button id="submitBtn" type="submit" class="btn btn-primary">submit</button>
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
		        	$("#picker1").prop("disabled", false);
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
		 
<%--  		$(window).bind('beforeunload', function(){
			 <% if(recipientList != null) { %>
				 <% recipientList.clear(); %>
			<% } %>
		});  --%>
		
		<% if(session.getAttribute("transfer") != null) { %>
		    $(document).ready(function(){
		        $("#onLoad").modal('show');
		    });
		<% } %>
		<% request.getSession().setAttribute("transfer", null);%>
		
		<% if(session.getAttribute("balanceLow") != null) { %>
		    $(document).ready(function(){
		        $("#onBalanceLow").modal('show'); 
		    });
		<% } %>
		<% request.getSession().setAttribute("balanceLow", null);%>
		
		<% if(session.getAttribute("transferFail") != null) { %>
	    	$(document).ready(function(){
	        $("#onFail").modal('show');
	    });
		<% } %>
		<% request.getSession().setAttribute("transferFail", null);%>
		
    </script>
  </body>
</html>
    