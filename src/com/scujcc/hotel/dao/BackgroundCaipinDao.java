package com.scujcc.hotel.dao;

import com.scujcc.hotel.domain.Caipin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by David on 16/11/29.
 */
public class BackgroundCaipinDao {
    public List getCaipin(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List list = new ArrayList();

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "select * from tb_menu2";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()){
                    Caipin caipin = new Caipin();
                    caipin.setNum(rs.getString("num"));
                    caipin.setSort_id(rs.getInt("sort_id"));
                    caipin.setName(rs.getString("name"));
                    caipin.setCode(rs.getString("code"));
                    caipin.setUnit(rs.getString("unit"));
                    caipin.setUnit_price(rs.getInt("unit_price"));
                    list.add(caipin);
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

    public void addCaipin(Caipin caipin){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "insert into tb_menu2 values(?,?,?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, caipin.getNum());
                ps.setInt(2, caipin.getSort_id());
                ps.setString(3, caipin.getName());
                ps.setString(4, caipin.getCode());
                ps.setString(5, caipin.getUnit());
                ps.setInt(6, caipin.getUnit_price());
                int i = ps.executeUpdate();

                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void delCaipin(String num){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "delete from tb_menu2 where num=\'" + num + "\'";
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

    public void changeCaipin(Caipin caipin){
        Connection conn = null;
        PreparedStatement ps = null;

        String num = caipin.getNum().trim();
        String name = caipin.getName();
        String code = caipin.getCode();
        int sort_id = caipin.getSort_id();
        String unit = caipin.getUnit();
        int unit_price = caipin.getUnit_price();

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                //String sql = "update tb_menu2 set name=?, sort_id=?, code=?, unit=?, unit_price=? where num=?";
                String sql = "UPDATE tb_menu2 set name=\'"+name+"\',sort_id="+sort_id+",code=\'"+code+"\',unit=\'"+unit+"\',unit_price="+unit_price+" where num=\'"+num+"\'";
                /*String sql = "UPDATE tb_menu2 SET name=\'"+caipin.getName()+"\',sort_id="+caipin.getSort_id()+",code=\'" +
                        caipin.getCode()+"\',unit=\'"+caipin.getUnit()+"\',"+"unit_price="+caipin.getUnit_price()+" WHERE num=\'"+caipin.getName()+"\'"; */
                ps = conn.prepareStatement(sql);
                /*
                ps.setString(1, caipin.getName());
                ps.setInt(2, caipin.getSort_id());
                ps.setString(3, caipin.getCode());
                ps.setString(4, caipin.getUnit());
                ps.setInt(5, caipin.getUnit_price());
                ps.setString(6, caipin.getName().trim());
                */
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
