<%-- 
    Document   : addstudent
    Created on : Jul 16, 2024, 9:20:59 PM
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
                    <th>Student ID</th>
                    <th>Student Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.students}" var="s">
                    <tr>
                        <td>${s.id}</td>
                        <td>${s.name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button onclick="addStudent()">Add</button>
        <button onclick="deleteStudent()">Delete</button>
        <form action="addstudent?action=insert" id="formAddEdit" method="POST" style="display: none">
            <h1>Form Add</h1>
            Course ID <input type="text" name="cid" value="" /> <br/>
            Course name  <input type="text" name="cname" value="" /> <br/>          
            <input type="submit" value="Insert" />
        </form>
        <form action="addstudent?action=delete" id="formDeleteEdit" method="POST" style="display: none">
            <h1>Form Delete</h1>
            Course ID <input type="text" name="sid" value="" /> <br/>
            <input type="submit" value="Delete" />
        </form>
        
        <script>
            function addStudent() {
                displayFormAdd();
            }
            function deleteStudent() {
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
