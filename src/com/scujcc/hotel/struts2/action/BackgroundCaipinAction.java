package com.scujcc.hotel.struts2.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.scujcc.hotel.dao.BackgroundCaipinDao;
import com.scujcc.hotel.domain.Caipin;

import java.util.List;

/**
 * Created by David on 16/11/29.
 */
public class BackgroundCaipinAction extends ActionSupport {
    private String num;
    private String sort_id; //int
    private String name;
    private String code;
    private String unit;
    private String unit_price; //int

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSort_id() {
        return sort_id;
    }

    public void setSort_id(String sort_id) {
        this.sort_id = sort_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(String unit_price) {
        this.unit_price = unit_price;
    }

    @Override
    public String execute() throws Exception{
        BackgroundCaipinDao dao = new BackgroundCaipinDao();
        List list = dao.getCaipin();
        ActionContext.getContext().getSession().put("menu", list);
        return SUCCESS;
    }

    public String addCaipin() throws Exception{
        Caipin caipin = new Caipin();
        caipin.setNum(num);
        caipin.setSort_id(Integer.parseInt(sort_id.trim()));
        caipin.setName(name);
        caipin.setCode(code);
        caipin.setUnit(unit);
        caipin.setUnit_price(Integer.parseInt(unit_price.trim()));
        BackgroundCaipinDao dao = new BackgroundCaipinDao();
        dao.addCaipin(caipin);

        return SUCCESS;
    }

    public String delCaipin() throws Exception{
        BackgroundCaipinDao dao = new BackgroundCaipinDao();
        dao.delCaipin(num);
        return SUCCESS;
    }

    public String editCaipin() throws Exception{
        Caipin caipin = new Caipin();
        caipin.setNum(num);
        caipin.setSort_id(Integer.parseInt(sort_id.trim()));
        caipin.setName(name);
        caipin.setCode(code);
        caipin.setUnit(unit);
        caipin.setUnit_price(Integer.parseInt(unit_price.trim()));
        ActionContext.getContext().getSession().put("caipin", caipin);
        return SUCCESS;
    }

    public String changeCaipin() throws Exception{
        Caipin caipinFromSession = (Caipin) ActionContext.getContext().getSession().get("caipin");
        String num = caipinFromSession.getNum();
        Caipin caipin = new Caipin();
        caipin.setNum(num);
        caipin.setSort_id(Integer.parseInt(sort_id.trim()));
        caipin.setName(name);
        caipin.setCode(code);
        caipin.setUnit(unit);
        caipin.setUnit_price(Integer.parseInt(unit_price.trim()));

        BackgroundCaipinDao dao = new BackgroundCaipinDao();
        dao.changeCaipin(caipin);

        return SUCCESS;
    }
}
