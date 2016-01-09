package com.etc.pdca.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class DownloadAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1003193547248675249L;

	/**
	 * 下载的资源名
	 */
	private String resourceName;

	public String getResourceName() {
		try {
			resourceName = new String(resourceName.getBytes(),"iso8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public InputStream getTarget() {
		String dir = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload_files");
		try {
			resourceName = new String(resourceName.getBytes("iso8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		File inputFile = new File(dir + File.separator + resourceName);
		try {
			return new BufferedInputStream(new FileInputStream(inputFile));
		} catch (FileNotFoundException e) {
			System.out.println("文件下载失败！");
		}
		return null;
	}
	
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

}
