<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Site</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fff;
        }

        .navbar {
            background-color: #ff8c00;
        }
        
        nav a{
        	color: white;
        }

        .navbar-nav .nav-link:hover {
            color: #fff;
            background-color: #white;
            text-decoration: underline;
        }

        .jumbotron {
            background-color: #ff8c00;
            color: white;
            padding: 3rem;
            margin-bottom: 0;
        }

        .card {
            margin-bottom: 1.5rem;
            wdith:250px;
        }
        
        .card-img-top {
        height: 200px; /* Set the desired fixed height */
        object-fit: cover; /* Crop the image and maintain aspect ratio */
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
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
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
        <div class="jumbotron">
            <div class="container">
                <h1 class="display-4">Welcome to the Recipe Site</h1>
                <p class="lead">All of our recipes.</p>
            </div>
        </div>
    </header>

    <div class="container">

            <div class="col-md-11">
                <div class="row">
				<c:forEach items="${Recipes}" var="recipe">
				    <div class="col-md-6">
				        <div class="card">
				            <!-- Recipe image -->
				            <img src="${recipe.image_source}" class="card-img-top" alt="Recipe 1">
				            <!-- Card content -->
				            <div class="card-body">
				                <!-- Card title -->
				                <h5 class="card-title">${recipe.name}</h5>
				                <p class="card-text">${recipe.ingredients }</p>
				                <p class="card-text">${recipe.description }</p>
				                <div class="d-flex justify-content-between align-items-center">
				                    <span class="text-muted">Rating: </span>
				                    <!-- Display star rating -->
				                    <span class="text-warning">
				                        <c:set var="rating" value="${recipe.rating}" />
				                        <c:set var="fullStars" value="${rating >= 1 ? rating.intValue() : 0}" />
				                        <c:set var="halfStar" value="${rating - fullStars >= 0.5 ? 1 : 0}" />
				                        <c:set var="emptyStars" value="${5 - fullStars - halfStar}" />
				
				                        <c:forEach begin="1" end="${fullStars}">
				                            <span class="star">&#9733;</span>
				                        </c:forEach>
				
				                        <c:if test="${halfStar eq 1}">
				                            <span class="star">&#9733;&#9734;</span>
				                        </c:if>
				
				                        <c:forEach begin="1" end="${emptyStars}">
				                            <span class="star">&#9734;</span>
				                        </c:forEach>
				                    </span>
				                </div>
				                <!-- Check if recipe is liked by the user -->
				                <c:set var="liked" value="false" />
				                <c:forEach items="${recipe.users}" var="user">
				                    <c:if test="${user.id eq sessionScope.userId}">
				                        <c:set var="liked" value="true" />
				                    </c:if>
				                </c:forEach>

				            </div>
				        </div>
				    </div>
				</c:forEach>
                    <!-- Repeat the above card structure for more recipes -->
                    <!-- Add more cards here -->
                </div>
            </div>
        </div>
    </div>
    
    

    <script>
        window.addEventListener('scroll', function () {

            var jumbotron = document.querySelector('.jumbotron');
            var navbarHeight = document.querySelector('.navbar').offsetHeight;

            if (window.pageYOffset > jumbotron.offsetHeight + navbarHeight) {
                sidePanel.style.top = navbarHeight + 'px';
                sidePanel.style.position = 'fixed';
            } else {
                sidePanel.style.top = '70px';
                sidePanel.style.position = 'sticky';
            }
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>