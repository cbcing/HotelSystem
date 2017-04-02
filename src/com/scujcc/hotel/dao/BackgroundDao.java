package com.scujcc.hotel.dao;

import com.scujcc.hotel.domain.DinnerTable;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by David on 16/11/28.
 */
public class BackgroundDao {
    public List getTbDesk(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List list = new ArrayList();
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "select * from tb_desk ORDER BY seating ASC";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()){
                    DinnerTable dinnerTable = new DinnerTable();
                    dinnerTable.setNum(rs.getString("num"));
                    dinnerTable.setSeating(rs.getInt("seating"));
                    list.add(dinnerTable);
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

    public void addDinnerTable(String id, int seating){
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "insert into tb_desk values(?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, id);
                ps.setInt(2, seating);
                int count = ps.executeUpdate();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void delDinnerTable(String id){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "delete from tb_desk where num = \'" + id + "\'";
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

    public void changeDinnerTable(String id, int seating){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "update tb_desk set seating = " + seating + " where num = \'" + id + "\'";
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
