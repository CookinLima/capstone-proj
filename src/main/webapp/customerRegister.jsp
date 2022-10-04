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
	<div id="login-container" class="container w-50 h-90 mt-5 mx-auto"">
	<!-- style="background-color: #EDF5E1 !important; -->
		<form action="/capstone/createCustomer" oninput='password2.setCustomValidity(password2.value != password.value ? "Passwords do not match." : "")' >
			<div class="row mb-2">
  				<div class="col form-floating">
  					<input type="text" id="firstName" class="form-control" placeholder="First name" name="firstName">	
  					<label for="firstName" class="form-label ms-2">First Name</label>   				
  				</div>
  				<div class="col form-floating">
  					<input type="text" id="lastName" class="form-control" placeholder="Last name" name="lastName">
  					<label for="lastName" class="form-label ms-2">Last Name</label>   				
  				</div>
			</div>
			<div class="row mb-2">
  				<div class="col form-floating">
  					<input type="text" id="username" class="form-control mt-3" placeholder="Username" name="userName" required>
					<label for="username" class="form-label ms-2 mt-3">Username</label>
  				</div>
  				<div class="col form-floating">
  					<input type="text" class="form-control mt-3" placeholder="$" name="deposit" >
  					<label  id="deposit" for="deposit" class="form-label ms-2 mt-3">Initial Deposit</label>
  				</div>
			</div>
			  <div class="row mb-2">
  				<div class="col form-floating">
				    <input type="password" class="form-control mt-3" id="exampleInputPassword1" name="password" placeholder="Password" required>
				    <label for="exampleInputPassword1" class="form-label ms-2 mt-3">Password</label>
  				</div>
  				<div class="col form-floating">
  					<input type="password" class="form-control mt-3" id="exampleInputPassword2" name="password2" placeholder="Retype password" required>
				    <label for="exampleInputPassword2" class="form-label ms-2 mt-3">Retype Password</label>
  				</div>
			</div>
			  <div class="mb-2 form-floating">
			  	<input type="text" class="form-control mt-3" id="address" placeholder="address" name="address" required>
				<label for="address" class="form-label">Address</label>
			  </div>
			  <div class="mb-2 form-floating mt-3">
			  	<input type="text" id="number" class="form-control" placeholder="Phone number" name="number" required>
				<label for="number" class="form-label">Phone Number</label>				
			  </div>
			  <div class="mb-3 form-floating mt-3">
			  	<input type="text" id="email" class="form-control" placeholder="youremail@email.com" name="email" required>
				<label for="email" class="form-label">Email</label>				
			  </div>
			  <button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
    