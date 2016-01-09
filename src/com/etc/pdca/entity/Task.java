package com.etc.pdca.entity;

public class Task {  //任务类
	private int id;            
	private Project project;
	
	private User userUpper;        
	private User userLower; 
	
	public Task() {
		super();
	}
	

	public Task(int id, Project project, User userUpper, User userLower) {
		super();
		this.id = id;
		this.project = project;
		this.userUpper = userUpper;
		this.userLower = userLower;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getUserUpper() {
		return userUpper;
	}

	public void setUserUpper(User userUpper) {
		this.userUpper = userUpper;
	}

	public User getUserLower() {
		return userLower;
	}

	public void setUserLower(User userLower) {
		this.userLower = userLower;
	}

	public String toString() {
		return "Task [id=" + id + ", project=" + project + ", userUpper="
				+ userUpper + ", userLower=" + userLower + "]";
	}
	
	
	
}
