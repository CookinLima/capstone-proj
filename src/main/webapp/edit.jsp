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
		  <div class="modal-header">
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
	<div class="container mx-auto w-50">
		<h3 class="mt-3">My Profile</h3>
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
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    