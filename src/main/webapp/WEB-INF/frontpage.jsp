<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cooking Recipes - Landing Page</title>
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
            overflow: hidden;
        }

        .navbar {
            background-color: #ff8c00;
            border-radius: 0;
        }

        .navbar-brand {
            color: #fff;
            font-weight: bold;
        }

        .navbar-toggler {
            border: none;
            background-color: transparent;
        }

        .navbar-toggler .navbar-toggler-icon {
            background-color: #333;
            width: 20px;
            height: 3px;
            display: inline-block;
            margin-top: 3px;
        }

        .navbar-nav .nav-link {
            color: #fff;
            font-weight: 500;
            font-family: 'Poppins', sans-serif;
        }

        .navbar-nav .nav-link::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 2px;
            bottom: -5px;
            left: 0;
            background-color: #fff;
            visibility: hidden;
            transform: scaleX(0);
            transition: transform 0.3s ease-in-out, visibility 0.3s ease-in-out;
        }

        .navbar-nav .nav-link:hover::before {
            visibility: visible;
            transform: scaleX(1);
        }

        .hero {
            position: relative;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .video-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .video-background video {
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .hero-content {
            text-align: center;
            color: #fff;
            position: relative;
            z-index: 1;
        }

        .hero-content h1 {
            font-size: 4rem;
            margin-bottom: 2rem;
        }

        .hero-content p {
            font-size: 1.5rem;
            margin-bottom: 3rem;
        }

        .btn-get-started {
            background-color: orange;
            color: #fff;
            font-size: 1.5rem;
            padding: 1rem 2rem;
            border-radius: 3rem;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-get-started:hover {
            background-color: #ff9900;
        }

        @media (max-width: 991px) {
            .navbar-nav .nav-link::before {
                display: none;
            }

            .navbar-collapse {
                text-align: center;
                background-color: orange;
                padding: 1rem;
                border-radius: 0 0 10px 10px;
            }

            .navbar-collapse .nav-link {
                display: block;
                padding: 0.5rem 0;
                border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            }

            .navbar-collapse .nav-link:last-child {
                border-bottom: none;
            }

            .navbar-toggler {
                border: none;
                background-color: transparent;
                outline: none;
            }

            .navbar-toggler .navbar-toggler-icon {
                width: 30px;
                height: 3px;
                display: inline-block;
                background-color: #fff;
                margin-top: 6px;
            }

            .navbar-toggler[aria-expanded="true"] .navbar-toggler-icon {
                background-color: transparent;
            }

            .navbar-collapse {
                display: none;
            }

            .navbar-collapse.show {
                display: block;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="${pageContext.request.contextPath}src/main/resources/images/your-image.png" width="30" height="30" class="d-inline-block align-top" alt="Logo"> recipeGuru
        </a>
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
                    <a class="nav-link" href="/login">Sign In</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="hero">
    <div class="video-background">
        <video autoplay loop muted playsinline>
            <source src="https://v4.cdnpk.net/videvo_files/video/free/video0468/large_watermarked/_import_615e879da73ba7.00965427_FPpreview.mp4"
                    type="video/mp4">
        </video>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="hero-content">
                    <h1>Welcome to Cooking Recipes</h1>
                    <p>Discover delicious recipes and cook like a pro!</p>
                    <a href="/signup" class="btn btn-get-started">Get Started</a>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
