package servlet;

import dao.ScholarshipDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login");
            return;
        }

        try {
            ScholarshipDAO dao = new ScholarshipDAO();
            int totalScholarships = dao.countScholarships();

            req.setAttribute("totalScholarships", totalScholarships);
            req.getRequestDispatcher("jsp/dashboard.jsp").forward(req, res);
        } catch (Exception e) {
            throw new ServletException("Error fetching dashboard data", e);
        }
    }
}
