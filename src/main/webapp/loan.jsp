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
  <body style="background-color: #f5d7d7">
 	<jsp:include page='navbar.jsp'>
    <jsp:param name="login" value=""/>
	</jsp:include>
	
	<div class="modal fade" id="onLoad" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Loan application Success!</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Please wait 1-2 weeks for our agents examine your application.
		  </div>
		</div>
	  </div>
	</div>
	
	<div class="modal fade" id="onFail" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Loan application Failed</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Username is invalid, please try again.
		  </div>
		</div>
	  </div>
	</div>
	
	<div id="login-container" class="container w-50 mt-3 mx-auto">
	<!-- style="background-color: #EDF5E1 !important; -->
		<form action="/capstone/submitLoan">
			<div class="row mb-3">
  				<div class="col">
					<label for="occupation" class="form-label">What is your occupation</label>
					<input type="text" class="form-control" placeholder="occupation" name="occupation" required>
  				</div>
  				<div class="col">
  					<label for="income" class="form-label">what is your current income</label>
    				<input type="text" class="form-control" placeholder="current income" aria-label="Last name" name="income" aria-label="Amount (to the nearest dollar)">
  				</div>
			</div>
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

			  <button id="submitBtn" type="submit" class="btn btn-primary">Submit</button>
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
		$('#submitBtn').click(function() {
			$("#annualIR").prop('disabled', false);
			$("#totalIR").prop('disabled', false);
		})
	
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
    <script>

		<% if(session.getAttribute("loan") != null){ %>
		    $(document).ready(function(){
		        $("#onLoad").modal('show');
		    });
		<% } %>
		<% request.getSession().setAttribute("loan", null);%>
		
		<% if(session.getAttribute("loanFail") != null) { %>
	    	$(document).ready(function(){
	        $("#onFail").modal('show');
	    });
		<% } %>
		<% request.getSession().setAttribute("loanFail", null);%>
		
    </script>
  </body>
</html>
    