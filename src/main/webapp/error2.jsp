<%-- 
    Document   : error2
    Created on : Mar 20, 2024, 10:33:50 PM
    Author     : imant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Password Missmatch</h2>
        <p>if (!newPassword.equals(confirmNewPassword)) {
            // Passwords do not match, redirect back to update page with error message
            response.sendRedirect(request.getContextPath() + "/myprofile.jsp?error=password_mismatch");
            return;
        }</p>
    </body>
</html>
