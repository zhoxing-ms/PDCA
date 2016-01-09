package com.etc.pdca.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.etc.pdca.dao.UrlDao;
import com.etc.pdca.entity.Project;
import com.etc.pdca.entity.Url;
import com.etc.pdca.util.MybatisUtil;

public class UrlService {
	private SqlSession sqlSession;
	private UrlDao urlDao;

	public UrlService() {
		sqlSession = MybatisUtil.openSession();
		urlDao = sqlSession.getMapper(UrlDao.class);
	}

	public int addUrl(Url url) {
		urlDao.addUrl(url);
		sqlSession.commit();
		int id = url.getId();
		return id;
	}

	public List<Url> getUrlSH(Url url) {
		List<Url> list = urlDao.getUrlSH(url);
		return list;
	}

	public void updateStates(Url url) {
		urlDao.updateStates(url);
		sqlSession.commit();
	}
	public void updataUrlstates(Url url){
		urlDao.updataUrlstates(url);
		sqlSession.commit();
	}
	// 获取所有任务信息
	public List<Url> getUrlByPDCA(Url url) {
		List<Url> list = urlDao.getUrlByPDCA(url);
		return list;

	}

	// 获取统计数据
	public int getUrlOfCount(Url url) {
		return urlDao.getUrlOfCount(url);
	}

	// 通过url_id获取所有Url
	public List<Url> getUrlOfAllList(Url url) {
		List<Url> list = urlDao.getUrlOfAllList(url);
		return list;
	}

	// 更新进度
	public void updateAdvanceD(int id) {
		urlDao.updateAdvanceD(id);
		sqlSession.commit();
	}

	// 获取下属任务
	public List<Url> getAllListById(Url url) {
		List<Url> list = urlDao.getAllListById(url);
		return list;
	}

	// iji获取下属任务
	public List<Url> getAllListById1(Url url) {
		List<Url> list = urlDao.getAllListById1(url);
		return list;
	}

	public int getUrlCountOfPDCA(Url url) {
		return urlDao.getUrlCountOfPDCA(url);

	}

	public Url getUrlByUrlId(int id) {
		return urlDao.getUrlByUrlId(id);
	}

	public void updateNum(int id, int num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("num", num);
		urlDao.updateNum(map);
		sqlSession.commit();
	}

	public List<Url> getUrlByUserAndProject(int projectId, int userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectId", projectId);
		map.put("userId", userId);
		List<Url> list = urlDao.getUrlByUserAndProject(map);
		return list;
	}

	public List<Url> getUrlByUserAndProjectAndTime(int projectId, Date endtime,
			int userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectId", projectId);
		map.put("endtime", endtime);
		map.put("userId", userId);
		List<Url> list = urlDao.getUrlByUserAndProjectAndTime(map);
		return list;
	}

	public int getUrlCountOfDNum(Url url) {
		return urlDao.getUrlCountOfDNum(url);
	}

	public void updateUrlByTask(Url url) {
		urlDao.updateUrlByTask(url);
		sqlSession.commit();
	}

	public List<Url> getUrlByUrl_Id(int id) {
		List<Url> list = urlDao.getUrlByUrl_Id(id);
		return list;
	}

	public List<Url> getUrlByUrl_Id_PDCA(int id) {
		List<Url> list = urlDao.getUrlByUrl_Id_PDCA(id);
		return list;
	}

	public List<Url> getUrlByUrl_Id_NoPDCA(int id) {
		List<Url> list = urlDao.getUrlByUrl_Id_NoPDCA(id);
		return list;
	}

	public void deleteUrl(int id) {
		urlDao.deleteUrl(id);
		sqlSession.commit();
	}

	public void deleteUrlByProjectId(int id) {
		urlDao.deleteUrlByProjectId(id);
		sqlSession.commit();
	}

	public List<Url> getUrlByProject(int id) {
		List<Url> list = urlDao.getUrlByProject(id);
		return list;
	}

	public int getCountByC(int id) {
		return urlDao.getCountByC(id);
	}

	public int getCountByUpNum(int id) {
		return urlDao.getCountByUpNum(id);
	}

	public void updateUrlDoc(Url url) {
		urlDao.updateUrlDoc(url);
		sqlSession.commit();
	}

	public int getCountOfExecution(int id) {
		return urlDao.getCountOfExecution(id);
	}

	public int getCountOfEarlier(int id) {
		return urlDao.getCountOfEarlier(id);
	}

	public int getCountOfUnfinished(int id) {
		return urlDao.getCountOfUnfinished(id);
	}

	public int getCountOfTimely(int id) {
		return urlDao.getCountOfTimely(id);
	}

	public int getCountOfUnderway(int id) {
		return urlDao.getCountOfUnderway(id);
	}

	public List<Url> getUrlOfDone(int id, int projectId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("projectId", projectId);
		return urlDao.getUrlOfDone(map);
	}

	public List<Url> getUrlOfFinished(int id, int projectId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("projectId", projectId);
		return urlDao.getUrlOfFinished(map);
	}

	public List<Url> getUrlOfUnfinished(int id, int projectId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("projectId", projectId);
		return urlDao.getUrlOfUnfinished(map);
	}

	public int getCountUrlByUserAndProjectAndTimeOfOver(int userId,
			int projectId, Date endtime) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("projectId", projectId);
		map.put("endtime", endtime);
		return urlDao.getCountUrlByUserAndProjectAndTimeOfOver(map);
	}

	public List<Url> getUrlOfAllUserLower(int id) {
		return urlDao.getUrlOfAllUserLower(id);
	}

	public int getUrlOfAllUserLowerByEarlier(int id) {
		return urlDao.getUrlOfAllUserLowerByEarlier(id);
	}

	public int getUrlOfAllUserLowerByTimely(int id) {
		return urlDao.getUrlOfAllUserLowerByTimely(id);
	}

	public int getUrlOfAllUserLowerByUnfinished(int id) {
		return urlDao.getUrlOfAllUserLowerByUnfinished(id);
	}

	public List<Url> urlPage(int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return urlDao.urlPage(map);
	}

	public List<Url> getUrlByPDCAPage(int id, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return urlDao.getUrlByPDCAPage(map);
	}

	public List<Url> getWork(int id) {
		return urlDao.getWork(id);
	}

	// my test
	public List<Url> getOfUnfinished(int id) {

		return (List<Url>) urlDao.getOfUnfinished(id);
	}

	public List<Url> getOfEarlier(int id) {

		return (List<Url>) urlDao.getOfEarlier(id);
	}
	public List<Url> getOfTimely(int id) {

		return (List<Url>) urlDao.getOfTimely(id);
	}

	public List<Url> getOfUnfinished2(int id) {
		return (List<Url>) urlDao.getOfUnfinished2(id);
	}

	public List<Url> getOfUnderway(int id) {
		return (List<Url>) urlDao.getOfUnderway(id);
	}

	public List<Url> getUrlByProjectID(int id) {
		return (List<Url>) urlDao.getUrlByProjectID(id);
	}

	public List<Url> getUrlUpper(int id, int user_upper_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("user_upper_id", user_upper_id);
		return urlDao.getUrlUpper(map);
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		sqlSession.close();
	}
}
