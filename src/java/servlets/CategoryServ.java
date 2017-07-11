/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import control.CategoryController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;

/**
 *
 * @author GHO$T
 */
public class CategoryServ extends HttpServlet {

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

        response.sendRedirect("jsp/category/addCategory.jsp");
        response.setContentType("text/html;charset=UTF-8");
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
        HttpSession session = request.getSession();
        String ids = request.getParameter("catId");
        int id = 0;
        if (ids != null) {
            id = Integer.parseInt(ids);
        }
        String name = request.getParameter("catName");
        String desc = request.getParameter("catDesc");
        Category category = new Category();
        category.setCategoryName(name);
        category.setCategoryDesc(desc);
        CategoryController ob = new CategoryController();
        if (id == 0) {
            int status = ob.saveCategory(category);
            if (status > 0) {
                session.setAttribute("msg", "<label class='text-success'>Add Success</label>");
            } else {
                session.setAttribute("msg", "<label class='text-danger'>Add Failed/Two categories cannot have same name.</label>");
            }
        } else {
            String query = "category_name = '" + name + "', category_desc='" + desc + "'";
            try {
                int status = ob.update(id, category);
                if (status > 0) {
                    session.setAttribute("msg", "<label class='text-success'>Update Success</label>");
                } else {
                    session.setAttribute("msg", "<label class='text-success'>Update Failed/Two categories cannot have same name.</label>");
                }
            } catch (SQLException ex) {
                Logger.getLogger(CategoryServ.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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
