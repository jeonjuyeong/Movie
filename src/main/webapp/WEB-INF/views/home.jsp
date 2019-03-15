<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title></title>


</head>

<body id="page-top">

	



	<!-- Navigation -->
	<%@include file="../views/includes/navigation.jsp"%>
	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
		<div class="container">
			<img class="img-fluid mb-5 d-block mx-auto"
				src="../ctrl/resources/img/logo.png" alt="">
			<h1 class="text-uppercase mb-0">HELLO CINEMA</h1>
			<hr class="star-light">
			<h2 class="font-weight-light mb-0">대한민국 극장의 중심 HELLO CINEMA에 오신
				것을 환영합니다.</h2>
		</div>
	</header>

	<!--  Grid Section -->
	<%@include file="../views/main/movieList.jsp"%>
	<!-- About Section -->
	<section class="bg-primary text-white mb-0" id="about">
		<div class="container">
			<h2 class="text-center text-uppercase text-white">About</h2>
			<hr class="star-light mb-5">
			<div class="row">
				<div class="col-lg-4 ml-auto">
					<p class="lead">Freelancer is a free bootstrap theme created by
						Start Bootstrap. The download includes the complete source files
						including HTML, CSS, and JavaScript as well as optional LESS
						stylesheets for easy customization.</p>
				</div>
				<div class="col-lg-4 mr-auto">
					<p class="lead">Whether you're a student looking to showcase
						your work, a professional looking to attract clients, or a graphic
						artist looking to share your projects, this template is the
						perfect starting point!</p>
				</div>
			</div>
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light" href="movie/getMovieRank">
					<i class="fas fa-download mr-2"></i> Download Now!
				</a>
			</div>
		</div>
	</section>

	<!-- Contact Section -->
	<section id="contact">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">Contact
				Me</h2>
			<hr class="star-dark mb-5">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
					<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
					<form name="sentMessage" id="contactForm" novalidate="novalidate">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Name</label> <input class="form-control" id="name"
									type="text" placeholder="Name" required="required"
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Email Address</label> <input class="form-control"
									id="email" type="email" placeholder="Email Address"
									required="required"
									data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Phone Number</label> <input class="form-control"
									id="phone" type="tel" placeholder="Phone Number"
									required="required"
									data-validation-required-message="Please enter your phone number.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Message</label>
								<textarea class="form-control" id="message" rows="5"
									placeholder="Message" required="required"
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-xl"
								id="sendMessageButton">Send</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>


	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"> <i class="fa fa-chevron-up"></i>
		</a>
	</div>
	<%@include file="../views/includes/footer.jsp"%>
	<!-- Portfolio Modals -->
	<%@include file = "../views/main/modal.jsp" %>
	


</body>

</html>
