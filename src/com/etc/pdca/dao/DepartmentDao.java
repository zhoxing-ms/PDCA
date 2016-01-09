package com.etc.pdca.dao;

import java.util.List;

import com.etc.pdca.entity.Department;

public interface DepartmentDao {
	void addDepartment(Department name);
	void deleteDepartment(int id);
	void updateDepartment(Department department);
	List<Department> getDepartmentsByCriteria(String condition);
	List<Department> selectDepartment();
}
