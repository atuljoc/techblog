package com.tech.blog.servlet;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.User;
import com.tech.blog.entities.Message;
import com.tech.blog.helper.databaseconnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String userEmail = request.getParameter("email");
            String userPass = request.getParameter("password");
            userdao dao = new userdao(databaseconnection.getConnection());
            User u = dao.getuserbynameandemail(userEmail, userPass);
            if (u == null) {
                // User does not exist
                Message msg = new Message("Invalid user", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
                response.sendRedirect("login_page.jsp");
            } else {
                // User exists
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", u); // Removed extra space
                response.sendRedirect("profile.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
