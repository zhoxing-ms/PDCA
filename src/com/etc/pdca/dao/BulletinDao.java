package com.etc.pdca.dao;

import java.util.List;

import com.etc.pdca.entity.Bulletin;

public interface BulletinDao {
	List<Bulletin> getBulletinList();
	void addBulletin(Bulletin bulletin);

}
