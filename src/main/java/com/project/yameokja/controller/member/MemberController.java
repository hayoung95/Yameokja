package com.project.yameokja.controller.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.yameokja.domain.Member;
import com.project.yameokja.service.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;

	private static final String DEFAULT_PATH = "/resources/upload/userProfile";

	// 회원가입 뷰
	@RequestMapping("/memberJoinForm")
	public String MemberJoinForm() {
		
		return "member/memberJoinForm";
	}
	
	// 회원가입 프로세스
	@RequestMapping(value="/memberJoinProcess", method=RequestMethod.POST)
	public String addMember(String memberName, String memberId, String memberNickname,
			String pass1, String pass2, String email, String domain, String agency,
			String phone1, String phone2, String phone3,	String address1, String address2,
			@RequestParam(value="memberPhoto", required=false) MultipartFile mfMemberPhoto,
			@RequestParam(value="memberFavoriteCategory", required=false, defaultValue = "null")
			String memberFavoriteCategory, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Member m = new Member();

				
		m.setMemberName(memberName);
		m.setMemberId(memberId);
		m.setMemberNickname(memberNickname);
		m.setMemberPassword(pass1);
		m.setMemberEmail(email + "@" + domain);
		m.setMemberMobile(agency + " " + phone1 + "-" + phone2 + "-" +phone3);
		m.setMemberAddress(address1 + " " + address2);
		m.setMemberFavoriteCategory(memberFavoriteCategory);
		
		// 파일 업로드
		System.out.println("MemberJoinController - originName : " + mfMemberPhoto.getOriginalFilename());
		System.out.println("MemberJoinController - name : " + mfMemberPhoto.getName());
		
		/*
		if(!mfMemberPhoto.isEmpty()) {
		
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" ; 

		}
		*/
		
		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다.');");
		out.println("</script>");
		
		memberService.addMember(m);
		
		return "redirect:/main";
	};

	// 아이디 중복확인
	@RequestMapping("/overlapIdCheck")
	public String memberidCheck(Model model, String memberId,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(memberId.length() < 5) {
			out.println("<script>");
			out.println("alert('아이디는 5자 이상 입력해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		
		boolean overlap = memberService.idOverlapCheck(memberId);

		model.addAttribute("overlap", overlap);
		model.addAttribute("memberId", memberId);

		return "member/overlapIdCheck";
	}
	
	
	
	// 닉네임 중복확인
	@RequestMapping("/overlapNicknameCheck")
	public String memberNicknameCheck(Model model, String memberNickname,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(memberNickname.length() < 2) {
			out.println("<script>");
			out.println("alert('닉네임은 2자 이상 입력해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		
		boolean overlap = memberService.nicknameOverlapCheck(memberNickname);
		
		model.addAttribute("overlap", overlap);
		model.addAttribute("memberNickname", memberNickname);
		
		return "member/overlapNicknameCheck";
	}
	
	
	


}