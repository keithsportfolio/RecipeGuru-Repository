<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cooking Recipes - Login</title>
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

        .form-container .btn-login {
            background-color: orange;
            color: #fff;
            font-size: 1.5rem;
            padding: 1rem 2rem;
            border-radius: 3rem;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .form-container .btn-login:hover {
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
                        <a class="nav-link" href="recipes/all">Recipes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/about">About</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/signup">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
   <p><c:out value="${error}" /></p>
	<section class="hero">
	    <div class="container">
	        <h1>Login</h1>
	        <div class="form-container">
	            <form method="post" action="/login">
	                <div class="form-group">
	                    <input type="email" class="form-control" placeholder="email" name="email">
	                    <div class="invalid-feedback"></div> <!-- Error message for email -->
	                </div>
	                <div class="form-group">
	                    <input type="password" class="form-control" placeholder="password" name="password">
	                    <div class="invalid-feedback"></div> <!-- Error message for password -->
	                </div>
	                <button type="submit" class="btn btn-login">Login</button>
	            </form>
	            <div class="text-center mt-3">
	                <p>Don't have an account? <a href="/signup">Sign Up</a></p>
	            </div>
	        </div>
	        <div id="login-feedback"></div> <!-- Div to display overall error message -->
	    </div>
	</section>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
		  $(document).ready(function() {
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
		
		    // Trigger email format validation on input change
		    $('input[name="email"]').on('input', function() {
		      validateEmailFormat();
		    });
		
		    // Function to validate password field
		    function validatePassword() {
		      var password = $('input[name="password"]').val();
		
		      // Validate password length
		      var isValid = password.length >= 3;
		
		      // Display error message and add red outline if password is too short
		      if (!isValid) {
		        $('input[name="password"]').addClass('is-invalid');
		        $('input[name="password"]').next('.invalid-feedback').text('Password should be at least 3 characters long.');
		      } else {
		        $('input[name="password"]').removeClass('is-invalid');
		        $('input[name="password"]').next('.invalid-feedback').text('');
		      }
		
		      return isValid;
		    }
		
		    // Trigger password validation on input change
		    $('input[name="password"]').on('input', function() {
		      validatePassword();
		    });
		
		    // Validate form on submit
		    $('form').on('submit', function(event) {
		      var isValidEmail = validateEmailFormat();
		      var isValidPassword = validatePassword();
		
		      // Prevent form submission if there are validation errors
		      if (!isValidEmail || !isValidPassword) {
		        event.preventDefault();
		      }
		    });
		  });
	</script>
</body>

</html>
