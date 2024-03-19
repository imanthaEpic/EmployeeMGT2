<%-- 
    Document   : myprofile
    Created on : Mar 19, 2024, 5:00:25 PM
    Author     : imant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.Employee"%>
<% Employee emp = (Employee) session.getAttribute("loguser");
    if (emp == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
    </head>
    <body>
        <%@ include file="navbar.jsp" %> <!-- Including navbar.jsp -->
        <h1>Hello Welcome <%= emp.getFirstName()%>!</h1>
        <h3>Your Account ID: <%= emp.getEmployeeCode()%></h3>
        <h3>Your Email Address: <%= emp.getEmail()%></h3>
    </body>
</html>
