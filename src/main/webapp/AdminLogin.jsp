<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
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
  background-image: url('Images/3dpic4.jpg');
 /* background-color:#96fbc4;*/
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat; 
  filter: blur(2px); 
  z-index: -1;
}
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
                        <div class="col-md-6">
                            <img src="Images/Admin2.png" class="img-fluid" alt="Admin Image">
                        </div>
                        
                        <div class="col-md-6">
                            <h2 class="text-center mb-4" style="text-decoration: underline;"><i>Admin Login</i></h2>
                            <form action="/HandyHelpers/AdminLoginValidationServlet" method="post">
                                <div class="form-group">
                                    <label for="username" class="fw-bold">Username:</label>
                                    <input type="text" class="form-control" id="username" name="username" required>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="fw-bold">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                 <div class="text-center mt-5"> <!-- Centering the button -->
                                    <button type="submit" class="btn btn-outline-info">Sign In</button>
                                </div>
                                 
                                  
                     
                                 
                            </form>
                            
                            
                        </div>
                    </div>
                </div>
                <%
                if (request.getParameter("res") != null && request.getParameter("res").equals("0")) {
                	out.println("<h6 class='text-danger mt-3 text-center '>Invalid username/password</h6>");
                }
                %>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>