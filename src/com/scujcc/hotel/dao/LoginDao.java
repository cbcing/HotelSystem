package com.scujcc.hotel.dao;

import com.opensymphony.xwork2.ActionContext;

import java.sql.*;

/**
 * Created by David on 16/12/1.
 */
public class LoginDao {
    public boolean login(String name, String password){
        boolean flag = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            try {
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.56.123:1521/orcl", "david", "cbc903205927");
                String sql = "select * from tb_user where name=\'"+name+"\' and password=\'"+password+"\'";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()){
                    flag = true;
                }else {
                    String error = "账户或密码错误！";
                    ActionContext.getContext().getSession().put("loginError", error);
                }
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return flag;
    }
}
