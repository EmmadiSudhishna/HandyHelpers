<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<title>About Us</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-image: url('Images/Admin1.jpg');
        background-size: 70% ; /* Set the background size to cover the entire body */
        background-position: center;
        height: 100vh; /* Set the height of the body to 100% of the viewport height */
        width: 100vw; /* Set the width of the body to 100% of the viewport width */
    }

    .container {
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.7);
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* Keyframes for 3D rotation */
    @keyframes spin {
        0% {
            transform: rotateY(0deg);
        }
        100% {
            transform: rotateY(360deg);
        }
    }

    /* 3D animation for the image */
    .animated-image {
        width: 150px;
        height: 150px;
        margin: 0 auto;
        animation: spin 5s infinite linear;
    }

    h1, p {
        text-align: center;
    }

    p {
        line-height: 1.6;
    }

    /* Responsive styles */
    @media only screen and (max-width: 600px) {
        .container {
            max-width: 90%;
            margin: 20px auto;
            padding: 10px;
        }
    }
</style>
</head>
<body>
<jsp:include page="Menu.jsp"></jsp:include>
<div class="container">
    <h1>About Us</h1>
    <p>Handy Helpers is a platform designed to connect individuals with various home service providers,
        offering a wide range of services such as cleaning, repairs, maintenance, and more. The platform aims to make it easy
        for users to find reliable and skilled professionals to help with their household needs.</p>
</div>
</body>
</html>
