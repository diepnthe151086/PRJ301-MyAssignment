<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Management</title>
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
        .summary-cards {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .summary-card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 45%;
            text-align: center;
        }
        .summary-card h2 {
            margin: 0;
            font-size: 24px;
            color: #007bff;
        }
        .summary-card p {
            font-size: 18px;
            color: #555;
        }
        .table-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
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
                <li><a href="lecturer" id="viewCourses">View List of Course</a></li>
                <li><a href="liststudent" id="viewStudents">View List of Student</a></li>
                <li><a href="../logout">Logout</a></li>
            </ul>
        </div>
        <div class="main_content">
            <div class="header">
                <div>Welcome, ${requestScope.displayname}</div>
                <div class="dropdown">
                    <button class="dropbtn">Profile</button>
                    <div class="dropdown-content">
                        <a href="#">Setting</a>
                        <a href="../logout">Logout</a>
                    </div>
                </div>
            </div>
            <h1 class="title">Student Management Dashboard</h1>
            <div class="summary-cards">
                <div class="summary-card">
                    <h2>Total Students</h2>
                    <p><c:out value="${fn:length(requestScope.students)}"/></p>
                </div>
                <div class="summary-card">
                    <h2>Total Courses</h2>
                    <p>12</p>
                </div>
            </div>
            <div class="table-container">
                <h2 class="title">Student List</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.students}" var="list">
                            <tr>
                                <td>${list.id}</td>
                                <td>${list.name}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
