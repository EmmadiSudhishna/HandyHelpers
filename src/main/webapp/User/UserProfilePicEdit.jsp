<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>User Pic Edit</title>
<jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="UserMenu.jsp"></jsp:include>
</head>
<body>
<div class="container mt-5">
        <div class="card mx-auto" style="max-width: 500px;">
            <div class="card-header bg-dark text-white text-center">
                <h5 class="font-weight-bold">Edit Image</h5>
            </div>
            <div class="card-body">
                <form action="/HandyHelpers/UploadUserImageServlet" method="post" enctype="multipart/form-data">
                    <input type='hidden' name='tableName' value='<%=request.getParameter("tableName") %>'>
                    <input type='hidden' name='setColName' value='<%=request.getParameter("setColName") %>'>
                    <input type='hidden' name='whereColName' value='<%=request.getParameter("whereColName") %>'>
                    <input type='hidden' name='conditionValue' value='<%=request.getParameter("conditionValue") %>'>

                    <div class="form-group">
                        <label for="image1">Upload Image</label>
                        <input type="file" class="form-control" name="image1">
                    </div>

                    <div class="form-group text-center mt-2">
                        <input type="submit" name="submit" class="btn btn-info" value="Upload">
                    </div>
                </form>
            </div>
        </div>
    </div>

    
</body>
</html>