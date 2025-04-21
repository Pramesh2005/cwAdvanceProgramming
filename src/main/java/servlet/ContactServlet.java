// src/servlet/ContactServlet.java
package servlet;
import dao.ContactDAO; import model.ContactMessage;
import jakarta.servlet.ServletException; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/contact.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            ContactMessage m = new ContactMessage();
            m.setName(req.getParameter("name"));
            m.setEmail(req.getParameter("email"));
            m.setSubject(req.getParameter("subject"));
            m.setMessage(req.getParameter("message"));

            new ContactDAO().save(m);

            req.setAttribute("success", "Message sent!");
            req.getRequestDispatcher("/jsp/contact.jsp").forward(req, res);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
