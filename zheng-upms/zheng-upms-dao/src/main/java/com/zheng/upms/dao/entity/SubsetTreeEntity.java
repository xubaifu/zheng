package com.zheng.upms.dao.entity;

import java.io.Serializable;

public class SubsetTreeEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String id;

	private String name;

	private String pid;

	private String bak;

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

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getBak() {
		return bak;
	}

	public void setBak(String bak) {
		this.bak = bak;
	}
}
