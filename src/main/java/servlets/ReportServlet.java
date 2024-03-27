/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import bean.Employee;

/**
 *
 * @author imant
 */
public class ReportServlet extends HttpServlet {

    private List<Employee> employees; // Assuming you have a list of employees

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Generate PDF report
        byte[] pdfBytes = generatePDFReport();
        // Serve PDF report for download
        serveReport(pdfBytes, "application/pdf", "employee_report.pdf", response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Generate Excel report
        byte[] excelBytes = generateExcelReport();
        // Serve Excel report for download
        serveReport(excelBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "employee_report.xlsx", response);
    }

    private byte[] generatePDFReport() throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfDocument pdf = new PdfDocument(new PdfWriter(baos));
        Document document = new Document(pdf);

        // Add employee details to PDF document
        for (Employee employee : employees) {
            document.add(new Paragraph("Employee Code: " + employee.getEmployeeCode()));
            document.add(new Paragraph("First Name: " + employee.getFirstName()));
            document.add(new Paragraph("Last Name: " + employee.getLastName()));
            // Add other employee details similarly
            document.add(new Paragraph("----------------------------------------------"));
        }

        document.close();
        return baos.toByteArray();
    }

    private byte[] generateExcelReport() throws IOException {
        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Employee Report");
            int rowNum = 0;
            Row row = sheet.createRow(rowNum++);
            // Creating headers
            row.createCell(0).setCellValue("Employee Code");
            row.createCell(1).setCellValue("First Name");
            row.createCell(2).setCellValue("Last Name");
            // Add other headers as needed

            // Adding employee details
            for (Employee employee : employees) {
                row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(employee.getEmployeeCode());
                row.createCell(1).setCellValue(employee.getFirstName());
                row.createCell(2).setCellValue(employee.getLastName());
                // Add other employee details similarly
            }

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            workbook.write(baos);
            return baos.toByteArray();
        }
    }

    private void serveReport(byte[] bytes, String contentType, String fileName, HttpServletResponse response) throws IOException {
        response.setContentType(contentType);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        try (OutputStream os = response.getOutputStream()) {
            os.write(bytes);
        }
    }
}
