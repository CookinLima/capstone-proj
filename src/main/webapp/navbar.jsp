<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <nav class="navbar sticky-top navbar-expand-lg navbar-light py-0 ps-5" style="background-color:white;">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <img
            src="images/merlion.jpeg"
            style="width: 70px; height: 70px;"
            alt=""
          />
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNavDropdown"
          aria-controls="navbarNavDropdown"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item px-4">
              <a class="nav-link" aria-current="page" href="/capstone/index.jsp">Home</a>
            </li>
            <li class="nav-item dropdown px-4">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdownMenuLink"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Bank
              </a>
              <ul
                class="dropdown-menu"
                aria-labelledby="navbarDropdownMenuLink"
              >
                <li><a class="dropdown-item" href="/capstone/loadTransferPage">Transfer (One-time)</a></li>
                <li>
                  <a class="dropdown-item" href="/capstone/addRecipient.jsp">Add new recipient</a>
                </li>
                <li>
                  <a class="dropdown-item" href="/capstone/transaction">Show all transactions</a>
                </li>
              </ul>
            </li>
            <li class="nav-item px-4">
              <a class="nav-link" href="/capstone/loan.jsp">Loan</a>
<!--               <ul
                class="dropdown-menu"
                aria-labelledby="navbarDropdownMenuLink"
              >
                <li><a class="dropdown-item" href="/capstone/loan.jsp">Loan</a></li>
                <li><a class="dropdown-item" href="#">Housing Loan</a></li>
                <li>
                  <a class="dropdown-item" href="#">Student Loan</a>
                </li>
              </ul> -->
            </li>
          </ul>
          <% if(session.getAttribute("login") == null) { %>
          <ul class="navbar-nav ms-auto me-3">
            <li class="nav-item">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-shield-lock-fill" viewBox="0 0 16 16">
				  	<path fill-rule="evenodd" d="M8 0c-.69 0-1.843.265-2.928.56-1.11.3-2.229.655-2.887.87a1.54 1.54 0 0 0-1.044 1.262c-.596 4.477.787 7.795 2.465 9.99a11.777 11.777 0 0 0 2.517 2.453c.386.273.744.482 1.048.625.28.132.581.24.829.24s.548-.108.829-.24a7.159 7.159 0 0 0 1.048-.625 11.775 11.775 0 0 0 2.517-2.453c1.678-2.195 3.061-5.513 2.465-9.99a1.541 1.541 0 0 0-1.044-1.263 62.467 62.467 0 0 0-2.887-.87C9.843.266 8.69 0 8 0zm0 5a1.5 1.5 0 0 1 .5 2.915l.385 1.99a.5.5 0 0 1-.491.595h-.788a.5.5 0 0 1-.49-.595l.384-1.99A1.5 1.5 0 0 1 8 5z"></path>
				  </svg>
                Login
              	</button>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				         <h5 class="modal-title" id="exampleModalLabel">Choose one to continue</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body d-flex justify-content-evenly">
				      	<div class="d-flex flex-column justify-content-center">
				      		<h5>Are you an admin?</h5>
				      		<input type="button" onclick="location.href='/capstone/adminLogin.jsp';" value=Admin class="btn btn-primary">
				      		<!-- <button type="button" class="btn btn-primary"><a href="/capstone/adminLogin.jsp">Admin</a></button> -->
				      	</div>
				        <div class="d-flex flex-column justify-content-center">
				        	<h5>Already a customer?</h5>
				        	<input type="button" onclick="location.href='/capstone/customerLogin.jsp';" value=Customer class="btn btn-primary">
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
            </li>
            <a href="customerRegister.jsp"><button class="btn btn-primary mx-3">Register</button></a>
          </ul>
          <%  } else { %>
		          <ul class="navbar-nav ms-auto me-3">
		            <li class="nav-item dropdown user-li">
		              <a
		                class="nav-link dropdown-toggle"
		                href="#"
		                id="navbarDropdownMenuLink"
		                role="button"
		                data-bs-toggle="dropdown"
		                aria-expanded="false"
		              >
		                <% 
		                	out.println(session.getAttribute("login"));
		                %>
		              </a>
		              <ul
		                class="dropdown-menu"
		                aria-labelledby="navbarDropdownMenuLink"
		              >
		                <li><a class="dropdown-item" href="/capstone/fetchCustomer">Edit Profile</a></li>
		                <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
		              </ul>
		            </li>
		            <a href="customerRegister.jsp"><button class="btn btn-primary mx-3">Register</button></a>
		          </ul>
		  <% } %>
        </div>
      </div>
    </nav>