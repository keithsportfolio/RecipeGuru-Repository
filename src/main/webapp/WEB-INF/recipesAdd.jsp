<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Recipe</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700" rel="stylesheet">
    <style>
        body {
            background-color: #f9f9f9;
            padding-top: 80px;
        }

        .navbar {
            background-color: #ff8c00;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 999;
        }

        .navbar-toggler {
            color: #000;
        }

        .navbar-nav .nav-link {
            font-weight: bold;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
        }

        .form-container h2 {
            margin-bottom: 30px;
            text-align: center;
        }

        .form-container .form-control {
            border-radius: 0;
        }

        .form-container textarea.form-control {
            height: 150px;
        }

        .form-container .form-control.green-outline {
            border-color: green;
        }

        .form-container .form-control.red-outline {
            border-color: red;
        }

        .form-container button[type="submit"] {
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="logo.png" alt="Logo" height="30">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/recipes/all">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/myrecipes">My Recipes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/home">Back</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

	<div class="container">
	    <div class="form-container">
	    <p><form:errors path="user.*"/></p>
	        <h2>Add Recipe</h2>
	        <form method="post" action="/recipes" modelAttribute="recipe">
	            <div class="mb-3">
	                <label for="recipeName" class="form-label">Recipe Name</label>
	                <input type="text" class="form-control" id="recipeName" name="name" required>
	                <div id="recipeName-feedback" class="invalid-feedback">Minimum length should be 3 characters.</div>
	            </div>
	            <div class="mb-3">
	                <label for="imageSrc" class="form-label">Image link:</label>
	                <input type="text" class="form-control" id="imageSrc" name="image_source" required>
	                <div id="imageSrc-feedback" class="invalid-feedback">Minimum length should be 3 characters.</div>
	            </div>
	            <div class="mb-3">
	                <label for="ingredients" class="form-label">Ingredients</label>
	                <textarea class="form-control" id="ingredients" name="ingredients" rows="3" required></textarea>
	                <div id="ingredients-feedback" class="invalid-feedback"></div>
	            </div>
	            <div class="mb-3">
	                <label for="description" class="form-label">Description</label>
	                <textarea class="form-control" id="description" name="description" rows="5" required></textarea>
	                <div id="description-feedback" class="invalid-feedback"></div>
	            </div>
	            <button type="submit" class="btn btn-dark">Submit</button>
	        </form>
	    </div>
	</div>










    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    
    
<!--      <script>
        // Function to handle input validation and color changes
        function handleInputValidation() {
            const ingredientsInput = document.getElementById('ingredients');
            const descriptionInput = document.getElementById('description');

            ingredientsInput.addEventListener('input', () => {
                if (ingredientsInput.value.length <= 250) {
                    ingredientsInput.classList.remove('red-outline');
                    ingredientsInput.classList.add('green-outline');
                } else {
                    ingredientsInput.classList.remove('green-outline');
                    ingredientsInput.classList.add('red-outline');
                }
            });

            descriptionInput.addEventListener('input', () => {
                if (descriptionInput.value.length <= 250) {
                    descriptionInput.classList.remove('red-outline');
                    descriptionInput.classList.add('green-outline');
                } else {
                    descriptionInput.classList.remove('green-outline');
                    descriptionInput.classList.add('red-outline');
                }
            });
        }

        // Call the function when the document is ready
        document.addEventListener('DOMContentLoaded', handleInputValidation);
    </script -->>
    
	<script>
	  document.addEventListener('DOMContentLoaded', function() {
	    const recipeNameInput = document.getElementById('recipeName');
	    const imageSrcInput = document.getElementById('imageSrc');
	    const ingredientsInput = document.getElementById('ingredients');
	    const descriptionInput = document.getElementById('description');
	    const ingredientsFeedback = document.getElementById('ingredients-feedback');
	    const descriptionFeedback = document.getElementById('description-feedback');
	  
	    recipeNameInput.addEventListener('input', function() {
	      if (recipeNameInput.value.length < 3) {
	        recipeNameInput.classList.add('is-invalid');
	      } else {
	        recipeNameInput.classList.remove('is-invalid');
	      }
	    });
	  
	    imageSrcInput.addEventListener('input', function() {
	      if (imageSrcInput.value.length < 3) {
	        imageSrcInput.classList.add('is-invalid');
	      } else {
	        imageSrcInput.classList.remove('is-invalid');
	      }
	    });
	  
	    ingredientsInput.addEventListener('input', function() {
	      if (ingredientsInput.value.length > 355) {
	        ingredientsInput.classList.add('is-invalid');
	        ingredientsFeedback.innerText = 'Exceeded maximum character limit (355 characters).';
	      } else {
	        ingredientsInput.classList.remove('is-invalid');
	        ingredientsFeedback.innerText = '';
	      }
	    });
	  
	    descriptionInput.addEventListener('input', function() {
	      if (descriptionInput.value.length > 355) {
	        descriptionInput.classList.add('is-invalid');
	        descriptionFeedback.innerText = 'Exceeded maximum character limit (355 characters).';
	      } else {
	        descriptionInput.classList.remove('is-invalid');
	        descriptionFeedback.innerText = '';
	      }
	    });
	  });
	  
	    // Function to handle input validation and color changes
	    function handleInputValidation() {
	        // ... Existing code for input validation

	        // Disable submit button if any of the conditions are met
	        const submitButton = document.querySelector('button[type="submit"]');
	        const recipeNameInput = document.getElementById('recipeName');
	        const imageSrcInput = document.getElementById('imageSrc');
	        const ingredientsInput = document.getElementById('ingredients');
	        const descriptionInput = document.getElementById('description');

	        function checkInputs() {
	            const recipeNameValue = recipeNameInput.value.trim();
	            const imageSrcValue = imageSrcInput.value.trim();
	            const ingredientsValue = ingredientsInput.value.trim();
	            const descriptionValue = descriptionInput.value.trim();

	            const isInvalid =
	                recipeNameValue.length < 3 ||
	                imageSrcValue.length < 3 ||
	                ingredientsValue.length > 275 ||
	                descriptionValue.length > 275;

	            submitButton.disabled = isInvalid;
	        }

	        recipeNameInput.addEventListener('input', checkInputs);
	        imageSrcInput.addEventListener('input', checkInputs);
	        ingredientsInput.addEventListener('input', checkInputs);
	        descriptionInput.addEventListener('input', checkInputs);
	    }

	    // Call the function when the document is ready
	    document.addEventListener('DOMContentLoaded', handleInputValidation);
	</script>
</body>

</html>
