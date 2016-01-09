package com.etc.pdca.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.junit.Test;

import com.etc.pdca.dao.DepartmentDao;
import com.etc.pdca.entity.Department;
import com.etc.pdca.util.MybatisUtil;

public class TestDepartment {
	private SqlSession sqlSession = MybatisUtil.openSession();
	private Transaction ts = new JdbcTransactionFactory()
			.newTransaction(sqlSession.getConnection());
	
	@Test
	public void add() {
		DepartmentDao dao = sqlSession.getMapper(DepartmentDao.class);
		Department department = new Department();
		department.setDepartName("统战部");
		dao.addDepartment(department);
		sqlSession.commit();
	}
	
	@Test
	public void delete() {
	}
	
	@Test
	public void update() {
		DepartmentDao dao = sqlSession.getMapper(DepartmentDao.class);
		System.out.println(dao);
		Department department = new Department(1, "教育部", "负责教育工作");
		dao.updateDepartment(department);
		sqlSession.commit();
	}
	
	@Test
	public void getDepartments() {
		DepartmentDao dao = sqlSession.getMapper(DepartmentDao.class);
		System.out.println(dao);
		String name="人事";
		List<Department> departments = dao.getDepartmentsByCriteria(name);
		System.out.println(departments.size());
		for (Department department : departments) {
			System.out.println(department);
		}
	}
}
