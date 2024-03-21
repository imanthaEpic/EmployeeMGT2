<%-- 
    Document   : error3
    Created on : Mar 21, 2024, 9:09:59 AM
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
        <h2>Error updating employee</h2>
        <p>
            else {
                // Error occurred while updating employee, redirect back to update page with error message
                response.sendRedirect(request.getContextPath() + "/myprofile.jsp?error=update_failed");
            }
        </p>
    </body>
</html>
