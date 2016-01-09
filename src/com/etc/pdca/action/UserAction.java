package com.etc.pdca.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.etc.pdca.config.Countof;
import com.etc.pdca.config.Judge;
import com.etc.pdca.entity.Bulletin;
import com.etc.pdca.entity.Count;
import com.etc.pdca.entity.Deliver;
import com.etc.pdca.entity.Department;
import com.etc.pdca.entity.Document;
import com.etc.pdca.entity.PageSize;
import com.etc.pdca.entity.Project;
import com.etc.pdca.entity.Role;
import com.etc.pdca.entity.Task;
import com.etc.pdca.entity.Url;
import com.etc.pdca.entity.User;
import com.etc.pdca.service.BulletinService;
import com.etc.pdca.service.DeliverService;
import com.etc.pdca.service.DepartmentService;
import com.etc.pdca.service.DocumentService;
import com.etc.pdca.service.ProjectService;
import com.etc.pdca.service.RoleService;
import com.etc.pdca.service.TaskService;
import com.etc.pdca.service.UrlService;
import com.etc.pdca.service.UserService;
import com.etc.pdca.util.JsonUtil;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tool.getString.getstring;

public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	public static final int pageSize = 6;
	private static final long serialVersionUID = -7701343032812738039L;
	private UserService userService = new UserService();
	private BulletinService bulletinService = new BulletinService();
	private ProjectService projectService = new ProjectService();
	private TaskService taskService = new TaskService();
	private UrlService urlService = new UrlService();
	private RoleService roleService = new RoleService();
	private DepartmentService departmentService = new DepartmentService();
	private DeliverService deliverService = new DeliverService();
	private DocumentService documentService = new DocumentService();
	private User user;
	private String selectname1;
	private int taskId;
	private int urlId;
	private int checkType;
	private String advance;
	private Url url;
	private Bulletin bulletin;
	private int updateId;
	private int lowerUrlId;
	private int spId;
	private String condition;
	private int num;
	private int gotoid;
	private String type;
	private String pageNum;
	public int getGotoid() {
		return gotoid;
	}

	public void setGotoid(int gotoid) {
		this.gotoid = gotoid;
	}

	
	public DeliverService getDeliverService() {
		return deliverService;
	}

	public void setDeliverService(DeliverService deliverService) {
		this.deliverService = deliverService;
	}

	public int getSpId() {
		return spId;
	}

	public void setSpId(int spId) {
		this.spId = spId;
	}

	public int getLowerUrlId() {
		return lowerUrlId;
	}

	public void setLowerUrlId(int lowerUrlId) {
		this.lowerUrlId = lowerUrlId;
	}

	public int getUpdateId() {
		return updateId;
	}

	public void setUpdateId(int updateId) {
		this.updateId = updateId;
	}

	public Bulletin getBulletin() {
		return bulletin;
	}

	public void setBulletin(Bulletin bulletin) {
		this.bulletin = bulletin;
	}

	public Url getUrl() {
		return url;
	}

	public void setUrl(Url url) {
		this.url = url;
	}

	public String getAdvance() {
		return advance;
	}

	public void setAdvance(String advance) {
		this.advance = advance;
	}

	public int getCheckType() {
		return checkType;
	}

	public void setCheckType(int checkType) {
		this.checkType = checkType;
	}

	public int getUrlId() {
		return urlId;
	}

	public void setUrlId(int urlId) {
		this.urlId = urlId;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getSelectname1() {
		return selectname1;
	}

	public void setSelectname1(String selectname1) {
		this.selectname1 = selectname1;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private int projectId;
	private Project project;

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	// 登入
	public String login() {
		User user1 = null;
		ActionContext ac = ActionContext.getContext();
		user1 = (User) ac.getSession().get("user");
		if (user1 == null) {
			user1 = userService.login(user.getUsername(), user.getPassword());
		}
		System.out.println(user1);
		if (user1 != null) {
			ac = ActionContext.getContext();
			ac.getSession().put("user", user1);
			/*
			 * 当grade==1时，是系统管理员登陆
			 */
			if (user1.getRole().getGrade() == 0) {
				return "admin";
			}
			return "success";
		} else {
			ac = ActionContext.getContext();
			ac.put("msg", "请检验后登录。若忘记密码，请联系管理员找回！");
			return "input";
		}

	}

	// 获取界面信息
	public String login1() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		ActionContext ac = ActionContext.getContext();
		List<Bulletin> bulletinList;
		List<Project> projectList = new ArrayList<Project>();
		List<Url> urlPDCA = new ArrayList<Url>();
		List<Url> workUrl = urlService.getWork(user.getId());

		// 针对无上级领导
		/*
		 * List<Count> countList = new ArrayList<Count>(); projectList =
		 * projectService.getProjectList(user.getId()); for (int i = 0; i <
		 * projectList.size(); i++) { Count count = new Count(); Task task = new
		 * Task(); task.setProject(projectList.get(i)); task.setUserUpper(user);
		 * Url url = new Url(); url.setTask(task); // 获取下属的详情 List<Url>
		 * listUrlOfLower = urlService.getAllListById1(url); int s =
		 * listUrlOfLower.size(); if (listUrlOfLower.size() > 0) { // 获取进度
		 * String advance = listUrlOfLower.get(0).getAdvance();
		 * count.setProject(projectList.get(i)); count.setAdvance(advance);
		 * countList.add(i, count); } else { count.setAdvance("P");
		 * count.setProject(projectList.get(i)); countList.add(i, count); } }
		 * ac.put("countList", countList);
		 */

		// 针对有上级领导

		/*
		 * // 获取项目信息 List<Url> urlPDCA1 = new ArrayList<Url>(); Url urllower =
		 * new Url(); urllower.setUrlType("PDCA"); Task tasklower = new Task();
		 * tasklower.setUserLower(user); urllower.setTask(tasklower); urlPDCA1 =
		 * urlService.getUrlByPDCA(urllower); // 获取数据 List<Count> countList1 =
		 * new ArrayList<Count>(); List<Url> urlTimeList = new ArrayList<Url>();
		 * for (int i = 0; i < urlPDCA1.size(); i++) {
		 * 
		 * urlTimeList=urlService.getUrlByUrl_Id(urlPDCA1.get(i).getId()); Count
		 * count = new Count(); count.setUrl(urlPDCA1.get(i));
		 * count.setUrlList(urlTimeList); countList1.add(i, count); }
		 * ac.put("urlTimeList", urlTimeList); ac.put("countList1", countList1);
		 */

		bulletinList = bulletinService.getBulletinList();
		System.out.println("bulletinList="+bulletinList.toString());
		ac.put("bulletinList", bulletinList);
		ac.put("projectList", projectList);
		ac.put("workUrl", workUrl);

		// 获取审核信息
		Url url = new Url();
		url.setStates("已完成");
		url.setUrlType("P");
		Task task = new Task();
		task.setUserUpper(user);
		url.setTask(task);
		List<Url> urlList = urlService.getUrlSH(url);
		ac.put("urlList", urlList);
		url.setUrlType("D");
		List<Url> urlDList = urlService.getUrlSH(url);
		ac.put("urlDList", urlDList);
		url.setUrlType("C");
		List<Url> urlCList = urlService.getUrlSH(url);
		ac.put("urlCList", urlCList);
		url.setUrlType("A");
		List<Url> urlAList = urlService.getUrlSH(url);
		ac.put("urlAList", urlAList);

		return "success";
	}

	public String getInfoOfFB() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		int pageNum = 0;
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
		response.setCharacterEncoding("UTF-8");
		User user = (User) ActionContext.getContext().getSession().get("user");
		ActionContext ac = ActionContext.getContext();
		List<Project> projectList = new ArrayList<Project>();
		List<Url> urlPDCA = new ArrayList<Url>();
		// 针对无上级领导
		List<Count> countList = new ArrayList<Count>();
		double s1 = projectService.getProjectList(user.getId()).size();
		double d = s1 / pageSize;
		System.out.println("size======================"+projectService.getProjectList(user.getId()).size());
		int endPage = (int) Math.ceil(d);
		projectList = projectService.projectPage(user.getId(), (pageNum - 1)
				* pageSize, pageSize);
		System.out.println("project========"+projectList.get(0));
		for (int i = 0; i < projectList.size(); i++) {
			Count count = new Count();
			Task task = new Task();
			task.setProject(projectList.get(i));
			task.setUserUpper(user);
			Url url = new Url();
			url.setTask(task);
			// 获取下属的详情
			List<Url> listUrlOfLower = urlService.getAllListById1(url);
			int s = listUrlOfLower.size();
			if (listUrlOfLower.size() > 0) {
				// 获取进度
				String advance = listUrlOfLower.get(0).getAdvance();
				count.setProject(projectList.get(i));
				count.setAdvance(advance);
				count.setP(pageNum);
				count.setD(endPage);
				countList.add(i, count);
			} else {
				count.setAdvance("P");
				count.setProject(projectList.get(i));
				count.setP(pageNum);
				count.setD(endPage);
				countList.add(i, count);
			}
		}
		Gson gson = new Gson();
		String json = gson.toJson(countList);
		System.out.println("json"+countList);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(json);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return null;
	}

	public String getInfoOfRW() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		int pageNum = 0;
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
		response.setCharacterEncoding("UTF-8");
		User user = (User) ActionContext.getContext().getSession().get("user");
		ActionContext ac = ActionContext.getContext();
		List<Url> urlPDCA1 = new ArrayList<Url>();
		Url urllower = new Url();
		urllower.setUrlType("PDCA");
		Task tasklower = new Task();
		tasklower.setUserLower(user);
		urllower.setTask(tasklower);
		urlPDCA1 = urlService.getUrlByPDCA(urllower);
		List<Url> urlPDCAPage = urlService.getUrlByPDCAPage(user.getId(),
				(pageNum - 1) * pageSize, pageSize);
		// 获取数据
		double s1 = urlPDCA1.size();
		double d = s1 / pageSize;
		int endPage = (int) Math.ceil(d);
		List<Count> countList1 = new ArrayList<Count>();
		List<Url> urlTimeList = new ArrayList<Url>();
		for (int i = 0; i < urlPDCAPage.size(); i++) {
			urlTimeList = urlService.getUrlByUrl_Id(urlPDCAPage.get(i).getId());
			Count count = new Count();
			count.setUrl(urlPDCAPage.get(i));
			count.setP(pageNum);
			count.setD(endPage);
			countList1.add(i, count);
		}
		Gson gson = new Gson();
		String json = gson.toJson(countList1);
		System.out.println(countList1);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(json);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return null;
	}

	// 添加公告信息addBulletin
	public String addBulletin() {

		User user = (User) ActionContext.getContext().getSession().get("user");
		Date date = new Date();
		bulletin.setUser(user);
		bulletin.setPublishTime(date);
		bulletinService.addBulletin(bulletin);
		return "success";
	}

	// 更新进度
	public String advanceUpdate() {
		urlService.updateAdvanceD(projectId);
		return "success";
	}

	// 获取所有有关项目信息
	public String checkProject() {
		ActionContext ac = ActionContext.getContext();
		List<Project> projectList = new ArrayList<Project>();
		User user = (User) ActionContext.getContext().getSession().get("user");
		projectList = projectService.getProjectList(user.getId());
		Url url = new Url();
		url.setUrlType("PDCA");
		Task task = new Task();
		task.setUserLower(user);
		url.setTask(task);
		List<Url> urlPDCA = urlService.getUrlByPDCA(url);
		ac.put("projectList", projectList);
		ac.put("urlPDCA", urlPDCA);
		ac.put("user", user);
		return "success";
	}

