package com.scujcc.hotel.struts2.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.scujcc.hotel.dao.LoginDao;
import com.scujcc.hotel.domain.User;

/**
 * Created by David on 16/11/30.
 */
public class CheckLoginAction extends ActionSupport {

    private String name;
    private String password;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String execute() throws Exception{
        User userForLogin = new User();
        userForLogin.setName(name);
        userForLogin.setPassword(password);
        ActionContext.getContext().getSession().put("user", userForLogin);
        return SUCCESS;
    }
}
