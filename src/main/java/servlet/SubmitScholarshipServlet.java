package servlet;

import dao.ScholarshipApplicationDAO;
import model.ScholarshipApplication;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

@WebServlet("/SubmitScholarshipServlet")
@MultipartConfig(maxFileSize = 2 * 1024 * 1024) // 2MB limit
public class SubmitScholarshipServlet extends HttpServlet {
    private ScholarshipApplicationDAO applicationDAO;

    @Override
    public void init() throws ServletException {
        applicationDAO = new ScholarshipApplicationDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract form data
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String scholarshipType = request.getParameter("scholarship");
        Part filePart = request.getPart("document");

        // Validate and process file
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = filePart.getSubmittedFileName();
            if (fileName.toLowerCase().endsWith(".pdf")) {
                // Create ScholarshipApplication object
                ScholarshipApplication application = new ScholarshipApplication();
                application.setFullname(fullname);
                application.setEmail(email);
                application.setScholarshipType(scholarshipType);

                // Save file and insert into database
                try (InputStream fileInputStream = filePart.getInputStream()) {
                    try {
                        applicationDAO.insertApplication(application, fileInputStream, fileName);
                    } catch (SQLException e) {
                        throw new ServletException("Database error while saving application", e);
                    }
                }
            }
        }

        // Redirect back to the form
        response.sendRedirect(request.getContextPath() + "/jsp/ScholarshipApplicationForm.jsp");
    }
}