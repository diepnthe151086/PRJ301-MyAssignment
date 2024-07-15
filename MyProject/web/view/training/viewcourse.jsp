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
        

    </body>
</html>
