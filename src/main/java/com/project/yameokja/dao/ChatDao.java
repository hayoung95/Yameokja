package com.project.yameokja.dao;

import java.util.List;

import com.project.yameokja.domain.Chat;

public interface ChatDao {

	List<String> chatIds(String memberId);

	Chat chatLists(String chatIds);
	
}