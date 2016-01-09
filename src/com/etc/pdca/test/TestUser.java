package com.etc.pdca.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.junit.Test;

import com.etc.pdca.config.Judge;
import com.etc.pdca.dao.BulletinDao;
import com.etc.pdca.dao.DepartmentDao;
import com.etc.pdca.dao.ProjectDao;
import com.etc.pdca.dao.UserDao;
import com.etc.pdca.entity.Bulletin;
import com.etc.pdca.entity.Department;
import com.etc.pdca.entity.Project;
import com.etc.pdca.entity.Role;
import com.etc.pdca.entity.Task;
import com.etc.pdca.entity.Url;
import com.etc.pdca.entity.User;
import com.etc.pdca.service.BulletinService;
import com.etc.pdca.service.DepartmentService;
import com.etc.pdca.service.ProjectService;
import com.etc.pdca.service.TaskService;
import com.etc.pdca.service.UrlService;
import com.etc.pdca.service.UserService;
import com.etc.pdca.util.MybatisUtil;

public class TestUser {
	private SqlSession sqlSession = MybatisUtil.openSession();
	private Transaction ts = new JdbcTransactionFactory()
			.newTransaction(sqlSession.getConnection());	
	private UserDao dao = sqlSession.getMapper(UserDao.class);
	BulletinDao bulletinDao = sqlSession.getMapper(BulletinDao.class);
	
	@Test
	public void getBulletin() {
		List<Bulletin> bulletins = bulletinDao.getBulletinList();
		for (Bulletin bulletin : bulletins) {
			System.out.println(bulletin);
		}
	}
	@Test
	public void time() {
		UrlService urlService = new UrlService();
		String time = "2014-12-29 00:00:00";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date;
		try {
			date = formatter.parse(time);
			List<Url> getTimelistOfUrl =urlService.getUrlByUserAndProjectAndTime(10,date,1);
			System.out.println(getTimelistOfUrl.size());
		} catch (ParseException e) {
			e.printStackTrace();
		}
			//java.sql.Date d2 = new java.sql.Date(date.getTime());
			//System.out.println(d2);
			
	}
	
	@Test
	public void getUser() {
		System.out.println(sqlSession);
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		System.out.println(userDao);
		//System.out.println("11"+userDao.getUserList());
		User user = userDao.getUser("yu");
		User user1 = userDao.getUserByRealName("陈敏");
		System.out.println(user);
		//System.out.println(user1);
		
	}
	@Test
	public void getBu() {
		BulletinService bulletinService = new BulletinService();
		System.out.println(bulletinService.getBulletinList().size());
	}
	@Test
	public void selectDepartment() {
		DepartmentService departmentService = new DepartmentService();
		//List<Department> list = departmentService.selectDepartment();
		DepartmentDao departmentDao = sqlSession.getMapper(DepartmentDao.class);
		List<Department> list = departmentDao.selectDepartment();
		System.out.println(list);
		
	}
	
	@Test
	public void getTask() {
	TaskService taskService = new TaskService();
	Task task = new Task();
	Project project = new Project();
	project.setId(1);
	User user = new User();
	user.setId(1);
	task.setProject(project);
	task.setUserUpper(user);
	
	}
	
	@Test
	public void addTask() {
		TaskService taskService = new TaskService();
		//taskService.addTask(1, 1, 2, "P");
		//System.out.println((int)(1*100/3));
		
		//System.out.println(taskService.getCount(null));
		System.out.println(taskService.getTaskByUserId(2));
	}
	@Test
	public void testUrl() {
		UrlService urlService = new UrlService();
		System.out.println(urlService.getWork(2));
	}
	
	@Test
	public void updateTask() {
		TaskService taskService = new TaskService();
		Task task = new Task();
		task.setId(16);
		taskService.updateTask(task);
	}
	
	@Test
	public void getUrl() {
		UrlService urlService = new UrlService();
		List<Url> list = urlService.getUrlByUserAndProject(10, 2);
		System.out.println(list.size());
	}
	
	@Test
	public void updateUrl() {
		UrlService urlService = new UrlService();
		/*Url url = new Url();
		url.setId(4);
		url.setStates("通过");
		System.out.println(url);*/
		//urlService.updateStates(url);
		urlService.updateAdvanceD(1);
	}
	@Test
	public void getCount(){
		UrlService urlService = new UrlService();
		System.out.println(urlService.getCountOfExecution(1));
		System.out.println(urlService.getCountOfEarlier(1));
		System.out.println(urlService.getCountOfTimely(1));
		System.out.println(urlService.getCountOfUnfinished(1));
		System.out.println(urlService.getCountOfUnderway(1));
		
		
	}
	@Test
	public void getUrlList(){
		UrlService urlService = new UrlService();
		/*Url url = new Url();
		Url url1 = new Url();
		url1.setId(10);
		url.setUrlType("P");
		url.setUrl1(url1);
		List<Url> list= urlService.getUrlOfAllList(url);*/
		Task task =new Task();
		User user = new User();
		
		Project project = new Project();
		project.setId(1);
		user.setId(1);
		task.setUserUpper(user);
		task.setProject(project);
		Url url = new Url();
		url.setTask(task);
		System.out.println(url);
		List<Url> list=urlService.getAllListById1(url);
		System.out.println(list);
	}
	@Test
	public void getCount1(){
		UrlService urlService = new UrlService();
		Task task =new Task();
		User user = new User();
		Project project = new Project();
		project.setId(1);
		user.setId(1);
		task.setUserUpper(user);
		task.setProject(project);
		Url url = new Url();
		url.setTask(task);
		url.setStates("通过");
		url.setUrlType("P");
		int s =urlService.getUrlCountOfPDCA(url);
		System.out.println(urlService.getUrlCountOfDNum(url));
		System.out.println(s);
	}
	@Test
	public void updateNum(){
		UrlService urlService = new UrlService();
		System.out.println(urlService.getUrlByPDCAPage(2, 1, 1));
	}
	@Test
	public void addUser() {
		Role role = new Role();
		role.setId(2);
		Department department = new Department();
		department.setDepartId(3);
		User user = new User(4, "xing苦独", "123456", "曹吉巴", "1", role, department);
		System.out.println(user);
		dao.addUser(user);
		sqlSession.commit();
	}
	
	@Test
	public void deleteUser() {
		dao.deleteUser(6);
		sqlSession.commit();
	}
	
	@Test
	public void updateUser() {
		Role role = new Role();
		role.setId(3);
		Department department = new Department();
		department.setDepartId(3);
		User user = new User(8, "kingstar", "444444", "大新哥", "1", role, department);
		dao.updateUser(user);
		sqlSession.commit();
		dao.updateUser(user);
	}
	@Test
	public void getProject(){
		ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
		ProjectService projectService = new ProjectService();
		int s =1;
		double ss=s/7;
		System.out.println(ss);
		System.out.println((int)Math.ceil(ss));
	}
	
	@Test
	public void getUsersByCondition() {
		String condition = "";
		List<User> users = dao.getUsersByCriteria(condition);
		for (User user : users) {
			System.out.println(user);
		}
	}
	@Test
	public void getUserByRoleNameANDdepId() {
		System.out.println("1");
		UserService userService  = new UserService();
		List<User> users = userService.getUserByRoleNameANDdepId("稽查部","县长");
		for (User user : users) {
			System.out.println(user);
		}
		
	}
	@Test
	public void getJudgeFruit1(){
		Judge j = new Judge();
		System.out.println(j.getJudgeFruit(1,1, 1));
	}
}
