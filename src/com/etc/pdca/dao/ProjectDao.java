package com.etc.pdca.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.etc.pdca.entity.Project;
import com.etc.pdca.entity.User;

public interface ProjectDao {
	public List<Project> getProjectList(User user);
	public void addProject(Project project);
	public Project getProjectByID(int id);
	public List<Project> projectPage(Map<String,Object> map);
}
