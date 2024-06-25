<%@page import="java.util.List"%>
<%@page import="com.example.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>View Customer</title>

<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="AdminMenu.jsp"></jsp:include> 



<script>
        function confirm_delete(userId) {
            let ans = confirm("Want to delete this User?");
            if (ans) {
                window.location = "/HandyHelpers/DeleteUserServlet?userId=" + userId;
            }
        }
    </script>


</head>
<body>
<div class="container mt-3">

<%
	Users user = new Users();
	List<Users> userList = user.getAllUsers();
	System.out.println("userList=" + userList.size());
	%>

<h2 class="text-center"><u>View Customers</u></h2><br/>
		<div class="table-responsive">
		<table class="table table-striped table-primary table-hover"
			id="table_id">
			<thead class="table-dark">
				<tr>
					
					
					<th>Slno</th>
					<th>UserId</th>
					<th>FullName</th>
					<th>RegistrationDate</th>
					<th>ProfilePic</th>
					<th>Operations</th>
					
					
					
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Users userOb : userList) {
					slno++;
				%>
				
				<tr>
					
					

					<td><%=slno%></td>
					<td><%=userOb.getUserId()%></td>
					<td><%=userOb.getFullName()%></td>
					<td><%=userOb.getRegistrationDate()%></td>
					
					
					<td>
    <a href='EditUserPic.jsp?tableName=users&setColName=profilePic&whereColName=userId&conditionValue=<%=userOb.getUserId() %>&colName=profilePic'>
        <img src='<%=request.getContextPath()%>/uploads/<%=userOb.getProfilePic()%>' style='width: 80px; height: 80px;' />
    </a>
</td>
<td>
						
						<button class='btn btn-sm btn-outline-danger'
							onclick="confirm_delete(<%=userOb.getUserId()%>)"><i class="fas fa-trash"></i></button>
					</td>
			
					
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		</div>
	</div>
	<%
		String res = request.getParameter("res");
		if(res!=null){
			if(res.equals("1")){
	%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Worker Updated.
		</div>
		<%
			}else if(res.equals("0")){
				%>
				<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Failed!</strong>Worker  not Updated.
		</div>
		<%
			}
		}
		%>

	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
			
			$('#success_id').slideUp(3000);
		});
	</script>
		</div>	

</body>
</html>

</body>
</html>