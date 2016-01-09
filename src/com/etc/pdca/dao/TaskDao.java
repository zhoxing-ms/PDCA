package com.etc.pdca.dao;

import java.util.List;
import java.util.Map;

import com.etc.pdca.entity.Task;

public interface TaskDao {
	public List<Task> getTask(Task task);
	
	public Task getTaskBy2Id(Task task);
	public Task getTaskBy1Id(int id);
	public void addTask(Map<String, Object> map);
	public int getTaskCount(Task task);
	public List<Task> getTaskByUserId(int lowerId);
	public List<Task> getTask(int id);
	public void updateTask(Task task);
	public void updateTaskByUserLower(Task task);
	public List<Task> getTaskByProjectId(int id);
	public List<Task> getUrlUpper(Map<String, Object> map);
}
