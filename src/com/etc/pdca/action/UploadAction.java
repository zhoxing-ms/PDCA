package com.etc.pdca.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.etc.pdca.entity.Deliver;
import com.etc.pdca.entity.Document;
import com.etc.pdca.entity.Project;
import com.etc.pdca.entity.Task;
import com.etc.pdca.entity.Url;
import com.etc.pdca.entity.User;
import com.etc.pdca.service.DeliverService;
import com.etc.pdca.service.DocumentService;
import com.etc.pdca.service.ProjectService;
import com.etc.pdca.service.TaskService;
import com.etc.pdca.service.UrlService;
import com.etc.pdca.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3794674286476881093L;
	/**
	 * 文件对应的File对象
	 */
	private File fileUpload;
	/**
	 * 文件类型
	 */
	private String fileUploadContentType;
	/**
	 * 文件名
	 */
	private UserService userService = new UserService();
	private TaskService taskService = new TaskService();
	private UrlService urlService = new UrlService();
	private DocumentService documentService = new DocumentService();
	private DeliverService deliverService = new DeliverService();
	private ProjectService projectService = new ProjectService();
	private String fileUploadFileName;
	private String selectname1;
	private int selectname;
	private User user;
	private Url url;
	private List<Url> urlList;
	private int gotoid;
	private String fileType;
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public int getGotoid() {
		return gotoid;
	}

	public void setGotoid(int gotoid) {
		this.gotoid = gotoid;
	}

	public List<Url> getUrlList() {
		return urlList;
	}

	public void setUrlList(List<Url> urlList) {
		this.urlList = urlList;
	}

	public Url getUrl() {
		return url;
	}

	public void setUrl(Url url) {
		this.url = url;
	}

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getSelectname1() {
		return selectname1;
	}

	public void setSelectname1(String selectname1) {
		this.selectname1 = selectname1;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}


	@Override
	public String execute() throws Exception {
//		System.out.println("fileUpload==1111====" + fileUpload);
//		System.out.println("fileuploadfilename=1111===" + fileUploadFileName);
		if(fileUploadFileName!=null){
			int num=(int) Math.round(Math.random()*8999+1000);
			 //fileUploadFileName = "NO"+":"+num+" "+fileUploadFileName;
			ServletContext servletContext = ServletActionContext
					.getServletContext();
			String dir = servletContext.getRealPath("/WEB-INF/upload_files/"
					+ fileUploadFileName);

			InputStream is = null;
			OutputStream os = null;
			
			try{
				is = new BufferedInputStream(
						new FileInputStream(fileUpload));
				os = new BufferedOutputStream(new FileOutputStream(dir));
				byte[] bytes = new byte[4048];
				int len = -1;
				while ((len = is.read(bytes)) != -1) {
					os.write(bytes, 0, len);
				}
			}catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if(os != null) os.close();
					if(is != null) is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		 
		// 添加Task
		
		User user1 = (User) ActionContext.getContext().getSession().get("user");
		ArrayList listName =  (ArrayList) ActionContext.getContext().getSession().get("listName");
		for(int i = 0;i<listName.size();i++){
			User user2 = userService.getUserByRealName((String)(listName.get(i)));
			int url_id = (Integer) ActionContext.getContext().getSession()
					.get("urlIdAdd");
			int projectId = (Integer) ActionContext.getContext().getSession()
					.get("projectId");
			Task task = new Task();
			Task task1 = new Task();
			Project project = new Project();
			project.setId(projectId);
			task.setProject(project);
			task.setUserLower(user2);
			task.setUserUpper(user1);
			if (taskService.getTask(task).size() == 0) {
				taskService.addTask(projectId, user1.getId(), user2.getId());
			}
			task1 = taskService.getTask(task).get(0);
			System.out.println(task1);
			Url url1 = new Url();
			if (url_id == 0) {
				url1 = null;
			} else {
				url1.setId(url_id);
			}
			url.setTask(task1);
			url.setUrlType("PDCA");
			url.setDocUrl(fileUploadFileName);
			url.setUrl1(url1);
			url.setUrlstates("已发布");
			urlService.addUrl(url);
			System.out.println(url.toString());
			Url url3 = new Url();
			url3.setTask(task1);
			url3.setUrlType("P");
			url3.setUrl1(url);
			url3.setEndtime(url.getEndtime());
			urlService.addUrl(url3);
//			Document document = new Document(0, fileUploadFileName,"P");
//			documentService.addDocument(document);
			System.out.println(url3.toString());
		}
		return SUCCESS;
	}

	public String uploadDoc() {
//		System.out.println("1="+fileType);
//		System.out.println("2="+fileUpload);
//		System.out.println("3="+fileUploadFileName);
		
		ServletContext servletContext = ServletActionContext
				.getServletContext();
		String dir = servletContext.getRealPath("/WEB-INF/upload_files/"
				+ fileUploadFileName);

		InputStream is = null; 
		OutputStream os = null; 
		
		try {
			is= new BufferedInputStream(
					new FileInputStream(fileUpload));
			os =new BufferedOutputStream(new FileOutputStream(dir));
			byte[] bytes = new byte[4048];
			int len = -1;
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(os != null)os.close();
				if(is != null) is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String docType = this.fileType;
		String docName = this.fileUploadFileName;
		Document document = new Document(0, docName, docType);
		documentService.addDocument(document);
		return SUCCESS;
	}
	
	
	public String uploadcheck() throws Exception {
		if(fileUploadFileName!=null){
			int num=(int) Math.round(Math.random()*8999+1000);
//			 fileUploadFileName = "NO"+":"+num+" "+fileUploadFileName;
			ServletContext servletContext = ServletActionContext
					.getServletContext();
			String dir = servletContext.getRealPath("/WEB-INF/upload_files/"
					+ fileUploadFileName);

			InputStream is = new BufferedInputStream(
					new FileInputStream(fileUpload));
			OutputStream os = new BufferedOutputStream(new FileOutputStream(dir));
			byte[] bytes = new byte[4048];
			int len = -1;
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
			os.close();
			is.close();
		}
		 
		// 添加Task
		
		User user1 = (User) ActionContext.getContext().getSession().get("user");
		ArrayList listName =  (ArrayList) ActionContext.getContext().getSession().get("listName");
		for(int i = 0;i<listName.size();i++){
			User user2 = userService.getUserByRealName((String)(listName.get(i)));
			int url_id = (Integer) ActionContext.getContext().getSession()
					.get("urlIdAdd");
			int projectId = (Integer) ActionContext.getContext().getSession()
					.get("projectId");
			Task task = new Task();
			Task task1 = new Task();
			Project project = new Project();
			project.setId(projectId);
			task.setProject(project);
			task.setUserLower(user2);
			task.setUserUpper(user1);
			if (taskService.getTask(task).size() == 0) {
				taskService.addTask(projectId, user1.getId(), user2.getId());
			}
			task1 = taskService.getTask(task).get(0);
			System.out.println(task1);
			Url url1 = new Url();
			if (url_id == 0) {
				url1 = null;
			} else {
				url1.setId(url_id);
			}
			url.setTask(task1);
			url.setUrlType("PDCA");
			url.setDocUrl(fileUploadFileName);
			url.setUrl1(url1);
			urlService.addUrl(url);
			
			Url url3 = new Url();
			url3.setTask(task1);
			url3.setUrlType("C");
			url3.setUrl1(url);
			url3.setEndtime(url.getEndtime());
			urlService.addUrl(url3);
//			Document document = new Document(0, fileUploadFileName,"C");
//			documentService.addDocument(document);
		}
		return SUCCESS;
	}
	
	public String addHandPlan() throws Exception {
		if(fileUploadFileName!=null){
			int num1 = (int) Math.round(Math.random() * 8999 + 1000);
//			fileUploadFileName = "NO" + ":" + num1 + " " + fileUploadFileName;
			ServletContext servletContext = ServletActionContext
					.getServletContext();
			String dir = servletContext.getRealPath("/WEB-INF/upload_files/"
					+ fileUploadFileName);
			InputStream is = new BufferedInputStream(
					new FileInputStream(fileUpload));
			OutputStream os = new BufferedOutputStream(new FileOutputStream(dir));
			byte[] bytes = new byte[4048];
			int len = -1;
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
			os.close();
			is.close();
		}
//		System.out.println(urlList.size());
//		
//		System.out.println("1111111111111");
//		System.out.println(fileUploadFileName);
//		System.out.println(message);
		Task task1 = new Task();
		User user1 = (User) ActionContext.getContext().getSession().get("user");
		int url_id = (Integer) ActionContext.getContext().getSession()
				.get("urlIdAdd");
		int taskId = (Integer) ActionContext.getContext().getSession()
				.get("taskId");
		task1 = taskService.getTaskBy1Id(taskId);
		Url url2 = new Url();
		url2.setId(url_id);
		url.setDocUrl(fileUploadFileName);
		url.setAdvance(message);
		url.setStates("已完成");
		url.setSubtime(new Date());
		urlService.updateUrlDoc(url);
		for(int i=0;i<urlList.size();i++){
			System.out.println(urlList.get(i).getEndtime());
			urlList.get(i).setUrlType("D");
			urlList.get(i).setUrl1(url2);
			urlList.get(i).setTask(task1);
			urlService.addUrl(urlList.get(i));
//			Document document = new Document(0, fileUploadFileName,"D");
//			documentService.addDocument(document);
		}
		return "success";
	}

	public String addHandDo() throws Exception {
//		System.out.println("fileUploadFileName"+fileUploadFileName);
		if(fileUploadFileName!=null){
			int num = (int) Math.round(Math.random() * 8999 + 1000);
//			fileUploadFileName = "NO" + ":" + num + " " + fileUploadFileName;
			ServletContext servletContext = ServletActionContext
					.getServletContext();
			String dir = servletContext.getRealPath("/WEB-INF/upload_files/"
					+ fileUploadFileName);
			InputStream is = new BufferedInputStream(
					new FileInputStream(fileUpload));
			OutputStream os = new BufferedOutputStream(new FileOutputStream(dir));
			byte[] bytes = new byte[4048];
			int len = -1;
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
			os.close();
			is.close();
		}
		

//		System.out.println(fileUploadFileName);
//		System.out.println(url.getId());
		url.setDocUrl(fileUploadFileName);
		url.setStates("已完成");
		url.setSubtime(new Date());
//		System.out.println(url);
		urlService.updateUrlDoc(url);
		return "success";
	}

	public String addHandCheck() throws Exception {
		if(fileUploadFileName!=null){
			int num = (int) Math.round(Math.random() * 8999 + 1000);
//			fileUploadFileName = "NO" + ":" + num + " " + fileUploadFileName;
			
			ServletContext servletContext = ServletActionContext
					.getServletContext();
			String dir = servletContext.getRealPath("/WEB-INF/upload_files/"
					+ fileUploadFileName);
			InputStream is = new BufferedInputStream(
					new FileInputStream(fileUpload));
			OutputStream os = new BufferedOutputStream(new FileOutputStream(dir));
			byte[] bytes = new byte[4048];
			int len = -1;
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
			os.close();
			is.close();
		}
		

//		System.out.println(url.getId());
		url.setDocUrl(fileUploadFileName);
		url.setStates("已完成");
		url.setSubtime(new Date());
//		System.out.println(url);
		urlService.updateUrlDoc(url);
		return "success";
	}
	
	public String addHandA() throws Exception {
		if(fileUploadFileName!=null){
			int num = (int) Math.round(Math.random() * 8999 + 1000);
//			fileUploadFileName = "NO" + ":" + num + " " + fileUploadFileName;
			ServletContext servletContext = ServletActionContext
					.getServletContext();
			String dir = servletContext.getRealPath("/WEB-INF/upload_files/"
					+ fileUploadFileName);
			InputStream is = new BufferedInputStream(
					new FileInputStream(fileUpload));
			OutputStream os = new BufferedOutputStream(new FileOutputStream(dir));
			byte[] bytes = new byte[4048];
			int len = -1;
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
			os.close();
			is.close();
		}
		
		int url_id = (Integer) ActionContext.getContext().getSession()
				.get("urlIdAdd");
		int taskId = (Integer) ActionContext.getContext().getSession()
				.get("taskId");
		Task task1 = new Task();
		task1 = taskService.getTaskBy1Id(taskId);
		Url url = new Url();
		Url url1 = new Url();
		
		if (url_id == 0) {
			url1 = null;
		} else {
			url1.setId(url_id);
			url.setUrl1(url1);
		}
		url.setDocUrl(fileUploadFileName);
		url.setStates("已完成");
		url.setUrlType("A");
		url.setTask(task1);
		Date date =new Date();
		url.setEndtime(date);
		url.setSubtime(date);
		urlService.addUrl(url);
//		Document document = new Document(0, fileUploadFileName,"A");
//		documentService.addDocument(document);
		return "success";
	}
	
	public String changeTask() {
		// 更换下级人员
		User user1 = (User) ActionContext.getContext().getSession().get("user");
		int projectId = (Integer) ActionContext.getContext().getSession()
				.get("projectId");
		Task task = new Task();
		Project project = new Project();
		project.setId(projectId);
		task.setProject(project);
		task.setUserUpper(user1);
		int updateId = (Integer) ActionContext.getContext().getSession()
				.get("updateId");
		User user2 = new User();
		user2.setId(user.getId());
		task.setUserLower(user2);
		if (taskService.getTask(task).size() < 1) {
			taskService.addTask(projectId, user1.getId(), user.getId());
		}
		task = taskService.getTask(task).get(0);
		Url url = new Url();
		url.setId(updateId);
		url.setTask(task);
		urlService.updateUrlByTask(url);
		System.out.println("urlid" + updateId);

		// 更换上级关系
		// 通过url_id获得URL
		List<Url> listUrl = urlService.getUrlByUrl_Id(updateId);
		System.out.println("数量为" + listUrl.size());
		for (int i = 0; i < listUrl.size(); i++) {
			task = listUrl.get(i).getTask();
			if (("PDCA").equals(listUrl.get(i).getUrlType())) {
				task.setUserUpper(user);
				if (taskService.getTask(task).size() < 1) {
					taskService.addTask(projectId, user.getId(), task
							.getUserLower().getId());
				}
			} else {
				task.setUserLower(user);
				if (taskService.getTask(task).size() < 1) {
					taskService.addTask(projectId, task.getUserUpper().getId(),
							user.getId());
				}
			}
			task = taskService.getTask(task).get(0);
			url.setId(listUrl.get(i).getId());
			url.setTask(task);
			urlService.updateUrlByTask(url);

		}
		return "success";
	}

	public String changeTaskByMyself() {
		User user1 = (User) ActionContext.getContext().getSession().get("user");
//		System.out.println("user1="+user1);
//		System.out.println("11111");
//		System.out.println(user);	
		int projectId = (Integer) ActionContext.getContext().getSession()
				.get("projectId");
		int updateId = (Integer) ActionContext.getContext().getSession()
				.get("urlIdAdd");
//		System.out.println(projectId + "    " + updateId);
		Url url = new Url();
		url = urlService.getUrlByUrlId(updateId);
		Task task = new Task();
		task = url.getTask();
		task.setUserLower(user);
		if (taskService.getTask(task).size() < 1) {
			taskService.addTask(projectId, task.getUserUpper().getId(),
					user.getId());
		}
		task = taskService.getTask(task).get(0);
		url.setTask(task);
		urlService.updateUrlByTask(url);
//		System.out.println("url="+urlService.getUrlByUrlId(updateId).toString());
//		System.out.println("urlid=" + updateId);
		String receivername = userService.getUserById(user.getId()).getRealname();
		Deliver deliver = new Deliver();
		Date date = new Date();
		Project deliverproject = projectService.getProjectByID(projectId);
		deliver.setDispatcher(user1.getRealname());
		deliver.setReceiver(receivername);
		deliver.setProjectId(deliverproject);
		deliver.setPublishTime(date);
		deliver.setContent(url.getDocUrl());
		deliverService.addDeliver(deliver);
		
		//deliverService.addDeliver(projectId, user1.getId(), user1.getId(), datatime,);
		// 更换上级关系
		// 通过url_id获得URL
		List<Url> listUrl = urlService.getUrlByUrl_Id(updateId);
//		System.out.println("数量为" + listUrl.size());
		for (int i = 0; i < listUrl.size(); i++) {
			
			task = listUrl.get(i).getTask();
			if (("PDCA").equals(listUrl.get(i).getUrlType())) {
				task.setUserUpper(user);
				if (taskService.getTask(task).size() < 1) {
					
					taskService.addTask(projectId, user.getId(), task
							.getUserLower().getId());
				}
			} else {
				task.setUserLower(user);
				if (taskService.getTask(task).size() < 1) {
					taskService.addTask(projectId, task.getUserUpper().getId(),
							user.getId());
				}
			}
			task = taskService.getTask(task).get(0);
			url.setId(listUrl.get(i).getId());
			url.setTask(task);
			urlService.updateUrlByTask(url);
		}
		return "success";

	}

}
