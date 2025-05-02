package servlet;

import dao.ScholarshipDAO;
import dao.ApplicationDAO;
import model.Scholarship;
import model.User;
import model.Application;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/apply")
public class ApplyServlet extends HttpServlet {
    private ScholarshipDAO scholarshipDAO = new ScholarshipDAO();
    private ApplicationDAO applicationDAO = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login");
            return;
        }

        String scholarshipIdStr = req.getParameter("scholarshipId");
        if (scholarshipIdStr == null || scholarshipIdStr.isEmpty()) {
            res.sendRedirect("available-scholarships");
            return;
        }

        try {
            int scholarshipId = Integer.parseInt(scholarshipIdStr);
            Scholarship scholarship = scholarshipDAO.findById(scholarshipId);
            if (scholarship == null) {
                res.sendRedirect("available-scholarships");
                return;
            }

            req.setAttribute("scholarship", scholarship);
            req.getRequestDispatcher("/jsp/applyScholarship.jsp").forward(req, res);
        } catch (NumberFormatException e) {
            res.sendRedirect("available-scholarships");
        } catch (SQLException e) {
            throw new ServletException("Error retrieving scholarship", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String scholarshipIdStr = req.getParameter("scholarshipId");
        String remarks = req.getParameter("remarks");

        if (scholarshipIdStr == null || remarks == null || remarks.trim().isEmpty()) {
            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("/jsp/applyScholarship.jsp").forward(req, res);
            return;
        }

        try {
            int scholarshipId = Integer.parseInt(scholarshipIdStr);
            Application application = new Application();
            application.setUserId(user.getUserId());
            application.setScholarshipId(scholarshipId);
            application.setRemarks(remarks);

            applicationDAO.apply(application);
            req.setAttribute("success", "Application submitted successfully!");
            res.sendRedirect("available-scholarships");
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid scholarship ID.");
            req.getRequestDispatcher("/jsp/applyScholarship.jsp").forward(req, res);
        } catch (SQLException e) {
            req.setAttribute("error", "Error submitting application: " + e.getMessage());
            req.getRequestDispatcher("/jsp/applyScholarship.jsp").forward(req, res);
        }
    }
}