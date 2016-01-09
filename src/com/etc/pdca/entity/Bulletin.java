package com.etc.pdca.entity;

import java.util.Date;
/*
 * 
 * 
 */
public class Bulletin {
	
	private int id;     //动态ID
	private User user;
	private String content;		//动态信息
	private Date publishTime;	//发布时间
	public Bulletin() {
		super();
	}
	public Bulletin(int id, User user, String content, Date publishTime) {
		super();
		this.id = id;
		this.user = user;
		this.content = content;
		this.publishTime = publishTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public String toString() {
		return "Bulletin [id=" + id + ", user=" + user + ", content=" + content
				+ ", publishTime=" + publishTime + "]";
	}
	
	
	
	
	
}
