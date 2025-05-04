package servlet;

import dao.ApplicationDAO;
import dao.DBUtil;
import model.Application;
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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/edit-delete-application")
@MultipartConfig(maxFileSize = 2 * 1024 * 1024) // 2MB limit
public class EditDeleteApplicationServlet extends HttpServlet {
    private ApplicationDAO applicationDAO;

    @Override
    public void init() throws ServletException {
        applicationDAO = new ApplicationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");
        String idStr = req.getParameter("id");

        if (idStr == null || action == null) {
            req.setAttribute("error", "Invalid request.");
            req.getRequestDispatcher("/jsp/scholarshipHistory.jsp").forward(req, res);
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            if ("edit".equals(action)) {
                // Fetch application for edit form
                String sql = "SELECT id, fullname, email, document_path, submitted_at, scholarship_id FROM applications WHERE id = ?";
                try (Connection c = DBUtil.getConnection();
                     PreparedStatement p = c.prepareStatement(sql)) {
                    p.setInt(1, id);
                    ResultSet r = p.executeQuery();
                    if (r.next()) {
                        Application app = new Application();
                        app.setId(r.getInt("id"));
                        app.setFullname(r.getString("fullname"));
                        app.setEmail(r.getString("email"));
                        app.setDocumentPath(r.getString("document_path"));
                        app.setSubmittedAt(r.getTimestamp("submitted_at"));
                        app.setScholarshipId(r.getInt("scholarship_id"));
                        req.setAttribute("application", app);
                        req.getRequestDispatcher("/jsp/editApplication.jsp").forward(req, res);
                    } else {
                        req.setAttribute("error", "Application not found.");
                        req.getRequestDispatcher("/jsp/scholarshipHistory.jsp").forward(req, res);
                    }
                }
            } else if ("delete".equals(action)) {
                applicationDAO.delete(id);
                res.sendRedirect(req.getContextPath() + "/scholarship-history");
            } else {
                req.setAttribute("error", "Invalid action.");
                req.getRequestDispatcher("/jsp/scholarshipHistory.jsp").forward(req, res);
            }
        } catch (NumberFormatException | SQLException e) {
            req.setAttribute("error", "Error processing request: " + e.getMessage());
            req.getRequestDispatcher("/jsp/scholarshipHistory.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login");
            return;
        }

        String idStr = req.getParameter("id");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        Part filePart = req.getPart("document");

        if (idStr == null || fullname == null || email == null) {
            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("/jsp/editApplication.jsp").forward(req, res);
            return;
        }

        String fileName = null;
        InputStream fileInputStream = null;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = filePart.getSubmittedFileName();
            if (!fileName.toLowerCase().endsWith(".pdf")) {
                req.setAttribute("error", "Only PDF files are allowed.");
                req.getRequestDispatcher("/jsp/editApplication.jsp").forward(req, res);
                return;
            }
            fileInputStream = filePart.getInputStream();
        }

        try {
            int id = Integer.parseInt(idStr);
            Application application = new Application();
            application.setId(id);
            application.setFullname(fullname);
            application.setEmail(email);
            // Fetch existing document path
            String sql = "SELECT document_path FROM applications WHERE id = ?";
            try (Connection c = DBUtil.getConnection();
                 PreparedStatement p = c.prepareStatement(sql)) {
                p.setInt(1, id);
                ResultSet r = p.executeQuery();
                if (r.next()) {
                    application.setDocumentPath(r.getString("document_path"));
                }
            }
            applicationDAO.update(application, fileInputStream, fileName);
            res.sendRedirect(req.getContextPath() + "/scholarship-history");
        } catch (NumberFormatException | SQLException | IOException e) {
            req.setAttribute("error", "Error updating application: " + e.getMessage());
            req.getRequestDispatcher("/jsp/editApplication.jsp").forward(req, res);
        } finally {
            if (fileInputStream != null) {
                fileInputStream.close();
            }
        }
    }
}