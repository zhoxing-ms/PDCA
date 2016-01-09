package com.etc.pdca.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.etc.pdca.dao.UserDao;
import com.etc.pdca.entity.Url;
import com.etc.pdca.entity.User;
import com.etc.pdca.util.MybatisUtil;

public class UserService {
	private SqlSession sqlSession;
	private UserDao userDao ;
	
	public UserService() {
		sqlSession = MybatisUtil.openSession();
		userDao = sqlSession.getMapper(UserDao.class);
	}
	public User getUser(String username){
		User user =userDao.getUser(username);;
		return user;
	}
	public User login(String username,String password){
		User user = new User();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("password", password);
		user = userDao.findUser(map);
		return user;	
	}
	public List<User> getUserList(){
		
		List<User> list = userDao.getUserList();
		return list;
	}
	public User getUserByRealName(String name){
		User user =userDao.getUserByRealName(name);
		return user;
	}
	public List<User> getUserByRoleName(String name){
		List<User> list = userDao.getUserByRoleName(name);
		return list;
	}
	
	/*public void addUser(User user) {
		userDao.addUser(user);
		sqlSession.commit();
	}*/
	
	public void addUser(User user) {
		String username = user.getUsername();
		if(this.getUser(username) != null) {
			return;
		}
		userDao.addUser(user);
		sqlSession.commit();
	}
	
	public void updateUser(User user) {
		userDao.updateUser(user);
		sqlSession.commit();
	}
	
	public void deleteUser(int id) {
		userDao.deleteUser(id);
		sqlSession.commit();
	}
	// my test
	public void changePsd(String username,String password){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("password", password);
		userDao.changePsd(map);
		sqlSession.commit();
		
	}
	public List<User> findUsersByCondition(String condition) {
		return userDao.getUsersByCriteria(condition);
	}
	public List<User> getUserByRoleNameANDdepId(String name1,String name2){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name1", name1);
		map.put("name2", name2);
		List<User> list = userDao.getUserByRoleNameANDdepId(map);
		return list;
	}
	public User getUserById(int id){
		User user = userDao.getUserById(id);
		return user;
	}
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		sqlSession.close();
	}

}
