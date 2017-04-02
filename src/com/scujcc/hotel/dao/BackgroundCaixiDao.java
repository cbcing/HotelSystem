package com.scujcc.hotel.dao;

import com.scujcc.hotel.domain.Caixi;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by David on 16/11/29.
 */
public class BackgroundCaixiDao {
    public List getTbSort(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List list = new ArrayList();

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "select * from tb_sort ORDER BY id ASC ";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()){
                    Caixi caixi = new Caixi();
                    caixi.setId(rs.getInt("id"));
                    caixi.setName(rs.getString("name"));
                    list.add(caixi);
                }

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void addCaixi(int id, String name){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "insert into tb_sort values(?,?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                ps.setString(2, name);
                int i = ps.executeUpdate();

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void delCaixi(int id){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "delete from tb_sort where id=" + id;
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void changeCaixi(int id, String name){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "UPDATE tb_sort set NAME=\'"+name+"\' WHERE id=" + id;
                ps = conn.prepareStatement(sql);
                int i = ps.executeUpdate();

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
