package com.project.yameokja.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.domain.Store;
import com.project.yameokja.dao.StoreDao;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao StoreDao;
	
	public void setStoreDao(StoreDao StoreDao) {
		this.StoreDao = StoreDao;
	}

	@Override
	public List<Store> storeList() {
		return StoreDao.StoreList();
	}

}