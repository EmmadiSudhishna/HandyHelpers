<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #900C3F ;">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
      <ul class="navbar-nav ml-auto"> <!-- Added ml-auto class to align items to the right -->
        <li class="nav-item">
          <a class="nav-link active" href="UserHome.jsp"  style="font-family: 'Playfair Display', serif;color: white; "><h5>Home</h5></a>
        
        <li class="nav-item">
            <a class="nav-link active" href="ViewUserProfile.jsp" style="font-family: 'Playfair Display', serif;color: white;"><h5>Profile</h5></a> 
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="ViewBookings.jsp" style="font-family: 'Playfair Display', serif;color: white;"><h5>Bookings</h5></a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="Review.jsp" style="font-family: 'Playfair Display', serif;color: white;"><h5>Reviews</h5></a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="../Logout.jsp" style="font-family: 'Playfair Display', serif;color: white;"><h5>Logout</h5></a>
        </li>
    </ul>
     <!-- Search Form -->
            <form class="d-flex">
                <input class="form-control me-2" type="text" placeholder="Search" name="search" required>
                <button class="btn btn-warning" type="submit">Search</button>
            </form>
</div>
</div>
</nav>