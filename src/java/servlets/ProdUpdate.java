/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import control.ProductController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author GHO$T
 */
public class ProdUpdate extends HttpServlet {

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
        response.sendRedirect("jsp/product/addProduct.jsp");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProdUpdate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProdUpdate at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        int prodid = 0;
        String tempprodid = request.getParameter("prodId");
        if (tempprodid != null) {
            prodid = Integer.parseInt(tempprodid);
        }
        String name = request.getParameter("prodName");
        String desc = request.getParameter("prodDesc");
        int catid = Integer.parseInt(request.getParameter("catId"));
        String fileType = request.getParameter("fileType");
        String path = request.getParameter("prodFile");
        String thumb = request.getParameter("prodThumb");

        ProductController ob = new ProductController();
        Product pro = new Product();
        pro.setCategoryId(catid);
        pro.setProductDesc(desc);
        pro.setProductFiletype(fileType);
        pro.setProductName(name);
        pro.setProductFile(path);
        pro.setProductThumb(thumb);
        if (prodid == 0) {
            int status = ob.saveProduct(pro);
            if (status > 0) {
                session.setAttribute("msg", "<label class='text-success'>Product Add Success</label>");
            } else {
                session.setAttribute("msg", "<label class='text-danger'>Product Add Failed</label>");
            }
        } else {
            int status = ob.update(prodid, pro);
            if (status > 0) {
                session.setAttribute("msg", "<label class='text-success'>Product Update Success</label>");
            } else {
                session.setAttribute("msg", "<label class='text-danger'>Product Update Failed</label>");
            }
        }
        processRequest(request, response);
    }

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
