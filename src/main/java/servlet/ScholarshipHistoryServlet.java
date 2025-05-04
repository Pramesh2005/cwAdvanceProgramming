package servlet;

import dao.ApplicationDAO;
import model.Application;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/scholarship-history")
public class ScholarshipHistoryServlet extends HttpServlet {
    private ApplicationDAO applicationDAO;

    @Override
    public void init() throws ServletException {
        applicationDAO = new ApplicationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            res.sendRedirect("login");
            return;
        }

        String email = (String) session.getAttribute("email");
        try {
            List<Application> applications = applicationDAO.listByEmail(email);
            req.setAttribute("applications", applications);
            req.getRequestDispatcher("/jsp/scholarshipHistory.jsp").forward(req, res);
        } catch (SQLException e) {
            req.setAttribute("error", "Error retrieving application history: " + e.getMessage());
            req.getRequestDispatcher("/jsp/scholarshipHistory.jsp").forward(req, res);
        }
    }
}