/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import bean.Employee;
import repository.EmployeeRepo;
import utill.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.IOUtils;

@WebServlet(name = "EmployeeUpdateServlet", urlPatterns = {"/EmployeeUpdateServlet"})
@MultipartConfig
public class EmployeeUpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processUpdate(request, response);
        } catch (SQLException | ParseException ex) {
            Logger.getLogger(EmployeeUpdateServlet.class.getName()).log(Level.SEVERE, "Error processing update", ex);
            response.sendRedirect("error.jsp"); // Redirect to error page in case of exception
        }
    }

    protected void processUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException {
        HttpSession session = request.getSession();
        Employee loggedInEmployee = (Employee) session.getAttribute("loguser");

        if (loggedInEmployee == null) {
            // Redirect to login page if no user is logged in
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobileNo = request.getParameter("mobileNo");
        String nic = request.getParameter("nic");
        String address = request.getParameter("address");
        String designation = request.getParameter("designation");
        String status = request.getParameter("status");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");

        System.out.println("New Password: " + newPassword);
        System.out.println("Confirm New Password: " + confirmNewPassword);

        // Check if new password and confirm new password match
        if (!newPassword.equals(confirmNewPassword)) {
            // Passwords do not match, redirect back to update page with error message
            response.sendRedirect("error2.jsp");
            return;
        }

        // Handle profile image upload
        InputStream profileImageStream = null;
        Part profileImagePart = request.getPart("profileImage");
        if (profileImagePart != null && profileImagePart.getSize() > 0) {
            profileImageStream = profileImagePart.getInputStream();
        }

        // Update employee object
        loggedInEmployee.setFirstName(firstName);
        loggedInEmployee.setLastName(lastName);
        loggedInEmployee.setEmail(email);
        loggedInEmployee.setMobileNo(mobileNo);
        loggedInEmployee.setNic(nic);
        loggedInEmployee.setAddress(address);
        
        // Only update designation if it's not empty or null
        if (designation != null && !designation.isEmpty()) {
            loggedInEmployee.setDesignation(designation);
        }

        // Only update status if it's not empty or null
        if (status != null && !status.isEmpty()) {
            loggedInEmployee.setStatus(status);
        }

        // Only update password if it's not empty or null
        if (newPassword != null && !newPassword.isEmpty()) {
            loggedInEmployee.setPassword(newPassword);
        }

        // Set profile image if provided
        if (profileImageStream != null) {
            loggedInEmployee.setProfileImage(IOUtils.toByteArray(profileImageStream));
        }

        Connection connection = null;
        try {
            connection = DBConnection.getConnection();
            EmployeeRepo employeeRepo = new EmployeeRepo(connection);

            // Check if old password matches the password in the database
            if (!employeeRepo.verifyPassword(loggedInEmployee.getEmployeeCode(), oldPassword)) {
                // Old password does not match, redirect back to update page with error message
                response.sendRedirect("error2.jsp");
                return;
            }

            // Update employee data in the database
            if (employeeRepo.updateEmployee(loggedInEmployee)) {
                // Employee updated successfully, redirect to profile page with success message
                response.sendRedirect("dashboard.jsp");
            } else {
                // Error occurred while updating employee, redirect back to update page with error message
                response.sendRedirect("error3.jsp");
            }
        } finally {
            if (connection != null) {
                try {
                    connection.close(); // Close connection in finally block
                } catch (SQLException e) {
                    Logger.getLogger(EmployeeUpdateServlet.class.getName()).log(Level.SEVERE, "Error closing connection", e);
                }
            }
        }
    }
}
