package com.project.yameokja.service.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.store.StoreDao;
import com.project.yameokja.domain.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao StoreDao;

	public void setStoreDao(StoreDao storeDao) {
		this.StoreDao = storeDao;
	}
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Override
	public Map<String, Object> storeList(int categoryNo, int pageNum, String type, String keyword, String orderBy) {
		
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0;
		
		listCount = StoreDao.getStoreCount(type, keyword, categoryNo);
		
		System.out.println(listCount + type + keyword);
		
		Map<String, Object> sMap =  new HashMap<String, Object>();
		
		if(listCount > 0) {
			
			List<Store> sList = StoreDao.StoreList(startRow, categoryNo, PAGE_SIZE, keyword, type, orderBy);
			
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP - 
					(currentPage % PAGE_GROUP == 0? PAGE_GROUP : 0) + 1;
			
			
			int endPage = startPage + 9;
			
				if(endPage > pageCount) endPage = pageCount;
				
				sMap.put("sList", sList);
				
				sMap.put("pageCount", pageCount);
				sMap.put("startPage", startPage);
				sMap.put("endPage", endPage);
				
				sMap.put("currentPage", currentPage);
				sMap.put("listCount", listCount);
				sMap.put("pageGroup", PAGE_GROUP);
				
				System.out.println("시작페이지 - 카테고리 번호 - 현재 페이지 : " + startPage+" - " + categoryNo + " - " + currentPage);
				
				return sMap;
		}
		
		return sMap;
	}

	@Override
	public Store getStore(int storeNo) {
		return StoreDao.getStore(storeNo);
	}
	

	@Override
	public void insertStore(Store store) {
		StoreDao.insertStore(store);
	}

	@Override
	public void updateStore(Store store) {
		StoreDao.updateStore(store);
		
	}

	
}
