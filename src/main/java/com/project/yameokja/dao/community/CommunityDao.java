package com.project.yameokja.dao.community;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Community;

public interface CommunityDao {
	
	// 커뮤니티 글 목록
	public List<Community> getCommunity(int startRow, int num, String type, String keyword, String categoryNo, String location);
	
	// 커뮤니티 글 개수
	public int getCommunityCount(String type, String keyword, String categoryNo, String location);
	
	// 커뮤니티 수다글 작성
	public void addCommunity101(Community co);
	
	// 커뮤니티 수다글 수정
	public void updateCommunity101(Community co);
	
	// 커뮤니티 모집글 작성
	public void addCommunity102(Community co);
	
	// 커뮤니티 모집글 수정
	public void updateCommunity102(Community co);

	// 커뮤니티 글 상세보기
	public Community getCommunityOne(int coNo);
	
	// 커뮤니티 글 삭제
	public void deleteCommunity(int coNo);
	
	// 커뮤니티 글 조회수 증가
	public void addReadCount(int coNo);
	
	// 커뮤니티 댓글 작성
	public void addCommunityReply(Community co);
	
	// 커뮤니티 댓글 수정
	public void updateCommunityReply(Community co);
	
	// 커뮤니티 댓글 출력
	public List<Community> getCommunityReply(Community co);
	
	// 커뮤니티 댓글 삭제
	public void delCommunityReply(int no, int communityParentNo);
	
	// 커뮤니티 댓글 작성자 출력
	public String getCommunityReplyMemberId(int no);
	
	// 모집글 참여 여부 수정
	public void update102PartyMemberIds(String partyMemberIds, int communityNo);
	
}
