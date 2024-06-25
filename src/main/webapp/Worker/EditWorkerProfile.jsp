<%@page import="servletpack.Cryptography"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Edit Worker Profile</title>
<jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="WorkerMenu.jsp"></jsp:include> 
    
</head>
<body>
<form action="/HandyHelpers/UpdateWorkerProfileServlet"
			method="post" >
			
			<div class="container mt-4">
		
				<div class="card w-100 mx-auto border-warning border-4 bg-light text-dark"
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
							<strong>Success!</strong> Profile Updated ..!
						</div>
						<%
						} else if (res.equals("0")) {
						%>
						<div class="alert alert-danger alert-dismissible" id='success_id'>
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							<strong>Success!</strong> *Profile not Updated..!
						</div>
						<%
						}
						}
						%>
						<%
						Workers worker = new Workers();
						worker.setWorkerId(Integer.parseInt(request.getParameter("workerId")));
						worker = worker.getWorkerProfileById();
						%>
						<div class="row">
							<div class="col-md-6 mx-auto">
								
									<label for="workerId" class="form-label fw-bold">Worker
										Id :</label> <input type="text" class="form-control" id="workerId"
										name="workerId" value='<%=worker.getWorkerId()%>' readonly>

									<label for="fullName" class="form-label fw-bold">Full
										Name:</label> <input type="text" class="form-control" id="fullName"
										name="fullName" value='<%=worker.getFullName()%>'>
							</div>
							
							<div class="col-md-6 mx-auto">
								
									<label for="serviceName" class="form-label fw-bold">Service
										Name :</label> <input type="text" class="form-control" id="serviceName"
										name="serviceName" value='<%=worker.getServiceName()%>'>

									<label for="mobile" class="form-label fw-bold">Mobile
										:</label> <input type="text" class="form-control" id="mobile"
										name="mobile" value='<%=Cryptography.decode(worker.getMobile())%>'>
							</div>
							
							<div class="col-md-6 mx-auto">
								
									<label for="currentAddress" class="form-label fw-bold">CurrentAddress
										:</label> <input type="text" class="form-control" id="currentAddress"
										name="currentAddress" value='<%=worker.getCurrentAddress()%>'>

									<label for="cities" class="form-label fw-bold">Cities
										:</label> <input type="text" class="form-control" id="cities"
										name="cities" value='<%=worker.getCities()%>'>
							</div>
							<div class="col-md-6 mx-auto">
								
									<label for="password" class="form-label fw-bold">Password
										:</label> <input type="text" class="form-control" id="password"
										name="password" value='<%=Cryptography.decode(worker.getPassword())%>'>

									<!--  <label for="status" class="form-label fw-bold">Status
										:</label> <input type="text" class="form-control" id="status"
										name="status" value='<%=worker.getStatus()%>'>-->
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