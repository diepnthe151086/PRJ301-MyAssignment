<%-- 
    Document   : take
    Created on : Jun 24, 2024, 2:01:09 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Scores</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #ffffff;
                padding: 20px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                width: 90%;
                max-width: 1000px;
                position: relative;
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
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #f8f8f8;
                font-weight: bold;
            }
            input[type="text"] {
                width: 80px;
                padding: 5px;
                margin: 5px 0;
                border: 1px solid #ddd;
                border-radius: 4px;
                text-align: center;
            }
            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .header {
                text-align: center;
                margin-bottom: 20px;
            }
            .header h1 {
                margin: 0;
                font-size: 24px;
                color: #333;
            }
            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
                background-color: #f0f0f0;
                color: #333;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }
            .back-button:hover {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <a href="javascript:history.back()" class="back-button">Back</a>
            <div class="header">
                <h1>Exam Scores</h1>
            </div>
            <form action="take" method="POST">
                <table>
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <c:forEach items="${requestScope.exams}" var="e">
                                <th>
                                    ${e.assessment.name} (${e.assessment.weight}%)<br/>
                                    ${e.from}
                                </th>
                            </c:forEach>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.students}" var="s">
                        <tr>
                            <td>${s.name}</td>
                            <c:forEach items="${requestScope.exams}" var="e">
                                <td>
                                    <input type="text" name="score${s.id}_${e.id}"
                                           <c:forEach items="${requestScope.grades}" var="g">
                                               <c:if test="${e.id eq g.exam.id and s.id eq g.student.id}">
                                                   value="${g.score}"
                                               </c:if>
                                           </c:forEach>
                                    />
                                    <input type="hidden" name="gradeid" value="${s.id}_${e.id}"/>
                                </td>
                            </c:forEach>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <input type="hidden" name="cid" value="${param.cid}" />
                <div style="text-align: center;">
                    <input type="submit" value="Save" />
                </div>
            </form>
        </div>
    </body>
</html>
