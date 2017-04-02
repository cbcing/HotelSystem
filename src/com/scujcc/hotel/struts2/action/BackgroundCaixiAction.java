package com.scujcc.hotel.struts2.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.scujcc.hotel.dao.BackgroundCaixiDao;
import com.scujcc.hotel.domain.Caixi;

import java.util.List;

/**
 * Created by David on 16/11/29.
 */
public class BackgroundCaixiAction extends ActionSupport {
    private String id;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception{
        BackgroundCaixiDao dao = new BackgroundCaixiDao();
        List list = dao.getTbSort();
        ActionContext.getContext().getSession().put("tb_sort", list);
        return SUCCESS;
    }

    public String addCaixi() throws Exception{
        int idHere = Integer.parseInt(id.trim());
        BackgroundCaixiDao dao = new BackgroundCaixiDao();
        dao.addCaixi(idHere, name);
        return SUCCESS;
    }

    public String delCaixi() throws Exception{
        BackgroundCaixiDao dao = new BackgroundCaixiDao();
        int idHere = Integer.parseInt(id.trim());
        dao.delCaixi(idHere);
        return SUCCESS;
    }

    public String editCaixi() throws Exception{
        Caixi caixi = new Caixi();
        System.out.println(id + " " + name + "haha");
        int idHere = Integer.parseInt(id.trim());
        caixi.setId(idHere);
        caixi.setName(name);
        ActionContext.getContext().getSession().put("sort", caixi);

        return SUCCESS;
    }

    public String changeCaixi() throws Exception{
        Caixi caixi = (Caixi) ActionContext.getContext().getSession().get("sort");
        int id = caixi.getId();
        BackgroundCaixiDao dao = new BackgroundCaixiDao();
        dao.changeCaixi(id, name);
        return SUCCESS;
    }
}
