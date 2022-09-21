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
	<%@ page import = "java.util.ArrayList" %>
	
	<% ArrayList<Loan> loans = (ArrayList<Loan>)session.getAttribute("userLoans"); %>
		<%
			for(int i=0; i<loans.size(); i++) {
				Loan loan = loans.get(i);
				if(loan.getApprove() == 0) {
		%>
 			<div class="container w-50 mx-auto mt-5">
				<div class="card text-start">
				  <div class="card-header">
				  	<div class="row">
				  		<div class="col-8">
				  			<span>Loan id:</span><h5 id="loanId"><%=loan.getId()%></h5>
				  		</div>
					    <button class="btn btn-outline-dark col-4" disabled>Pending</button>				  	
				  	</div>
				  </div>
				  <div class="card-body">
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
				</div>	  
			</div>
		<% } else if(loan.getApprove() == 1) { %>
 			<div class="container w-50 mx-auto mt-5">
				<div class="card text-start">
				  <div class="card-header">
				  	<div class="row">
				  		<div class="col-8">
				  			<span>Loan id:</span><h5 id="loanId"><%=loan.getId()%></h5>
				  		</div>
					    <button class="btn btn-outline-success col-4" disabled>Approved</button>				  	
				  	</div>
				  </div>
				  <div class="card-body">
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
				</div>	  
			</div>							
		<% } else { %>
 			<div class="container w-50 mx-auto mt-5">
				<div class="card text-start">
				  <div class="card-header">
				  	<div class="row">
				  		<div class="col-8">
				  			<span>Loan id:</span><h5 id="loanId"><%=loan.getId()%></h5>
				  		</div>
					    <button class="btn btn-outline-danger col-4" disabled>Rejected</button>				  	
				  	</div>
				  </div>
				  <div class="card-body">
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
				</div>	  
			</div>		
		<% } }%>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
    