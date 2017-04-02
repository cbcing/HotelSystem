package com.scujcc.hotel.dao;

import com.scujcc.hotel.domain.DinnerTable;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by David on 16/12/1.
 */
public class FrontServerOrderDao {
    public List selectTable(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List list = new ArrayList();

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "select * from tb_desk";
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
}
