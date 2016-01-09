package com.etc.pdca.dao;

import java.util.List;
import java.util.Map;

import com.etc.pdca.entity.Url;
import com.etc.pdca.entity.User;

public interface UserDao {
	User getUser(String username);
	User getUserByRealName(String name);
	List<User> getUserList();
	User findUser(Map<String, Object> map);
	List<User> getUserByRoleName(String name);
	void addUser(User user);
	void deleteUser(int id);
	void updateUser(User user);
	List<User> getUsersByCriteria(String condition);
	
	List<User> getUserByRoleNameANDdepId(Map<String, Object> map);
	User getUserById(int id);
	void changePsd(String username, String password);
	void changePsd(Map<String, Object> map);
	
}
