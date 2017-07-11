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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Link;

/**
 *
 * @author GHO$T
 */
public class LinkController {
    private final Connection con;

    public LinkController() {
        this.con = ConnectionProvider.getCon();
    }
    
    public int addLink(String data)
    {
        int s = 0;
        try {
            PreparedStatement ps = con.prepareStatement("insert into link(link_data) values(?)");
            ps.setString(1, data);
            s = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return s;
    }
    
    public int updateLink(Link link)
    {
        int s = 0;
        try {
            PreparedStatement ps = con.prepareStatement("UPDATE link SET link_data=? WHERE idlink=?");
            ps.setString(1, link.getLinkData());
            ps.setInt(2, link.getIdlink());
            s = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return s;
    }
    
    public Link getLink()
    {
        Link temp=new Link();
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from link");
            System.out.print("--------------------------------------------");
           while (rs.next()) {
                temp.setIdlink(rs.getInt("idlink"));
                temp.setLinkData(rs.getString("link_data"));
                 
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return temp;
    }
}
