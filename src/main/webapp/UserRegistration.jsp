<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration</title>
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<style>
        body {
            background-color: #a1c4fd;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 500px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            background-color: #30cfd0;
            position: relative;
            overflow: hidden;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }

        label {
            font-weight: bold;
            color: #343a40;
        }

        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="file"] {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            width: 100%;
            margin-bottom: 20px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="date"]:focus,
        input[type="file"]:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .bg-pattern {
            position: absolute;
            top: -10px;
            left: -10px;
            right: -10px;
            bottom: -10px;
            background: linear-gradient(45deg, #2c3e50, #3498db, #9b59b6, #34495e);
            background-size: 400% 400%;
            animation: gradientBg 10s ease infinite;
            z-index: -1;
        }

        @keyframes gradientBg {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
    </style>
</head>
<body>

<div class="container mt-3">
        <h2>User Registration</h2>
        <form action="/HandyHelpers/AddUserServlet" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
            </div>
            
            <div class="form-group">
                <label for="registrationDate">Registration Date:</label>
                <input type="date" class="form-control" id="registrationDate" name="registrationDate" required>
            </div>
            
            <div class="form-group">
                <label for="mobile">Mobile:</label>
                <input type="text" class="form-control" id="mobile" name="mobile" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="profilePic">Profile Picture:</label>
                <input type="file" class="form-control-file" id="profilePic" name="profilePic">
            </div>
            
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
        <div class="bg-pattern"></div>
    </div>

</body>
</html>