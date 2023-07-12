<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fff;
        }

        .navbar {
            background-color: #ff8c00;
        }

        .navbar-brand {
            margin-right: auto;
        }

        .navbar-nav {
            margin-left: auto;
        }

        .jumbotron {
            background-color: #ff8c00;
            color: #fff;
            padding: 3rem;
            margin-bottom: 0;
            min-height: 375px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 50px; /* Add margin to create space below the jumbotron */
        }

        .card-container {
            position: relative;
            z-index: 1;
            margin-top: -200px;
        }

        .card {
            width: 100%;
            max-width: 650px;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .card-img-top {
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            padding: 20px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="logo.png" alt="Logo" height="30">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/home">Back</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/myrecipes">My Recipes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="jumbotron">
        <div class="container text-center">
            <h2>About Us</h2>
        </div>
    </div>

    <div class="container card-container">
        <div class="card">
            <img src="https://images.pexels.com/photos/4259707/pexels-photo-4259707.jpeg?auto=compress&cs=tinysrgb&w=600" class="card-img-top" alt="Card Image">
            <div class="card-body">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a ex ac urna vehicula mattis sed non
                    neque. Nam lacinia pharetra diam, a malesuada nunc eleifend ut. In non risus neque. Curabitur
                    consectetur enim quis sem sagittis, a vulputate mi lobortis. Nulla facilisi. Curabitur
                    pellentesque mi quis lacus rhoncus porttitor. Suspendisse ut lorem purus. Integer cursus iaculis
                    porta tincidunt. Nullam at semper enim, non facilisis erat. Phasellus aliquet venenatis tristique.
                    Ut nec metus enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
                    Curae; Aenean a felis quis nunc tincidunt fermentum. Nulla sed justo eget metus consectetur
                    sagittis a eu nisl. Donec sit amet mi et massa laoreet sagittis vel non tellus.</p>
                <p>Morbi et congue metus. Sed ac fringilla orci. Sed ac ligula eu nulla ullamcorper feugiat. Integer
                    auctor purus vel enim posuere, id molestie elit finibus. Nulla facilisi. Suspendisse vel tincidunt
                    orci. Vivamus pharetra tincidunt malesuada. Morbi finibus a erat ac ultricies.</p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>