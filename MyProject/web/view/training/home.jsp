<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Course Selection</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .container {
                display: flex;
            }
            .side_nav {
                width: 250px;
                background-color: #333;
                padding: 20px;
                height: 100vh;
                color: white;
                position: fixed;
            }
            .side_nav .logo img {
                width: 100%;
            }
            .side_nav ul {
                list-style-type: none;
                padding: 0;
                margin-top: 30px;
            }
            .side_nav ul li {
                margin-bottom: 20px;
            }
            .side_nav ul li a {
                text-decoration: none;
                color: white;
                font-size: 18px;
                display: block;
                padding: 10px;
                border-radius: 4px;
            }
            .side_nav ul li a:hover,
            .side_nav ul li a.active {
                background-color: #555;
            }
            .main_content {
                margin-left: 270px;
                padding: 20px;
                flex-grow: 1;
                background-color: #f4f4f4;
                min-height: 100vh;
            }
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border-radius: 8px;
            }
            .header .dropdown {
                position: relative;
                display: inline-block;
            }
            .header .dropbtn {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                background-color: #007bff;
                color: white;
                cursor: pointer;
            }
            .header .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }
            .header .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .header .dropdown-content a:hover {
                background-color: #ddd;
            }
            .header .dropdown:hover .dropdown-content {
                display: block;
            }
            .header .dropdown:hover .dropbtn {
                background-color: #0056b3;
            }
            h1.title {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            .form-container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                margin: 0 auto;
            }
            .form-container h1 {
                margin-bottom: 20px;
                font-size: 24px;
                text-align: center;
                color: #333;
            }
            .form-container form {
                display: flex;
                flex-direction: column;
            }
            .form-container label {
                margin-bottom: 10px;
                font-weight: bold;
                color: #555;
            }
            .form-container select {
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }
            .form-container input[type="submit"] {
                padding: 10px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                text-align: center;
            }
            .form-container input[type="submit"]:hover {
                background-color: #0056b3;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="side_nav">
                <div class="logo">
                    <img src="https://hcmuni.fpt.edu.vn/Data/Sites/1/skins/default/img/og-image.png" alt="FPT Logo">
                </div>
                <ul>
                    <li><a href="viewcourse" id="viewCourses">View List of Courses</a></li>
                    <li><a href="addcourse" id="viewStudents">View List of Students</a></li>
                    <li><a href="../logout">Logout</a></li>
                </ul>
            </div>           
        </div>

    </body>

</html>
