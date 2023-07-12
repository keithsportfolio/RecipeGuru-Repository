<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fff;
        }

        .navbar {
            background-color: ff8c00;
        }

        .navbar-brand {
            color: #fff;
            font-weight: bold;
        }

        .navbar-nav {
            margin-left: auto;
        }

        .navbar-nav .nav-link {
            color: #fff;
            font-weight: bold;
        }

        .navbar-nav .nav-link:hover {
            color: #000;
        }

        .navbar-toggler-icon {
            border-bottom: 2px solid #fff;
        }

        .card {
            width: 27rem;
            height: 25rem;
            margin-bottom: 20px;
            margin-right: 6px;
        }

        .card-img-top {
            height: 60%;
            object-fit: cover;
        }

        .card-title {
            margin-top: 10px;
            font-weight: bold;
        }

        .card-text {
            color: #777;
        }

        .rating {
            color: #FFC107;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">RecipeGuru</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/logout">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="recipes/all">Recipes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/home">My Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout">Sign Out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="container" style="margin-top: 100px;">
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <div class="col">
                <div class="card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Recipe Image">
                    <div class="card-body">
                        <h5 class="card-title">Recipe 1</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <div class="rating">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Recipe Image">
                    <div class="card-body">
                        <h5 class="card-title">Recipe 2</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <div class="rating">&#9733;&#9733;&#9734;&#9734;&#9734;</div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Recipe Image">
                    <div class="card-body">
                        <h5 class="card-title">Recipe 3</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <div class="rating">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    </div>
                </div>
            </div>
            <!-- Add more card items as needed -->
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
