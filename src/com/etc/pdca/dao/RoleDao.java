package com.etc.pdca.dao;

import java.util.List;

import com.etc.pdca.entity.Role;

public interface RoleDao {
	List<Role> selectRole(); 
	void addRole(Role role);
	void deleteRole(int id);
	void updateRole(Role role);
	List<Role> getRolesByCriteria(String condition);
}
