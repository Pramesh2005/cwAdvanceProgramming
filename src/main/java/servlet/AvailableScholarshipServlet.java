package servlet;

import dao.ScholarshipDAO;
import model.Scholarship;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/available-scholarships")
public class AvailableScholarshipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ScholarshipDAO scholarshipDAO;

    @Override
    public void init() throws ServletException {
        scholarshipDAO = new ScholarshipDAO();
        System.out.println("AvailableScholarshipServlet initialized");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            System.out.println("Fetching scholarships...");
            String keyword = req.getParameter("keyword");
            List<Scholarship> list;
            if (keyword != null && !keyword.trim().isEmpty()) {
                list = scholarshipDAO.searchByTitle(keyword);
            } else {
                list = scholarshipDAO.listAll();
            }
            System.out.println("Scholarships retrieved: " + list.size());
            req.setAttribute("list", list);
            req.getRequestDispatcher("/jsp/AvailableScholarship.jsp").forward(req, res);
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "Database error: " + e.getMessage());
            req.getRequestDispatcher("/jsp/AvailableScholarship.jsp").forward(req, res);
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "Unexpected error: " + e.getMessage());
            req.getRequestDispatcher("/jsp/AvailableScholarship.jsp").forward(req, res);
        }
    }
}