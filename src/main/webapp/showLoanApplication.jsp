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
  <body style="background-color:#659dbd;">
 	<jsp:include page='navbar.jsp'>
    <jsp:param name="login" value=""/>
	</jsp:include>
	<%@ page import = "com.ncs.customerModel.Loan" %>
	<%@ page import = "com.ncs.customerModel.Customer" %>
	
	<% Loan loan = (Loan)session.getAttribute("fetchLoan"); %>
	<% Customer customer = (Customer)session.getAttribute("fetchCustomer"); %>
		<%if(loan != null){ %>
			<div class="container w-50 mx-auto mt-5">
				<div class="card text-start">
				  <div class="card-header">
				    <span>Loan id:</span><h5 id="loanId"><%=loan.getId()%></h5>
				  </div>
				  <div class="card-body">
				  	<div class="row mb-3">
		  				<div class="col">
							<p class="card-text">First name: <%=customer.getFirstName()%></p>
		  				</div>
		  				<div class="col">
							<p class="card-text">Last name: <%=customer.getLastName()%></p>
		  				</div>
					</div>
					<div class="row mb-3">
		  				<div class="col">
							<p class="card-text">Applicant's Occupation: <%=customer.getOccupation()%></p>
		  				</div>
		  				<div class="col">
							<p class="card-text">Applicant's Income:$ <%=customer.getIncome()%></p>
		  				</div>
					</div>
					<div class="row mb-3">
		  				<div class="col">
							<p class="card-text">Applicant's Email: <%=customer.getEmail()%></p>
		  				</div>
		  				<div class="col">
							<p class="card-text">Applicant's Phone Number: <%=customer.getNumber()%></p>
		  				</div>
					</div>
					<div class="row mb-3">
		  				<div class="col">
							<span class="card-text">Principal Sum: $</span><span id="principal"><%=loan.getPrincipal()%></span>
		  				</div>
		  				<div class="col">
							<p class="card-text">Duration: <%=loan.getDuration()%><span> years</span></p>
		  				</div>
					</div>
					<div class="row mb-3">
		  				<div class="col">
							<p class="card-text">Total Interest payable: $<%=loan.getTotalIR()%></p>
		  				</div>
		  				<div class="col">
							<p class="card-text">Annual Interest Rate: $<%=loan.getAnnualIR()%></p>
		  				</div>
					</div>
				  </div>
				  <div class="container card-footer text-muted justify-content-evenly">
				  <div class="row justify-content-evenly">
					  <form action="/capstone/approveLoan" class="col-6 text-center" >
					  	<input type="hidden" class="loanId_hidden" name="loanId"/>
					  	<input type="hidden" name="approve" value="1"/>
					  	<input type="hidden" name="applicantUserName" value="<%=customer.getUserName()%>"/>
					  	<input type="hidden" name="principal" class="principal_hidden"/>
					    <button type="submit" id="approveBtn" class="btn btn-primary my-2">Approve</button>
					  </form>
					  <form action="/capstone/rejectLoan" class="col-6 text-center">
						<input type="hidden" class="loanId_hidden" name="loanId" />
						<input type="hidden" name="reject" value="2"/>
						<button type="submit" id="rejectBtn" class="btn btn-primary my-2">Reject</button>
					  </form>				  
				  </div>
<!-- 					  <div class="card-footer text-muted">

					  </div>	 -->			  
				  </div>

				</div>
			</div>
		<% } %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		 $('#approveBtn').click(function() {
			$(".loanId_hidden").val($("#loanId").text());
			$(".principal_hidden").val($("#principal").text());
			 console.log($(".principal_hidden").val());
			 
		 });
		 $('#rejectBtn').click(function() {
			$(".loanId_hidden").val($("#loanId").text());
			console.log($("#loanId_hidden").val());
		 });
  </script>
  </body>
</html>
    