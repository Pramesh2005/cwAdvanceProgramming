// src/servlet/ScholarshipServlet.java
package servlet;

import dao.ScholarshipDAO;
import model.Scholarship;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/scholarship")
public class ScholarshipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");
        ScholarshipDAO dao = new ScholarshipDAO();

        try {
            if ("new".equals(action)) {
                req.getRequestDispatcher("jsp/scholarship_form.jsp").forward(req, res);
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("sch", dao.findById(id));
                req.getRequestDispatcher("jsp/scholarship_form.jsp").forward(req, res);
            } else if ("delete".equals(action)) {
                dao.delete(Integer.parseInt(req.getParameter("id")));
                res.sendRedirect("scholarship");
            } else {
                List<Scholarship> list = dao.listAll();
                req.setAttribute("list", list);
                req.getRequestDispatcher("jsp/scholarship_list.jsp").forward(req, res);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            Scholarship s = new Scholarship();
            String id = req.getParameter("id");

            s.setTitle(req.getParameter("title"));
            s.setDescription(req.getParameter("description"));
            s.setEligibilityCriteria(req.getParameter("eligibility"));
            s.setAmount(Double.parseDouble(req.getParameter("amount")));
            s.setApplicationDeadline(Date.valueOf(req.getParameter("deadline")));

            User u = (User) req.getSession().getAttribute("user");
            s.setCreatedBy(u.getUserId());

            ScholarshipDAO dao = new ScholarshipDAO();
            if (id == null || id.isEmpty()) {
                dao.create(s);
            } else {
                s.setScholarshipId(Integer.parseInt(id));
                dao.update(s);
            }
            res.sendRedirect("scholarship");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
