<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Class List</title>
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
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 20px;
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
        .course-list {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }
        .course-list label {
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .course-list .course-item {
            padding: 20px;
            border: 2px solid #ddd;
            border-radius: 8px;
            margin-bottom: 20px;
            width: 80%;
            background-color: #ffffff;
            cursor: pointer;
            font-size: 20px;
            text-align: center;
            transition: all 0.3s ease;
        }
        .course-list .course-item:hover {
            background-color: #f1f1f1;
            border-color: #007bff;
        }
        .exam-list {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .exam-list label {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .exam-list input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .exam-list input[type="submit"]:hover {
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
                <li><a href="lecturer" id="viewCourses">View List of Course</a></li>
                <li><a href="liststudent" id="viewStudents">View List of Student</a></li>
                <li><a href="../logout">Logout</a></li>
            </ul>
        </div>
        <div class="main_content">
            <div class="header">
                <div class="dropdown">
                    <button class="dropbtn">${requestScope.displayname}</button>
                    <div class="dropdown-content">
                        <a href="#">Setting</a>
                        <a href="../logout">Logout</a>
                    </div>
                </div>
            </div>
            <h1 class="title">Class List</h1>
            <div class="course-list">
                <c:if test="${requestScope.exams eq null}">
                    <c:if test="${requestScope.courses.size() > 0}">
                        <label>Courses:</label>
                        <c:forEach items="${requestScope.courses}" var="c">
                            <div class="course-item" onclick="viewCourse('${c.id}')">
                                ${c.name}
                            </div>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${requestScope.exams ne null}">
                    <form action="take" method="GET" class="exam-list">
                        <input type="hidden" name="cid" value="${param.cid}"/>
                        <c:forEach items="${requestScope.exams}" var="e">
                            <label>
                                <input type="checkbox" name="eid" value="${e.id}"/> 
                                ${e.assessment.name} - (${e.from} : ${e.assessment.weight}%)
                            </label>
                        </c:forEach>
                        <input type="submit" value="Take"/>
                    </form>
                </c:if>
            </div>
        </div>
    </div>

    <script>
        // Highlight the active link
        const path = window.location.pathname;
        const viewCoursesLink = document.getElementById('viewCourses');
        const viewStudentsLink = document.getElementById('viewStudents');

        if (path.includes('lecturer')) {
            viewCoursesLink.classList.add('active');
        } else if (path.includes('liststudent')) {
            viewStudentsLink.classList.add('active');
        }

        function viewCourse(courseId) {
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = 'lecturer';
            
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'cid';
            input.value = courseId;
            form.appendChild(input);
            
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</body>
</html>
