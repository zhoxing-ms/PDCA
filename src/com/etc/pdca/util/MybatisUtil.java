package com.etc.pdca.util;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MybatisUtil {
	
	public static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/etc/pdca/config/mybatis.cfg.xml";
		InputStream is = MybatisUtil.class.getClassLoader().getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
	}
	
	public static SqlSession openSession() {
		return sqlSessionFactory.openSession();
	}
	
	public static void main(String[] args) {
		System.out.println(MybatisUtil.openSession());
	}
	
	
}
