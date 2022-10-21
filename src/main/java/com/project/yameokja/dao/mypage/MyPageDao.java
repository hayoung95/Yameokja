package com.project.yameokja.dao.mypage;

import java.util.List;   

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

public interface MyPageDao {
	//회원의 정보
	public Member getMember(String userId);
	//작성글 리스트
	public List<Post> myPagePost(String userId, int startRow, int num);
	//작성글 갯수
	public int getPostListCount(String userId);
	//동네글 리스트 겸 별점 댓글 리스트
	public List<Community> myPageCommunity(String memberId, int startRow, int num, String status);
	//작성글 갯수
	public int getCommunityListCount(String memberId);
	//찜 리스트
	public List<Store> myPageStore(String memberId);
	
}