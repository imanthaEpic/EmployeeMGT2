<%-- 
    Document   : employeeMngt
    Created on : Mar 19, 2024, 1:46:21 PM
    Author     : imantha_o
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Management</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Bootstrap JavaScript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@ include file="navbar.jsp" %> <!-- Including navbar.jsp -->
        <div class="container">
            <h2>Employee Management</h2>
            <!-- Search Form -->
            <form id="searchForm">
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label for="employeeCode">Employee Code:</label>
                        <input type="text" class="form-control" id="employeeCode" name="employeeCode">
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="employeeNIC">Employee NIC:</label>
                        <input type="text" class="form-control" id="employeeNIC" name="employeeNIC">
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="employeeName">Employee Name:</label>
                        <input type="text" class="form-control" id="employeeName" name="employeeName">
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="status">Status:</label>
                        <select class="form-control" id="status" name="status">
                            <option value="All">All</option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Search</button>
                <button type="button" class="btn btn-secondary" onclick="resetForm()">Reset</button>
            </form>

            <hr>

            <!-- Search Results Table -->
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Employee Code</th>
                        <th>Full Name</th>
                        <th>Address</th>
                        <th>NIC</th>
                        <th>Mobile No</th>
                        <th>Designation</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="searchResults">
                    <!-- Search results will be populated here -->
                </tbody>
            </table>

            <!-- Add New Employee Button -->
            <button type="button" class="btn btn-success" onclick="showAddEmployeeModal()">New</button>
        </div>

        <!-- Add New Employee Modal -->
        <div class="modal fade" id="addEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <!-- Modal header, body, and footer will be added here -->
                </div>
            </div>
        </div>

        <!-- JavaScript for handling form submission, resetting form, and showing modal -->
        <script>
            // JavaScript functions will be added here
        </script>

    </body>
</html>
