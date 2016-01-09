package com.etc.pdca.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.etc.pdca.dao.DeliverDao;
import com.etc.pdca.entity.Deliver;
import com.etc.pdca.entity.User;
import com.etc.pdca.util.MybatisUtil;

public class DeliverService {
	private SqlSession sqlSession;
	private DeliverDao deliverDao;
	
	public DeliverService() {
		sqlSession = MybatisUtil.openSession();
		this.deliverDao = sqlSession.getMapper(DeliverDao.class);
	}
	@Test
	public void addDeliver(Deliver deliver){
		/*Map<String,Object> map = new HashMap<String,Object>();
		map.put("project_id", projectId);
		map.put("dispatcher_id",dispatcherId);
		map.put("receiver_id", receiverId);
		map.put("content", content);
		map.put("dispather_time", datatime);*/
		
		deliverDao.addDeliver(deliver);
		sqlSession.commit();
	}
	public List<Deliver> getDeliverlist(){
		List<Deliver> deliverList = deliverDao.getDeliverlist();
		return deliverList;
	}
	public List<Deliver> getDeliverbyProjectId(int projectId){
		return deliverDao.getDeliverbyProjectId(projectId);
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		sqlSession.close();
	}
}
