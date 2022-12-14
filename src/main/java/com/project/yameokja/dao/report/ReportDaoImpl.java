package com.project.yameokja.dao.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.project.yameokja.mappers.ReportMapper";

	// 신고 입력
	@Override
	public void addReport(Report report) {
		sqlSession.insert(NAME_SPACE + ".addReport", report);
	}

	// 신고 목록 조회
	@Override

	public List<Report> reportList(int memberLevel, String memberId, int categoryNo, String reportPunishCheck, String type, String keyword, int startRow, int num) {
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("reportPunishCheck", reportPunishCheck);
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("startRow", startRow);
		map.put("num", num);
		map.put("memberId", memberId);
		map.put("memberLevel", memberLevel);
		System.out.println("memberLevel"+memberLevel);
		System.out.println("memberId"+memberId);
		return sqlSession.selectList(NAME_SPACE + ".reportList", map);
	}
	
	
	// 신고목록 수 조회
	@Override
	public int reportCount(int memberLevel, String memberId, int categoryNo, String reportPunishCheck, String type, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("reportPunishCheck", reportPunishCheck);
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("memberId", memberId);
		map.put("memberLevel", memberLevel);
		
		return sqlSession.selectOne(NAME_SPACE + ".reportCount", map);
	}


	@Override
	public Report getReport(int reportNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getReport", reportNo);
	}

	@Override
	public void reportUpdate(Report report) {
		sqlSession.update(NAME_SPACE+ ".reportUpdate", report);
	}

	@Override
	public void deleteReport(int reportNo) {
		sqlSession.delete(NAME_SPACE+ ".deleteReport", reportNo);
	}

	@Override
	public void memberPermanenSuspension(String memberId) {
		sqlSession.update(NAME_SPACE+ ".memberPermanenSuspension", memberId);
	}
	
}
