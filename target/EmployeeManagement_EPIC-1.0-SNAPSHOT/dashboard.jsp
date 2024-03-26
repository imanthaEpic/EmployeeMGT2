<%-- 
    Document   : dashboard
    Created on : Mar 18, 2024, 2:56:34 PM
    Author     : imantha_o
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="utill.DBConnection" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Active Employees Counts</title>
    </head>
    <body>
        <%@ include file="navbar.jsp" %> <!-- Including navbar.jsp -->

        <!--        <div class="mt-4">
                    <h2>Total Employees Count: <span id="totalEmployeesCount"></span></h2>
                    <h2>Active Employees Count: <span id="activeEmployeesCount"></span></h2>
                    <h2>Inactive Employees Count: <span id="inactiveEmployeesCount"></span></h2>
                </div>-->

        <!-- Success message -->
        <c:if test="${not empty requestScope.loginSuccess}">
            <div id="successMessage" class="alert alert-success error-message" role="alert" style="display: block; position: fixed; top: 10px; right: 10px; z-index: 9999;">
                <strong>Success:</strong> ${requestScope.loginSuccess}
                <button type="button" class="btn-close" onclick="hideSuccessMessage()" aria-label="Close"></button>
            </div>
        </c:if>


        <div class="container mt-4">
            <h1 class="text-center mb-5">System Dashboard</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-header">Total Registered Employees</div>
                        <div class="card-body">
                            <h5 class="card-title">
                                <span id="totalEmployeesCount"></span>
                            </h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-header">Active Employees</div>
                        <div class="card-body">
                            <h5 class="card-title">
                                <span id="activeEmployeesCount"></span>
                            </h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-danger mb-3">
                        <div class="card-header">Inactive Employees</div>
                        <div class="card-body">
                            <h5 class="card-title">
                                <span id="inactiveEmployeesCount"></span>
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                    $(document).ready(function () {
                        $.ajax({
                            url: 'DashboardServlet', // Change to DashboardServlet
                            type: 'GET',
                            dataType: 'json',
                            success: function (data) {
                                $('#totalEmployeesCount').text(data.totalEmployeesCount);
                                $('#activeEmployeesCount').text(data.activeEmployeesCount);
                                $('#inactiveEmployeesCount').text(data.inactiveEmployeesCount);
                            },
                            error: function (xhr, status, error) {
                                console.error(xhr.responseText);
                                // Handle errors
                            }
                        });
                    });

                    $(document).ready(function () {
                        // Call the function to hide the success message after 3 seconds
                        setTimeout(hideSuccessMessage, 2000);
                    });

                    // Function to hide the success message after 3 seconds
                    function hideSuccessMessage() {
                        $('.alert-success').fadeOut('slow', function () {
                            $(this).remove();
                        });
                    }
        </script>
    </body>
</html>