<%@page import="com.example.model.Reviews"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Rating</title>
<jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="Title.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="../Css/userHome.css">
    
</head>
<body>
<jsp:include page="UserMenu.jsp"></jsp:include>

<%
	String reviewId=request.getParameter("reviewId");
	Reviews review=new Reviews();
	review.setReviewId(Integer.parseInt(reviewId));
	review=Reviews.getRatingById(review.getReviewId());
%>
<div class="container">
    <div class="card mt-4">
        <div class="card-header text-white" style="background: linear-gradient(to right, #833ab4, #22075e);">
            <h2 class="mb-0 text-center">Edit Your Ratings</h2>
        </div>
        <div class="card-body" style="background: linear-gradient(to right, #b2fefa, #0ed2f7);">
            <form action="/HandyHelpers/UpdateRatingServlet" method="post">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="reviewId" class="fw-bold">Review ID:</label>
                            <input type="text" class="form-control" id="reviewId" name="reviewId" value="<%=review.getReviewId()%>">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="workerId" class="fw-bold">Worker Id:</label>
                            <input type="text" class="form-control" id="workerId" name="workerId" value="<%=review.getWorkerId()%>" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="rating" class="fw-bold">Rating:</label>
                            <input type="number" class="form-control" id="rating" name="rating" value="<%=review.getRating()%>">
                        </div>
                        
                        
                        
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="comments" class="fw-bold">Comments:</label>
                            <textarea class="form-control" id="comments" name="comments" rows="3"><%=review.getComments()%></textarea>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary">Update Rating</button>
                </div>
            </form>
        </div>
    </div>
</div>

    <%
		String res= request.getParameter("res");
		if(res!=null){
				if(res.equals("1")){
			%>

		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Rating updated.
		</div>
		<%
				}else if(res.equals("0")){
					%>
		<div class="alert alert-success alert-dismissible fade show">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Yup!</strong> Rating not updated.
		</div>
		<%
			
			
							
				}
		}
		%>

	



</body>
</html>