/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import bean.Employee;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.http.HttpSession;
import repository.EmployeeRepo;
import utill.DBConnection;

/**
 *
 * @author imant
 */
public class EmployeeDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        // Validate CSRF token
        String sessionToken = (String) session.getAttribute("csrfToken");
        String requestToken = request.getParameter("csrfToken");
        if (!sessionToken.equals(requestToken)) {
            // Handle invaild CSRF token ..
            return;
        }
        
        // Get employee object from session
        
        Employee emp = (Employee) session.getAttribute("loguser");
        if (emp == null){
            System.out.println("Cannot identify the Employee");
            return;
        }
        
        EmployeeRepo empRepo = null;
        try {
            empRepo = new EmployeeRepo(DBConnection.getConnection());
        }catch (SQLException ex) {
            Logger.getLogger(EmployeeDeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (empRepo.deleteEmployee(emp.getEmployeeCode())){
            // Employee deleted successfully
            session.invalidate();
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
