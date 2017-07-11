/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import connection.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author GHO$T
 */
public class ProductController {

    private final Connection con;

    public ProductController() {
        con = ConnectionProvider.getCon();
    }

    public int saveProduct(Product product) {
        int s = 0;
        try {
            PreparedStatement ps = con.prepareStatement("insert into product(product_name,"
                    + "product_desc,product_file,product_filetype,category_id,product_thumb) "
                    + "values(?,?,?,?,?,?)");
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getProductDesc());
            ps.setString(3, product.getProductFile());
            ps.setString(4, product.getProductFiletype());
            ps.setInt(5, product.getCategoryId());
            ps.setString(6, product.getProductThumb());
            s = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return s;
    }

    public Product getProductbyProductId(int proid) throws SQLException {
        Product e = new Product();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from product where product_id = " + proid);
        while (rs.next()) {
            e.setProductId(rs.getInt("product_id"));
            e.setCategoryId(rs.getInt("category_id"));
            e.setProductName(rs.getString("product_name"));
            e.setProductDesc(rs.getString("product_desc"));
            e.setProductFile(rs.getString("product_file"));
            e.setProductFiletype(rs.getString("product_filetype"));
            e.setProductThumb(rs.getString("product_thumb"));
            e.setProductId(proid);
        }
        return e;
    }

    public int update(int id, Product product) {
        int s = 0;
        try {
            PreparedStatement ps = con.prepareStatement("UPDATE product SET product_name=?, product_desc=?, product_file=?, product_filetype=?, category_id=?, product_thumb=? WHERE product_id=?");
            
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getProductDesc());
            ps.setString(3, product.getProductFile());
            ps.setString(4, product.getProductFiletype());
            ps.setInt(5, product.getCategoryId());
            ps.setString(6, product.getProductThumb());
            ps.setInt(7, id);
            s = ps.executeUpdate();
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return s;
    }

    public int delete(int id) throws SQLException {
        int s;
        Statement st = con.createStatement();
        s = st.executeUpdate("delete from product where product_id= " + id);
        return s;
    }

    public ArrayList<Product> getProductsbyCategory(int id) throws SQLException {
        ArrayList<Product> elist = new ArrayList<>();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from product where category_id= " + id);
        while (rs.next()) {
            Product e = new Product();
            e.setCategoryId(id);
            e.setProductDesc(rs.getString("product_desc"));
            e.setProductFile(rs.getString("product_file"));
            e.setProductFiletype(rs.getString("product_filetype"));
            e.setProductId(rs.getInt("product_id"));
            e.setProductName(rs.getString("product_name"));
            e.setProductThumb(rs.getString("product_thumb"));
            elist.add(e);
        }
        return elist;
    }

    public ArrayList<Product> getAllProducts() throws SQLException {
        ArrayList<Product> elist = new ArrayList<>();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from product");
        while (rs.next()) {
            Product e = new Product();
            e.setCategoryId(rs.getInt("category_id"));
            e.setProductDesc(rs.getString("product_desc"));
            e.setProductFile(rs.getString("product_file"));
            e.setProductFiletype(rs.getString("product_filetype"));
            e.setProductId(rs.getInt("product_id"));
            e.setProductName(rs.getString("product_name"));
            e.setProductThumb(rs.getString("product_thumb"));
            elist.add(e);
        }
        return elist;
    }
}
