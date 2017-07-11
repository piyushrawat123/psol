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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author GHO$T
 */
public class CategoryController 
{
    private final Connection con;
    public CategoryController() 
    {
        con = ConnectionProvider.getCon();
    }    
    public int saveCategory(Category product)
    {
      int s = 0;
        try {
            PreparedStatement ps = con.prepareStatement("insert into category(category_name,category_desc) values(?,?)");
            ps.setString(1, product.getCategoryName());
            ps.setString(2, product.getCategoryDesc());
            s = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return s;
    }
    public ArrayList<Category> getCategories()
    {
         ArrayList<Category> elist = new ArrayList<>();           
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from category");
            while (rs.next()) {
                Category e = new Category();
                e.setCategoryId(rs.getInt("category_id"));
                e.setCategoryName(rs.getString("category_name"));
                e.setCategoryDesc(rs.getString("category_desc"));
                elist.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return elist;
    }
    public int update(int id, Category cat) throws SQLException
    {
        int s = 0;
        try {
            PreparedStatement ps = con.prepareStatement("UPDATE category SET category_name=?, category_desc=? WHERE category_id=?");
            ps.setString(1, cat.getCategoryName());
            ps.setString(2, cat.getCategoryDesc());
            ps.setInt(3, id);
            s = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return s;
    }  
    public int delete(int id) throws SQLException
    {
        int s;
        Statement st = con.createStatement();
        s = st.executeUpdate("delete from category where category_id='" + id + "'");
        return s;
    }

    public Category getCategory(int id) {
    {
         Category e = new Category();       
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from category where category_id="+id);
            while (rs.next()) {               
                e.setCategoryId(rs.getInt("category_id"));
                e.setCategoryName(rs.getString("category_name"));
                e.setCategoryDesc(rs.getString("category_desc"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }
    }
}
