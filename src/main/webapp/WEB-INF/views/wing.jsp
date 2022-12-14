<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="/yameokja/resources/js/member.js"></script>

<!-- 윙 버튼 -->
<a id="wingButton" class="d-block d-lg-none btn">
	<span class="fa-stack fa-lg">
		<i class="fa fa-circle fa-stack-2x headerColor"></i>
		<i class="fa fa-bars fa-stack-1x fa-inverse"></i>
	</span>
</a>

<!-- 윙 배경 -->
<div id="wingMask" style="display:none;"></div>

<!-- 윙 -->
<div id="wing">
	<div class="row">
		<div class="col-12">	
			<!-- 비로그인 상태 -->
			<c:if test="${ empty sessionScope.memberId }">
				<div class="row">
					<div class="col-3"></div>
					<div class="col-6 text-center pt-5 pb-5">
						<img alt="프로필 사진" class="rounded-circle col-12" src="/yameokja/resources/IMG/member/memberDefault.png">
					</div>
					<div class="col-3"></div>
				</div>
				<div class="col-12 text-white fs-3 fw-semibold text-center">
					로그인을 해주세요
				</div>
				<div class="row px-2 pt-3 pb-4">
					<div class="col-6">
						<a class="col-12 btn btn-light text-small text-secondary rounded-pill border border-2 py-2 px-1" onclick="window.open('/yameokja/loginForm','LoginForm','width=500, height=600')">
							로그인
						</a>
					</div>
					<div class="col-6">
						<a href="/yameokja/memberJoinForm" class="col-12 btn btn-light text-small text-secondary rounded-pill border border-2 py-2 px-1">
							회원가입
						</a>
					</div>
				</div>
			</c:if>
			<!-- 로그인 상태 -->
			<c:if test="${ not empty sessionScope.memberId }">
				<div class="d-flex align-items-center border rounded-circle" style="margin:30px auto; overflow:hidden; width:150px; height:150px;;">
					<img alt="프로필 사진" class="col-12" src="/yameokja/resources/IMG/member/${ sessionScope.member.memberPhoto }">
				</div>
				<div class="col-12 text-white fs-3 fw-semibold text-center">
					${ memberNickname }님<br>
					환영합니다
				</div>
				<div class="row px-2 pt-3 pb-4">
					<div class="col-6">
						<a href="/yameokja/logout" class="wing col-12 btn btn-light text-small text-secondary rounded-pill border border-2 py-2 px-1">
							로그아웃
						</a>
					</div>
					<div class="col-6">
						<a href="/yameokja/myPagePost?userId=${ sessionScope.memberId }" class="wing col-12 btn btn-light text-small text-secondary rounded-pill border border-2 py-2 px-1">
							마이페이지
						</a>
					</div>
				</div>
				
				<c:if test="${ sessionScope.member.memberLevel >= 7}">
					<div class="col-12 pb-2">
						<a class="text-warning wing" href="/yameokja/admin/adminMember">
							<i class="fa fa-cog" aria-hidden="true"></i> 관리자 페이지
						</a>
					</div>
				</c:if>
			</c:if>
			
			<div class="col-12 fs-5 fw-semibold p-1">
				<a href="/yameokja/main" class="wing">메인 페이지</a>
			</div>
			<div class="col-12 fs-5 fw-semibold p-1">
				<a href="/yameokja/communityList" class="wing">커뮤니티</a>
			</div>
			<div class="col-12 fs-5 fw-semibold p-1">
				<a href="javascript:;" class="wing" onclick="window.open('/yameokja/chat/chatList','채팅목록','width=500, height=810')">채팅 목록</a>
			</div>
			<div class="col-12 fs-5 fw-semibold p-1">
				<a href="/yameokja/myPageLike?userId=${ sessionScope.memberId }" class="wing">내가 찜한 가게</a>
			</div>
			
			<div class="col-12 fs-6 text-white fw-semibold mt-4 p-1">
				내 주소
			</div>
			<div class="col-12">
				<c:if test="${ not empty sessionScope.memberId }">
					<div class="fw-semibold ps-3 text-warning" id="myAddress">
						<i class="fa fa-map-marker" aria-hidden="true"></i>
						&nbsp;&nbsp;${ sessionScope.member.memberAddress }
					</div>
				</c:if>
				<c:if test="${ empty sessionScope.memberId }">
					<a class="btn text-warning" onclick="window.open('/yameokja/loginForm','LoginForm','width=500, height=600')">
						로그인이 필요합니다
					</a>
				</c:if>
			</div>
			
			<c:if test="${ not empty sessionScope.memberId }">
				<div class="col-12 text-white fs-6 fw-semibold text-start mt-4 mb-1">
					내 주소 변경
				</div>
				<div class="row">
					<span class="col-8">
						<select class="text-center rounded-pill border border-2 text-secondary p-1 me-1" name="address1" id="address1" onchange="addressChange(this)">
							<option>선택</option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
							<option value="울산">울산</option>
							<option value="광주">광주</option>
							<option value="강원">강원</option>
							<option value="세종">세종</option>
							<option value="충북">충북</option>
							<option value="충남">충남</option>
							<option value="경북">경북</option>
							<option value="경남">경남</option>
							<option value="전북">전북</option>
							<option value="전남">전남</option>
							<option value="제주">제주</option>
						</select>
						&nbsp;
						<select class="text-center rounded-pill border border-2 text-secondary p-1" name="address2" id="address2">
							<option>선택</option>
						</select>
					</span>
					<span class="col-4 pe-0">
						<a class="btn btn-light btn-sm rounded-pill border border-2 text-secondary px-3" id="memberChangeAddress">
							변경
						</a>
					</span>
				</div>
			</c:if>	
		</div>
	</div>
</div>

