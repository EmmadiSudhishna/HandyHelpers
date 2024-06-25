<%@page import="com.example.model.Services"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Edit Services</title>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="AdminMenu.jsp"></jsp:include> 

</head>
<body>
<%
String serviceId = request.getParameter("serviceId");
Services service = new Services();
service.setServiceId(Integer.parseInt(serviceId));

service = service.getServiceById();
%>

<body class="bg-light">


	<div class="container mt-5">
		<div class="card" style="background-color: #FFC0CB;">
			<form class="card-body"
				action="/HandyHelpers/UpdateServiceServlet" method="post">

				<h2 class="mb-4 text-center">Edit Service</h2>

				<div class="form-group">
					<label for="serviceName" class="fw-bold">Service Name:</label> <input type="text"
						class="form-control" id="serviceName" name="serviceName"
						value="<%=service.getServiceName()%>" required>
				</div>

				<div class="form-group">
					<label for="serviceId" class="fw-bold">Service Id:</label> <input type="text"
						class="form-control" id="serviceId" name="serviceId"
						value="<%=service.getServiceId()%>" readonly required>
				</div>


				<div class="text-center mt-2">
					<button type="submit" class="btn btn-success">Update
						service</button>
				</div>





			</form>
		</div>
	</div>
	<%
	String res = request.getParameter("res");
	if (res != null) {
		if (res.equals("0")) {
			out.println("<h4 style='color:red'>Service not updated</h4>");
		} else {
			out.println("<h4 style='color:green'>Service  updated</h4>");
		}
	}
	%>


</body>
</html>