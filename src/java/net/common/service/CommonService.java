/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.common.service;

import connection.ConnectionProvider;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import java.util.List;

import model.IPPool;

import org.apache.commons.net.util.SubnetUtils;

/**
 *
 * @author SINHA
 */
public class CommonService {

    private final Connection con;

    public CommonService() {
        con = ConnectionProvider.getCon();
    }

    
    public IPPool findOperatorByIp(String ip) {
        IPPool ippool = null;
        try {

           
    List<IPPool>ipPoolList=findAllEnableIp();
            System.out.println("::::::::::ipPoolList::"+ipPoolList);
           for(IPPool ipp:ipPoolList){
               System.out.println("findOperatorByIp::ipp::::::::"+ipp.getIpAddress());
           }
            ippool = ipPoolList.stream().filter(p -> p != null
                    && p.getSubnetUtils() != null && p.getSubnetUtils().getInfo().
                    isInRange(ip)).findFirst().orElse(null);

            System.out.println("findOperatorByIp::ippool::"+ippool);
        } catch (Exception ex) {
            System.out.println("findOperatorByIp::ip:: " + ip + " ,ippool " + ippool + ":ex:" + ex);
            ippool = null;
        }
        return ippool;
    }

    public List<IPPool> findAllEnableIp(){
        List<IPPool> elist = new ArrayList<>();
        
        try{
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from tb_opgateway_ipseries WHERE status=1");
        System.out.println("findAllEnableIp::::::rs:"+rs);
        while (rs.next()) {
            IPPool e = new IPPool();
            e.setGwipId(rs.getInt("gwip_id"));
            e.setOpid(rs.getInt("op_id"));
            e.setIpAddress(rs.getString("ip_address"));
            e.setCircleId(rs.getLong("circle_id"));
            e.setDateOfCreation(Timestamp.valueOf(rs.getString("date_of_creation")));
            e.setLastUpdate(Timestamp.valueOf(rs.getString("last_update")));
            e.setStatus(rs.getBoolean("status"));
           SubnetUtils utils = new SubnetUtils(e.getIpAddress().replaceAll(" ", "").trim());
              //  SubnetUtils utils = new SubnetUtils(e.getIpAddress());
                        utils.setInclusiveHostCount(true);
                        e.setSubnetUtils(utils);
            elist.add(e);
               // System.out.println("findAllEnableIp::::::elist"+e.getIpAddress());
           //   System.out.println("findAllEnableIp::::::elist"+elist);
        }}catch(Exception ee){
            ee.printStackTrace();
       // System.out.println("findAllEnableIpee:::::::");
        }
        return elist;
    }
}



