<%@page import="java.util.List"%>
<%@page import="com.example.model.Services"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>View Services</title>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="AdminMenu.jsp"></jsp:include> 




<script>
        function confirm_delete(serviceId) {
            let ans = confirm("Want to delete this record?");
            if (ans) {
                window.location = "/HandyHelpers/DeleteServiceServlet?serviceId=" + serviceId;
            }
        }
    </script>

</head>
<body>
<div class="container mt-3">


<%
	Services service = new Services();
	List<Services> serviceList = service.getAllServices();
	System.out.println("serviceList=" + serviceList.size());
	%>
	
	
		<h2 class="text-center"><u>View Services</u></h2><br/>
		<div class="table-responsive">
		<table class="table table-striped table-warning table-hover"
			id="table_id">
			<thead class="table-danger">
				<tr>
					
					<th>Slno</th>
					<th>ServiceId</th>
					<th>ServiceName</th>
					<th>ServicePic</th>
					<th>Operations</th>
					<th>Operations</th>
					
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Services serviceOb : serviceList) {
					slno++;
				%>
				
				<tr>
    <td><%=slno%></td>
    <td><%=serviceOb.getServiceId()%></td>
    <td><%=serviceOb.getServiceName()%></td>
    <td>
        <a href='EditServicePic.jsp?tableName=services&setColName=servicepic&whereColName=serviceId&conditionValue=<%=serviceOb.getServiceId() %>&colName=servicePic'>
            <img src='<%=request.getContextPath()%>/uploads/<%=serviceOb.getServicePic()%>' style='width: 80px; height: 80px' />
        </a>
    </td>
    <td>
    <button class='btn btn-sm btn-danger' onclick="confirm_delete(<%=serviceOb.getServiceId()%>)">
        <i class="fas fa-trash-alt"></i> <!-- Font Awesome trash icon -->
        
    </button>
</td>
<td>
    <a href="/HandyHelpers/Admin/EditService.jsp?serviceId=<%=serviceOb.getServiceId()%>" class='btn btn-sm btn-info'>
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
	<%
		String res = request.getParameter("res");
		if(res!=null){
			if(res.equals("1")){
	%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> ServiceName Updated.
		</div>
		<%
			}else if(res.equals("0")){
				%>
				<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Failed!</strong>ServiceName  not Updated.
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

</body>
</html>