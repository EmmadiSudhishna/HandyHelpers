<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Service</title>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="AdminMenu.jsp"></jsp:include> 
</head>


<body style="background-color:#f3e7e9">
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card border-success" style="width: 500px;">
            <div class="card-header text-white" style="background-color: #34495e;">
                <h2 class="mb-0 text-center">Add Service</h2>
            </div>
            <div class="card-body" style="background-color: #e6f7ff;">
                <form action="/HandyHelpers/AddServiceServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="serviceName" class="fw-bold">Service Name:</label>
                        <input type="text" class="form-control" id="serviceName" name="serviceName" required>

                    </div><br/>
                    
                    <div class="form-group">
    <label for="servicePic" class="fw-bold">Service Picture:</label>
    <input type="file" class="form-control-file" id="servicePic" name="servicePic" accept="image/*">
</div>
                    
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success">
                            <i class="fas fa-plus"></i> Add Service
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>