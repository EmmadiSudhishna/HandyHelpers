<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="AdminMenu.jsp"></jsp:include>
</head>
<body>
<form action="/HandyHelpers/UploadWorkerPicServlet"
		method="post" enctype="multipart/form-data">

		<div class="container mt-3 card " style='background-color: #A077A4'>
			<h1 class="text-warning ">Edit Image</h1>

			<input type='hidden' name='tableName'
				value='<%=request.getParameter("tableName")%>'> <input
				type='hidden' name='setColName'
				value='<%=request.getParameter("setColName")%>'> <input
				type='hidden' name='whereColName'
				value='<%=request.getParameter("whereColName")%>'> <input
				type='hidden' name='conditionValue'
				value='<%=request.getParameter("conditionValue")%>'>


			<div class="row">
				<div class="col-sm-6">
					<label>UploadImage</label> <input type="file" class="form-control"
						name="image1">
				</div>
			</div>


			<div class="row mt-3">
				<div class="col-sm-12 text-center">
					<%-- <input type="submit" name="submit"  class="form-control btn btn-md btn-outline-danger p-3"  style="width:150px" value="Add Product"> --%>
					<input type="submit" name="submit"
						class="form-control btn btn-md btn-info" style="width: 150px"
						value="Submit">
				</div>
			</div>
			
			
			<%
            String res = request.getParameter("res");
            if (res != null) {
                if (res.equals("0")) {
                    out.println("<h4 style='color:red'>Image not updated</h4>");
                } else {
                    out.println("<h4 style='color:green'>Image updated</h4>");
                }
            }
            %>
            


		</div>
	</form>


</body>
</html>