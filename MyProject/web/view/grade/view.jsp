<%-- 
    Document   : view
    Created on : Jul 2, 2024, 4:26:54 PM
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
                    <th>GRADE ITEM</th>
                    <th>WEIGHT</th>
                    <th>VALUE</th>
                </tr>
            </thead>
            
            <tbody>
                <c:forEach items="${requestScope.grades}" var="grade">
                
                <tr>
                    <td>${grade.getAname()}</td>
                    <td>${grade.getWeightByPercentage() }%</td>
                    <td>${grade.getScore()}</td>
                </tr>
                
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
