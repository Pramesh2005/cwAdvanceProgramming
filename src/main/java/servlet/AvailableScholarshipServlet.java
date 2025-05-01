package servlet;

import dao.ScholarshipDAO;
import model.Scholarship;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/available-scholarships")
public class AvailableScholarshipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ScholarshipDAO scholarshipDAO = new ScholarshipDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            List<Scholarship> list = scholarshipDAO.findAll();
            req.setAttribute("list", list);
            req.getRequestDispatcher("/jsp/AvailableScholarship.jsp").forward(req, res);
        } catch (Exception e) {
            throw new ServletException("Error retrieving scholarships", e);
        }
    }
}