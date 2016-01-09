package com.etc.pdca.dao;

import java.util.List;
import java.util.Map;

import com.etc.pdca.entity.Deliver;

public interface DeliverDao {
	void addDeliver(Deliver deliver);
	List<Deliver> getDeliverlist();
	List<Deliver> getDeliverbyProjectId(int projectId);
}
