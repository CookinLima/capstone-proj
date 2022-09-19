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
  <body style="background-image:url(./images/family1.jpeg); ">
 	<jsp:include page='navbar.jsp'>
    <jsp:param name="login" value=""/>
	</jsp:include>
	
	<div id="login-container" class="container w-50 mt-5 mx-auto">
	<!-- style="background-color: #EDF5E1 !important; -->
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
	</div>
	
	<div class="modal fade" id="onLoad" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Login Failed</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Incorrect username or password, please try again.
		  </div>
		</div>
	  </div>
	</div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
		<% if(session.getAttribute("fail") != null) { %>
		    $(document).ready(function(){
		        $("#onLoad").modal('show');
		    });
		<% } %>
		<% request.getSession().setAttribute("fail", null);%>
    </script>
  </body>
</html>
    