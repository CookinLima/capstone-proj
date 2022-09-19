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
    <link rel="stylesheet" href="index.css" />
  </head>
  <body>
 	<jsp:include page='navbar.jsp'>
    <jsp:param name="login" value=""/>
	</jsp:include>
		  
	<div id="first-div" class="main-div">
		<div class="info shadow-lg">
			<h2>Long Term Value</h2>
			<h5>Our approach to sustainability</h5>
			<p>Here is how we are managing our business in a balanced and responsible way.</p>
			<button class="btn btn-primary">Find out</button>			
		</div>
	</div>
	<div id="second-div" class="main-div">
		<div class="d-flex container justify-content-around">
			<div class=row>
				<div class="col-4">
					<div class="card h-100" style="width: 18rem;">
					  <img src="./images/house1.jpeg" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">Housing Loan</h5>
					    <p class="card-text">Worried about financing your house? Fear not!</p>
					    <a href="#" class="btn btn-primary">find out more</a>
					  </div>
					</div>
				</div>
		
			<div class="col-4">
					<div class="card h-100" style="width: 18rem;">
					  <img src="./images/car1.jpeg" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">Auto Loan</h5>
					    <p class="card-text">Thinking of buying your dream car? Wait no longer!</p>
					    <a href="#" class="btn btn-primary">find out more</a>
					  </div>
					</div>
			</div>

			<div class="col-4">
					<div class="card h-100" style="width: 18rem;">
					  <img src="./images/student.jpeg" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">Student Loan</h5>
					    <p class="card-text">Don't get distracted by your finances, get that degree!</p>
					    <a href="#" class="btn btn-primary">find out more</a>
					  </div>
					</div>
			</div>
			
			</div>


		</div>
	</div>
	<div id="third-div" class="main-div">
		<div class="info shadow-lg">
			<h2>Get that peace of mind</h2>
			<h5>Our approach to securing your future</h5>
			<p>Here is how we are managing our business in a balanced and responsible way.</p>
			<button class="btn btn-primary">Find out</button>						
		</div>
	</div>
	<div id="fourth-div" class="main-div">
		<h2>Div 4</h2>
	</div>
	
	
	<script>
		const parallax = document.getElementById("first-div");
		
		window.addEventListener("scroll", function() {
			let offset = window.pageYOffset;
			parallax.style.backgroundPositionY = offset * 0.7 + "px";
		})
	</script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
    