/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Helper;
import com.tech.blog.helper.databaseconnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author lalit
 */
@MultipartConfig
public class editservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editservlet</title>");
            out.println("</head>");
            out.println("<body>");
            String username = request.getParameter("user_name");
            String useremail = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            Part part = request.getPart("user_profile");
            String imagename = part.getSubmittedFileName();

            //getUserfrom session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            //update the details of the user
            user.setEmail(useremail);
            user.setName(username);
            user.setPassword(password);
            String oldfile=user.getProfile();
            user.setProfile(imagename);
            user.setId(user.getId());
            //update database
            userdao Userdao = new userdao(databaseconnection.getConnection());
            boolean ans = Userdao.updateUser(user);
            if (ans) {
                out.println("updated");
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                 String oldprofilepath = request.getRealPath("/") + "pics" + File.separator + oldfile;
                Helper.deletefile(oldprofilepath);
                if (Helper.savefile(part.getInputStream(), path)) {
                    out.println("uploaded");
                    Message msg = new Message("Profile Updated succesfully", "success", "alert-danger");
                    s.setAttribute("msg", msg);
                } else {
                    out.println("file not updated successfully");
                    Message msg = new Message("Something went wrong ", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
            } else {
                out.println("not updated");
                Message msg = new Message("Something went wrong ", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
