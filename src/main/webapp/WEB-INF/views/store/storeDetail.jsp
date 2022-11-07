<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="resources/css/storeDetail.css" />
<article>

<div class="row py-3">
	<form name="storeDetailForm" id="storeDetailForm">
		<input type="hidden" name="storeNo" value="${ store.storeNo }">
		<input type="hidden" name="categoryNo" value="${ store.categoryNo }">
	</form>
	
<!-- 	fullFrame start-->
	<div class="col-12 p-2">
	
<!-- 	store info start -->
	<div class="row border rounded-3 p-1 text-center d-flex justify-content-center m-0">
		<div class="row border-bottom pb-2 mb-2">
			<div class="col-4 text-start p-0">
				<div class="col-12 fs-4 fw-semibold text-secondary">${store.storeName }</div>
				<div class="col-12 fs-7 fw-semibold text-secondary">
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					<i class="fa fa-star" aria-hidden="true"></i>
					(5.0)
				</div>
				<div class="col-12"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;${store.storeReadCount }</div>
				<div class="col-12"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;&nbsp;${store.storeReviewCount }</div>	
				<div class="col-12"><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;${store.storeBookmarks }</div>		
			</div>
			<div class="col-8">
			<div class="row">
				<div class="col border rounded-3 p-1 m-1"><img src="/yameokja/resources/IMG/store/${ s.storeFileMain }" class="img-thumbnail rounded float-start" alt="..."></div>
				<div class="col border rounded-3 p-1 m-1"><img src="/yameokja/resources/IMG/store/${ s.storeFileMenu }" class="img-thumbnail rounded float-start" alt="..."></div>
				<div class="col border rounded-3 p-1 m-1"><img src="https://picsum.photos/200" class="img-thumbnail rounded float-start" alt="..."></div>		
			</div>
			</div>
		</div>
		<div class="row text-start">
			<div class="col-6">
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">주소</div>
					<div class="col-8 text-secondary fs-7">${ store.storeAddress }</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">전화번호</div>
					<div class="col-8 text-secondary fs-7">${ store.storePhone }</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">음식종류</div>
					<div class="col-8 text-secondary fs-7">${ store.categoryNo }</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">주차</div>
					<div class="col-8 text-secondary fs-7">${ store.storeParking }</div>
				</div>
			</div>
			<div class="col-6 border-start ps-4">
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">영업시간</div>
					<div class="col-8 text-secondary fs-7">
						<div class="col">${ store.storeTime }</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4 text-secondary fs-7 fw-bold">휴무일</div>
					<div class="col-8 text-secondary fs-7">${ store.storeDayOff }</div>
				</div>
				<div class="row">
					<div class="col-12 text-secondary fs-7">가게 사정에 따라 변경 될 수 있음</div>
					<div class="col-12 text-end m-0 p-0 d-inline">
						<i class="fa fa-heart-o" aria-hidden="true"></i>
						<i class="fa fa-link" aria-hidden="true"></i>
						<i class="fa fa-bell" aria-hidden="true" onclick='window.open("reportForm?categoryNo=${store.categoryNo}&reportTarget=${store.memberId}","reportForm","width=500, height=600")'></i>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 	store info end -->

	<div class="text-center col-12 mt-3">
		<span class="postListbutton d-table-cell fs-6 fw-bold px-3 py-2">맛집 리뷰</span>
		<span class="starListbutton d-table-cell fs-6 fw-bold px-3 py-2"><a href="storeDetailReply?storeNo=${ store.storeNo }">별점 리뷰</a></span> 
	</div>

