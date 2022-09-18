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
	
				  	<%@ page import = "com.ncs.customerModel.Loan" %>
					<%@ page import = "java.util.ArrayList" %>
								
						<% ArrayList<Loan> loanList = (ArrayList<Loan>)session.getAttribute("fetchLoans"); %>
							<%	if(loanList != null)  { %>
								<%
									for(int i=0; i<loanList.size(); i++) {
										Loan loan = loanList.get(i);
								%>
								<p><%=loan.getLoanName()%></p>
						<% } }%>

	
	
	<div class="container w-50 mx-auto mt-5">
		<ol class="list-group list-group-numbered">
		  <li class="list-group-item d-flex justify-content-between align-items-start" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
		    <div class="ms-2 me-auto">
		      <div class="fw-bold">Pending Loan</div>
		      Cras justo odio
		    </div>
		    <span class="badge bg-danger rounded-pill">14</span>
		  </li>
		  <div class="card collapse" id="collapseExample">
			  <div class="card-body">
			    This is some text within a card body.
			  </div>
		 </div>
		 		  <div class="card collapse" id="collapseExample">
			  <div class="card-body">
			    This is some text within a card body.
			  </div>
		 </div>
		 		  <div class="card collapse" id="collapseExample">
			  <div class="card-body">
			    This is some text within a card body.
			  </div>
		 </div>
		  <!-- <p class="collapse" id="collapseExample">working</p> -->
		  <li class="list-group-item d-flex justify-content-between align-items-start">
		    <div class="ms-2 me-auto">
		      <div class="fw-bold">Approved Loan</div>
		      Cras justo odio
		    </div>
		    <span class="badge bg-primary rounded-pill">14</span>
		  </li>
		  <li class="list-group-item d-flex justify-content-between align-items-start">
		    <div class="ms-2 me-auto">
		      <div class="fw-bold">Rejected Loan</div>
		      Cras justo odio
		    </div>
		    <span class="badge bg-primary rounded-pill">14</span>
		  </li>
		</ol>
	</div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>