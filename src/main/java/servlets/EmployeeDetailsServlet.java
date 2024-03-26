package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utill.DBConnection;
import bean.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Base64;
import org.apache.commons.io.IOUtils;

@WebServlet(name = "EmployeeDetailsServlet", urlPatterns = {"/EmployeeDetailsServlet"})
public class EmployeeDetailsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String employeeCodeParam = request.getParameter("employee_code");
        int employeeCode = Integer.parseInt(employeeCodeParam);

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PrintWriter out = response.getWriter();
        try {
            con = DBConnection.getConnection();
            String query = "SELECT * FROM employees WHERE employee_code=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, employeeCode);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Create an Employee object and set its properties
                Employee employee = new Employee();
                employee.setEmployeeCode(rs.getInt("employee_code"));
                employee.setFirstName(rs.getString("first_name"));
                employee.setLastName(rs.getString("last_name"));
                employee.setEmail(rs.getString("email"));
                employee.setNic(rs.getString("nic"));
                employee.setMobileNo(rs.getString("mobile_no"));
                employee.setAddress(rs.getString("address"));
                employee.setDesignation(rs.getString("designation"));
                employee.setGender(rs.getString("gender"));
                employee.setDob(rs.getDate("dob"));
                employee.setStatus(rs.getString("status"));

                employee.setProfileImage(rs.getBytes("profile_image"));

                request.setAttribute("employee", employee);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/empDetails.jsp");
                dispatcher.forward(request, response);

            } else {
                // Handle case where employee is not found
                response.getWriter().println("No employee found with the given code.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to fetch employee details";
    }
}
