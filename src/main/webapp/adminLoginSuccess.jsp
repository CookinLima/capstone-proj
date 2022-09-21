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
  <body style="background-color: #659dbd;">
 	<jsp:include page='navbar.jsp'>
    <jsp:param name="login" value=""/>
	</jsp:include>
	
	<div class="modal fade" id="onLoad" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Loan approved successfully</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Click the cross to view your changes
		  </div>
		</div>
	  </div>
	</div>
	
	<div class="modal fade" id="onFail" tabindex="-1">
	  <div class="modal-dialog modal-sm">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Loan rejected successfully</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
				Click the cross to view your changes
		  </div>
		</div>
	  </div>
	</div>
	
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
									<b>loan type:</b>
									<%if(loan.getLoanName().equals("housing")) { %>
									<p class="mt-2"><%=loan.getLoanName() %> <svg class="ms-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
									  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
									</svg></p>
									<% }  else if(loan.getLoanName().equals("auto")) { %>
									<p class="mt-2"><%=loan.getLoanName() %><svg class="ms-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-car-front-fill" viewBox="0 0 16 16">
									<path fill-rule="evenodd" d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2Zm10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2ZM6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2H6ZM2.906 5.189l.956-1.913A.5.5 0 0 1 4.309 3h7.382a.5.5 0 0 1 .447.276l.956 1.913a.51.51 0 0 1-.497.731c-.91-.073-3.35-.17-4.597-.17-1.247 0-3.688.097-4.597.17a.51.51 0 0 1-.497-.731Z"/>
									</svg></p>
									<% } else { %>
									<p class="mt-2"><%=loan.getLoanName() %><svg class="ms-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book-fill" viewBox="0 0 16 16">
									<path d="M8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
									</svg></p>									
									<% } %>
									<b class="font-weight-bold">loan id:</b><p id=<%="id"+i%>><%=loan.getId()%></p>
									<input type="hidden" id=<%="id_hidden"+i%> name="loanId" />
								</div>
								<div class="col-4">
									<b class="font-weight-bold">username:</b><p id=<%="un"+i %>><%=loan.getUserName()%></p>
									<input type="hidden" id=<%="unh"+i%> name="userName" />
									<b>Principal sum: </b><p class="mt-2"">$ <%=loan.getPrincipal() %></p>
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
									<button id=<%=i%> type="button" class="checkLoan btn btn-outline-success mt-5 ms-5 disabled">Check Loan</button>
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
									<button id=<%=i%> type="button" class="checkLoan btn btn-outline-danger mt-5 ms-5 disabled">Rejected</button>
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
		 
		<% if(session.getAttribute("approve") != null) { %>
		    $(document).ready(function(){
		        $("#onLoad").modal('show');
		    });
		<% } %>
		<% request.getSession().setAttribute("approve", null);%>
		
		<% if(session.getAttribute("reject") != null) { %>
	    	$(document).ready(function(){
	        $("#onFail").modal('show');
	    });
		<% } %>
		<% request.getSession().setAttribute("reject", null);%>
		 
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