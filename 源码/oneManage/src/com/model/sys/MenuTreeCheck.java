package com.model.sys;

import java.util.List;

public class MenuTreeCheck {
	int id;
	int pid;
	String name;
	String open;
	Boolean checked;
	int sort;
	String isTop;
	String delFlag;
	List<MenuTreeCheck> children;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public Boolean getOpen() {
		if(open.equals("0")){
			return false;
		}else{
			return true;
		}
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getIsTop() {
		return isTop;
	}
	public void setIsTop(String isTop) {
		this.isTop = isTop;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public List<MenuTreeCheck> getChildren() {
		return children;
	}
	public void setChildren(List<MenuTreeCheck> children) {
		this.children = children;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getChecked() {
		/*if(checked.equals("0")){
			return false;
		}else{
			return true;
		}*/
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	
}
