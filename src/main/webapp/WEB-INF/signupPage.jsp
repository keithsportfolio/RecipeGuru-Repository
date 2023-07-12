<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cooking Recipes - Signup</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">
    <style>
        body {
            background-color: #fff;
            color: #333;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }

        .navbar {
            background-color: orange;
            border-radius: 0;
        }

        .navbar-brand {
            color: #fff;
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: #fff;
            font-weight: 500;
            font-family: 'Poppins', sans-serif;
            transition: color 0.3s ease;
        }

        .navbar-nav .nav-link:hover {
            color: #000;
        }

        .navbar-toggler {
            border: none;
            background-color: #fff;
        }

        .navbar-toggler .navbar-toggler-icon {
            background-color: #333;
        }

        .navbar-toggler:hover .navbar-toggler-icon {
            background-color: #000;
        }

        .hero {
            padding: 4rem 0;
            text-align: center;
            background-color: #fff;
        }

        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
        }

        .form-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container .form-control {
            border: none;
            border-radius: 0;
            box-shadow: none;
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-bottom: 2px solid #ccc;
        }

        .form-container .form-control:focus {
            border-color: orange;
        }

        .form-container .btn-signup {
            background-color: orange;
            color: #fff;
            font-size: 1.5rem;
            padding: 1rem 2rem;
            border-radius: 3rem;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .form-container .btn-signup:hover {
            background-color: #ff9900;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="Screenshot 2023-05-23 175827.jpg" width="30" height="30" class="d-inline-block align-top" alt="Logo"> recipeGuru
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/recipes/all">Recipes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/">About</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Sign In</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	<section class="hero">
	    <div class="container">
	        <h1>Sign Up</h1>
	        <div class="form-container">
	        	<p><form:errors path="user.*"/></p>
				<form method="POST" action="/signup" modelAttribute="user">
				    <div class="form-group">
				        <input type="text" class="form-control" placeholder="Full Name" name="name">
				        <div class="invalid-feedback"></div> <!-- Error message for name -->
				    </div>
				    <div class="form-group">
				        <input type="text" class="form-control" placeholder="Username" name="userName">
				        <div class="invalid-feedback"></div> <!-- Error message for username -->
				    </div>
				    <div class="form-group">
				        <input type="email" class="form-control" placeholder="Email" name="email">
				        <div class="invalid-feedback"></div> <!-- Error message for email -->
				    </div>
				    <div class="form-group">
				        <input type="password" class="form-control" placeholder="Password" name="password">
				        <div class="invalid-feedback"></div> <!-- Error message for password -->
				    </div>
				    <div class="form-group">
				        <input type="password" class="form-control" placeholder="Confirm Password" name="passwordConfirmation">
				        <div class="invalid-feedback"></div> <!-- Error message for password confirmation -->
				    </div>
				    <button type="submit" class="btn btn-signup">Sign Up</button>
				</form>
	            <div class="text-center mt-3">
	                <p>Already have an account? <a href="/login">Log in?</a></p>
	            </div>
	            <div id="signup-feedback"></div> <!-- Div to display overall error message -->
	        </div>
	    </div>
	</section>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    
	 <script>
	  $(document).ready(function() {
	    // Disable submit button by default
	    $('.btn-signup').prop('disabled', true);
	
	    // Function to validate name, username, and email fields
	    function validateFields() {
	      var name = $('input[name="name"]').val();
	      var username = $('input[name="userName"]').val();
	      var email = $('input[name="email"]').val();
	
	      // Validate name, username, and email length
	      var isValid = name.length >= 3 && username.length >= 3 && email.length >= 3;
	
	      // Display error message and add red outline if fields are too short
	      if (name.length < 3) {
	        $('input[name="name"]').addClass('is-invalid');
	        $('input[name="name"]').next('.invalid-feedback').text('Name should be at least 3 characters long.');
	      } else {
	        $('input[name="name"]').removeClass('is-invalid');
	        $('input[name="name"]').next('.invalid-feedback').text('');
	      }
	
	      if (username.length < 3) {
	        $('input[name="userName"]').addClass('is-invalid');
	        $('input[name="userName"]').next('.invalid-feedback').text('Username should be at least 3 characters long.');
	      } else {
	        $('input[name="userName"]').removeClass('is-invalid');
	        $('input[name="userName"]').next('.invalid-feedback').text('');
	      }
	
	      if (email.length < 3) {
	        $('input[name="email"]').addClass('is-invalid');
	        $('input[name="email"]').next('.invalid-feedback').text('Email should be at least 3 characters long.');
	      } else {
	        $('input[name="email"]').removeClass('is-invalid');
	        $('input[name="email"]').next('.invalid-feedback').text('');
	      }
	
	      return isValid;
	    }
	
	    // Function to validate password and password confirmation fields
	    function validatePasswords() {
	      var password = $('input[name="password"]').val();
	      var confirmPassword = $('input[name="passwordConfirmation"]').val();
	
	      // Validate if password and password confirmation match
	      var isValid = password === confirmPassword;
	
	      // Display error message and add red outline if passwords don't match
	      if (!isValid) {
	        $('input[name="password"], input[name="passwordConfirmation"]').addClass('is-invalid');
	        $('input[name="password"], input[name="passwordConfirmation"]').next('.invalid-feedback').text('Passwords do not match.');
	      } else {
	        $('input[name="password"], input[name="passwordConfirmation"]').removeClass('is-invalid');
	        $('input[name="password"], input[name="passwordConfirmation"]').next('.invalid-feedback').text('');
	      }
	
	      return isValid;
	    }
	
	    // Function to validate email format
	    function validateEmailFormat() {
	      var email = $('input[name="email"]').val();
	
	      // Validate email format using a regular expression
	      var isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
	
	      // Display error message and add red outline if email format is incorrect
	      if (!isValid) {
	        $('input[name="email"]').addClass('is-invalid');
	        $('input[name="email"]').next('.invalid-feedback').text('Invalid email format.');
	      } else {
	        $('input[name="email"]').removeClass('is-invalid');
	        $('input[name="email"]').next('.invalid-feedback').text('');
	      }
	
	      return isValid;
	    }
	
	    // Trigger validations on input change
	    $('input[name="name"], input[name="userName"], input[name="email"], input[name="password"], input[name="passwordConfirmation"]').on('input', function() {
	      validateFields();
	      validatePasswords();
	      validateEmailFormat();
	
	      // Enable or disable submit button based on field validations
	      if (validateFields() && validatePasswords() && validateEmailFormat()) {
	        $('.btn-signup').prop('disabled', false);
	      } else {
	        $('.btn-signup').prop('disabled', true);
	      }
	    });
	  });
	</script>
</body>

</html>