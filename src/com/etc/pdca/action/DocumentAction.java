package com.etc.pdca.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.pdca.entity.Document;
import com.etc.pdca.entity.Role;
import com.etc.pdca.service.DocumentService;
import com.etc.pdca.util.JsonUtil;
import com.opensymphony.xwork2.ActionSupport;

public class DocumentAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1413869927764253615L;

	private DocumentService documentService = new DocumentService();
	
	private Document document;
	
	private String condition;

	public Document getDocument() {
		return document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public DocumentAction() {
		super();
	}
	
	public void deleteDocument() {
		documentService.deleteDocument(document.getId());
		ServletContext servletContext = ServletActionContext
				.getServletContext();
		String dir = servletContext.getRealPath("/WEB-INF/upload_files/"
				+ document.getDocName());
		System.out.println(dir);
		File file = new File(dir);
		file.delete();
	}
	
	public void findDocumentsByCondition() {
		List<Document> documents = documentService.findDocumentsByCondition(condition);
		/*
		 * 使用JsonUtil将Documents集合转为json字符串
		 */
		String jsonStr = JsonUtil.toJson(documents);
		/*
		 * 获得response对象
		 */
		HttpServletResponse response = ServletActionContext.getResponse();
		/*
		 * 设置HTTP协议接受的内容类型及编码
		 */
		response.setContentType("text/html;charset=utf-8");
		/*
		 * 输出json字符串到前台
		 */
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.println(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String list() {
		return SUCCESS;
	}
}
