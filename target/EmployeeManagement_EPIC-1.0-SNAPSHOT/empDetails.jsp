<%-- 
    Document   : empDetails
    Created on : Mar 23, 2024, 7:02:41 PM
    Author     : imant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
<%@ page import="bean.Employee"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <style>
            button.button-10 {
                touch-action: manipulation;
                position: relative;
                display: inline-block;
                cursor: pointer;
                outline: none;
                border: 0;
                vertical-align: middle;
                text-decoration: none;
                font-size: inherit;
                font-family: inherit;
            }
            button.button-10 {
                touch-action: manipulation;
                font-weight: 600;
                color: #382b22;
                text-transform: uppercase;
                padding: 1.25em 2em;
                background: #f0f0ff; /* Changed background color to blue */
                border: 2px solid #8597b1; /* Changed border color to blue */
                border-radius: 0.75em;
                transform-style: preserve-3d;
                transition: transform 150ms cubic-bezier(0, 0, 0.58, 1),
                    background 150ms cubic-bezier(0, 0, 0.58, 1);
            }
            button.button-10::before {
                position: absolute;
                content: "";
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: #d2d9f9; /* Changed background color to blue */
                border-radius: inherit;
                box-shadow: 0 0 0 2px #8597b1, 0 0.625em 0 0 #e2e3ff; /* Changed shadow color to blue */
                transform: translate3d(0, 0.75em, -1em);
                transition: transform 150ms cubic-bezier(0, 0, 0.58, 1),
                    box-shadow 150ms cubic-bezier(0, 0, 0.58, 1);
            }
            button.button-10:hover {
                background: #e9e9ff; /* Changed background color on hover to lighter blue */
                transform: translate(0, 0.25em);
            }
            button.button-10:hover::before {
                box-shadow: 0 0 0 2px #8597b1, 0 0.5em 0 0 #e2e3ff; /* Changed shadow color on hover to blue */
                transform: translate3d(0, 0.5em, -1em);
            }
            button.button-10:active {
                background: #e9e9ff; /* Changed background color on active to lighter blue */
                transform: translate(0em, 0.75em);
            }
            button.button-10:active::before {
                box-shadow: 0 0 0 2px #8597b1, 0 0 #e2e3ff; /* Changed shadow color on active to blue */
                transform: translate3d(0, 0, -1em);
            }
        </style>
    </head>
    <body>
        <%@ include file="navbar.jsp" %> <!-- Including navbar.jsp -->
        <section class="" style="background-color: #eee;">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">


                                <div class="card-body text-center">
                                    <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(employee.profileImage)}" class="rounded-circle img-fluid" style="width: 150px;" alt="pic">
                                </div>


                                <h5 class="my-3">${employee.firstName}</h5>
                                <p class="text-muted mb-1">${employee.designation}</p>
                                <p class="text-muted mb-4">${employee.address}</p>
                                <div class="d-flex justify-content-center mb-2">
                                    <a href="tel:${employee.mobileNo}"><button type="button" class="btn btn-success">Call</button></a>
                                    <a href="mailto:${employee.email}"><button type="button" class="btn btn-primary ms-1">Email</button></a>
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
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${employee.firstName} ${employee.lastName}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${employee.email}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Phone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${employee.mobileNo}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">NIC</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${employee.nic}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${employee.address}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Designation</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${employee.designation}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Gender</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${employee.gender}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Date of Birth</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${employee.dob}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Status</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${employee.status}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button class="button-10" role="button">
                                <span class="text">Get a Report
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
