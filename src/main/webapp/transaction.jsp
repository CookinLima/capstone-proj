<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css"/>
    
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    <script>
	    $(document).ready(function () {
	        $('#example').DataTable();
	    });
    </script>
    
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
		<div class="container w-75 mx-auto mt-5">
			<table id="example" class="table table-striped" style="width:100%">
				 <thead>
				   <tr>
				     <th scope="row">Date</th>
				     <th>Reference</th>
				     <th>Debit(Withdrawal)</th>
				     <th>Credit(Deposit)</th>
				   </tr>
				 </thead>
				 <tbody>
				  	<%@ page import = "com.ncs.customerModel.Customer" %>
					<%@ page import = "java.util.ArrayList" %>
								
						<% ArrayList<Customer> transactionList = (ArrayList<Customer>)session.getAttribute("transactionList"); %>
							<%	if(transactionList != null)  { %>
								<%
									for(int i=0; i<transactionList.size(); i++) {
										Customer transaction = transactionList.get(i);
								%>
									<tr>
										<th><%=transaction.getDatetime()%></th>
										<% if(session.getAttribute("cusUserName").equals(transaction.getRecipientUserName())) { %>
											<th> <%=transaction.getUserName() %></th>
											<th> </th>
											<th> <%=transaction.getAmount() %> </th>
										<% }  else { %>
											<th> <%=transaction.getRecipientUserName() %> </th>
											<th> <%=transaction.getAmount() %> </th>
											<th>  </th>
										<% } %>
									</tr>
						<% } }%>
				  </tbody>
				</table>
		</div>
  	<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script> 
	<script>
		 $(window).bind('beforeunload', function(){
			 <% if(transactionList != null) { %>
				 <% transactionList.clear(); %>
			<% } %>
		})
	</script>

  </body>
</html>
    