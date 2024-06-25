<%@page import="java.util.List"%>
<%@page import="com.example.model.Services"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Worker Registration</title>
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
</head>
<style>

body {
	font-family: Arial, sans-serif;
	background-color: #c7eafd;
	margin: 0;
	padding: 0;
}
.card-body {
    background-color: #E3FDF5; /* Add your desired background color here */
}

.form-group {
	margin-bottom: 20px;
}
/* Header Styles */
header {
	background-color: #28a745;
	color: #c2e59c;
	text-align: center;
	padding: 20px 0;
	border-radius: 5px 5px 0 0;
}

header h1 {
	margin: 0;
	font-size: 2em;
}
/* Button Styles */
button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #28a745;
	color: #fff;
	cursor: pointer;
	font-size: 1em;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #218838;
}

/* Label Styles */
label {
	font-weight: bold;
}
/* Validation Message Styles */
.validation-message {
	margin-top: 5px;
	font-size: 0.9em;
	color: #dc3545;
}

/* Password Strength Indicator Styles */
#password-strength {
	margin-top: 10px;
	font-weight: bold;
}
</style>


</head>

<body>
<%
    Services service=new Services();
    List<String> serviceList=service. getAllServicesByName();
    %>
	
<div class="container mt-3">
    <div class="card">
        <header class="card-header bg-warning">
            <h5 class="card-title"><i class="fa fa-wrench" style="font-size: 24px;"></i> Worker Registration</h5>
        </header>
        <div class="card-body">
            <form method='POST' action="AddWorkerServlet" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="fullName">Full Name:</label>
                    <input type="text" class="form-control" id="fullName" placeholder="Enter full name" name="fullName" required>
                </div>
                <div class="form-group">
                    <label for="serviceName">Service Name:</label>
                    <select name="serviceName" class="form-control">
                        <% for(String serviceName:serviceList){ %>
                        <option value='<%=serviceName%>'><%=serviceName%></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile:</label>
                    <input type="text" class="form-control" id="mobile" placeholder="Enter mobile number" name="mobile" required>
                </div>
                <div class="form-group">
                    <label for="currentAddress">Current Address:</label>
                    <input type="text" class="form-control" id="currentAddress" placeholder="Enter current address" name="currentAddress" required>
                </div>
                <div class="form-group">
                    <label for="cities">Cities:</label>
                    <input type="text" class="form-control" id="cities" placeholder="Enter cities" name="cities" required>
                </div>
                <div class="form-group">
                    <label for="workerPic">Worker Picture:</label>
                    <input type="file" class="form-control" id="workerPic" name="workerPic" required>
                </div>
                <div class="form-group">
                    <label for="aadhaarPic">Aadhaar Picture:</label>
                    <input type="file" class="form-control" id="aadhaarPic" name="aadhaarPic" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" oninput="checkPasswordStrength(this.value)" required>
                    <div id="password-strength"></div>
                </div>
                <div class="form-group">
                    <label for="cpassword">Confirm Password:</label>
                    <input type="password" class="form-control" id="cpassword" oninput="validatePasswords(this.value)" required>
                    <div id="cpwdLabel"></div>
                </div>
                <div class='form-group'>
							<label>Status:</label> <input type="text"
								class="form-control" id="status" name="status" value="Inactive" readonly>
						</div>
					</div>
                <div class="text-center">
                    <button type="submit" class="btn btn-outline-success mt-3">Register</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function checkPasswordStrength(password) {
        // Define your password strength criteria and calculations here
        // This is a simple example, you can modify it based on your requirements

        var strength = 0;

        // Check the length of the password
        if (password.length >= 8) {
            strength += 1;
        }

        // Check if the password contains both uppercase and lowercase characters
        if (/[a-z]/.test(password) && /[A-Z]/.test(password)) {
            strength += 1;
        }

        // Check if the password contains at least one number
        if (/\d/.test(password)) {
            strength += 1;
        }

        // Check if the password contains at least one special character
        if (/[$&+,:;=?@#|'<>.^*()%!-]/.test(password)) {
            strength += 1;
        }

        var strengthText = "";
        switch (strength) {
            case 0:
            case 1:
                strengthText = "Weak";
                break;
            case 2:
                strengthText = "Moderate";
                break;
            case 3:
            case 4:
                strengthText = "Strong";
                break;
        }

        document.getElementById("password-strength").innerHTML = "Password Strength: " + strengthText;
        if (strengthText == "Weak") {
            document.getElementById("password-strength").style.color = 'red';
        } else if (strengthText == "Moderate") {
            document.getElementById("password-strength").style.color = 'blue';
        } else if (strengthText == "Strong") {
            document.getElementById("password-strength").style.color = 'green';
        }
    }

    function validatePasswords(cpassword) {
        var cpwd = document.getElementById("password").value;
        if (cpassword == cpwd) {
            document.getElementById("cpwdLabel").innerHTML = "Passwords match";
            document.getElementById("cpwdLabel").style.color = "green";
        } else {
            document.getElementById("cpwdLabel").innerHTML = "Passwords not match";
            document.getElementById("cpwdLabel").style.color = "red";
        }
    }
</script>

</body>
</html>