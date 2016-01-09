package com.etc.pdca.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.pdca.dao.RoleDao;
import com.etc.pdca.entity.Role;
import com.etc.pdca.util.MybatisUtil;

public class RoleService {
	private SqlSession sqlSession;
	private RoleDao roleDao;
	
	public RoleService() {
		sqlSession = MybatisUtil.openSession();
		this.roleDao = sqlSession.getMapper(RoleDao.class);
	}
	public List<Role> selectRole(){
		List<Role> list = roleDao.selectRole();
		 
		return list;
	}
	public void addRole(Role role) {
		roleDao.addRole(role);
		sqlSession.commit();
		 
	}
	
	public void updateRole(Role Role) {
		roleDao.updateRole(Role);
		sqlSession.commit();
		 
	}
	
	public void deleteRole(int id) {
		roleDao.deleteRole(id);
		sqlSession.commit();
		 
	}
	
	public List<Role> findRolesByCondition(String condition) {
		List<Role> roles = roleDao.getRolesByCriteria(condition);
		 
		return roles;
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		sqlSession.close();
	}
}
