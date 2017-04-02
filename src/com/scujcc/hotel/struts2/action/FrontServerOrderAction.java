package com.scujcc.hotel.struts2.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.scujcc.hotel.dao.BackgroundCaipinDao;
import com.scujcc.hotel.dao.FrontServerOrderDao;
import com.scujcc.hotel.domain.DinnerTable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by David on 16/12/1.
 */
public class FrontServerOrderAction extends ActionSupport {

    /*
    public Map getTable(){
        Map map = new HashMap();
        FrontServerOrderDao dao = new FrontServerOrderDao();
        List<DinnerTable> list = dao.selectTable();
        for (int i = 0; i < list.size(); i++){
            map.put(Integer.parseInt(list.get(i).getNum().trim()), list.get(i).getSeating());
        }
        return map;
    }
    */

    @Override
    public String execute() throws Exception{
        BackgroundCaipinDao dao = new BackgroundCaipinDao();
        List list = dao.getCaipin();
        ActionContext.getContext().getSession().put("showCaipin", list);
        return SUCCESS;
    }
}
