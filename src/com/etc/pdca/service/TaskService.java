package com.etc.pdca.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.etc.pdca.dao.TaskDao;
import com.etc.pdca.entity.Count;
import com.etc.pdca.entity.Task;
import com.etc.pdca.entity.Url;
import com.etc.pdca.util.MybatisUtil;

public class TaskService {
	private TaskDao taskDao;
	private SqlSession sqlSession;
	public TaskService(){
		sqlSession = MybatisUtil.openSession();
		this.taskDao = sqlSession.getMapper(TaskDao.class);
	}
	
	//upper lower
	public List<Task> getTaskInfo(int id){
		
		List<Task> list = taskDao.getTaskByProjectId(id);
		return list;
	}

	public List<Task> getTask(Task task){
		List<Task> list = taskDao.getTask(task);
		 
		return list;
	}
	public Task getTaskBy1Id(int id){
		Task task = taskDao.getTaskBy1Id(id);
		 
		return task;
	}
	public Task getTaskBy2Id(Task task){
		Task task1 = taskDao.getTaskBy2Id(task);
		 
		return task1;
	}
	public void addTask(int projectId,int userId1,int userId2){
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("projectId", projectId);
		map.put("userId1", userId1);
		map.put("userId2", userId2);
		taskDao.addTask(map);
		sqlSession.commit();
		 
	}
	/*public Count getCount(List<Task> list){
		
		int size  = list.size();
		int s1=0;
		int s2=0;
		int s3=0;
		int s4=0;
		for(int i = 0;i<size;i++){
			Task task = list.get(i);
			if(("完成").equals(task.getpStates()))  {s1++;}
			if(("完成").equals(task.getdStates()))  {s2++;}
			if(("完成").equals(task.getcStates()))  {s3++;}
			if(("完成").equals(task.getaStates()))  {s4++;}
		}
		s1 = (int)(s1*100/size);
		s2 = (int)(s2*100/size);
		s3 = (int)(s3*100/size);
		s4 = (int)(s4*100/size);
		Count count = new Count(s1,s2,s3,s4);
		System.out.println(count);
		return count;
	}*/
	public int getTaskCount(Task task){
		int s = taskDao.getTaskCount(task);
		 
		return s;
	}
	public List<Task> getTaskByUserId(int lowerId){
		List<Task> list = taskDao.getTaskByUserId(lowerId);
		return list;
	}
	public List<Task> getTask(int lowerId){
		List<Task> list = taskDao.getTask(lowerId);
		return list;
	}
	public void updateTask(Task task){
		taskDao.updateTask(task);
	}
	
	public void updateTaskByUserLower(Task task){
		taskDao.updateTaskByUserLower(task);
		sqlSession.commit();
	}
	public List<Task> getUrlUpper(int id,int user_upper_id){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("user_upper_id",user_upper_id);
		return taskDao.getUrlUpper(map);
	}
	public List<Task> getTaskByProjectId(int project_id){
		return taskDao.getTaskByProjectId(project_id);
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		sqlSession.close();
	}
}
	