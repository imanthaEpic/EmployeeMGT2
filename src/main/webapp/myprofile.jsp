<%-- 
    Document   : myprofile
    Created on : Mar 19, 2024, 5:00:25 PM
    Author     : imant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.Employee"%>
<%@page import="java.util.Base64" %>
<% Employee emp = (Employee) session.getAttribute("loguser");
    if (emp == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>My Profile</title>
        <style>
            hr.new1{
                border: 1px solid blue;
            }
            .button-container {
                margin-right: 20px; /* Adjust this value as needed */
            }
        </style>

    </head>
    <body>
        <%@ include file="navbar.jsp" %> <!-- Including navbar.jsp -->

        <section style="background-color: #eee;">
            <div class="container py-5">
                <form action="EmployeeUpdateServlet" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <div class="card-body text-center">
                                        <% 
                                        byte[] imageData = emp.getProfileImage();
                                        if (imageData != null && imageData.length > 0) {
                                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                                            String imageSrc = "data:image/jpeg;base64," + base64Image;
                                        %>
                                        <img src="<%= imageSrc %>" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                                        <% 
                                        } else {
                                        %>
                                        <!-- Provide a default image if no image data is available -->
                                        <img src="default-avatar.jpg" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                                        <% 
                                        } 
                                        %>
                                        <!-- Other HTML content -->
                                    </div>
                                    <h5 class="my-3"><%= emp.getFirstName()%> <%= emp.getLastName()%></h5>
                                    <p class="text-muted mb-1"><%= emp.getDesignation()%></p>
                                    <p class="text-muted mb-4"><%= emp.getAddress()%></p>
                                    <div class="d-flex justify-content-center mb-2">
                                        <div class="input-group">
                                            <input type="file" name="profileImage" class="form-control" id="customFile" style="display: none;" onchange="updateLabel(this)" />
                                            <label for="customFile" class="form-control" id="customFileLabel">Upload a New Picture</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-4 mb-lg-0">
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush rounded-3">
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <i class="fas fa-globe fa-lg text-warning"></i>
                                            <p class="mb-0">https://mdbootstrap.com</p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                                            <p class="mb-0">mdbootstrap</p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                                            <p class="mb-0">@mdbootstrap</p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                                            <p class="mb-0">mdbootstrap</p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                                            <p class="mb-0">mdbootstrap</p>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                            <i class="fab fa-linkedin-in fa-lg" style="color: #0077B5;"></i>
                                            <p class="mb-0">YourLinkedInUsername</p>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="firstName" class="form-label">First Name</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="firstName" name="firstName" value="<%= emp.getFirstName()%>" >
                                        </div>
                                    </div>
                                    <hr class="new1">
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="lastName" class="form-label">Last Name</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="lastName" name="lastName" value="<%= emp.getLastName()%>" >
                                        </div>
                                    </div>
                                    <hr class="new1">

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="email" class="form-label">Email</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="email" name="email" value="<%= emp.getEmail()%>" >
                                        </div>
                                    </div>
                                    <hr class="new1">

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="mobileNo" class="form-label">Phone</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="mobileNo" name="mobileNo" value="<%= emp.getMobileNo()%>" >
                                        </div>
                                    </div>
                                    <hr class="new1">

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="nic" class="form-label">NIC</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="nic" name="nic" value="<%= emp.getNic()%>" >
                                        </div>
                                    </div>
                                    <hr class="new1">

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="address" class="form-label">Address</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="address" name="address" value="<%= emp.getAddress()%>" >
                                        </div>
                                    </div>
                                    <hr class="new1">

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="designation" class="form-label">Designation</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <select class="form-select form-control form-control-lg" id="designation" name="designation" >
                                                    <option value=""><%= emp.getDesignation()%></option>
                                                    <option value="Intern">Intern</option>
                                                    <option value="ASE">ASE</option>
                                                    <option value="SE">SE</option>
                                                    <option value="SSE">SSE</option>
                                                    <option value="ATL">ATL</option>
                                                    <option value="TL">TL</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="new1">

                                    <!--                                    other inputs-->

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="status" class="form-label">Status</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <select class="form-select form-control-lg" id="status" name="status">
                                                    <option value=""><%= emp.getStatus()%></option>
                                                    <option value="Active">Active</option>
                                                    <option value="Inactive">Inactive</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="new1">

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="oldPassword" class="form-label">Current Password</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" id="oldPassword" name="oldPassword">
                                        </div>
                                    </div>
                                    <hr class="new1">

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="newPassword" class="form-label">New Password</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" id="newPassword" name="newPassword">
                                        </div>
                                    </div>
                                    <hr class="new1">

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" id="confirmPassword" name="confirmNewPassword">
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <!--                            <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="card mb-4 mb-md-0">
                                                                    <div class="card-body">
                                                                        <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> Project Status
                                                                        </p>
                                                                        <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                                                        <div class="progress rounded" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                                                                        <div class="progress rounded" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                                                        <div class="progress rounded" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                                                                        <div class="progress rounded" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                                                        <div class="progress rounded mb-2" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="card mb-4 mb-md-0">
                                                                    <div class="card-body">
                                                                        <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> Project Status
                                                                        </p>
                                                                        <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                                                        <div class="progress rounded" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                                                                        <div class="progress rounded" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                                                        <div class="progress rounded" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                                                                        <div class="progress rounded" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                                                        <div class="progress rounded mb-2" style="height: 5px;">
                                                                            <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>
                    </div>
                    <div class="d-flex justify-content-center mt-5">
                        <div class="button-container">
                            <button type="submit" class="btn btn-primary btn-lg mb-2">Save Profile</button>
                        </div>
                        <a href="confirmDelete.jsp">
                            <button type="button" class="btn btn-danger btn-lg mb-2">Delete Profile</button>
                        </a>
                    </div>

                </form>
            </div>
        </section>
        <script>
            function updateLabel(input) {
                var label = document.getElementById('customFileLabel');
                if (input.files && input.files.length > 0) {
                    label.textContent = input.files[0].name;
                    label.style.backgroundColor = '#62FFFF'; // Change background color to light gray
                } else {
                    label.textContent = 'Upload a New Picture';
                    label.style.backgroundColor = ''; // Reset background color
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
