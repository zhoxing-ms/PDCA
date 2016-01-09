package com.etc.pdca.entity;

/**
 * 文档（模板）实体
 * @author 陈敏
 *
 */
public class Document {
	private int id;
	private String docName;
	private String docType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getDocType() {
		return docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}

	public Document() {
		super();
	}

	public Document(int id, String docName, String docType) {
		super();
		this.id = id;
		this.docName = docName;
		this.docType = docType;
	}

	@Override
	public String toString() {
		return "Document [id=" + id + ", docName=" + docName + ", docType="
				+ docType + "]";
	}
}
