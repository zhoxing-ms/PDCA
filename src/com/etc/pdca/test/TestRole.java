package com.etc.pdca.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.junit.Test;

import com.etc.pdca.dao.RoleDao;
import com.etc.pdca.entity.Role;
import com.etc.pdca.util.MybatisUtil;

public class TestRole {
	private SqlSession sqlSession = MybatisUtil.openSession();
	private Transaction ts = new JdbcTransactionFactory()
			.newTransaction(sqlSession.getConnection());
	private RoleDao dao = sqlSession.getMapper(RoleDao.class);
	
	@Test
	public void getRole() {
		List<Role> roles = dao.selectRole();
		for (Role role : roles) {
			System.out.println(role);
		}
	}
	
	@Test
	public void addRole() {
		Role role = new Role(5, "省长", 8);
		dao.addRole(role);
		sqlSession.commit();
	}
	
	@Test
	public void deleteRole() {
		int id = 6;
		dao.deleteRole(id);
		sqlSession.commit();
	}
	
	@Test
	public void update() {
		Role role = new Role(8, "省长111", 8);
		dao.updateRole(role);
		sqlSession.commit();
	}
	
	@Test
	public void getRoleByCondition() {
		String condition = "";
		List<Role> roles = dao.getRolesByCriteria(condition);
		for (Role role : roles) {
			System.out.println(role);
		}
	}
}	
