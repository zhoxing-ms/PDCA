package com.etc.pdca.dao;

import java.util.List;

import com.etc.pdca.entity.Document;

public interface DocumentDao {
	void addDocument(Document document);
	void deleteDocument(int id);
	List<Document> getDocumentsByCriteria(String condition);
	List<Document> getDocumentByType(String docType);
}
