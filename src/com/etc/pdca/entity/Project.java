package com.etc.pdca.entity;

import java.util.Date;

/*
 * ��Ŀ
 */
public class Project {  
	private int id;              
	private String projectname;         
	private String description;        
	private Date startTime;             
	private User user;
	public Project() {
		super();
	}
	public Project(int id, String projectname, String description,
			Date startTime, User user) {
		super();
		this.id = id;
		this.projectname = projectname;
		this.description = description;
		this.startTime = startTime;
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Project [id=" + id + ", projectname=" + projectname
				+ ", description=" + description + ", startTime=" + startTime
				+ ", user=" + user + "]";
	} 
	
	
	

}
