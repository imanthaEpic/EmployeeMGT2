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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.min.css" rel="stylesheet" />
    </head>
    <body>
        <%@ include file="navbar.jsp" %> <!-- Including navbar.jsp -->
        <div class="container mt-4">
            <h2>Employee Management</h2>
            <!-- Search Form -->
            <form id="searchForm" class="mt-4">
                <div class="form-row align-items-center">
                    <div class="col-md-9 mb-3">
                        <label for="employeeCode">Search Employees:</label>
                        <input type="text" id="employeeSearch" placeholder="Search..." class="form-control">
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
                <div class="form-row mt-1">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary">Search</button>
                        <button type="button" class="btn btn-secondary" onclick="resetForm()">Reset</button>
                    </div>
                </div>
            </form>

            <!-- Search Results Table -->
            <table class="table table-striped mt-5">
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
                <tbody id="Results">
                    <!-- Results will be populated here -->
                </tbody>
            </table>

            <!-- Add New Employee Button -->
            <!--            <button type="button" class="btn btn-success" onclick="showAddEmployeeModal()">New</button>-->
            <button type="button" class="btn btn-success mb-3 mt-3" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#staticBackdrop">
                Add New
            </button>

            <div
                class="modal fade"
                id="staticBackdrop"
                data-mdb-backdrop="static"
                data-mdb-keyboard="false"
                tabindex="-1"
                aria-labelledby="staticBackdropLabel"
                aria-hidden="true"
                >
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                            <button type="button" class="btn-close" data-mdb-ripple-init data-mdb-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label for="firstName" class="form-label">First Name</label>
                                    <input type="text" class="form-control" id="firstName" placeholder="Enter first name">
                                </div>
                                <div class="mb-3">
                                    <label for="lastName" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="lastName" placeholder="Enter last name">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" placeholder="Enter email">
                                </div>
                                <div class="mb-3">
                                    <label for="nic" class="form-label">NIC</label>
                                    <input type="text" class="form-control" id="nic" placeholder="Enter NIC">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" placeholder="Enter password">
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-mdb-ripple-init data-mdb-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" data-mdb-ripple-init>Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                            // Function to handle form submission (when Search button is clicked)
                            document.getElementById("searchForm").addEventListener("submit", function (event) {
                                event.preventDefault(); // Prevent default form submission

                                // Call the handleSearch function to filter employees
                                handleSearch();
                            });
                            // AJAX function to fetch data and populate the table
                            function fetchData() {
                                var xhttp = new XMLHttpRequest();
                                xhttp.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        document.getElementById("Results").innerHTML = this.responseText;
                                    }
                                };
                                xhttp.open("GET", "EmployeeDataServlet", true);
                                xhttp.send();
                            }

                            // Call fetchData function when the page loads
                            window.onload = function () {
                                fetchData();
                            };

                            // Function to redirect to the employee details page
                            function viewEmployeeDetails(employeeCode) {
                                window.location.href = "EmployeeDetailsServlet?employeeCode=" + employeeCode;
                            }

                            // Example function for editing employee data (you can customize this)
                            function editEmployee(employeeCode) {
                                alert("View employee with code: " + employeeCode);
                                // Add your logic to edit employee here
                            }

                            // Function to handle real-time search
                            function handleSearch() {
                                // Get the search query
                                var query = document.getElementById("employeeSearch").value.trim().toLowerCase();

                                // Get the status filter
                                var status = document.getElementById("status").value;

                                // Get all table rows
                                var rows = document.querySelectorAll("#Results tr");

                                // Loop through each row and check if it matches the search query and status filter
                                rows.forEach(function (row) {
                                    // Get the content of cells for employee code, full name, and NIC
                                    var employeeCode = row.cells[0].textContent.trim().toLowerCase();
                                    var fullName = row.cells[1].textContent.trim().toLowerCase();
                                    var nic = row.cells[3].textContent.trim().toLowerCase();
                                    var rowStatus = row.cells[6].textContent.trim().toLowerCase();

                                    // Check if any of the fields match the search query and status filter
                                    if ((employeeCode.includes(query) || fullName.includes(query) || nic.includes(query)) &&
                                            (status === "All" || rowStatus === status.toLowerCase())) {
                                        row.style.display = "";
                                    } else {
                                        row.style.display = "none";
                                    }
                                });
                            }

                            // Attach an input event listener to the search input field
                            document.getElementById("employeeSearch").addEventListener("input", handleSearch);

                            // Function to reset the search form
                            function resetForm() {
                                document.getElementById("employeeSearch").value = "";
                                document.getElementById("status").value = "All";
                                // Show all rows in the table
                                var rows = document.querySelectorAll("#Results tr");
                                rows.forEach(function (row) {
                                    row.style.display = "";
                                });
                            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.umd.min.js"
        ></script>
    </body>
</html>
