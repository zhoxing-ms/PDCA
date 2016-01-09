package com.etc.pdca.entity;

import java.util.Date;

public class Url {
	private int id;
	private String urlType;
	private String docUrl;
	private String states;
	private String checkstates;
	private String advance;
	private int num;
	private Date subtime;
	private Date endtime;
	private Task task;
	private Url url1;
	private String urlstates;
	
	
	public Url() {
		super();
	}



	public Url(int id, String urlType, String docUrl, String states,
			String checkstates, String advance, int num, Date subtime,
			Date endtime, Task task, Url url1,String urlstates) {
		super();
		this.id = id;
		this.urlType = urlType;
		this.docUrl = docUrl;
		this.states = states;
		this.checkstates = checkstates;
		this.advance = advance;
		this.num = num;
		this.subtime = subtime;
		this.endtime = endtime;
		this.task = task;
		this.url1 = url1;
		this.urlstates = urlstates;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getUrlType() {
		return urlType;
	}



	public void setUrlType(String urlType) {
		this.urlType = urlType;
	}



	public String getDocUrl() {
		return docUrl;
	}



	public void setDocUrl(String docUrl) {
		this.docUrl = docUrl;
	}



	public String getStates() {
		return states;
	}



	public void setStates(String states) {
		this.states = states;
	}



	public String getCheckstates() {
		return checkstates;
	}



	public void setCheckstates(String checkstates) {
		this.checkstates = checkstates;
	}



	public String getAdvance() {
		return advance;
	}



	public void setAdvance(String advance) {
		this.advance = advance;
	}



	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}



	public Date getSubtime() {
		return subtime;
	}



	public void setSubtime(Date subtime) {
		this.subtime = subtime;
	}



	public Date getEndtime() {
		return endtime;
	}



	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}



	public Task getTask() {
		return task;
	}



	public void setTask(Task task) {
		this.task = task;
	}



	public Url getUrl1() {
		return url1;
	}



	public void setUrl1(Url url1) {
		this.url1 = url1;
	}
	


	public String getUrlstates() {
		return urlstates;
	}



	public void setUrlstates(String urlstates) {
		this.urlstates = urlstates;
	}



	@Override
	public String toString() {
		return "Url [id=" + id + ", urlType=" + urlType + ", docUrl=" + docUrl
				+ ", states=" + states + ", checkstates=" + checkstates
				+ ", advance=" + advance + ", num=" + num + ", subtime="
				+ subtime + ", endtime=" + endtime + ", task=" + task
				+ ", url1=" + url1 + ", urlstates=" + urlstates + "]";
	}
	

}
