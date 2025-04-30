package servlet;

import dao.ContactDAO;
import model.ContactMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/contact-messages")
public class AdminContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            // Fetch all contact messages from the database
            List<ContactMessage> messages = contactDAO.findAll();
            // Set messages as a request attribute
            req.setAttribute("messages", messages);
            // Forward to the admin contact messages JSP
            req.getRequestDispatcher("/jsp/contact-messages.jsp").forward(req, res);
        } catch (Exception e) {
            throw new ServletException("Error retrieving contact messages", e);
        }
    }
}