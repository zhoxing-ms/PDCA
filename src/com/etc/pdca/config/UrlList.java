package com.etc.pdca.config;

import java.util.List;

import com.etc.pdca.entity.Url;
import com.etc.pdca.entity.User;

public class UrlList {
	private User userHead;
	private List<Url> allUrlByProjectId ;
	
	public UrlList() {
		super();
	}
	public UrlList(User user, List<Url> urls) {
		super();
		this.userHead = user;
		this.allUrlByProjectId = urls;
	}
	public User getUser() {
		return userHead;
	}
	public void setUser(User user) {
		this.userHead = user;
	}
	public List<Url> getUrls() {
		return allUrlByProjectId;
	}
	public void setUrls(List<Url> urls) {
		this.allUrlByProjectId = urls;
	}
	@Override
	public String toString() {
		return "UrlList [urls=" + allUrlByProjectId + ", user=" + userHead + "]";
	}
	
}
