<%@page import="servletpack.Cryptography"%>
<%@page import="com.example.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Edit User Profile</title>
<jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="UserMenu.jsp"></jsp:include>
</head>
<body>

<form action="/HandyHelpers/UpdateUserProfileServlet"
			method="post">
			
			<div class="container mt-5">
		
				<div class="card w-100 mx-auto border-dark border-4 bg-light text-dark"
					style="max-width: none;">
					<div class="card-body">
						<h2 class="card-title text-center mb-4">Edit Profile</h2>

						<%
						String res = request.getParameter("res");
						if (res != null) {
							if (res.equals("1")) {
						%>
						<div class="alert alert-success alert-dismissible" id='success_id'>
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							<strong>Success!</strong> User Profile Updated ..!
						</div>
						<%
						} else if (res.equals("0")) {
						%>
						<div class="alert alert-danger alert-dismissible" id='success_id'>
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							<strong>Success!</strong> User Profile not Updated..!
						</div>
						<%
						}
						}
						%>
						<%
						Users user = new Users();
						user.setUserId(Integer.parseInt(request.getParameter("userId")));
						user = user.getUserProfileById();
						%>
						<div class="row">
							<div class="col-md-6 mx-auto">
								
									<label for="userId" class="form-label fw-bold">User
										Id :</label> <input type="text" class="form-control" id="userId"
										name="userId" value='<%=user.getUserId()%>'>

									<label for="fullName" class="form-label fw-bold">Full
										Name:</label> <input type="text" class="form-control" id="fullName"
										name="fullName" value='<%=user.getFullName()%>'>
							</div>
						
						<div class="col-md-6 mx-auto">
								
									<label for="registrationDate" class="form-label fw-bold">RegistrationDate
										:</label> <input type="text" class="form-control" id="registrationDate"
										name="registrationDate" value='<%=user.getRegistrationDate()%>'>

									<label for="mobile" class="form-label fw-bold">Mobile
										:</label> <input type="text" class="form-control" id="mobile"
										name="mobile" value='<%=Cryptography.decode(user.getMobile())%>'>
							</div>
						
						<div class="col-md-6 mx-auto">
								
									<label for="password" class="form-label fw-bold">Password
										:</label> <input type="text" class="form-control" id="password"
										name="password" value='<%=Cryptography.decode(user.getPassword())%>'>

										
							</div>
							</div>
							<div class="text-center mt-2">
							<input type="submit" name="submit" class="btn btn-info"
								value="Upload">
						</div>
							</div>
							</div>
							</div>
							</form>
							
			

</body>
</html>