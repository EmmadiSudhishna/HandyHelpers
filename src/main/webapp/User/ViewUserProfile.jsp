<%@page import="servletpack.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>User Profile</title>
<jsp:include page="../Header.jsp"></jsp:include>
    <jsp:include page="Title.jsp"></jsp:include>
<jsp:include page="UserMenu.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../Css/userProfile.css">
</head>
<body>

  <div class="container" style="height: 100vh; display: grid; place-items: center;margin-top: -50px;">  
   <%
    Users user = new Users();
    List<Users> userList = user.getUserById((int) session.getAttribute("userId"));
    for (Users userObj : userList) {
%>
       <div class="card w-100" style="max-width: 600px;">
            <div class="header-section">
                <h2 class="card-title">Worker Profile</h2>
                <div class="profile-container">
                    <div class="profile-image-container">
                        <img src='../uploads/<%=userObj.getProfilePic()%>' alt="Profile Picture" style="height: 100px; width: 100px;">
                    </div>
                    <a
							href='/HandyHelpers/User/UserProfilePicEdit.jsp?tableName=users&setColName=profilePic&whereColName=userId&conditionValue=<%=userObj.getUserId()%>&colName=profilePic'>
							<i class="fas fa-edit edit-icon"></i>
						</a>
                </div>
            </div>
            <div class="body-section">
                            <div class="row">
                                <div class="col-md-6">
                                    <h6 class="fw-bold">User ID</h6>
                                    <p><%=userObj.getUserId()%></p>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="fw-bold">Full Name</h6>
                                    <p><%=userObj.getFullName()%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <h6 class="fw-bold">Registration Date</h6>
                                    <p><%=userObj.getRegistrationDate()%></p>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="fw-bold">Mobile Number</h6>
                                    <p><%=Cryptography.decode(userObj.getMobile())%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <h6 class="fw-bold">Password</h6>
                                    <p><%=Cryptography.decode(userObj.getPassword())%></p>
                                </div>
                            </div>
                        
                        <div class="text-center">
                   <a href="/HandyHelpers/User/EditUserProfile.jsp?userId=<%=userObj.getUserId()%>">
										<button type="submit" class="btn btn-info">Edit</button>
									</a>
                </div>
                        </div>
                    </div>
                </div>
                
           
<% 
    } 
%>

</body>
</html>