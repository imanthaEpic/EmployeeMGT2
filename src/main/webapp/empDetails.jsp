<%-- 
    Document   : empDetails
    Created on : Mar 23, 2024, 7:02:41 PM
    Author     : imant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="utill.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.min.css" rel="stylesheet" />
        <title>Active Employees Counts</title>
    </head>
    <body>
        <%@ include file="navbar.jsp" %> <!-- Including navbar.jsp -->
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            int totalEmployeesCount = 0;
            int activeEmployeesCount = 0;
            int inactiveEmployeesCount = 0;

            try {
                conn = DBConnection.getConnection();

                // Query to get total employees count
                String totalQuery = "SELECT COUNT(*) AS total_count FROM employees";
                stmt = conn.prepareStatement(totalQuery);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    totalEmployeesCount = rs.getInt("total_count");
                }

                // Query to get active employees count
                String activeQuery = "SELECT COUNT(*) AS active_count FROM employees WHERE status = 'Active'";
                stmt = conn.prepareStatement(activeQuery);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    activeEmployeesCount = rs.getInt("active_count");
                }

                // Query to get inactive employees count
                String inactiveQuery = "SELECT COUNT(*) AS inactive_count FROM employees WHERE status = 'Inactive'";
                stmt = conn.prepareStatement(inactiveQuery);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    inactiveEmployeesCount = rs.getInt("inactive_count");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                DBConnection.closeConnection(conn);
            }
        %>

        <div class="mt-4">
            <h2>Total Employees Count: <%= totalEmployeesCount %></h2>
            <h2>Active Employees Count: <%= activeEmployeesCount %></h2>
            <h2>Inactive Employees Count: <%= inactiveEmployeesCount %></h2>
        </div>
    </body>
</html>
