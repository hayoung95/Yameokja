<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>야먹자</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link rel="stylesheet" type="text/css" href="resources/css/index.css" />
  	<link rel="stylesheet" type="text/css" href="resources/css/userProfile.css" />
<!-- <script type="text/javascript" src="resources/js/chat.js"></script> -->
  	<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<form name="blockListForm" id="blockListForm">
	<input type="hidden" name="memberId" value="${ member.memberId }" />
</form>
<div class="row">
<!-- 좌측날개 -->
<div class="d-none d-sm-block col-sm-2 col-lg-3"></div>
	<!-- 센터 -->
	<div class="col-12 col-sm-8 col-lg-6 p-5">
	<form name="blockListForm" id="blockListForm">
		<input type="hidden" name="memberId" value="${ member.memberId }" />
	</form>
	<!-- 	profileHeader -->
	<div class="fullFrame col-12">
		<div class="profileHeaderFrame col-12">
			<div class="profileheader col-12 py-3">김핑구짱짱맨 님의 프로필</div>
		</div>	
		<!-- 	profileHeader 끝-->
		<!-- 	profileFrame1 -->
		<div class="profileFrame1 col-12">
			<div class=" inlineBlock col-4 p-3">
				<img alt="프로필 사진" class="profileIMG col-12" src="resources/IMG/mypage/likeIMG.PNG">
			</div><div class="profileCategoryFrame inlineBlock col-8">
				<div class="col-12">
					<div class="profileheader col-12">좋아하는 음식 종류</div>
				<div class="col-12">
					<div class=" inlineBlock"><img  class="profileCategoryIMG"alt="카테고리음식IMG" src="resources/IMG/mypage/likeIMG.PNG"><br>한식</div>
					<div class=" inlineBlock"><img  class="profileCategoryIMG"alt="카테고리음식IMG" src="resources/IMG/mypage/likeIMG.PNG"><br>양식</div>
					<div class=" inlineBlock"><img  class="profileCategoryIMG"alt="카테고리음식IMG" src="resources/IMG/mypage/likeIMG.PNG"><br>중식</div>
				</div>
				</div>
			</div>
		</div><!-- 	profileFrame1 끝-->
		
		<!-- 	profileFrame2 시작-->
			<div class="profileFrame2 col-12 mt-3">
			<div class="row">
				<div class="myLocationTh col-4 p-1">동네</div>
				<div class="myLocationTd col-8 p-1">서울시 관악구</div>		
			</div>
			<div class="row">
				<div class=" col-6 fw-semibold fs-6 p-1">가입일</div>
				<div class=" col-6 p-1"> D+100</div>		
			</div>
			<div class="row">
				<div class=" col-6 fw-semibold p-1">작성한리뷰총합</div>
				<div class=" col-6 p-1">500개</div>		
			</div>
			<div class="row">
				<div class=" col-6 fw-semibold p-1">받은추천총합</div>
				<div class=" col-6 p-1">1,000개</div>		
			</div>
			<div class="row">
				<div class=" col-6 fw-semibold p-1">활동내역구경가기 -></div>
				<div class=" col-6 p-1"> 종모양이미지</div>		
			</div>
		</div>
		<!-- 	profileFrame2 끝-->
		<div class="buttonFrame text-center col-12 mt-3 py-3">
			<button type="button" class="closeButton btn col-6">확&nbsp;&nbsp;인</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="chatButton btn col-6 ">채팅신청</button>
<!-- 			<button type="button" class="UnblockIdButton btn">차단 해제</button> -->
		</div>
	</div>
	</div>

	</div>
<!-- 우측날개 -->
<div class="d-none d-sm-block col-sm-2 col-lg-3"></div>
</body>
</html>