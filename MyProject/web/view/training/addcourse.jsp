<%-- 
    Document   : addcourse
    Created on : Jul 16, 2024, 12:13:31 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>Course id</th>
                    <th>Course name</th>
                    <th>Lecturer id</th>
                    <th>Subject id</th>
                    <th>Semester</th>
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
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button onclick="addCourse()">Add</button>
        <button onclick="deleteCourse()">Delete</button>
        <form action="addcourse?action=insert" id="formAddEdit" method="POST" style="display: none">
            <h1>Form Add</h1>
            Course ID <input type="text" name="cid" value="" /> <br/>
            Course name  <input type="text" name="cname" value="" /> <br/>
            Lecturer ID <input type="text" name="lid" value="" /> <br/>
            Subject ID <input type="text" name="subid" value="" /> <br/>
            Semester <input type="text" name="semid" value="" /> <br/>
            <input type="submit" value="Insert" />
        </form>
        <form action="addcourse?action=delete" id="formDeleteEdit" method="POST" style="display: none">
            <h1>Form Delete</h1>
            Course ID <input type="text" name="cid" value="" /> <br/>
            <input type="submit" value="Delete" />
        </form>
        
        <script>
            function addCourse() {
                displayFormAdd();
            }
            function deleteCourse() {
                displayFormDelete();
            }
            function displayFormAdd() {
                let form = document.querySelector("#formAddEdit");
                if (form.style.display === 'none') {
                    form.style.display = 'block';
                } else {
                    form.style.display = 'none';
                }
            }
            function displayFormDelete() {
                let form = document.querySelector("#formDeleteEdit");
                if (form.style.display === 'none') {
                    form.style.display = 'block';
                } else {
                    form.style.display = 'none';
                }
            }
        </script>

    </body>
</html>
