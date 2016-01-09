package com.etc.pdca.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.pdca.dao.DocumentDao;
import com.etc.pdca.entity.Document;
import com.etc.pdca.entity.Role;
import com.etc.pdca.util.MybatisUtil;

public class DocumentService {
	private SqlSession sqlSession;
	private DocumentDao documentDao;
	
	public DocumentService() {
		sqlSession = MybatisUtil.openSession();
		this.documentDao = sqlSession.getMapper(DocumentDao.class);
	}
	
	public void addDocument(Document document) {
		documentDao.addDocument(document);
		sqlSession.commit();
	}
	
	public void deleteDocument(int id) {
		documentDao.deleteDocument(id);
		sqlSession.commit();
	}
	
	public List<Document> findDocumentsByCondition(String condition) {
		List<Document> documents = documentDao.getDocumentsByCriteria(condition);
		return documents;
	}
	
	public List<Document> getDocumentByType(String docType){
		List<Document> documents = documentDao.getDocumentByType(docType);
		return documents;
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		sqlSession.close();
	}
}
