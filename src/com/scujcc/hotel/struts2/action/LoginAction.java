package com.scujcc.hotel.struts2.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.scujcc.hotel.dao.LoginDao;
import com.scujcc.hotel.domain.User;

/**
 * Created by David on 16/12/1.
 */
public class LoginAction extends ActionSupport{

    @Override
    public String execute() throws Exception{
        Boolean flag = null;
        LoginDao dao = new LoginDao();
        ActionContext.getContext().getSession().put("flag", flag);
        User userHere = (User)ActionContext.getContext().getSession().get("user");
        String name = userHere.getName();
        String password = userHere.getPassword();
        flag = dao.login(name, password);
        if (flag){
            return SUCCESS;
        }else {
            return LOGIN;
        }
    }
}
