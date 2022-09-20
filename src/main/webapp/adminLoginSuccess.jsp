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
	<%ArrayList<Integer> countLoans = (ArrayList<Integer>)session.getAttribute("countLoans");%>
							
	<div class="container w-50 mx-auto mt-5">
		<h5>You have <b><u><%=countLoans.get(2)%></u></b> pending loans left</h5>
		<ol class="list-group">
			<li class="list-group-item d-flex justify-content-between align-items-start" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapseExample">
				<div class="ms-2 me-auto">
					<div class="fw-bold">Pending Loan</div>
					      Click to view all pending loans
					 </div>
				<span class="badge bg-danger rounded-pill mt-3"><%=countLoans.get(2)%></span>
			 </li>
			  <% ArrayList<Loan> loanList = (ArrayList<Loan>)session.getAttribute("fetchLoans"); %>
			  <%	if(loanList != null)  { %>
					<%
						for(int i=0; i<loanList.size(); i++) {
							Loan loan = loanList.get(i);
							if(loan.getApprove() == 0) {
					%>
					
					<div class="card collapse" id="collapse5">
						<form action="/capstone/fetchLoanCustomerDetails">
							<div class="row g-0">
								<div class="col-4 ms-4">
									<b>loan type:</b><p class="mt-2"><%=loan.getLoanName() %></p>
									<b class="font-weight-bold">loan id:</b><p id=<%="id"+i%>><%=loan.getId()%></p>
									<input type="hidden" id=<%="id_hidden"+i%> name="loanId" />
								</div>
								<div class="col-4">
									<b class="font-weight-bold">username:</b><p id=<%="un"+i %>><%=loan.getUserName()%></p>
									<input type="hidden" id=<%="unh"+i%> name="userName" />
									<b>Principal sum:</b><p class="mt-2"><%=loan.getPrincipal() %></p>
								</div>
								<div class="col-3">
									<button id=<%=i%> type="submit" class="checkLoan btn btn-outline-primary mt-5 ms-5">Check Loan</button>
								</div>
							</div>
						</form>
					</div>
					
					<% } } }%>
					  <li class="list-group-item d-flex justify-content-between align-items-start" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapseExample">
					    <div class="ms-2 me-auto">
					      <div class="fw-bold">Approved Loan</div>
					      Click to view all approved loans
					    </div>
					    <span class="badge bg-primary rounded-pill mt-3"><%=countLoans.get(0)%></span>
					  </li>
					<%-- <% ArrayList<Loan> loanList = (ArrayList<Loan>)session.getAttribute("fetchLoans"); %> --%>
					  <%	if(loanList != null)  { %>
							<%
								for(int i=0; i<loanList.size(); i++) {
									Loan loan = loanList.get(i);
									if(loan.getApprove() == 1) {
							%>
							<div class="card collapse" id="collapse1">
							<div class="row">
								<div class="col ms-4">
									<p class="mt-2">
										loan type: <%=loan.getLoanName() %>
									</p>
									<span>loan id:</span><p><%=loan.getId()%></p>									
									<span>username:</span><p id="userName"><%=loan.getUserName()%></p>
								</div>
							</div>
						</div>
				<% }  } }%>
					  <li class="list-group-item d-flex justify-content-between align-items-start" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapseExample">
					    <div class="ms-2 me-auto">
					      <div class="fw-bold">Rejected Loan</div>
					      Click to view all rejected loans
					    </div>
					    <span class="badge bg-primary rounded-pill mt-3"><%=countLoans.get(1)%></span>
					  </li>		
					<%-- <% ArrayList<Loan> loanList = (ArrayList<Loan>)session.getAttribute("fetchLoans"); %> --%>
					  <%	if(loanList != null)  { %>
							<%
								for(int i=0; i<loanList.size(); i++) {
									Loan loan = loanList.get(i);
									if(loan.getApprove() == 2) {
							%>	  		
						<div class="card collapse" id="collapse2">
							<div class="row">
								<div class="col ms-4">
									<p class="mt-2">
										loan type: <%=loan.getLoanName() %>
									</p>
									<span>loan id:</span><p><%=loan.getId()%></p>
									<span>username:</span><p><%=loan.getUserName()%></p>
									
								</div>
							</div>
						</div>
			<%} } } %>
		</ol>
	</div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		 $('.checkLoan').click(function() {
			 console.log(this.id);
			 var i = this.id;
 			$("#id_hidden"+i).val($("#id"+i).text());
			 console.log($("#id_hidden"+i).val());
 			$("#unh"+i).val($("#un"+i).text());
			console.log($("#unh"+i).val());   
		 });
		 
<%-- 		 $(window).bind('beforeunload', function(){
			 <% if(loanList != null) { %>
				 <% loanList.clear(); %>
			<% } %>
		}); --%>
		 
<%-- 		 $(window).bind('beforeunload', function(){
			 <% if(countLoans != null) { %>
				 <% countLoans.clear(); %>
			<% } %> --%>
  </script>
  </body>
</html>