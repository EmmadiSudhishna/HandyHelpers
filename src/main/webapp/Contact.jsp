<!DOCTYPE html>
<html lang="en">
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Handy Helpers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('Images/contact.jpg'); /* Add the path to your background image */
            background-size: contain;
            background-position: center;
            height: 100vh; /* Set height to full viewport height */
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Add opacity to make the content readable */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1, p {
            text-align: center;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        @media only screen and (max-width: 600px) {
            .container {
                max-width: 90%;
                margin: 20px auto;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="Menu.jsp"></jsp:include>
    <div class="container">
        <h1>Contact Us</h1>
        <p>Have questions or feedback? Fill out the form below and we'll get back to you as soon as possible.</p>
        <form action="#" method="post">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="text" name="email" placeholder="Your Email" required>
            <textarea name="message" placeholder="Your Message" rows="5"  cols="10" required></textarea>
            <input type="submit" value="Send Message">
        </form>
    </div>
</body>
</html>
