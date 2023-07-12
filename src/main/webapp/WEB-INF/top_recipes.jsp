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

        .navbar-nav .nav-link:hover {
            color: #fff;
            background-color: #f25602;
        }

        .jumbotron {
            background-color: #ff8c00;
            color: white;
            padding: 3rem;
            margin-bottom: 0;
        }

        .card {
            margin-bottom: 1.5rem;
        }
        
        .card-img-top {
        height: 200px; /* Set the desired fixed height */
        object-fit: cover; /* Crop the image and maintain aspect ratio */
    	}

        .side-panel {
            position: sticky;
            top: 70px;
            width: 320px;
            height: calc(100vh - 70px);
            overflow-y: auto;
            padding: 1rem;
            background-color: #f8f9fa;
        }

        .side-panel .list-group-item:hover {
            background-color: #f2f2f2;
        }

        @media (max-width: 992px) {
            .side-panel {
                display: none;
            }
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="logo.png" alt="RecipeGuru"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/home">Home</a>
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
                <p class="lead">Checkout our most popular recipes.</p>
                <p class="lead">${user.name}</p>
            </div>
        </div>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="side-panel" id="sidePanel">
                    <h5 class="mb-3">Menu</h5>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="/recipes">Add A Recipe</a></li>
                        <li class="list-group-item"><a href="/myrecipes">Your Recipes</a></li>
                        <li class="list-group-item"><a href="/recipes/favorites">Favorites</a></li>
                        <li class="list-group-item"><a href="/recipes/popular">Top Recipes</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-8">
                <div class="row">
                     <div class="col-md-12 text-center mt-4">
            				<h2 class="mb-4">Top Rated Recipes</h2>
        			</div>
                    <c:forEach items="${topRecipes}" var="recipe">
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
				                <!-- Display appropriate button based on liking status -->
				                <c:choose>
				                    <c:when test="${liked}">
				                        <a href="/recipe/unlike/${recipe.id }"><button class="btn btn-dark mt-3" data-bs-toggle="modal" data-bs-target="#rateModal1">Unlike</button></a>  <a href="/recipe/rates/${recipe.id }"><button class="btn btn-dark mt-3" data-bs-toggle="modal" data-bs-target="#rateModal1">Rate</button></a>
				                    </c:when>
				                    <c:otherwise>
				                        <a href="/recipe/like/${recipe.id }"><button class="btn btn-dark mt-3" data-bs-toggle="modal" data-bs-target="#rateModal1">Like</button></a>  <a href="/recipe/rates/${recipe.id }"><button class="btn btn-dark mt-3" data-bs-toggle="modal" data-bs-target="#rateModal1">Rate</button></a>
				                    </c:otherwise>
				                </c:choose>
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



	    <!-- Modal -->
    <div class="modal fade" id="rateModal1" tabindex="-1" aria-labelledby="rateModalLabel1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="rateModalLabel1">Rate Recipe 1</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/add_rating" method="post">
                        <div class="mb-3">
                            <label for="ratingInput1" class="form-label">Rating</label>
                            <input type="number" class="form-control" id="ratingInput1" min="1" max="5">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Submit</button>
                    
                </div>
            </div>
        </div>
    </div>


    <script>
        window.addEventListener('scroll', function () {
            var sidePanel = document.getElementById('sidePanel');
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