<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Rating</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fff;
        }
    
        .navbar {
            background-color: #ff8c00;
            margin-bottom: 20px;
        }
    
        .navbar-nav a.nav-link {
            color: white; /* Set initial text color to white */
            transition: color 0.3s; /* Add transition effect for smooth color change */
        }
    
        .navbar-nav a.nav-link:hover {
            color: black; /* Change text color to black on hover */
            text-decoration: underline; /* Add underline effect on hover */
            transition-delay: 0.2s; /* Add delay effect to the hover transition */
        }
    
        .jumbotron {
            background-color: orange;
            color: white;
            padding: 3rem;
            margin-bottom: 0;
        }
    
        .card {
            width: 40%;
            margin: 100px auto 0;
        }
    
        .rate-slider {
            width: 40%;
            margin: 0 auto;
        }
    
        .rate-slider input[type="range"] {
            -webkit-appearance: none;
            appearance: none;
            width: 100%;
            height: 8px;
            border-radius: 5px;
            background-color: #f1f1f1;
            outline: none;
            opacity: 0.7;
            transition: opacity 0.2s;
        }
    
        .rate-slider input[type="range"]::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background-color: orange;
            cursor: pointer;
        }
    
        .rate-slider input[type="range"]::-moz-range-thumb {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background-color: orange;
            cursor: pointer;
        }
    
        .rate-slider .rating-values {
            display: flex;
            justify-content: space-between;
            font-weight: bold;
            font-size: 18px;
        }
    </style>
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="logo.png" alt="Logo"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/recipes/all">Recipes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout">Sign out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="card">
            <img src="${recipe.image_source }" alt="Recipe Image"
                style="width: 100%; height: 200px; object-fit: cover;">
            <div class="card-body">
                <h5 class="card-title text-center fw-bold">${recipe.name }</h5>
                <p class="card-text text-center">Tell us what you think</p>
            </div>
        </div>

        <div class="rate-slider mt-4">
            <h2 class="text-center">Rate this recipe</h2>
            <input type="range" min="1" max="5" step="1" value="3" id="ratingSlider">
            <div class="rating-values d-flex justify-content-between mt-2">
                <span><b>1</b></span>
                <span><b>2</b></span>
                <span><b>3</b></span>
                <span><b>4</b></span>
                <span><b>5</b></span>
            </div>
            <output id="ratingValue" class="text-center fw-bold mt-2">3</output>
        </div>

        <div class="text-center mt-3">
            <button type="button" class="btn btn-dark" id="submitRatingBtn">Submit</button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const ratingSlider = document.getElementById('ratingSlider');
        const ratingValue = document.getElementById('ratingValue');
        const submitRatingBtn = document.getElementById('submitRatingBtn');

        const recipeId = ${recipe.id};

        submitRatingBtn.addEventListener('click', () => {
            const rating = ratingSlider.value;
            
            // Create a new XMLHttpRequest object
            const xhr = new XMLHttpRequest();
            
            // Set the request method and URL
            xhr.open('POST', '/add_rating/' + recipeId + '/' + rating, true);
            
            // Set the Content-Type header for the request
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            
            // Set up the callback function to handle the response
            xhr.onload = function() {
                if (xhr.status === 200) {
                    // Request succeeded
                    console.log('Rating added successfully');
                    // Redirect to the desired page
                    window.location.href = '/home';
                } else {
                    // Request failed
                    console.error('Error adding rating');
                }
            };
            
            // Send the request with the rating data
            xhr.send();
        });
    </script>
</body>

</html>

