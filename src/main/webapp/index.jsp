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
    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <img
            src="images/bankicon.png"
            style="width: 70px; height: 70px; border-radius: 50%"
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
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item dropdown">
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
                <li><a class="dropdown-item" href="#">Deposit</a></li>
                <li><a class="dropdown-item" href="#">Withdrawal</a></li>
                <li>
                  <a class="dropdown-item" href="#">Transfer</a>
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdownMenuLink"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Loan
              </a>
              <ul
                class="dropdown-menu"
                aria-labelledby="navbarDropdownMenuLink"
              >
                <li><a class="dropdown-item" href="#">Auto Loan</a></li>
                <li><a class="dropdown-item" href="#">Housing Loan</a></li>
                <li>
                  <a class="dropdown-item" href="#">Student Loan</a>
                </li>
              </ul>
            </li>
          </ul>
          <% if(session.getAttribute("login") == null) { %>
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdownMenuLink"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Login
              </a>
<!--               <ul
                class="dropdown-menu"
                aria-labelledby="navbarDropdownMenuLink"
              >
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <a class="dropdown-item" href="#">Something else here</a>
                </li>
              </ul> -->
            </li>
            <button class="btn btn-primary">Register</button>
          </ul>
          <%  } else { %>
		          <ul class="navbar-nav ms-auto">
		            <li class="nav-item dropdown">
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
		                <li><a class="dropdown-item" href="#">Edit Profile</a></li>
		                <li><a class="dropdown-item" href="#">Logout</a></li>
		              </ul>
		            </li>
		            <button class="btn btn-primary">Register</button>
		          </ul>
		  <% } %>
        </div>
      </div>
    </nav>
    <a class="nav-link" href="/capstone/adminLogin.jsp"
      >Add Car Details</a
    >
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
    