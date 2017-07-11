/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import connection.ConnectionProvider;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Users;

/**
 *
 * @author GHO$T
 */
public class LoginController {

    private final Connection con;

    public LoginController() {
        con = ConnectionProvider.getCon();
    }

    public boolean checkLogin(String un, String ps) {
        boolean status = false;
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from users where uname='" + un + "'");
            while (rs.next()) {
                String tpas = rs.getString("upass");
                if (tpas.equalsIgnoreCase(ps)) {
                    status = true;
                }
            }
            System.out.println(status);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public int changePassword(String un, String oldp, String newp) {
        int status = 0;
        try {
            if (checkLogin(un, oldp)) {
                Statement st = con.createStatement();
                status = st.executeUpdate("update users set upass='" + newp + "' where uname='" + un + "'");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public int changeUser(String un, String pas, String newn) {
        int status = 0;
        try {
            if (checkLogin(un, pas)) {
                Statement st = con.createStatement();
                status = st.executeUpdate("update users set uname='" + newn + "' where uname='" + un + "'");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

}