//	public String cjtest() {
//		ActionContext ac = ActionContext.getContext();
//		HttpServletResponse response = ServletActionContext.getResponse();
//		HttpServletRequest request = ServletActionContext.getRequest();
//		type = request.getParameter("type");
//		response.setCharacterEncoding("UTF-8");
//		User user = (User) ac.getSession().get("user");
//		   System.out.println(user);
//		   System.out.println("type="+ type);
//		// 获取下级详情
//		List<Url> status = null;
//		String statuName=null;
//		if(type.equals("Unfinished")){
//		status = urlService.getOfUnfinished(user.getId());
//		statuName = "未完成";
//		}
//		if(type.equals("Underway")){
//			//status = urlService.getOfUnderway(user.getId());
//			statuName = "正在进行";
//			}
//		for (int i = 0; i < status.size(); i++) {
//		   User use = status.get(i).getTask().getUserLower();
//		   User user1 = null;
//		   user1 = userService.login(use.getUsername(), use.getPassword());
//		   status.get(i).getTask().setUserLower(user1);
////		   System.out.println("+++++++++++++++++"+urlUnfinished.get(i).getTask().getUserLower().getRole()+"+++++++++++++++++++++" +
////		   urlUnfinished.get(i).getTask().getUserLower().getDepartment());
//		}
//		
//		ac.put("status", status);
//		ac.put("user", user);
//		ac.put("statuName", statuName);
//		return "success";
//	}

	// 获取项目所有有关人员
	public String selectAllUser() {
		HttpServletResponse response = ServletActionContext.getResponse();
		List<Url> allUrlByProject = urlService.getUrlByProject(spId);
		User userHead = projectService.getProjectByID(spId).getUser();
		//System.out.println("allUrlByProject"+allUrlByProject.toString());
		ActionContext ac = ActionContext.getContext();
		ac.put("allUrlByProject", allUrlByProject);
		ac.put("userHead1", userHead);
		return "success";
	}

	// 进入操作界面
	public String performPage() {
		ActionContext ac = ActionContext.getContext();
		User user = (User) ac.getSession().get("user");
		ac.getSession().put("projectId", projectId);
		Project project = new Project();
		project.setId(projectId);
		ac.getSession().put("project", project);
		ac.getSession().put("urlIdAdd", urlId);
		ac.getSession().put("taskId", taskId);
		if (urlService.getUrlByUrlId(urlId) != null) {
			ac.put("advance", urlService.getUrlByUrlId(urlId).getAdvance());
		} else {
			ac.put("advance", advance);
		}
		
		Url url = new Url();
		Url url1 = new Url();
		url1.setId(urlId);
		url.setUrlType("P");
		url.setUrl1(url1);
		url.setStates("通过");
		int sum1 = urlService.getUrlOfCount(url);
		ac.put("sum", sum1);
		List<Url> urlTimeList = urlService.getUrlByUserAndProject(projectId,
				user.getId());
		List<Count> countListOfTime = new ArrayList<Count>();
		int num = 0;// 记录离当前时间最近的点
		int dex = 0;
		for (int i = 0; i < urlTimeList.size(); i++) {
			Count count = new Count();
			System.out.println(urlTimeList.get(i).getEndtime().getTime() + " "
					+ new Date().getTime());
			if (urlTimeList.get(i).getEndtime().getTime() > (new Date()
					.getTime())) {
				dex++;
			}
			if (dex == 1) {
				num = i + 1;
				System.out.println(num);
			}
			int s = urlService.getCountUrlByUserAndProjectAndTimeOfOver(user
					.getId(), projectId, urlTimeList.get(i).getEndtime());
			if (s == 0) {
				count.setUrl(urlTimeList.get(i));
				count.setAdvance("完成");
				countListOfTime.add(i, count);
			} else {
				count.setUrl(urlTimeList.get(i));
				count.setAdvance("未完成");
				countListOfTime.add(i, count);
			}
		}
		System.out.println(countListOfTime);
		ac.put("countListOfTime", countListOfTime);
		System.out.println(num);
		ac.put("postNum", num);
		return "success";
	}

	public String makeplanPage() {
		ActionContext ac = ActionContext.getContext();
		Project project = (Project) ac.getSession().get("project");
		User user = (User) ac.getSession().get("user");
		int url_id = (Integer) ActionContext.getContext().getSession().get(
				"urlIdAdd");
		Url url = new Url();
		Task task = new Task();
		task.setProject(project);
		task.setUserUpper(user);
		url.setTask(task);
		List<Url> listUrlOfLower = new ArrayList<Url>();
		if (url_id == 0) {
			listUrlOfLower = urlService.getAllListById1(url);
		} else {
			url.setId(url_id);
			listUrlOfLower = urlService.getAllListById(url);
		}
		// 获取下级详情
		ac.put("listUrlOfLower", listUrlOfLower);
		List<Count> countList = new ArrayList<Count>();
		List<Url> urlListOfDone = urlService.getUrlOfDone(user.getId(), project
				.getId());
		List<Url> urlListOfFinished = urlService.getUrlOfFinished(user.getId(),
				project.getId());
		List<Url> urlListOfUnfinished = urlService.getUrlOfUnfinished(user
				.getId(), project.getId());
		ac.put("urlListOfDone", urlListOfDone);
		ac.put("urlListOfFinished", urlListOfFinished);
		ac.put("urlListOfUnfinished", urlListOfUnfinished);

		for (int i = 0; i < listUrlOfLower.size(); i++) {
			// int num = listUrlOfLower.get(i).getNum();
			Count count = new Count();
			count.setUrl(listUrlOfLower.get(i));
			countList.add(i, count);

		}
		ac.put("countList", countList);
		return "success";
	}

	public String selectTime() {
		ActionContext ac = ActionContext.getContext();
		Url url = urlService.getUrlByUrlId(gotoid);
		User userlower = url.getTask().getUserLower();
		List<Url> urlTimeList = urlService.getUrlByUserAndProject(url.getTask()
				.getProject().getId(), userlower.getId());
		ac.put("urlTimeList", urlTimeList);
		ac.put("userlower", userlower);
		return "success";
	}

	public String selectLowerPerform() {
		ActionContext ac = ActionContext.getContext();
		Url url = urlService.getUrlByUrlId(lowerUrlId);
		Task task = url.getTask();
		User user = task.getUserLower();
		task.setUserUpper(user);
		url.setTask(task);
		List<Url> listUrlOfLower = new ArrayList<Url>();
		listUrlOfLower = urlService.getAllListById(url);
		// 获取下级详情
		List<Count> countList = new ArrayList<Count>();
		for (int i = 0; i < listUrlOfLower.size(); i++) {
			int num = listUrlOfLower.get(i).getNum();
			Count count = new Count();
			count.setUrl(listUrlOfLower.get(i));
			Url url2 = new Url();
			url2.setUrl1(listUrlOfLower.get(i));
			url2.setUrlType("P");
			url2.setStates("通过");
			count.setP(urlService.getUrlOfCount(url2) * 100);

			if (num != 0) {
				url2.setUrlType("D");
				url2.setStates("通过");
				int s = urlService.getUrlOfCount(url2);
				if (s <= num) {
					count.setD((int) (s * 100 / num));
				} else {
					count.setD(100);
				}

				url2.setStates("未通过");
				s = urlService.getUrlOfCount(url2) + s;
				if (s > 0) {
					count.setC(100);
				} else {
					count.setC(0);
				}

				if (count.getD() == 100) {
					count.setA(100);
				} else {
					count.setA(0);
				}

			} else {
				count.setD(0);
				count.setC(0);
				count.setA(0);
			}
			countList.add(i, count);

		}

		ac.put("countList", countList);
		return "success";

	}

	// 审核
	public String check() {
		Url url = new Url();
		url.setId(urlId);
		if (checkType == 0) {
			url.setStates("通过");
		} else if (checkType == 1) {
			url.setStates("未通过");
		}
		urlService.updateStates(url);

		return "success";
	}

	public String handInDPage() {
		ActionContext ac = ActionContext.getContext();
		ac.put("gotoid", gotoid);
		return "success";
	}

	public String gotosubmitAction() {
		ActionContext ac = ActionContext.getContext();
		ac.put("gotoid", gotoid);
		return "success";
	}

	public String gotosubmitCheck() {
		ActionContext ac = ActionContext.getContext();
		ac.put("gotoid", gotoid);
		return "success";
	}

	public String handInPage() {
		ActionContext ac = ActionContext.getContext();
		int id = (Integer) ac.getSession().get("urlIdAdd");
		Url url = urlService.getUrlByUrlId(id);
		ac.put("url", url);
		ac.put("gotoid", gotoid);
		return "success";
	}

	public String updateNum() {
		int url_id = (Integer) ActionContext.getContext().getSession().get(
				"urlIdAdd");
		urlService.updateNum(url_id, num);
		return null;
	}

	// 更改执行人
	public String changeplan() {
		List<Role> listRole = roleService.selectRole();
		List<Department> listDepartments = departmentService.selectDepartment();
		ActionContext ac = ActionContext.getContext();
		ac.put("listRole", listRole);
		ac.put("listDepartments", listDepartments);
		ac.getSession().put("updateId", updateId);
		return "success";
	}

	public String changeUser() {
		List<Role> listRole = roleService.selectRole();
		List<Department> listDepartments = departmentService.selectDepartment();
		ActionContext ac = ActionContext.getContext();
		ac.put("listRole", listRole);
		ac.put("listDepartments", listDepartments);
		return "success";
	}

	public String makeplanPage1() {
		List<Department> listDepartments = departmentService.selectDepartment();
		List<Document> documentList = documentService.getDocumentByType("P");
		List<Role> listRole = roleService.selectRole();
		ActionContext ac = ActionContext.getContext();
		ac.put("listRole", listRole);
		ac.put("listDepartments", listDepartments);
		ac.put("document", documentList.get(0));
		ac.put("projectId", projectId);
		return "success";
	}

	public String findUserSelect() {
		String rolename;
		String depName;
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		rolename = request.getParameter("rolename");
		depName = request.getParameter("depName");
		response.setCharacterEncoding("UTF-8");
		// List<User> listUser = userService.getUserByRoleName(rolename);
		List<User> listUser = userService.getUserByRoleNameANDdepId(rolename,
				depName);
		Gson gson = new Gson();
		String json = gson.toJson(listUser);
		System.out.println("json="+json);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(json);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		return null;
	}

	public String overData() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		ActionContext ac = ActionContext.getContext();
		User user = (User) ac.getContext().getSession().get("user");
		int id = user.getId();
		
		int size = projectService.getProjectList(user.getId()).size();//项目的个数
		int num1 = urlService.getCountOfExecution(id);
		System.out.println(num1 + "--------");
		double num2 = 0;
		double num3 = 0;
		double num4 = 0;
		double num5 = 0;
		if (num1 != 0) {
			num2 = urlService.getCountOfEarlier(id) * 100 / num1;
			num3 = urlService.getCountOfTimely(id) * 100 / num1;
			num4 = urlService.getCountOfUnfinished(id) * 100 / num1;
			num5 = urlService.getCountOfUnderway(id) * 100 / num1;
		}
		String json = "{\"Earlier\":" + num2 + ",\"Timely\":" + num3
				+ ",\"Unfinished\":" + num4 + ",\"Underway\":" + num5 + ",\"size\":" + size + "}";
		System.out.println("json=" + json);
		try {
			response.getWriter().write(json);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		return null;
	}

	public String appraise() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		ActionContext ac = ActionContext.getContext();
		User user = (User) ac.getContext().getSession().get("user");
		int id = user.getId();
		int num1 = 0;
		int num2 = 0;
		int num3 = 0;
		int num4 = 0;
		Judge judge = new Judge();
		List<Url> listUrl = urlService.getUrlOfAllUserLower(id);
		for (int i = 0; i < listUrl.size(); i++) {
			int userlowerId = listUrl.get(i).getTask().getUserLower().getId();
			int earlier = urlService.getUrlOfAllUserLowerByEarlier(userlowerId);
			int timely = urlService.getUrlOfAllUserLowerByTimely(userlowerId);
			int unfinished = urlService
					.getUrlOfAllUserLowerByUnfinished(userlowerId);
			System.out.println(i+":"+listUrl.get(i).toString());
			System.out.println("=== " + unfinished);
			int appraise = judge.getJudgeFruit(earlier, timely, unfinished);
			if (appraise == 1) {
				num1++;
			} else if (appraise == 2) {
				num2++;
			} else if (appraise == 3) {
				num3++;
			} else if (appraise == 4) {
				num4++;
			}
		}
		int sum = num1 + num2 + num3 + num4;
		int temp=sum;
		System.out.println(num1 + " " + num2 + " " + num3 + " " + num4);
		String json = null;
		if(temp==0){  //加判断，没有数据也显示图形
			sum = 1;
		}
		if (sum != 0) {
			num1 = (num1 * 100) / sum;
			num2 = (num2 * 100) / sum;
			num3 = (num3 * 100) / sum;
			num4 = (num4 * 100) / sum;
		}
		json = "{\"youxiu\":" + (num1 * 100) / sum + ",\"lianghao\":"
					+ (num2 * 100) / sum + ",\"jige\":" + (num3 * 100) / sum
					+ ",\"hencha\":" + (num4 * 100) / sum + ",\"sum\":" + temp + "}";
		System.out.println("json=" + json);
		try {
			response.getWriter().write(json);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		return null;
	}

	public String deleteUrl() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		int deleteId;
		deleteId = Integer.parseInt(request.getParameter("deleteId"));
		urlService.deleteUrl(deleteId);
		return null;
	}

	public String deleteUrlBy1() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		int deleteId;
		deleteId = Integer.parseInt(request.getParameter("deleteId"));
		urlService.deleteUrlByProjectId(deleteId);
		return null;
	}

	public String addTask() {
		User user2 = userService.getUserByRealName(selectname1);
		User user1 = (User) ActionContext.getContext().getSession().get("user");
		return "success";
	}

	public String sengJson() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		String bJson;
		bJson = request.getParameter("bJson");
		bJson = bJson.substring(1, bJson.length() - 1);
		ArrayList listName = new ArrayList();
		String[] names = bJson.split(",");
		for (String string : names) {
			listName.add(string.substring(1, string.length() - 1));
		}
		ActionContext ac = ActionContext.getContext();
		ac.getSession().put("listName", listName);
		return null;
	}

	public String getInfo() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		ActionContext ac = ActionContext.getContext();
		response.setCharacterEncoding("UTF-8");
		User user = (User) ac.getSession().get("user");
		int projectId = (Integer) ac.getSession().get("projectId");
		String time;
		time = request.getParameter("time");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Url> getTimelistOfUrl = new ArrayList<Url>();
		Date date;
		try {
			if (time.equals("") && "".equals(time)) {
				getTimelistOfUrl = null;
			} else {
				date = formatter.parse(time);
				getTimelistOfUrl = urlService.getUrlByUserAndProjectAndTime(
						projectId, date, user.getId());
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}
		Gson gson = new Gson();
		String json = gson.toJson(getTimelistOfUrl);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(json);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return null;
	}

	public String getInfo1() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		ActionContext ac = ActionContext.getContext();
		response.setCharacterEncoding("UTF-8");
		int projectId = (Integer) ac.getSession().get("projectId");
		String time;
		int user1;
		time = request.getParameter("time");
		user1 = Integer.parseInt(request.getParameter("user1"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Url> getTimelistOfUrl = new ArrayList<Url>();
		Date date;
		try {
			if (time.equals("") && "".equals(time)) {
				getTimelistOfUrl = null;
			} else {
				date = formatter.parse(time);
				getTimelistOfUrl = urlService.getUrlByUserAndProjectAndTime(
						projectId, date, user1);
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}
		Gson gson = new Gson();
		String json = gson.toJson(getTimelistOfUrl);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(json);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return null;
	}

	public String entryPage() {
		return "success";
	}

	public String returnHome() {
		return "success";
	}

	public String addProject() {
		projectService.addProject(project);
		return "success";
	}

	public void addUser() {
		userService.addUser(user);
	}

	public void updateUser() {
		userService.updateUser(user);
		/*
		 * 获得response对象
		 */
		HttpServletResponse response = ServletActionContext.getResponse();
		/*
		 * 设置HTTP协议接受的内容类型及编码
		 */
		response.setContentType("text/html;charset=utf-8");
		String msg = JsonUtil.toJson("更新成功");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.println(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void deleteUser() {
		userService.deleteUser(user.getId());
	}
	public String makePlanFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request =   ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		List<Document> documentList = documentService.getDocumentByType("P");
		String json ="{\"p1\":[";
		for(int i = 0;i<documentList.size();i++){
			String p1= "{";
			p1 = p1+"\"docName\":\""+documentList.get(i).getDocName()+"\"},";
			json = json+p1;
		}
		json = json.substring(0,json.length()-1);
		System.out.println(json);
		json = json+"]}";
		System.out.println("filename:=" + json);
		try {
			response.getWriter().write(json);
	} catch (IOException e1) {
		e1.printStackTrace();
	}
	return null;
	}
	public void findUsersByCondition() {
		List<User> users = userService.findUsersByCondition(condition);
		// System.out.println(users.toString());
		/*
		 * 使用JsonUtil将Roles集合转为json字符串
		 */
		String jsonStr = JsonUtil.toJson(users);
		/*
		 * 获得response对象
		 */
		HttpServletResponse response = ServletActionContext.getResponse();
		/*
		 * 设置HTTP协议接受的内容类型及编码
		 */
		response.setContentType("text/html;charset=utf-8");
		/*
		 * 输出json字符串到前台
		 */
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			pw.println(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public String Data(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request =   ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		ActionContext ac = ActionContext.getContext();
		response.setCharacterEncoding("UTF-8");
		User user = (User) ac.getSession().get("user");
		
		type = (String) ac.getSession().get("type");
		   System.out.println(user);
		   System.out.println("type="+ type);
		//翻页
		pageNum =  (String)ac.getSession().get("pageNum");
		
		System.out.println("pagenum========================"+pageNum);
		//pageNum = Integer.parseInt(request.getParameter("pageNum"));
		 int pageNum1= Integer.parseInt(pageNum);
		   
	
		// 获取下级详情
		List<Url> unFinishedList =null;
		//String statuName=null;
		if(type.equals("Unfinished")){

		// statuName = "未完成";
		 unFinishedList = urlService.getOfUnfinished(user.getId());
		}
		if(type.equals("Underway")){
			unFinishedList = urlService.getOfUnderway(user.getId());
		//	statuName = "正在进行";
			
			}
		if(type.equals("Earlier")){
			unFinishedList = urlService.getOfEarlier(user.getId());
		//	statuName = "提前完成";
		}
		if(type.equals("Timely")){
			unFinishedList = urlService.getOfTimely(user.getId());
			//statuName = "已完成";
			}
		//ac.getSession().put("statuName",statuName);	
		System.out.println("========================"+unFinishedList.size());
		//User user = userService.getUserById(1);
		//List<Task> projectList = taskService.getTaskByUserId(1);
		List<Task> projectList = new ArrayList<Task>();
		for(int i =0;i<unFinishedList.size();i++){
			Task task = unFinishedList.get(i).getTask();
			System.out.println("task="+task.toString());
			if(Countof.isHaveproject(projectList, task))
				projectList.add(task);
			//System.out.println(task.getProject().getId()+",projectName="+task.getProject().getProjectname());
		}
		int pageSize1=2;
		double s1 = projectList.size();
		double d = s1 / pageSize1;
		int endPage = (int) Math.ceil(d);
		System.out.println("s1="+s1+"end="+endPage);
		ac.getSession().put("endPage",endPage);
		String json ="{\"options\":[{";
		System.out.println(projectList.size()+"---------------");
		if(pageNum1>endPage)  pageNum1=endPage;
		if(pageNum1<1) pageNum1=1;
		
		for(int i=pageSize1*(pageNum1-1);i<(pageSize1*pageNum1);i++){
			System.out.println("i=================="+i);
			if(i>=projectList.size()) continue;
			if(i==pageSize1*(pageNum1-1)){
				json = json+"\"p1\":[";
				
			}
			else{
				json=json+"{\"p1"+"\":[";
				
			}
		System.out.println("projectList.get(i).getProject="+projectList.get(i).getProject().toString());
		int projectId = projectList.get(i).getProject().getId();
		Project project = projectService.getProjectByID(projectId);
		String projectname = project.getProjectname();
		int url_id = 0;
		Url url = new Url();
		Task task = new Task();
		task.setProject(project);
		task.setUserUpper(user);
		url.setTask(task);
		List<Url> listUrlOfLower = new ArrayList<Url>();
		if (url_id == 0) {
			listUrlOfLower = urlService.getAllListById1(url);
		} else {
			url.setId(url_id);
			listUrlOfLower = urlService.getAllListById(url);
		}
		// 获取下级详情
		//ac.put("listUrlOfLower", listUrlOfLower);
		List<Count> countList = new ArrayList<Count>();
		System.out.println("user.getId="+user.getId()+",project.getId="+project.getId());
		List<Url> urlListOfDone = urlService.getUrlOfDone(user.getId(), project.getId());
		System.out.println("urlListOfDone="+urlListOfDone.size());
		List<Url> urlListOfFinished =urlService.getUrlOfFinished(user.getId(), project.getId());
		System.out.println("urlListOfFinished="+urlListOfFinished.size());
		List<Url> urlListOfUnfinished = urlService.getUrlOfUnfinished(user.getId(), project.getId());
		System.out.println("urlListOfUnfinished="+urlListOfUnfinished.size());
		List<Url> lowerofurl  = urlService.getUrlOfAllUserLower(user.getId());
		System.out.println("lowerofurl.size="+lowerofurl.size());
		
		List<String> listofjson  = new ArrayList<String>();
		String p1;
		//double[] num = new double[lowerofurl.size()];
		double countofnum = urlListOfDone.size()
				+urlListOfFinished.size()+urlListOfUnfinished.size();
		for(int k =0 ;k<lowerofurl.size();k++){
			DecimalFormat    df   = new DecimalFormat("######0.00");  
			String realname=lowerofurl.get(k).getTask().getUserLower().getRealname();
			double Done = Countof.Countofnum(realname,urlListOfDone);
			System.out.println("Done="+Done);
			double Finished = Countof.Countofnum(realname,urlListOfFinished);
			System.out.println("Finished="+Finished);
			double Unfinished =Countof. Countofnum(realname,urlListOfUnfinished);
			System.out.println("Unfinished="+Unfinished);
			double countofProject = Done+Finished+Unfinished;
			System.out.println("countofProject="+countofProject);
			//num[i] = countofProject;
			if(Done+Finished+Unfinished!=0){
			p1="{\"projectname\":\""+projectname
				+"\",\"realname\":\""+realname+"\","+"\"per\":"+df.format(countofProject*100/countofnum)
			+",\"p2\":[{\"Finished\":\""+"待完成\","+"\"per\":"+df.format((Done*100/countofProject)*countofProject/countofnum)
					+"},"+"{\"Finished\":\""+"完成\","+"\"per\":"+df.format((Finished*100/countofProject)*countofProject/countofnum)
					+"},"+"{\"Finished\":\""+"未完成\","+"\"per\":"+df.format((Unfinished*100/countofProject)*countofProject/countofnum)
					+"}]},";
			System.out.println("p1"+p1);
			listofjson.add(p1);
			}
		}
		
//		json = "{\"projectname\":\""+lowerofurl.get(0).getTask().getProject().getProjectname()+"\","
//				+"\"realnameNum\":"+lowerofurl.size()+",";
		System.out.println("listofjson.size="+listofjson.size()+json);
		for(int j =0;j<listofjson.size();j++){
			json=json+listofjson.get(j);
//			System.out.println(listofjson.get(j));
			System.out.println(json);
//			System.out.println(j);
		}
//		System.out.println("lowerofurl==="+lowerofurl.size()+",userId="+user.getId());
//		System.out.println(11111);
		json=json.substring(0, json.length()-1);
		json=json+"]},";
		
		//if(i+1>=projectList.size()) break;
		}
		
		
		json=json.substring(0, json.length()-1);
		json=json+"],"+"\"projectnumber\":"+projectList.size()+"}";
		System.out.println(json);
		
		try {
				response.getWriter().write(json);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return null;
	}
	
	public String getChart(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		ActionContext ac = ActionContext.getContext();
		User user = (User) ac.getSession().get("user");
		List<Url> unFinishedList=null;
		type = (String) ac.getSession().get("type");
		   //System.out.println(user)
		   //System.out.println("type="+ type);
		// 获取下级详情
		ac.getSession().remove("statuName");
		//String statuName=null;
		pageNum =  (String)ac.getSession().get("pageNum");
		 int pageNum1= Integer.parseInt(pageNum);
		if(type.equals("Unfinished")){

		// statuName = "未完成";
		 unFinishedList = urlService.getOfUnfinished(user.getId());
		}
		if(type.equals("Underway")){
			unFinishedList = urlService.getOfUnderway(user.getId());
			//statuName = "正在进行";
			}
		if(type.equals("Earlier")){
			unFinishedList = urlService.getOfEarlier(user.getId());
			//statuName = "提前完成";
			//System.out.println("unFinishedList  size ="+unFinishedList.get(0).toString());
		}
		if(type.equals("Timely")){
			unFinishedList = urlService.getOfTimely(user.getId());
			//statuName = "已完成";
			}
		//ac.getSession().put("statuName",statuName);	
		//System.out.println(unFinishedList.toString());
//		//User user = userService.getUserById(1);
		 
//		System.out.println("+++++++++++++++++++++++++++++"+unFinishedList);
//		System.out.println("==================="+unFinishedList.size());
		List<Task> projectList = new ArrayList<Task>();
		for(int i =0;i<unFinishedList.size();i++){
			Task task = unFinishedList.get(i).getTask();
			//System.out.println("task="+task);
			if(Countof.isHaveproject(projectList, task))
				projectList.add(task);
			//System.out.println(task.getProject().getId()+",projectName1="+task.getProject().getProjectname());
		}
		System.out.println("projectList="+projectList.toString());
		//List<Task> projectList = taskService.getTaskByUserId(1);
		//List<Task> projectList =new ArrayList<Task>();
		int pageSize1=2;
		double s1 = projectList.size();
		double d = s1 / pageSize1;
		int endPage = (int) Math.ceil(d);
		//System.out.println("s1="+s1+"end="+endPage);
		if(pageNum1>endPage)  pageNum1=endPage;
		if(pageNum1<1) pageNum1=1;
		String json ="{\"options\":[";
		//System.out.println(projectList.size()+"---------------");
		for(int i=pageSize1*(pageNum1-1);i<(pageSize1*pageNum1);i++){
			
			//System.out.println("i=================="+i);
			if(i>=projectList.size()) continue;
			int spId = projectList.get(i).getProject().getId();
			String p = "{\"deliver\":"+"\"转交情况\","+"\"href\":"+"\"LookDeliver.action?projectId="+spId+"\",";
			json = json+p+"\"p1\":[{";
			
			//System.out.println(projectList.get(i).getProject().getId()+"============");
			List<String>  userList = new ArrayList<String>();
			List<Task> allUrlByProject = taskService.getTaskByProjectId(spId);
			//System.out.println("allUrlByProject.size()="+allUrlByProject.size());
			List<Task> UpperUser = new ArrayList<Task>();
		for(int n = 0;n<allUrlByProject.size();n++){
			List<Task> task = taskService.getUrlUpper(spId, allUrlByProject.get(n).getUserUpper().getId());
			for(int m =0;m<task.size();m++){
				UpperUser.add(task.get(m));
			}
		}
		for(int n=0;n<UpperUser.size();n++){
			allUrlByProject.add(UpperUser.get(n));
		}
		for(int n =0;n<allUrlByProject.size();n++){
		//System.out.println("====================================="+n+allUrlByProject.get(n).toString());
		}
		for(int j=0;j<allUrlByProject.size();j++){
			Task url = allUrlByProject.get(j);
			//System.out.println("url="+url.toString());
			String p1 ="";
			p1=p1+"\"userLower\":\""+url.getUserLower().getRealname()
			+"\",\"userUpper\":\""+url.getUserUpper().getRealname()
			+"\",\"href\":\"performPage.action?projectId="+spId
			+"\"},{";
			//System.out.println("p1="+p1);
			userList.add(p1);
		}
		for(int j=0;j<userList.size();j++){
			json = json+userList.get(j);
		}
		json = json.substring(0,json.length()-2);
		json = json+"]},";
		//User userHead = projectService.getProjectByID(spId).getUser();
		//System.out.println("allUrlByProject"+allUrlByProject.toString());
		}
	
		json = json.substring(0,json.length()-1);
		json = json+"]}";
		System.out.println("json================"+json);
		try {
			response.getWriter().write(json);
	} catch (IOException e1) {
		e1.printStackTrace();
	}
		
		return null;
	}
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String list() {
		return SUCCESS;
	}
	public String cjdata() {
		ActionContext ac = ActionContext.getContext();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		type = request.getParameter("type");
		pageNum = request.getParameter("pageNum");
		//User user = (User) ac.getSession().get("user");
		String statuName=null;
		if(type.equals("Unfinished")){
		 statuName = "未完成";	
		}
		if(type.equals("Underway")){;
			statuName = "正在进行";
			}
		if(type.equals("Earlier")){
			statuName = "提前完成";
		}
		if(type.equals("Timely")){
			statuName = "已完成";
			}
		ac.getSession().put("statuName", statuName);
		//ac.getSession().put("statuName",statuName);
	    ac.getSession().put("type", type);
	    ac.getSession().put("pageNum", pageNum);
	
		
		return "success";
	}
	public String exit() {
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		if (session.get("user") != null) {
			session.remove("user");
			return SUCCESS;
		}
		return ERROR;
	}
	public String changePsd(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		 String username = request.getParameter("username");
		 String password = request.getParameter("password");
		 String repsd = request.getParameter("repassword");
		 ActionContext ac = ActionContext.getContext();
		 Map<String, Object> session = ac.getSession();
//		 System.out.println(name+"  ==== "+psd+"  ===  "+repsd);
		 
		 
		 if(repsd.equals(password)){	
			
			 userService.changePsd(username, password);
			 if (session.get("user") != null) {
					session.remove("user");
					return SUCCESS;
				}
		 }
		return ERROR;	
	}
	public String rtchangePsd(){
		
		return SUCCESS;
		
	}
	public String getTestChart(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		List<Task> projectList = taskService.getTaskByProjectId(1);
		//List<Task> projectList =new ArrayList<Task>();
		String json ="{\"options\":[";
		json = json+"{\"p1\":[{";
		System.out.println(projectList.size()+"---------------");
		for(int i= 0;i<projectList.size();i++){
			int spId = projectList.get(i).getProject().getId();
			System.out.println(projectList.get(i).getProject().getId()+"============");
		List<String>  userList = new ArrayList<String>();
		//List<Url> allUrlByProject = urlService.getUrlUpper(spId,1);
		//System.out.println(allUrlByProject.size());
		//for(int j=0;j<allUrlByProject.size();j++){
			//Url url = allUrlByProject.get(j);
			String p1 ="";
			p1=p1+"\"userLower\":\""+projectList.get(i).getUserLower().getRealname()
			+"\",\"userUpper\":\""+projectList.get(i).getUserUpper().getRealname()
			+"\",\"href\":\"performPage.action?projectId="+spId
			+"\"},{";
			//System.out.println(p1);
			userList.add(p1);
		//}
		for(int j=0;j<userList.size();j++){
			json = json+userList.get(j);
		}
		User userHead = projectService.getProjectByID(spId).getUser();
		//System.out.println("allUrlByProject"+allUrlByProject.toString());
		}
		json = json.substring(0,json.length()-2);
		json = json+"]},";
		json = json.substring(0,json.length()-1);
		json = json+"]}";
		System.out.println(json);
		try {
			response.getWriter().write(json);
	} catch (IOException e1) {
		e1.printStackTrace();
	}
		
		return null;
	}
	public String LookDeliver(){
		ActionContext ac = ActionContext.getContext();
		List<Deliver> delivers = deliverService.getDeliverbyProjectId(projectId);
		System.out.println("projectId===================="+projectId);
		System.out.println("delivers="+delivers.toString());
		ac.put("deliverlist", delivers);
		return "success";
	}
}
