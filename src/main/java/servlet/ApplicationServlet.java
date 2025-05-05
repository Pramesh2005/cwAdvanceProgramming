package servlet;

import dao.ApplicationDAO;
import model.Application;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet("/application")
@MultipartConfig(maxFileSize = 2 * 1024 * 1024) // 2MB limit
public class ApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User u = (session != null) ? (User) session.getAttribute("user") : null;
        if (u == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        ApplicationDAO dao = new ApplicationDAO();
        try {
            if ("delete".equals(req.getParameter("action")) && !"admin".equals(u.getRole())) {
                dao.delete(Integer.parseInt(req.getParameter("id")));
            }
            List<Application> L;
            if ("admin".equals(u.getRole())) {
                L = dao.listAll();
            } else {
                L = dao.listByEmail(u.getEmail());
            }
            req.setAttribute("apps", L);
            req.setAttribute("isAdmin", "admin".equals(u.getRole()));
            req.getRequestDispatcher("/jsp/application_list.jsp").forward(req, res);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User u = (session != null) ? (User) session.getAttribute("user") : null;
        if (u == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String scholarshipIdStr = req.getParameter("scholarshipId");
        Part filePart = req.getPart("document");

        if (fullname == null || email == null || scholarshipIdStr == null || filePart == null || filePart.getSize() == 0) {
            req.setAttribute("error", "All fields and document are required.");
            req.getRequestDispatcher("/jsp/application_list.jsp").forward(req, res);
            return;
        }

        String fileName = filePart.getSubmittedFileName();
        if (!fileName.toLowerCase().endsWith(".pdf")) {
            req.setAttribute("error", "Only PDF files are allowed.");
            req.getRequestDispatcher("/jsp/application_list.jsp").forward(req, res);
            return;
        }

        try {
            int scholarshipId = Integer.parseInt(scholarshipIdStr);
            Application a = new Application();
            a.setFullname(fullname);
            a.setEmail(email);
            a.setScholarshipId(scholarshipId);

            try (InputStream fileInputStream = filePart.getInputStream()) {
                new ApplicationDAO().apply(a, fileInputStream, fileName);
            }
            res.sendRedirect(req.getContextPath() + "/application");
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid scholarship ID.");
            req.getRequestDispatcher("/jsp/application_list.jsp").forward(req, res);
        } catch (Exception e) {
            req.setAttribute("error", "Error submitting application: " + e.getMessage());
            req.getRequestDispatcher("/jsp/application_list.jsp").forward(req, res);
        }
    }
}