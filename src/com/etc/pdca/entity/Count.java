package com.etc.pdca.entity;

import java.util.List;

public class Count {
	private int p;
	private int d;
	private int c;
	private int a;
	private Url url;
	private String advance;
	private List<Url> urlList;
	public List<Url> getUrlList() {
		return urlList;
	}
	public void setUrlList(List<Url> urlList) {
		this.urlList = urlList;
	}
	public String getAdvance() {
		return advance;
	}
	public void setAdvance(String advance) {
		this.advance = advance;
	}
	private Project project;
	
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public Count() {
		super();
	}
	
	public Count(int p, int d, int c, int a, Url url, String advance,
			List<Url> urlList, Project project) {
		super();
		this.p = p;
		this.d = d;
		this.c = c;
		this.a = a;
		this.url = url;
		this.advance = advance;
		this.urlList = urlList;
		this.project = project;
	}
	public int getP() {
		return p;
	}
	public void setP(int p) {
		this.p = p;
	}
	public int getD() {
		return d;
	}
	public void setD(int d) {
		this.d = d;
	}
	public int getC() {
		return c;
	}
	public void setC(int c) {
		this.c = c;
	}
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	public Url getUrl() {
		return url;
	}
	public void setUrl(Url url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "Count [p=" + p + ", d=" + d + ", c=" + c + ", a=" + a
				+ ", url=" + url + ", advance=" + advance + ", urlList="
				+ urlList + ", project=" + project + "]";
	}
	
	

}
