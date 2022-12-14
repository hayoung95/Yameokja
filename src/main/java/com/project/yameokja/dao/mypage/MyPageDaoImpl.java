package com.project.yameokja.dao.mypage;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Post;

// 이 클래스가 데이터 액세스(데이터 저장소) 계층의 컴포넌트(Bean) 임을 선언한다.
@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	private static final String NAME_SPACE = "com.project.yameokja.MyPageMapper";
	
	private SqlSessionTemplate sqlSession;

	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Post> myPagePost(String userId, int startRow, int num) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("startRow", startRow);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE+".myPagePost", params);
		
	}

	@Override
	public int myPagePostCount(String userId) {
		return sqlSession.selectOne(NAME_SPACE+".myPagePostCount", userId);
	}

	@Override
	public void deleteMyPagePost(int postNo) {
		sqlSession.delete(NAME_SPACE+ ".deleteMyPagePost", postNo);
	}

	@Override
	public List<Post> myPageReply(String userId, int startRow, int num) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("startRow", startRow);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE+".myPageReply", params);
	}

	@Override
	public int myPageReplyCount(String userId) {
		return sqlSession.selectOne(NAME_SPACE+".myPageReplyCount", userId);
	}

	@Override
	public List<Community> myPageCommunity(String userId, int startRow, int num) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("startRow", startRow);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE+".myPageCommunity", params);
	}

	@Override
	public int myPageCommunityCount(String userId) {
		return sqlSession.selectOne(NAME_SPACE+".myPageCommunityCount", userId);
	}

	@Override
	public void deleteMyPageCommunity(int communityNo) {
		sqlSession.delete(NAME_SPACE+ ".deleteMyPageCommunity", communityNo);
	}

	@Override
	public int sumPostUpCount(String userId) {
		return sqlSession.selectOne(NAME_SPACE+ ".sumPostUpCount", userId);
	}

}
