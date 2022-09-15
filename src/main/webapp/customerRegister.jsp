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
	<div id="login-container" class="container w-50 mt-3 mx-auto">
	<!-- style="background-color: #EDF5E1 !important; -->
		<form action="/capstone/createCustomer" oninput='password2.setCustomValidity(password2.value != password.value ? "Passwords do not match." : "")' >
			<div class="row mb-3">
  				<div class="col">
  					<label for="firstName" class="form-label">First Name</label>
    				<input type="text" class="form-control" placeholder="First name" aria-label="First name" name="firstName">
  				</div>
  				<div class="col">
  					<label for="lastName" class="form-label">Last Name</label>
    				<input type="text" class="form-control" placeholder="Last name" aria-label="Last name" name="lastName">
  				</div>
			</div>
  			<div class="mb-3">
				<label for="username" class="form-label">Username</label>
				<input type="text" class="form-control" placeholder="Username" name="userName" required>
			  </div>
			  <div class="row mb-3">
  				<div class="col">
				    <label for="exampleInputPassword1" class="form-label">Password</label>
				    <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password" required>
  				</div>
  				<div class="col">
				    <label for="exampleInputPassword2" class="form-label">Retype Password</label>
				    <input type="password" class="form-control" id="exampleInputPassword2" name="password2" placeholder="Retype password" required>
  				</div>
			</div>
			  <div class="mb-3">
				<label for="username" class="form-label">Address</label>
				<input type="text" class="form-control" placeholder="address" name="adderess" required>
			  </div>
			  <div class="mb-3">
				<label for="username" class="form-label">Phone Number</label>
				<input type="text" class="form-control" placeholder="Phone number" name="number" required>
			  </div>
			  <div class="mb-3">
				<label for="username" class="form-label">Email</label>
				<input type="text" class="form-control" placeholder="youremail@email.com" name="email" required>
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
    