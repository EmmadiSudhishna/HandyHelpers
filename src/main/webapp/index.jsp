<%@page import="servletpack.Cryptography"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Index page</title>
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>  
<link rel="stylesheet" type="text/css" href="Css/index.css">
</head>

<body >
	<jsp:include page="Menu.jsp"></jsp:include>


	<%
	String text = "";
	String encode = Cryptography.encode(text);
	//System.out.println("encode=" + encode);
	String decode = Cryptography.decode(text);
	System.out.println("decode=" + decode);
	%>

	<div class="container mt-3">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div id="demo" class="carousel slide" data-bs-ride="carousel"
					style="background-image: url('Images/3dpic.jpg');">

					<div class="carousel-indicators">
						<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
							class="active"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="5"></button>
					</div>

					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="Images/light.png" alt="1" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="Images/cat1.png" alt="2" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="Images/plumb.png" alt="3" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="Images/plumb1.png" alt="4" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="Images/cat3.png" alt="5" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="Images/plumb2.png" alt="6" class="d-block w-100">
						</div>

					</div>

					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#demo" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#demo" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
					</button>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>

	<!-- Marquee tag for displaying flash news -->
	<!-- Flash news container -->
	<div class="container mt-3">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class=" p-2 rounded">
					<marquee behavior="scroll" direction="left" class="mb-0 text-black">
						<h2>
							<i>Always Ready, Always Reliable!...</i>
						</h2>
					</marquee>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-9 mb-3 mb-lg-0">
					<div class="card">
						<div class="card-inner">
							<div class="card-face front-face">
								<img src="Images/electrician.jpg" alt="Electrician">
								<h3>Electrician</h3>
							</div>
							<div class="card-face back-face">
								<img src="Images/Cat1.jpg" alt="Electrician Back"
									style="max-width: 80%; max-height: 90%;">
								<p style="text-align: center;" >
									<strong>An Electrician is a skilled professional who
										installs, maintains, and repairs electrical systems. They
										execute wiring plans, install fixtures and equipment, and
										ensure safety compliance. Electricians have expertise in
										various electrical systems, tools, and safety regulations.</strong>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-9 mb-3 mb-lg-0">
					<div class="card">
						<div class="card-inner">
							<div class="card-face front-face">
								<img src="Images/cat4.jpg" alt="Plumber">
								<h3>Plumber</h3>
							</div>
							<div class="card-face back-face">
								<img src="Images/plumb.webp" alt="Plumber Back"
									style="max-width: 70%; max-height: 60%;">
								<p style="text-align: center;">
									<strong>A Plumber is a professional responsible for
										installing, repairing, and maintaining pipes in commercial
										structures like apartment buildings or residential homes.</strong>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-9 mb-3 mb-lg-0">
					<div class="card">
						<div class="card-inner">
							<div class="card-face front-face">
								<img src="Images/carpenter1.jpg" alt="Carpenter">
								<h3 class="h5">Carpenter</h3>
							</div>
							<div class="card-face back-face">
								<img src="Images/cat7.jpg" alt="Carpenter Back"
									style="max-width: 70%; max-height: 80%;">
								<p style="text-align: center;">
									<strong>A Carpenter is a construction professional who
										works with construction crews to build, adjust and repair wood
										frameworks in various construction projects.</strong>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-9 mb-3 mb-lg-0">
					<div class="card">
						<div class="card-inner">
							<div class="card-face front-face">
								<img src="Images/paint.jpg" alt="Painter">
								<h3 class="h5">Painter</h3>
							</div>
							<div class="card-face back-face">
								<img src="Images/paint2.jpg" alt="Painter Back"
									style="max-width: 70%; max-height: 70%;">
								<p style="text-align: center;">
									<strong>A Painter is a professional who helps prepare
										surfaces, mix paints for different needs, and apply them with
										brushes or rollers to fill in cracks or apply color on walls
										and other objects around a home, such as furniture pieces or
										doors.</strong>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="Footer.jsp"></jsp:include>
</html>
</body>