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
        <style>
            .carousel-caption {
                background-color: rgba(0, 0, 0, 0.4); /* Semi-transparent black background */
                color: white; /* White text color */
                padding: 20px; /* Add padding to the caption */
            }

        </style>
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
                <strong>Login Success:</strong> ${requestScope.loginSuccess}
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

        <div class="container mt-5 mb-4">
            <div id="carouselExampleCaptions" class="carousel slide" data-mdb-ride="carousel" data-mdb-carousel-init>
                <div class="carousel-indicators">
                    <button
                        type="button"
                        data-mdb-target="#carouselExampleCaptions"
                        data-mdb-slide-to="0"
                        class="active"
                        aria-current="true"
                        aria-label="Slide 1"
                        ></button>
                    <button
                        type="button"
                        data-mdb-target="#carouselExampleCaptions"
                        data-mdb-slide-to="1"
                        aria-label="Slide 2"
                        ></button>
                    <button
                        type="button"
                        data-mdb-target="#carouselExampleCaptions"
                        data-mdb-slide-to="2"
                        aria-label="Slide 3"
                        ></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://www.epictechnology.lk/wp-content/uploads/2019/03/fintech-mobile-software-company-epic-lanka-about-us-image.jpg" class="d-block w-100" alt="Wild Landscape"/>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>OUR VISION</h5>
                            <p>Delightful life for everyone through affordable, state-of-the-art, and high-quality technological innovations.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://www.epictechnology.lk/wp-content/uploads/2019/03/fintech-mobile-software-company-epic-lanka-our-corporate-management-image.jpg" class="d-block w-100" alt="Camera"/>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>OUR PASSION</h5>
                            <p>We are passionate about continuing our efforts in reducing the digital divide with cutting-edge solutions. </p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://www.epictechnology.lk/wp-content/uploads/2019/04/Annual-Trip-to-RIU-Ahungalla-2018-3.jpg" class="d-block w-100" alt="Exotic Fruits"/>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>OUR MISSION</h5>
                            <p>To create a sought-after and best-in-class workplace synonymous with sharing and caring for our employees – our most valuable assets.</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
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
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.umd.min.js"
        ></script>
    </body>
</html>