// src/servlet/LoginServlet.java
package servlet;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String pw = req.getParameter("password");

        try {
            User u = new UserDAO().findByEmailPwd(email, pw);
            if (u != null) {
            	//Session implementation
                HttpSession s = req.getSession();
                s.setAttribute("user", u);
                s.setAttribute("first_name", u.getFirstName());
                s.setAttribute("last_name", u.getLastName());
                s.setAttribute("email", u.getEmail());
                if ("ADMIN".equalsIgnoreCase(u.getRole())) {
                    res.sendRedirect(req.getContextPath() + "/dashboard");
                } else {
                    res.sendRedirect(req.getContextPath() + "/jsp/home.jsp");
                }
            } else {
                req.setAttribute("error", "Invalid credentials");
                req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
