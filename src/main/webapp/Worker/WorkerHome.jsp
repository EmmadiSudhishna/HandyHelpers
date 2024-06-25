<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Worker Menu</title>
<jsp:include page="../Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>


<style>
  
  @keyframes slideIn {
    0% {
      transform: translateX(-100%);
    }
    100% {
      transform: translateX(0);
    }
  }

  
  .nav-item a {
    animation: slideIn 0.5s forwards;
    text-decoration: none; 
    position: relative;
    color: dark;
  }


  .nav-item a:hover {
    text-decoration: none; 
  }

  /* Add underline on hover */
  .nav-item a:hover::after {
    content: '';
    display: block;
    width: 100%;
    height: 2px;
    background-color: orange;
    position: absolute;
    bottom: -5px;
    left: 0;
    animation: slideIn 0.3s forwards;
  }
  
  body {
  position: relative;
  height: auto;
  margin: 0;
  display: flex;
  flex-direction: column;
}

body::before {
  content: "";
  position: fixed;
  top: 0%;
  left: 0;
  bottom:0%;
  width: 100%;
  height: 100%;
  background-image: url('../Images/userhn.jpg');
  background-size: cover;
  background-position: center; 
  background-repeat: no-repeat; 
  filter: blur(1px); 
  z-index: -1; 
   
}
  
</style>


</head>
<body>

<jsp:include page="WorkerMenu.jsp"></jsp:include>
</body>
</html>