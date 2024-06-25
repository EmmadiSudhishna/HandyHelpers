<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>User</title>
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
  /*background-image: url('Images/3dpic3.jpg')a8edea;*/
  background-size: cover;
  background-color:#92fe9d;
  background-position: center; /* Center the background image */
  background-repeat: no-repeat; /* Do not repeat the background image */
  filter: blur(7px); /* Adjust the blur value as needed */
  z-index: -1; /* Place the pseudo-element behind the content */
}

/* Additional styles for the rest of your content */
</style>




</head>
<body>
<jsp:include page="Menu.jsp"></jsp:include>



               <div class="container-fluid mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6"> <!-- Adjusted column size -->
        <div class="card bg-success"> 
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4"> <!-- Adjusted column size -->
                            <img src="Images/jaipic.jpeg" class="img-fluid" alt="Admin Image">
                        </div>
                        <div class="col-md-8"> <!-- Adjusted column size -->
                            <h2 class="text-center mb-4" style="text-decoration: underline;"><i>User Login</i></h2>
                            <form action="/HandyHelpers/UserLoginValidationServlet" method="post"><br/><br/>
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
                        <small>Not Registered?<a href="UserRegistration.jsp">Create an account</a></small>
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
</div>


               


</body>
</html>