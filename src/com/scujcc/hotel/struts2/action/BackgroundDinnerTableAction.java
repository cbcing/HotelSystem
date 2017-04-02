package com.scujcc.hotel.struts2.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.scujcc.hotel.dao.BackgroundDao;
import com.scujcc.hotel.domain.DinnerTable;

import java.util.List;

/**
 * Created by David on 16/11/28.
 */
public class BackgroundDinnerTableAction extends ActionSupport {

    private String id;
    private String seating;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSeating() {
        return seating;
    }

    public void setSeating(String seating) {
        this.seating = seating;
    }

    @Override
    public String execute() throws Exception{
        BackgroundDao dao = new BackgroundDao();
        List list = dao.getTbDesk();
        ActionContext.getContext().getSession().put("tb_desk", list);
        return SUCCESS;
    }

    public String addDinnerTable() throws Exception{
        BackgroundDao dao = new BackgroundDao();
        int seatingHere = Integer.parseInt(seating.trim());
        dao.addDinnerTable(id, seatingHere);
        return SUCCESS;
    }

    public String delDinnerTable() throws Exception{
        BackgroundDao dao = new BackgroundDao();
        dao.delDinnerTable(id);
        return SUCCESS;
    }

    public String editDinnerTable() throws Exception{
        DinnerTable dinnerTable = new DinnerTable();
        dinnerTable.setNum(id);
        int seatingHere = Integer.parseInt(seating);
        dinnerTable.setSeating(seatingHere);
        ActionContext.getContext().getSession().put("dinner", dinnerTable);
        return SUCCESS;
    }

    public String changeDinnerTable() throws Exception{
        DinnerTable dinnerTable = (DinnerTable) ActionContext.getContext().getSession().get("dinner");
        String id = dinnerTable.getNum();
        int seatingHere = Integer.parseInt(seating.trim());
        BackgroundDao dao = new BackgroundDao();
        dao.changeDinnerTable(id, seatingHere);
        return SUCCESS;
    }
}
