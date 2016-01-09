package com.etc.pdca.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etc.pdca.dao.BulletinDao;
import com.etc.pdca.entity.Bulletin;
import com.etc.pdca.util.MybatisUtil;

public class BulletinService {
	private SqlSession sqlSession;
	private BulletinDao bulletinDao;
	
	public BulletinService() {
		sqlSession = MybatisUtil.openSession();
		this.bulletinDao = sqlSession.getMapper(BulletinDao.class);
	}
	
	public List<Bulletin> getBulletinList(){
		List<Bulletin>  list = bulletinDao.getBulletinList();
		return list;
	}
	public void  addBulletin(Bulletin bulletin){
		bulletinDao.addBulletin(bulletin);
		sqlSession.commit();
	}
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		sqlSession.close();
	}
}
