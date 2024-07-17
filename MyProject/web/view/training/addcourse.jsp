<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            .form-container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                margin: 20px auto;
                text-align: center;
                display: none;
            }
            .form-container h1 {
                margin-bottom: 20px;
                font-size: 24px;
                text-align: center;
                color: #333;
            }
            .form-container input[type="text"],
            .form-container input[type="number"] {
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                width: calc(100% - 20px);
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
                width: 100%;
            }
            .form-container input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .action-buttons {
                margin-top: 20px;
                text-align: center;
            }
            .action-buttons button {
                padding: 10px 20px;
                margin: 0 10px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            .action-buttons button:hover {
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
                    <li><a href="viewcourse" id="viewCourses">View All</a></li>
                    <li><a href="addcourse" id="viewStudents">View List of Student</a></li>
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
                <h1 class="title">Management</h1>
                <div class="summary-cards">
                    <div class="summary-card">
                        <h2>Total Courses</h2>
                        <p><c:out value="${fn:length(requestScope.courses)}"/></p>
                    </div>
                </div>
                <div class="table-container">
                    <h2 class="title">Course List</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Course ID</th>
                                <th>Course Name</th>
                                <th>Lecturer ID</th>
                                <th>Subject ID</th>
                                <th>Semester</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.courses}" var="c">
                                <tr>
                                    <td>${c.id}</td>
                                    <td>${c.name}</td>
                                    <td>${c.lecturer.id}</td>
                                    <td>${c.subject.id}</td>
                                    <td>${c.semester.id}</td>
                                    <td><a href="addstudent?cid=${c.id}">Add Student</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="action-buttons">
                        <button id="addCourseBtn" onclick="toggleForm('addForm')">Add Course</button>
                        <button id="deleteCourseBtn" onclick="toggleForm('deleteForm')">Delete Course</button>
                    </div>
                </div>

                <div class="form-container" id="addForm">
                    <form action="addcourse?action=insert" method="POST">
                        <h1>Add Course</h1>
                        <input type="text" name="cid" placeholder="Course ID" required><br>
                        <input type="text" name="cname" placeholder="Course Name" required><br>
                        <input type="text" name="lid" placeholder="Lecturer ID" required><br>
                        <input type="text" name="subid" placeholder="Subject ID" required><br>
                        <input type="text" name="semid" placeholder="Semester" required><br>
                        <input type="submit" value="Add">
                    </form>
                </div>

                <div class="form-container" id="deleteForm">
                    <form action="addcourse?action=delete" method="POST">
                        <h1>Delete Course</h1>
                        <input type="text" name="cid" placeholder="Course ID to delete" required><br>
                        <input type="submit" value="Delete">
                    </form>
                </div>

            </div>
        </div>

        <script>
            // X? lý khi nh?n nút "Add"
            document.getElementById('addForm').querySelector('form').addEventListener('submit', function (event) {
                event.preventDefault(); // Ng?n ch?n form g?i ?i m?c ??nh

                // Ki?m tra các tr??ng nh?p li?u có d? li?u không
                var cid = this.elements['cid'].value.trim();
                var cname = this.elements['cname'].value.trim();
                var lid = this.elements['lid'].value.trim();
                var subid = this.elements['subid'].value.trim();
                var semid = this.elements['semid'].value.trim();

                // Ki?m tra các tr??ng có r?ng không
                if (cid === '' || cname === '' || lid === '' || subid === '' || semid === '') {
                    alert('Please fill in all fields before adding a course.');
                    return;
                }

                // Hi?n th? c?nh báo xác nh?n
                if (confirm('Are you sure you want to add this course?')) {
                    this.submit(); // G?i form ?i n?u ng??i dùng xác nh?n
                }
            });

// X? lý khi nh?n nút "Delete"
            document.getElementById('deleteForm').querySelector('form').addEventListener('submit', function (event) {
                event.preventDefault(); // Ng?n ch?n form g?i ?i m?c ??nh

                // Ki?m tra tr??ng nh?p li?u có d? li?u không
                var cid = this.elements['cid'].value.trim();

                // Ki?m tra tr??ng có r?ng không
                if (cid === '') {
                    alert('Please enter the Course ID to delete.');
                    return;
                }

                // Hi?n th? c?nh báo xác nh?n
                if (confirm('Are you sure you want to delete this course?')) {
                    this.submit(); // G?i form ?i n?u ng??i dùng xác nh?n
                }
            });




            function toggleForm(formId) {
                var form = document.getElementById(formId);
                if (form.style.display === 'none') {
                    form.style.display = 'block';
                } else {
                    form.style.display = 'none';
                }
            }
        </script>

    </body>
</html>
