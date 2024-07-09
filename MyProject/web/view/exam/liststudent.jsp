<%-- 
    Document   : liststudent
    Created on : Jul 10, 2024, 12:21:59 AM
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
                    <th>STUDENT ID</th>
                    <th>STUDENT NAME</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.students}" var="s">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
