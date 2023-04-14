<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.NoticeBoardFileVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>

<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-flag-alt page-icon"></i>
	<span class="fw-light" onclick="javascript:history.back();" style="cursor:pointer;">학사 공지사항  / </span>
	상세
</h4>

<div class="card" style="height: auto;">
	<div class="card-body">
		<div class="row">
			<div class="col-lg-10 mx-auto">
				<div class="row g-3">
				<br /><br />
				<input type="hidden" id="nbNum" value="${data.nbNum }" />
	              <div class="col-md-12" style="font-size: 2.5em;">
	              	${data.nbTitle}
	              </div>
	              <hr />
	              <div class="col-md-6">
	                <label class="form-label" for="fullname">공지종류 &nbsp;&nbsp;</label>
	                <input type="hidden" id="cate" value="${data.nbCate}" />
	                <span style="font-size: 1.0em;">${data.nbCate}공지</span>
	              </div>
	              <div class="col-md-6">
	                <label class="form-label" for="fullname">작성자 &nbsp;&nbsp;</label>
	                <span style="font-size: 1.0em;">관리자</span>
	              </div>
	              <div class="col-md-6">
	                <label class="form-label" for="email">작성일 &nbsp;&nbsp;</label>
	                <span style="font-size: 1.0em;"><fmt:formatDate pattern="yyyy.MM.dd" value="${data.nbDt}"/></span>
	              </div>
	              <div class="col-md-6">
	                <label class="form-label" for="email">조회수 &nbsp;&nbsp;</label>
	                <span style="font-size: 1.0em;">${data.nbHit }</span>
	              </div>
	              <hr />
	              <div class="col-md-10" style="height: auto;">
	                ${data.nbContent}
	              <br />
	              </div>
	              <br />


	              <c:set var="list" value="${data.fileVOList}" />
	              <c:if test="${list == null || list.size() == 0}">
	                <br /><br /><br /><br /><br /><br />
	                <hr />
	                <label class="form-label" for="email" style="font-weight: bold;">첨부파일 &nbsp;&nbsp;</label>
	              	<p>첨부된 파일이 없습니다.<p>
	              </c:if>

	              <c:forEach var="nfVO" items="${data.fileVOList}" varStatus="stat">
	              <c:if test="${nfVO.nbfCate == 2}">
	              <div class="col-md-10" style="height: auto;">
	                <img src="/resources/upload${nfVO.nbfFilenm}" style="width:100%;" />
	              </div>
	              </c:if>
	              </c:forEach>
	              <hr />
	              <c:forEach var="nfVO" items="${data.fileVOList}" varStatus="stat">
	              <div class="col-md-12">
	              <c:if test="${nfVO.nbfCate == 1}">
	                <label class="form-label" for="email" style="font-weight: bold;">첨부파일 &nbsp;&nbsp;</label>
	                <label class="form-label" for="">
	                	${fn:substringAfter(nfVO.nbfFilenm, '_')} &nbsp;&nbsp;
	                </label>
	                <a href="/downloadFile?fileName=${nfVO.nbfFilenm}" type="button" class="btn btn-xs btn-dark">다운로드</a>
	              </c:if>
	              </div>
	              </c:forEach>

	              <c:set var="list" value="${data.fileVOList}" />
	              <c:if test="${list.size() > 0}">
	              <hr />
	              </c:if>

	              <c:if test="${auth != 'ROLE_ADMIN'}">
	              <div class="col-md-10">
	              </div>
	              <div class="col-md-2">
	              <a style="margin-left: 55px;" href="/acadNotice/list?cate=${data.nbCate}" class="btn btn-sm btn-secondary">목록보기</a>
	              </div>
				  </c:if>
				  <c:if test="${auth == 'ROLE_ADMIN'}">
	              <div class="col-md-9">
	              <a href="/acadNotice/list?cate=${data.nbCate}" class="btn btn-sm btn-secondary">목록보기</a>
	              </div>
	              <div class="col-md-3">
	              <a href="/acadNotice/update?nbNum=${data.nbNum}" style="margin-left: 55px;" class="btn btn-sm btn-warning">수정하기</a>
	              <a id="deleteBtn" href="#" class="btn btn-sm btn-danger">삭제하기</a>
	              </div>
	              </c:if>
	            </div>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	$("#deleteBtn").on("click", function(){
		nbNum = $("#nbNum").val();
		data = {"nbNum" : nbNum};
		cate = $("#cate").val();
		$.ajax({
			url : "/acadNotice/delete",
			type: "post",
			data : data,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
					if(result > 0){
					  Swal.fire({
						    title: '정삭적으로 삭제되었습니다.',
						    showClass: {
						      popup: 'animate__animated animate__bounceIn'
						    },
						    icon: 'success',
						    customClass: {
						      confirmButton: 'btn btn-primary'
						    },
						    buttonsStyling: false
						  }).then(function(){
							  location.href = "/acadNotice/list?cate=" + cate;
						  });
					}
				}
		});
	});
});
</script>