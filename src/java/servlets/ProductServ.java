/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import control.ProductController;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Product;

/**
 *
 * @author GHO$T
 */
@WebServlet(name = "ProductServ", urlPatterns = {"/prodcon"})
@MultipartConfig
public class ProductServ extends HttpServlet {

    private final static Logger LOGGER
            = Logger.getLogger(ProductServ.class.getCanonicalName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        boolean flag = true;
        int prodid = 0, check = 0;
        HttpSession session = request.getSession();
        String tempprodid = request.getParameter("prodId");
        if (tempprodid != null) {
            prodid = Integer.parseInt(tempprodid);
        }
        String name = request.getParameter("prodName");
        String desc = request.getParameter("prodDesc");
        int catid = Integer.parseInt(request.getParameter("catId"));
        String path = request.getParameter("fileType");
        Part filePart = request.getPart("prodFile");
        String thumb = request.getParameter("prodThumb");

        Product pro = new Product();
        pro.setCategoryId(catid);
        pro.setProductDesc(desc);
        pro.setProductFiletype(path);
        pro.setProductName(name);
        pro.setProductThumb(thumb);
        String fileName = name.replaceAll("[^a-zA-Z]+", "-");
        if (filePart.getSize() == 0) {
            fileName = request.getParameter("originalfn");
            check = 1;
        } else {
            String tempname = filePart.getSubmittedFileName();
            fileName = fileName + tempname.substring(tempname.lastIndexOf("."), tempname.length());
        }
        pro.setProductFile(fileName);
        OutputStream out = null;
        InputStream filecontent = null;
        final PrintWriter writer = response.getWriter();
        if (check == 0) {
            try {
                out = new FileOutputStream(new File(getPath() + File.separator + path + File.separator + fileName));
                filecontent = filePart.getInputStream();
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }
            } catch (FileNotFoundException fne) {
                flag = false;
                writer.println("You either did not specify a file to upload or are "
                        + "trying to upload a file to a protected or nonexistent "
                        + "location.");
                writer.println("<br/> ERROR: " + fne.getMessage());

                LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                        new Object[]{fne.getMessage()});
            } finally {
                if (flag) {
                    ProductController ob = new ProductController();
                    if (prodid == 0) {
                        int status = ob.saveProduct(pro);
                        if (status > 0) {
                            session.setAttribute("msg", "<label class='text-success'>Product Add Success</label>");
                        } else {
                            session.setAttribute("msg", "<label class='text-danger'>Product Add Failed/Two products cannot have same name</label>");
                        }
                    } else {
                        System.out.println("HERE");
                        // String query = "product_name = '" + pro.getProductName() + "', product_desc='" + pro.getProductDesc() + "', product_file='"+pro.getProductFile()+"', product_filetype='"+pro.getProductFiletype()+"', category_id="+pro.getCategoryId()+" where product_id="+prodid;
                        int status = ob.update(prodid, pro);
                        if (status > 0) {
                            session.setAttribute("msg", "<label class='text-success'>Product Update Success</label>");
                        } else {
                            session.setAttribute("msg", "<label class='text-danger'>Product Update Failed/Two products cannot have same name</label>");
                        }
                    }
                }
                response.setContentType("text/html;charset=UTF-8");
                response.sendRedirect("jsp/product/addProduct.jsp");

                if (out != null) {
                    out.close();
                }
                if (filecontent != null) {
                    filecontent.close();
                }
                if (writer != null) {
                    writer.close();
                }
            }
        } else if (check == 1) {
            if (flag) {
                ProductController ob = new ProductController();
                if (prodid == 0) {
                    int status = ob.saveProduct(pro);
                    if (status > 0) {
                        session.setAttribute("msg", "<label class='text-success'>Product Add Success</label>");
                    } else {
                        session.setAttribute("msg", "<label class='text-danger'>Product Add Failed/Two products cannot have same name</label>");
                    }
                } else {
                    System.out.println("HERE");
                    // String query = "product_name = '" + pro.getProductName() + "', product_desc='" + pro.getProductDesc() + "', product_file='"+pro.getProductFile()+"', product_filetype='"+pro.getProductFiletype()+"', category_id="+pro.getCategoryId()+" where product_id="+prodid;
                    int status = ob.update(prodid, pro);
                    if (status > 0) {
                        session.setAttribute("msg", "<label class='text-success'>Product Update Success</label>");
                    } else {
                        session.setAttribute("msg", "<label class='text-danger'>Product Update Failed/Two products cannot have same name</label>");
                    }
                }
            }
            response.setContentType("text/html;charset=UTF-8");
            response.sendRedirect("jsp/product/addProduct.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductServ.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductServ.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    private String getPath() throws UnsupportedEncodingException {
        String path = this.getClass().getClassLoader().getResource("").getPath();
        String fullPath = URLDecoder.decode(path, "UTF-8");
        String pathArr[] = fullPath.split("/WEB-INF/classes/");
        fullPath = pathArr[0];
        String reponsePath = "";
        // to read a file from webcontent
        reponsePath = new File(fullPath).getPath() + File.separatorChar;
        
        return /*getServletContext().getInitParameter("upload.location")*/reponsePath;
    }
}
