package com.etc.pdca.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.junit.Test;

import com.etc.pdca.dao.DocumentDao;
import com.etc.pdca.entity.Document;
import com.etc.pdca.util.MybatisUtil;

public class TestDocument {
	private SqlSession sqlSession = MybatisUtil.openSession();
	private Transaction ts = new JdbcTransactionFactory()
			.newTransaction(sqlSession.getConnection());	
	private DocumentDao dao = sqlSession.getMapper(DocumentDao.class);
	
	@Test
	public void getDocument() {
		List<Document> documents = dao.getDocumentsByCriteria("发");
		for (Document document : documents) {
			System.out.println(document);
		}
	}
	
	@Test
	public void insertDocument() {
		Document document = new Document(0, "开路", "P");
		dao.addDocument(document);
		sqlSession.commit();
	}
	
	@Test
	public void deleteDocument() {
		int id = 4;
		dao.deleteDocument(id);
		sqlSession.commit();
	}
}
