/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import static connection.Provider.*;
import control.CategoryController;
import java.sql.Connection;
//import static connection.Provider.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.IPPool;

/**
 *
 * @author PC-040
 */
public class ConnectionProvider {

    private static Connection con = null;

    static {
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

    public static Connection getCon() {
        return con;
    }
    public int executeUpdate(String sql1){
        int rep=0;
        Connection conn=getCon();
         
        if(conn!=null){
            try{
                rep=conn.createStatement().executeUpdate(sql1);
            }catch(Exception e){
                rep=-1;
                System.out.println("DBConnection.class :: executeUpdate() :: sql1 : "+sql1+", Exception "+e);
            }finally{
                try{
                    if(conn!=null) conn.close();
                }catch(Exception ee){}
                conn=null;
            }
        }else{
            rep=-1;
            System.out.println("DBConnection.class :: executeUpdate() :: sql1 : "+sql1+", Failed to connect Database.");
        }
        return rep;
    }
    
    public List<String[]> executeQuery(String sql1,int limit){
        List<String[]> dataMap=new ArrayList<String[]>();
       Connection conn=getCon();
       
        if(conn!=null){
            try{
                sql1 +=" limit "+limit+";";
                System.out.println("sql "+sql1);
                Statement st=conn.createStatement();
                ResultSet rs=st.executeQuery(sql1);
                ResultSetMetaData rsMeta=rs.getMetaData();
                int colCnt=rsMeta.getColumnCount();
                System.out.println("colCnt "+colCnt);
                String[] rowData=null;
                while(rs.next()){
                    rowData=new String[colCnt];
                    for(int i=1;i<=colCnt;i++){
                        rowData[(i-1)]=rs.getString(i);
                        System.out.println("rowData["+(i-1)+"] :: "+rowData[(i-1)]);
                    }
                    dataMap.add(rowData);
                    rowData=null;
                }
                if(rs!=null) rs.close();
                rs=null;
                if(st!=null) st.close();
                st=null;
           }catch(Exception e){
               System.out.println(" sql="+sql1+", exception "+e);
                //logMsg(RLogger.MSG_TYPE_ERROR,RLogger.LOGGING_LEVEL_ERROR,"DBConnection.class :: executeQuery() :: sql1 : "+sql1+", Exception "+e);
                
           }finally{
                try{
                    if(conn!=null) conn.close();
                }catch(Exception ee){}
                conn=null;
            }
        }else{
            System.out.println(" amayavoda_wap :: executeQuery() :: sql1 : "+sql1+", Failed to connect Database.");
           // logMsg(RLogger.MSG_TYPE_ERROR,RLogger.LOGGING_LEVEL_ERROR,"DBConnection.class :: executeQuery() :: sql1 : "+sql1+", Failed to connect Database.");
        }
        
        return dataMap;
    }
    

}
