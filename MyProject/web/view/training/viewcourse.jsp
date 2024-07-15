<%-- 
    Document   : viewcourse
    Created on : Jul 15, 2024, 12:44:55 AM
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
                    <th>Lecturer ID</th>
                    <th>Lecturer name</th>
                    <th>Student ID</th>
                    <th>Subject name</th>
                    <th>Semester</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.list}" var="o">
                    <tr>
                        <td>${o.cid}</td>
                        <td>${o.cname}</td>
                        <td>${o.lid}</td>
                        <td>${o.lname}</td>
                        <td>${o.sid}</td>
                        <td>${o.sname}</td>
                        <td>${o.semid}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button onclick="addCourse()">Add</button>
        <button onclick="deleteCourse()">Delete</button>
        <form action="viewcourse?action=insert" id="formAddEdit" method="POST" style="display: none">
            <h1>Form Add</h1>
            Course ID <input type="text" name="cid" value="" /> <br/>
            Course name  <input type="text" name="cname" value="" /> <br/>
            Lecturer ID <input type="text" name="lid" value="" /> <br/>
            Subject ID <input type="text" name="subid" value="" /> <br/>
            Semester <input type="text" name="semid" value="" /> <br/>
            <input type="submit" value="Insert" />
        </form>
        <form action="viewcourse?action=delete" id="formDeleteEdit" method="POST" style="display: none">
            <h1>Form Delete</h1>
            Course ID <input type="text" name="cid" value="" /> <br/>
            Course name  <input type="text" name="cname" value="" /> <br/>
            Lecturer ID <input type="text" name="lid" value="" /> <br/>
            Subject ID <input type="text" name="subid" value="" /> <br/>
            Semester <input type="text" name="semid" value="" /> <br/>
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
