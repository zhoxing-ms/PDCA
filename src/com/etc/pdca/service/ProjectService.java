package com.etc.pdca.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import com.etc.pdca.dao.ProjectDao;
import com.etc.pdca.dao.UserDao;
import com.etc.pdca.entity.Project;
import com.etc.pdca.entity.User;
import com.etc.pdca.util.MybatisUtil;

public class ProjectService {
	private SqlSession sqlSession;
	private ProjectDao projectDao;
	
	public ProjectService(){
		sqlSession = MybatisUtil.openSession();
		projectDao = sqlSession.getMapper(ProjectDao.class);
	}
	public List<Project> getProjectList(int id){
		User user = new User();
		user.setId(id);
		List<Project> list = projectDao.getProjectList(user);
		 
		return list;
	}
	public void addProject(Project project){
		projectDao.addProject(project);
		sqlSession.commit();
		 
	}
	public Project getProjectByID(int id){
		Project project = projectDao.getProjectByID(id);
		 
		return project;
	}
	public List<Project> projectPage(int id,int startNum,int endNum){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return projectDao.projectPage(map);
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		sqlSession.close();
	}
}