<!-- 	review start -->	
	<div class="rounded-end rounded-bottom d-inline-block border text-center col-12 p-2">
	<c:if test="${ not empty bestOnePost }">
	<c:forEach var="p" items="${ bestOnePost }">	
		<div class="border text-start p-2 rounded col-12 mb-2">
			<div class="col-12 fw-bold fs-5 text-secondary">${ store.storeName }</div>
			<div class="col-12 fw-bold fs-3 text-secondary"><a href="#">[BEST]${ p.postTitle }</a></div>
			<div class="row my-2 mx-0 justify-content-center">
				<div class="col-2 p-0 m-0">
					<img src="https://picsum.photos/200" class="img-thumbnail rounded-circle text-center profileIMG" alt="...">
				</div>
				<div class="col-5 p-2 m-0">
					<div class="col">${ p.memberNickname }</div>
					<div class="col">${ p.postRegDate }</div>
				</div>
				<div class="col-5 p-0 m-0">
					<div class="col"><i class="fa fa-thumbs-up" aria-hidden="true"></i>&nbsp;&nbsp;${ p.postUpCount }</div>
					<div class="col"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;${ p.postReadCount }</div>
				</div>
			</div>
			<div class="row border-top py-4 m-1">
				<div class="col-5">
					<img src="resources/IMG/LOGOtemporaryIMG.PNG" class="img-thumbnail rounded float-start" alt="...">
					리뷰 관련 사진
				</div>
				<div class="col-7">${ p.postContent }짧아서 추가함. 장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.
				장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.
				장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.
				장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.
				장문의 리뷰내용이 올라갑니다.장문의 리뷰내용이 올라갑니다.</div>
			</div>
			<div class="col-12 text-end">
				<input type="button" class="updateButton text-secondary bg-white" value="수정">
				<input type="button" class="deleteButton text-secondary border-start border-3 bg-white" value="삭제">
			</div>
		</div>
		</c:forEach>
	</c:if>
	<c:if test="${ empty bestOnePost }">
		<div class="col-12 text-center">아직 작성된 글이 없습니다.</div>
	</c:if>
	<c:if test="${ empty bestTwoPost or empty bestThreePost }">
		<div class="col-12 text-center"></div>
	</c:if>
		
<!-- 	best2 -->
	<c:if test="${ not empty bestOnePost and not empty bestTwoPost }">
	<c:forEach var="p" items="${ bestTwoPost }">
			<div class="postFrame border text-center py-2 rounded col-12 mb-2">
				<div class="col-3 mx-2">
					<img src="resources/IMG/LOGOtemporaryIMG.PNG" class="img-thumbnail rounded" alt="...">
				</div>
				<div class="col-9 postContent text-start mx-2">
					<div class="fs-3 fw-bold">
						<a href="#">${ p.postTitle }</a>
					</div>
					<div class="">
						<a href="#">${ p.memberNickname }</a>
					</div>
					<div class="">
						<i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i>
						${ p.postRegDate }
					</div>
					<div class="">
						<i class="fa fa-eye fa-2x" aria-hidden="true"></i> ${ p.postUpCount }
					</div>
					<div class="">
						<i class="fa fa-thumbs-up fa-2x" aria-hidden="true"></i> ${ p.postUpList }
					</div>
				</div>
			</div>
	</c:forEach>
	</c:if>

	<c:if test="${ not empty bestOnePost and not empty bestTwoPost and not empty bestThreePost}">
	<c:forEach var="p" items="${ bestThreePost }">
			<div class="postFrame border text-center py-2 rounded col-12 mb-2">
				<div class="col-3 mx-2">
					<a href="#"><img src="resources/IMG/LOGOtemporaryIMG.PNG" class="img-thumbnail rounded" alt="...">
					</a>
				</div>
				<div class="col-9 postContent text-start mx-2">
					<div class="fs-3 fw-bold">
						<a href="#">${ p.postTitle }</a>
					</div>
					<div class="">
						<a href="#">${ p.memberNickname }</a>
					</div>
					<div class="">
						<i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i>
						${ p.postRegDate }
					</div>
					<div class="">
						<i class="fa fa-eye fa-2x" aria-hidden="true"></i> ${ p.postUpCount }
					</div>
					<div class="">
						<i class="fa fa-thumbs-up fa-2x" aria-hidden="true"></i> ${ p.postUpList }
					</div>
				</div>
			</div>
	</c:forEach>
	</c:if>					
	
	</div>
	<div class="row text-end">
		<div class="col-12 py-3">
			<div class="d-inline-block storeWhiteFormButton text-start"><a href="storeWrite" class="py-1 px-3">글 쓰기</a></div>
			<div class="d-inline-block storeDetailPostButton text-end"><a href="storeDetailList?storeNo=${ store.storeNo }" class="py-1 px-3">리뷰 전체보기</a></div>
			<div class="d-inline-block storeListButton text-end"><a href="#storeList?categoryNo=?&pageNum=?" class="py-1 px-3">가게 목록으로</a></div>
		</div>
	</div>
<!-- 	review end -->

<!-- 	fullFrame end-->			
	</div>
</div>
</article>