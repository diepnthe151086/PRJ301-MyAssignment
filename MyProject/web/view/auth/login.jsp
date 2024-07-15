<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - FPT University</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100&display=swap">
    <style>
        body {
            background: url(https://daihoc.fpt.edu.vn/wp-content/uploads/2022/07/truong-dh-fpt-genz-ao-uoc-duoc-hoc-vi-trai-nghiem-qua-dinh-1-1658310054-910x606.jpeg) no-repeat center center fixed;
            background-size: cover;
            font-family: 'Roboto', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .login-card {
            padding: 40px;
            width: 400px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .logo img {
            width: 200px;
            margin-bottom: 20px;
        }

        .login-card h1 {
            margin-bottom: 20px;
            font-weight: 400;
            font-size: 2.3em;
        }

        .login-card input[type="text"], 
        .login-card input[type="password"] {
            height: 44px;
            font-size: 16px;
            width: 100%;
            margin-bottom: 15px;
            padding: 0 10px;
            border: 1px solid #d9d9d9;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .login-card input[type="text"]:hover, 
        .login-card input[type="password"]:hover {
            border-color: #b9b9b9;
        }

        .login-card input[type="submit"] {
            width: 100%;
            height: 44px;
            background-color: #4d90fe;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-card input[type="submit"]:hover {
            background-color: #357ae8;
        }

        .login-card a {
            text-decoration: none;
            color: #666;
            font-weight: 400;
            display: inline-block;
            margin-top: 20px;
            transition: opacity 0.3s ease;
        }

        .login-card a:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <div class="logo">
            <img src="https://hcmuni.fpt.edu.vn/Data/Sites/1/skins/default/img/og-image.png" alt="FPT University Logo">
        </div>
        <h1>Log-in</h1>
        <form method="POST" action="login">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" name="login" class="login-submit" value="Login">
            <div><span style="color: red">${error}</span></div>
        </form>
    </div>
</body>
</html>
