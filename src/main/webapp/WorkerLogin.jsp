<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Worker</title>
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>

<style>
body {
  position: relative;
  height: auto;
  margin: 0;
  display: flex;
  flex-direction: column;
}

body::before {
  content: "";
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  
  background-color:#abecd6;
  background-size: cover;
  background-position: center; /* Center the background image */
  background-repeat: no-repeat; /* Do not repeat the background image */
  filter: blur(2px); /* Adjust the blur value as needed */
  z-index: -1; /* #ff758c Place the pseudo-element behind the content */
}

/* Additional styles for the rest of your content */
</style>



</head>
<body>
<jsp:include page="Menu.jsp"></jsp:include>


<div class="container-fluid mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
        <div class="card bg-success"> 
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 mt-4">
                            <img src="Images/work.jpg" class="img-fluid" alt="Admin Image">
                        </div>
                        <div class="col-md-6">
                            <h2 class="text-center mb-4" style="text-decoration: underline;"><i>Worker Login</i></h2>
                            <form action="/HandyHelpers/WorkerLoginValidationServlet" method="post">
                                <div class="form-group">
                                    <label for="mobile" class="fw-bold">Username:</label>
                                    <input type="text" class="form-control" id="mobile" name="mobile" required>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="fw-bold">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                 <div class="text-center mt-5"> <!-- Centering the button -->
                                    <button type="submit" class="btn btn-outline-info">Sign In</button>
                                </div>
                                 
                                
                                <div class="form-group mb-2 text-center">
                        <small>Don't have an Account? <a href="WorkerRegistration.jsp">Register</a></small>
                    </div>
                    <%
                if (request.getParameter("res") != null && request.getParameter("res").equals("0")) {
                	out.println("<h6 class='text-danger mt-3 text-center '>Invalid username/password</h6>");
                }
                %>
                    
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




</body>
</html>