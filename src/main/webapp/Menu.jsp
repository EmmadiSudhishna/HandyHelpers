<style>


  /* Define keyframes for the animation */
  @keyframes slideIn {
    0% {
      transform: translateX(-100%);
    }
    100% {
      transform: translateX(0);
    }
  }
  
  

  /* Apply animation to the nav links */
  .nav-item a {
    animation: slideIn 0.5s forwards;
    text-decoration: none; 
    position: relative;
    color: dark;
     font-size: 18px;
  }
  .nav-item a.home {
    color: black;
  }

  /* Set color for icons */
  .nav-item a .fas {
    color:white; /* Change this to your desired unique color */
  }
  

  /* Add hover effect for dropdown menu items */
  .dropdown-item:hover {
    background-color: #green; /* Set background color */
    box-shadow: 0 0 0px 2px #00FFFF; /* Add thicker appearance */
  }

  

  /* Add hover effect */
  .nav-item a:hover {
    text-decoration: none; 
  }
  

  /* Add underline on hover */
 /* .nav-item a:hover::after {
    content: '';
    display: block;
    width: 100%;
    height: 2px;
    background-color: orange;
    position: absolute;
    bottom: -5px;
    left: 0;
    animation: slideIn 0.3s forwards;
  }*/
  
  
</style>


<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #343a40;">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
      <ul class="navbar-nav ml-auto"> <!-- Added ml-auto class to align items to the right -->
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp"  style="font-family: 'Playfair Display', serif;color: Cyan;"><i class="fas fa-home"></i>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="About.jsp" style="font-family: 'Palyfair Display', serif;color: Cyan;"><i class="fas fa-info-circle"></i>About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Contact.jsp" style="font-family: 'Playfair Display', serif;color: Cyan;"><i class="fas fa-phone"></i>Contact</a>
        </li>
        <li class="nav-item dropdown">
         <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" style="font-family: 'Playfair Display', serif;color: Cyan;"><i class="fas fa-key"></i>Login</a> 
          <ul class="dropdown-menu">
            <li><a class="dropdown-item"  href="AdminLogin.jsp">Admin</a></li>
             <li><a class="dropdown-item"  href="WorkerLogin.jsp">Workers</a></li>
              <li><a class="dropdown-item" href="UserLogin.jsp">Users</a></li>
          </ul>
          
        </li>
      </ul>
    </div>
  </div>
</nav>
