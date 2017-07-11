/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import control.LoginController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GHO$T
 */
public class LoginServ extends HttpServlet {

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
            out.println("<title>Servlet LoginServ</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServ at " + request.getContextPath() + "</h1>");
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
        
        HttpSession session = request.getSession();
        String un = request.getParameter("un");
        String ps = request.getParameter("ps");
        LoginController lnc = new LoginController();
        int reqtype = Integer.parseInt(request.getParameter("rt"));
        switch (reqtype) {
            case 1:
                if (lnc.checkLogin(un, ps)) {
                    session.setAttribute("uname",un);
                    response.sendRedirect("admnpnl.jsp");
                    
                } else {
                    session.setAttribute("msg", "<label class='text-danger'>User name/Password is incorrect</label>");
                    response.sendRedirect("login.jsp");
                }
                break;
            case 2:
                String nps = request.getParameter("nps");
                String npsc = request.getParameter("npsc");
                if (nps.equals(npsc)) {
                    if (lnc.changePassword(un, ps, nps) > 0) {
                        session.setAttribute("msg", "<label class='text-success'>Password Changed Successfully</label>");
                    } else {
                        session.setAttribute("msg", "<label class='text-danger'>Old Password is incorrect</label>");
                    }

                } else {
                    session.setAttribute("msg", "<label class='text-danger'>New Password and Confirm Password are different</label>");
                }
                response.sendRedirect("jsp/admin/cdetail.jsp");
                break;
            case 3:
                String nun = request.getParameter("nun");
                if (lnc.changeUser(un, ps, nun) > 0) {
                    session.setAttribute("uname", nun);
                    session.setAttribute("msg", "<label class='text-success'>Username Changed Successfully</label>");
                } else {
                    session.setAttribute("msg", "<label class='text-danger'>Old Password is incorrect</label>");
                }
                response.sendRedirect("jsp/admin/cdetail.jsp");
                break;
            default:
                break;
        }

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
