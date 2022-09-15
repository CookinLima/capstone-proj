<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
	
	<%@ page import = "com.ncs.customerModel.Customer" %>
	
	<% Customer customer = (Customer)session.getAttribute("customerDetails"); %>
	<div class="container mx-auto w-50">
		<h3 class="mt-3">My Profile</h3>
		<h5>Manage and protect your account</h5>
		<hr>
		<form action="/capstone/updateCustomer">
			<div style="font-size:18px;" class="mb-3">
				<% out.println("User name: " + customer.getUserName()); %>
			</div>
		    <div style="font-size:18px;" class="mb-3">
		    	<% out.println("Balance: $ " + customer.getBalance()); %>
		    </div>
		    <div class="row input-group mb-3">
  				<div class="col input-group mb-3 ml-2">
  					<span class="input-group-text" id="inputGroup-sizing-default">First name</span>
    				<input type="text" name="firstName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="
    				<% out.println(customer.getFirstName());%>
    				">
  				</div>
  				<div class="col input-group mb-3 ">
  					<span class="input-group-text" id="inputGroup-sizing-default">Last name</span>
    				<input type="text" name="lastName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="
    				<% out.println(customer.getLastName());%>
    				">
  				</div>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default">Password</span>
				<input type="text" name="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="
				  <% out.println(customer.getPassword());%>	
				  ">
			</div>
			<div class="row input-group mb-3">
	  			<div class="col input-group mb-3 ml-2">
	  				<span class="input-group-text" id="inputGroup-sizing-default">Email</span>
	    			<input type="text" name="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="
	    				<% out.println(customer.getEmail());%>
	    				">
	  			</div>
	  			<div class="col input-group mb-3 ">
	  				<span class="input-group-text" id="inputGroup-sizing-default">Phone No.</span>
	    			<input type="text" name="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="
	    			<% out.println(customer.getNumber());%>
	    			">
	  			</div>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default">Address</span>
				<input type="text" name="address" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="
				  <% out.println(customer.getAddress());%>
				  ">
			</div>
		  	<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>


<!-- 	<div class="container w-50 mt-5 mx-auto">
		<form action="/capstone/validateCustomerLogin">
  			<div class="mb-3">
				<label for="username" class="form-label">Username</label>
				<input type="text" class="form-control" placeholder="Username" name="username" required>
			  </div>
			  <div class="mb-3">
			    <label for="exampleInputPassword1" class="form-label">Password</label>
			    <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password" required>
			  </div>
			  <button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div> -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
    