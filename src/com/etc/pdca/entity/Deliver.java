package com.etc.pdca.entity;

import java.util.Date;

public class Deliver {
	private int id;
	private String dispatcher;
	private String receiver;
	private String content;
	private Date publishTime;
	private Project projectId;
	
	public Deliver() {
		super();
	}

	public Deliver(int id, String dispatcher, String receiver, String content,
			Date publishTime, Project projectId) {
		super();
		this.id = id;
		this.dispatcher = dispatcher;
		this.receiver = receiver;
		this.content = content;
		this.publishTime = publishTime;
		this.projectId = projectId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDispatcher() {
		return dispatcher;
	}

	public void setDispatcher(String dispatcher) {
		this.dispatcher = dispatcher;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
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

	

	public Project getProjectId() {
		return projectId;
	}

	public void setProjectId(Project projectId) {
		this.projectId = projectId;
	}

	@Override
	public String toString() {
		return "Deliver [id=" + id + ", dispatcher=" + dispatcher
				+ ", receiver=" + receiver + ", content=" + content + ", publishTime="
				+ publishTime + ", projectId=" + projectId + "]";
	}
	
}
 