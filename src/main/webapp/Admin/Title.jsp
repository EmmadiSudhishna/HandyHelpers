
<style>
        /* Add your custom styles here */
        .bg-custom {
    background-color: #020D19;
}
        .social-icons .nav-item a {
            color: #007bff; /* Default color */
            position: relative;
            transition: color 0.3s;
        }

        .social-icons .nav-item a::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #007bff; /* Default color for the line */
            visibility: hidden;
            transform: scaleX(0);
            transition: all 0.3s ease-in-out;
        }

        .social-icons .nav-item:hover a::before {
            visibility: visible;
            transform: scaleX(1);
        }

        .social-icons .nav-item:hover a {
            color: #0056b3; /* Change color on hover */
        }

        .social-icons .nav-item .icon {
            font-size: 50px;
            margin-right: 5px;
        }

        .social-icons .nav-item:nth-child(2) a {
            color: #ff8800; /* Customize color for the second social icon */
        }

        .social-icons .nav-item:nth-child(3) a {
            color: #4caf50; /* Customize color for the third social icon */
        }
          /* Hover effects for specific social icons */
    .social-icons .nav-item:hover .fa-google {
        box-shadow: 0px 0px 7px #ff0000 inset, 0px 0px 7px #ff0000;
    }

    .social-icons .nav-item:hover .fa-instagram {
        box-shadow: 0px 0px 7px #ff0095 inset, 0px 0px 7px #ff0095;
    }

    .social-icons .nav-item:hover .fa-twitter {
        box-shadow: 0px 0px 7px #FF1493 inset, 0px 0px 7px #FF1493;
    }
    </style>

<body>
<nav class="navbar navbar-expand-sm bg-custom navbar-dark sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"> <img src="../Images/Logo.png" alt="Logo" style="width: 60px;" class="rounded-pill">
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="#" style="color: white; text-shadow: 0 0 10px pink;"><h4>Handy Helpers</h4></a></li>
            </ul>

            <ul class="navbar-nav ms-auto social-icons">
                <li class="nav-item"><a class="nav-link" href="#"><i class="fab  fa-google fa-2x"></i></a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fab  fa-instagram fa-2x"></i></a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fab  fa-twitter fa-2x"></i></a></li>
            </ul>
        </div>
    </div>
</nav>

</body>
</html>
