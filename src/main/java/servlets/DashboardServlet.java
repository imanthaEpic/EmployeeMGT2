package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.JSONException;
import org.json.JSONObject;
import utill.DBConnection;

@WebServlet(name = "DashboardServlet", urlPatterns = {"/DashboardServlet"})
@MultipartConfig
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            
            // Query to get total employees count
            String totalQuery = "SELECT COUNT(*) AS total_count FROM employees";
            stmt = conn.prepareStatement(totalQuery);
            rs = stmt.executeQuery();
            if (rs.next()) {
                jsonResponse.put("totalEmployeesCount", rs.getInt("total_count"));
            }
            
            System.out.println(rs);

            // Query to get active employees count
            String activeQuery = "SELECT COUNT(*) AS active_count FROM employees WHERE status = 'Active'";
            stmt = conn.prepareStatement(activeQuery);
            rs = stmt.executeQuery();
            if (rs.next()) {
                jsonResponse.put("activeEmployeesCount", rs.getInt("active_count"));
            }
            
            System.out.println(rs);

            // Query to get inactive employees count
            String inactiveQuery = "SELECT COUNT(*) AS inactive_count FROM employees WHERE status = 'Inactive'";
            stmt = conn.prepareStatement(inactiveQuery);
            rs = stmt.executeQuery();
            if (rs.next()) {
                jsonResponse.put("inactiveEmployeesCount", rs.getInt("inactive_count"));
            }
            
            System.out.println(rs);

            out.print(jsonResponse.toString());
        } catch (SQLException | JSONException e) {
            e.printStackTrace();
            // Handle exceptions
        } finally {
            DBConnection.closeConnection(conn);
            if (out != null) {
                out.close();
            }
        }
    }
}
