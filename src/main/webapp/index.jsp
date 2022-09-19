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
			<div id="login-container" class="container w-50 mt-2 mx-auto">
	<!-- style="background-color: #EDF5E1 !important; -->
		<form action="/capstone/submitLoan">
			<select id="selectVal" class="form-select mb-3" name="loanName" aria-label="Default select example" required>
			  <option value="">Choose a loan option</option>
			  <option value="auto">Auto Loan</option>
			  <option value="housing">Housing Loan</option>
			  <option value="student">Student Loan</option>
			</select>
			  <div class="mb-4">
				<label for="principal" class="form-label">How much do you want to borrow?</label>
				<input id="pVal" type="text" class="form-control" placeholder="principal amount: $" name="principal" required>
			  </div>
			  <div class="mb-3">
				  <label for="customRange2" class="form-label">How long do you intent to borrow for?</label>
				  <input type="range" class="form-range" min="1" max="20" id="customRange2" onInput="$('#rangeval').val($(this).val())">
				  <div class="input-group mb-3">
					  <input id="rangeval" type="text" class="form-control" name="duration" placeholder="years" aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button id="onCalculate" class="btn btn-outline-primary" type="button" id="button-addon2">Calculate IR</button>
				  </div>
				  <!-- <span id="rangeval">0</span><span> years</span> -->
				  <!-- <button type="button" id="onCalculate" class="btn btn-primary ms-1">Calculate IR</button> -->
			  </div>
			  <div class="mb-3">
				  <label for="" class="form-label">Your expected annual interest-rate(IR)</label>
				  <input id="annualIR" class="form-control" type="text" name="annualInterest" aria-label="Disabled input example" disabled readonly>
			  </div>
			  <div class="mb-3">
				  <label for="" class="form-label">Your expected total interest-rate(IR)</label>
				  <input id="totalIR" class="form-control" type="text" name="totalInterest" aria-label="Disabled input example" disabled readonly>
			  </div>
		</form>
	</div>
	</div>
	
	
	<script>
		const parallax = document.getElementById("first-div");
		
		window.addEventListener("scroll", function() {
			let offset = window.pageYOffset;
			parallax.style.backgroundPositionY = offset * 0.7 + "px";
		})
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
	 $('#onCalculate').click(function () {
	        var selectedRange = $('#rangeval').val();
			var selectedLoan = $('#selectVal').val();
			var selectedPVal = $('#pVal').val();
			
			/* auto 10% of principal sum */
			/* housing 15% of principal sum */
			/* student 5% of principal sum */
			var autoIR = 0.1;
			var housingIR = 0.15;
			var studentIR = 0.05;
			
			console.log(selectedRange);
			
			if(selectedLoan == 'auto') {
				var newAutoIR = autoIR + ((selectedRange - 1) / 100);
				var totalInterest = selectedPVal * newAutoIR;
				var annualInterest = totalInterest / selectedRange;
				$('#annualIR').val(annualInterest.toFixed(2));
				$('#totalIR').val(totalInterest.toFixed(2));
				console.log(annualInterest);
			} 
			
			if(selectedLoan == 'housing') {
				var newHousingIR = housingIR + ((selectedRange - 1) / 100);
				var totalInterest = selectedPVal * newHousingIR;
				var annualInterest = totalInterest / selectedRange;
				$('#annualIR').val(annualInterest.toFixed(2));
				$('#totalIR').val(totalInterest.toFixed(2));
				console.log(annualInterest);
			}
			
			if(selectedLoan == 'student') {
				var newStudentIR = studentIR + ((selectedRange - 1) / 100);
				var totalInterest = selectedPVal * newHousingIR;
				var annualInterest = totalInterest / selectedRange;
				$('#annualIR').val(annualInterest.toFixed(2));
				$('#totalIR').val(totalInterest.toFixed(2));
				console.log(annualInterest);
			} 
	    });
	</script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
    