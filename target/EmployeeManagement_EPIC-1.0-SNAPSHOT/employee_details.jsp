<%-- 
    Document   : employee_details
    Created on : Mar 25, 2024, 4:01:36 PM
    Author     : imant
--%>
<%@page import="bean.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Employee Details</title>
        <!-- Add your CSS styling here -->
    </head>
    <body>
        <!-- Display employee details -->
        <h1>Employee Details</h1>
        <table>
            <tr>
                <th>Employee Code</th>
                <th>Full Name</th>
                <!-- Add other table headers -->
            </tr>
            <tr>
                <td>${employee.employeeCode}</td>
                <td>${employee.firstName} ${employee.lastName}</td>
                <!-- Add other table cells -->
            </tr>
        </table>
    </body>
</html>
