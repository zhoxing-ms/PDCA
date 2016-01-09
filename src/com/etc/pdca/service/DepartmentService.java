package com.etc.pdca.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.pdca.dao.DepartmentDao;
import com.etc.pdca.entity.Department;
import com.etc.pdca.util.MybatisUtil;

public class DepartmentService {
	private SqlSession sqlSession;
	private DepartmentDao departmentDao;
	
	public DepartmentService() {
		sqlSession = MybatisUtil.openSession();
		departmentDao = sqlSession.getMapper(DepartmentDao.class);
	}
	
	public void addDepartment(Department department) {
		departmentDao.addDepartment(department);
		sqlSession.commit();
		 
	}
	
	public void updateDepartment(Department department) {
		departmentDao.updateDepartment(department);
		sqlSession.commit();
	}
	
	public void deleteDepartment(int id) {
		departmentDao.deleteDepartment(id);
		sqlSession.commit();
	}
	
	public List<Department> findDepartmentsByCondition(String condition) {
		return departmentDao.getDepartmentsByCriteria(condition);
	}
	public List<Department> selectDepartment(){
		 List<Department> list = departmentDao.selectDepartment();
		return list;
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		sqlSession.close();
	}
}
