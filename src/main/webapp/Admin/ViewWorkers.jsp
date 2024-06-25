<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>View Workers</title>

<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="AdminMenu.jsp"></jsp:include> 

<script>
    function confirm_delete(workerId) {
        let ans = confirm("Want to delete this User?");
        if (ans) {
            window.location = "/HandyHelpers/DeleteWorkerServlet?workerId=" + workerId;
        }
    }
    function status(workerId){
    	let ans=confirm("Want to activate?");
    	if(ans){
    		window.location="/HandyHelpers/UpdateWorkerStatus?workerId=" + workerId +"&status=Active";
    	}
    }
    function status1(workerId){
    	let ans=confirm("Want to deactivate?");
    	if(ans){
    		window.location="/HandyHelpers/UpdateWorkerStatus?workerId=" + workerId +"&status=Inactive";
    	}
    }
    
</script>

</head>
<body>
<div class="container mt-3">
<%
    Workers worker = new Workers();
    List<Workers> workerList = worker.getAllWorkers(null);
    System.out.println("workerList=" + workerList.size());
%>

<h2 class="text-center"><u>View Workers</u></h2><br/>
<div class="table-responsive">
    <table class="table table-striped table-warning table-hover" id="table_id">
        <thead class="table-dark">
            <tr>
                <th>Slno</th>
                <th>WorkerId</th>
                <th>FullName</th>
                <th>RegistrationDate</th>
                <th>ServiceName</th>
                <th>CurrentAddress</th>
                <th>Cities</th>
                <th>Status</th>
                <th>StatusOperations</th>
                
                <th>WorkerPic</th>
                <th>AadhaarPic</th>
                <th>Operations</th>
                
            </tr>
        </thead>
        <tbody>
            <%
            int slno = 0;
            for (Workers workerOb : workerList) {
                slno++;
            %>
            <tr>
                <td><%=slno%></td>
                <td><%=workerOb.getWorkerId()%></td>
                <td><%=workerOb.getFullName()%></td>
                <td><%=workerOb.getRegistrationDate()%></td>
                <td><%=workerOb.getServiceName()%></td>
                <td><%=workerOb.getCurrentAddress()%></td>
                <td><%=workerOb.getCities()%></td>
               <td><%=workerOb.getStatus()%></td>
               
               
               <td>
								<% if(workerOb.getStatus().toString().equalsIgnoreCase("inactive")){%>
								<input type="button" class="btn btn-sm btn-outline-primary"
						value="Active" onclick="status(<%=workerOb.getWorkerId()%>)" />
						<%
						}%>
						<% if(workerOb.getStatus().toString().equalsIgnoreCase("active")){%>
								<input type="button" class="btn btn-sm btn-outline-primary"
						value="Inactive" onclick="status1(<%=workerOb.getWorkerId()%>)" />
						<%
						}%>
							</td>
               
                <td>
                    <a href='EditWorkerPic.jsp?tableName=workers&setColName=workerPic&whereColName=workerId&conditionValue=<%=workerOb.getWorkerId() %>&colName=workerPic'>
                        <img src='<%=request.getContextPath()%>/uploads/<%=workerOb.getWorkerPic()%>' style='width: 100px; height: 100px;' />
                    </a>
                </td>
                <td>
                    <a href='EditWorkerPic.jsp?tableName=workers&setColName=aadhaarPic&whereColName=workerId&conditionValue=<%=workerOb.getWorkerId() %>&colName=aadhaarPic'>
                        <img src='<%=request.getContextPath()%>/uploads/<%=workerOb.getAadhaarPic()%>' style='width: 100px; height: 100px;' />
                    </a>
                </td>
                <td>
                    <button class='btn btn-sm btn-outline-danger' onclick="confirm_delete(<%=workerOb.getWorkerId()%>)">
                        <i class="fas fa-trash"></i>
                    </button>
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
    if(res != null) {
        if(res.equals("1")) {
%>
            <div class="alert alert-success alert-dismissible" id='success_id'>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <strong>Success!</strong> Worker Updated.
            </div>
<%
        } else if(res.equals("0")) {
%>
            <div class="alert alert-danger alert-dismissible" id='success_id'>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                <strong>Failed!</strong> Worker not Updated.
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
