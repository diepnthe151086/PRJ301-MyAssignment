<%-- 
    Document   : view
    Created on : Jul 2, 2024, 4:26:54 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grade List</title>
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
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: white;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            th, td {
                padding: 12px;
                text-align: left;
                border: 1px solid #ddd;
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
            #totalCredits {
                margin-top: 20px;
                padding: 10px;
                background-color: #f4f4f4;
                border-radius: 8px;
                display: none;
            }
            #totalCredits h2 {
                color: #333;
                text-align: center;
            }
            #total {
                font-size: 24px;
                color: #007bff;
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
                    <li><a href="student" id="viewStudents">View List of Scores</a></li>
                    <li><a href="../logout">Logout</a></li>
                </ul>
            </div>
            <div class="main_content">
                <div class="header">
                    <div>Welcome, ${requestScope.username}</div>
                    <div class="dropdown">
                        <button class="dropbtn">Profile</button>
                        <div class="dropdown-content">
                            <a href="#">Setting</a>
                            <a href="../logout">Logout</a>
                        </div>
                    </div>
                </div>
                <h1 class="title">Grade List</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Grade Item</th>
                            <th>Weight</th>
                            <th>Value</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.grades}" var="grade">
                            <tr>
                                <td>${grade.getAname()}</td>
                                <td>${grade.getWeightByPercentage()}%</td>
                                <td>${grade.getScore()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
            <div class="form-container">
                <h1>Calculate Total Credits</h1>
                <form id="calculateForm">
                    <label for="credit1">WS1:</label>
                    <input type="number" id="credit1" name="credit1" min="0" required>
                    <br><br>
                    <label for="credit2">WS2:</label>
                    <input type="number" id="credit2" name="credit2" min="0" required>
                    <br><br>
                    <label for="credit3">Credit 3:</label>
                    <input type="number" id="credit3" name="credit3" min="0" required>
                    <br><br>
                    <input type="button" value="Calculate Total" onclick="calculateTotal()">
                </form>
                <div id="totalCredits" style="display:none;">
                    <h2>Total Credits: <span id="total"></span></h2>
                </div>
            </div>
        </div>
        <script>
            function calculateTotal() {
                // Lấy giá trị từ input
                var credit1 = parseInt(document.getElementById('credit1').value) || 0;
                var credit2 = parseInt(document.getElementById('credit2').value) || 0;
                var credit3 = parseInt(document.getElementById('credit3').value) || 0;

                // Tính tổng
                var total = credit1 + credit2 + credit3;

                // Hiển thị kết quả
                document.getElementById('total').textContent = total;
                document.getElementById('totalCredits').style.display = 'block';
            }
        </script>   
    </body>
</html>
