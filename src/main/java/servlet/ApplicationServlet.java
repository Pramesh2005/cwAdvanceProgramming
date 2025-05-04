// src/servlet/ApplicationServlet.java
package servlet;
import dao.ApplicationDAO; 
import model.Application; 
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.*; 
import java.io.IOException;
import java.util.List;
@WebServlet("/application")
public class ApplicationServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    User u = (session != null) ? (User)session.getAttribute("user") : null;
    if (u == null) { res.sendRedirect(req.getContextPath() + "/login"); return; }
    ApplicationDAO dao = new ApplicationDAO();
    try {
      if ("delete".equals(req.getParameter("action"))) {
        dao.delete(Integer.parseInt(req.getParameter("id")));
      }
      List<Application> L = dao.listByEmail(u.getEmail());
      req.setAttribute("apps", L);
      req.getRequestDispatcher("/jsp/application_list.jsp").forward(req, res);
    } catch (Exception e) { throw new ServletException(e); }
  }
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    HttpSession session = req.getSession(false);
    User u = (session != null) ? (User)session.getAttribute("user") : null;
    if (u == null) { res.sendRedirect(req.getContextPath() + "/login"); return; }
    try {
      Application a = new Application();
      a.setId(u.getUserId());
      a.setScholarshipId(Integer.parseInt(req.getParameter("scholarshipId")));

      new ApplicationDAO().apply(a);
      res.sendRedirect(req.getContextPath() + "/application");
    } catch (Exception e) { throw new ServletException(e); }
  }
}
