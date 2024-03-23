<%-- 
    Document   : confirmDelete
    Created on : Mar 21, 2024, 11:31:28 AM
    Author     : imant
--%>

<%@ page import="java.util.UUID" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // Generate a random CSRF token
  String csrfToken = UUID.randomUUID().toString();
  session.setAttribute("csrfToken", csrfToken);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Confirm Profile Deletion</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles can be added here */
        body {
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Confirm Profile Deletion</h5>
                        <p class="card-text">Are you sure you want to delete your profile? This action cannot be undone.</p>
                        <p class="card-text">All your data and account information will be permanently removed.</p>
                        <form action="EmployeeDeleteServlet" method="post">
                            <input type="hidden" name="csrfToken" value="<%= csrfToken %>" />
                            <button type="submit" class="btn btn-danger">Confirm Deletion</button>
                            <a href="myprofile.jsp" class="btn btn-secondary">Cancel</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies (jQuery) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

