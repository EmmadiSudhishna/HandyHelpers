<%@page import="java.util.List"%>
<%@page import="com.example.model.Reviews"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../Css/userHome.css">
    
<script>
    function confirm_delete(reviewId) {
        let ans = confirm("Are you sure you want to delete this rating?");
        if (ans) {
            window.location = "/HandyHelpers/DeleteRatingServlet?reviewId=" + reviewId;
        }
    }
</script>
</head>
<body>
<jsp:include page="UserMenu.jsp"></jsp:include>

<%
    int userId = (Integer) session.getAttribute("userId");
    Reviews review = new Reviews();
    List<Reviews> reviewList = review.getAllRatingsByUserId(userId);
%>

<%
    String res = request.getParameter("res");
    if(res != null) {
        if(res.equals("1") || res.equals("0")) {
%>
<div class="alert alert-success alert-dismissible" id="success_id">
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    <strong>Success!</strong> Service record Updated.
</div>
<%
        }
    }
%>

<div class="container">
    <h2 class="text-center"> User Reviews</h2>
    <div class="table-responsive">
        <table class="table table-striped table-info table-hover" id="table_id">
            <thead class="table-dark">
                <tr>
                    <th>SlNo</th>
                    <th>Review Id</th>
                    <th>User Id</th>
                    <th>Worker Id</th>
                    <th>Review Date</th>
                    <th>Service Name</th>
                    <th>Rating</th>
                    <th>Comments</th>
                    <th>Operation</th>
                    <th>Operation</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int slno = 0;
                    for (Reviews reviewOb : reviewList) {
                        slno++;
                %>
                <tr>
                    <td><%=slno%></td>
                    <td><%=reviewOb.getReviewId()%></td>
                    <td><%=reviewOb.getUserId()%></td>
                    <td><%=reviewOb.getWorkerId()%></td>
                    <td><%=reviewOb.getReviewDate()%></td>
                    <td><%=reviewOb.getServiceName()%></td>
                    <td><%=reviewOb.getRating()%></td>
                    <td><%=reviewOb.getComments()%></td>
                    <td>
                        <button class="btn btn-sm btn-danger" onclick="confirm_delete(<%=reviewOb.getReviewId()%>)">
                            <i class="fas fa-trash-alt"></i> <!-- Font Awesome trash icon -->
                        </button>
                    </td>
                    
                    <td>
    <a href="/HandyHelpers/User/EditRating.jsp?reviewId=<%=reviewOb.getReviewId()%>" class='btn btn-sm btn-info'>
        <i class="fas fa-edit"></i> <!-- Font Awesome edit icon -->
        
    </a>
</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#table_id').DataTable();
        $('#success_id').slideUp(3000);
    });
</script>
</body>
</html>
