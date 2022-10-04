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
  <body style="background-image:url(./images/banking1.jpeg); background-repeat: no-repeat; background-size: cover; height: 100vh; width: 100%;">
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
			<h5 class="modal-title" id="exampleModalLabel">Update Success!</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Click the cross to view your changes
		  </div>
		</div>
	  </div>
	</div>
	
	<div class="modal fade" id="onDeleteFail" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header alert alert-danger" role="alert">
		  	<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
			<h5 class="modal-title" id="exampleModalLabel">Account deletion failed</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Password invalid, please try again.
		  </div>
		</div>
	  </div>
	</div>
	
	<%@ page import = "com.ncs.customerModel.Customer" %>
	
	<% Customer customer = (Customer)session.getAttribute("customerDetails"); %>
	<div id="login-container" class="container mx-auto w-50 mt-5">
		<h3 class="mt-4">My Profile</h3>
		<h5>Manage and protect your account</h5>
		<hr>
		<form action="/capstone/updateCustomer">
			<div style="font-size:18px;" class="mb-3 clearfix">
				<% out.println("User name: " + customer.getUserName()); %>
			</div>
		    <div style="font-size:18px;" class="mb-3 white-space: nowrap;">
		    	<% out.println("Balance: $ " + customer.getBalance()); %>
		    </div>
		    <div class="row input-group mb-3">
  				<div class="col input-group mb-3 ml-2">
  					<span class="input-group-text" id="inputGroup-sizing-default">First name</span>
    				<input type="text" name="firstName" class="form-control" aria-label="Sizing example input" 
    				aria-describedby="inputGroup-sizing-default" value="<% out.println(customer.getFirstName());%>">
  				</div>
  				<div class="col input-group mb-3 ">
  					<span class="input-group-text" id="inputGroup-sizing-default">Last name</span>
    				<input type="text" name="lastName" class="form-control" aria-label="Sizing example input" 
    				aria-describedby="inputGroup-sizing-default" value="<% out.println(customer.getLastName());%>">
  				</div>
			</div>
			<div class="row input-group mb-3">
	  			<div class="col input-group mb-3 ml-2">
	  				<span class="input-group-text" id="inputGroup-sizing-default">Email</span>
	    			<input type="text" name="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="<%=customer.getEmail()%>">
	  			</div>
	  			<div class="col input-group mb-3 ">
	  				<span class="input-group-text" id="inputGroup-sizing-default">Phone No.</span>
	    			<input type="text" name="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="<% out.println(customer.getNumber());%>">
	  			</div>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default">Address</span>
				<input type="text" name="address" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="<% out.println(customer.getAddress());%>">
			</div>
		  	<button type="submit" class="btn btn-primary mb-3">Submit</button>
		</form>
		<p data-bs-toggle="modal" data-bs-target="#exampleModal" class="mb-3" style="color: #0d6efd; cursor: pointer;">Click here to delete account</p>
		<div class="modal fade mt-5" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">To delete, please enter your password</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="/capstone/deleteCustomer">
			        <div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">Password</span>
						<input type="text" name="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>
					<div class="modal-footer">
		      			<input type="submit" onclick="location.href='/capstone/deleteCustomer';" value=Delete class="btn btn-primary">
		      		</div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    >
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
	<script>
		<% if(session.getAttribute("update") != null) { %>
		    $(document).ready(function(){
		        $("#onLoad").modal('show');
		    });
		<% } %>
		<% request.getSession().setAttribute("update", null);%>
		
		<% if(session.getAttribute("delete") != null) { %>
	    	$(document).ready(function(){
	        $("#onDeleteFail").modal('show');
	    });
		<% } %>
		<% request.getSession().setAttribute("delete", null);%>
		
    </script>
  </body>
</html>
    