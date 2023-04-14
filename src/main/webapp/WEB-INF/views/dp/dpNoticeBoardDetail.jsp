<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-chalkboard page-icon"></i>
	<span class="fw-light" onclick="javascript:history.back();" style="cursor:pointer;">학과 공지사항  / </span>
	상세보기
</h4>

<div class="card" style="height: auto;">
	<div class="card-body">
		<div class="row">
			<div class="col-lg-10 mx-auto">
				<div class="row g-3">
				<br /><br />
	              <div class="col-md-12 mt-5" style="font-size: 2.5em;">
	              	${data.dnTitle}
	              </div>
	              <hr />
	              <div class="col-md-8">
	                <label class="form-label" for="fullname">작성자 &nbsp;&nbsp;</label>
	                <span style="font-size: 1.0em;">${data.name}</span>
	              </div>
	              <div class="col-md-6">
	                <label class="form-label" for="email">작성일 &nbsp;&nbsp;</label>
	                <span style="font-size: 1.0em;"><fmt:formatDate pattern="yyyy.MM.dd" value="${data.dnDt}"/></span>
	              </div>
	              <div class="col-md-6">
	                <label class="form-label" for="email">조회수 &nbsp;&nbsp;</label>
	                <span style="font-size: 1.0em;">${data.dnHit }</span>
	              </div>
	              <hr />
	              <div class="col-md-6" style="height: auto;">
	                ${data.dnContent}
	              <br /><br /><br /><br /><br /><br /><br />
	              </div>
	              <hr />
	              <label class="form-label" for="email" style="font-weight: bold;">첨부파일 &nbsp;&nbsp;</label>
	              <c:set var="list" value="${data.dfVOList}" />
	              <c:if test="${list == null || list.size() == 0}">
	              	<p>첨부된 파일이 없습니다.<p>
	              </c:if>
	              <c:forEach var="dfVO" items="${data.dfVOList}" varStatus="stat">
	              <div class="col-md-12">
	                <label class="form-label" for="">
	                	${fn:substringAfter(dfVO.dfNm, '_')} &nbsp;&nbsp;
	                </label>
	                <a href="/downloadFile?fileName=${dfVO.dfNm}" type="button" class="btn btn-sm btn-dark">다운로드</a>
	              </div>
	              </c:forEach>
	              <hr />
	              <c:if test="${data.teaNum != username}">
	              <div class="col-md-10 mb-5">
	              </div>
	              <div class="col-md-2">
	              <a style="margin-left: 55px;" href="/dpNotieBoard/dpNoticeBoardList" class="btn btn-secondary">목록보기</a>
	              </div>
				  </c:if>
				  <c:if test="${data.teaNum == username}">
	              <div class="col-md-9 mb-5">
	              <a href="/dpNotieBoard/dpNoticeBoardList" class="btn btn-secondary">목록보기</a>
	              </div>
	              <div class="col-md-3">
	              <a href="/dpNotieBoard/update?dnNum=${data.dnNum}" style="margin-left: 55px;" class="btn btn-warning">수정하기</a>
	              <a href="/dpNotieBoard/delete?dnNum=${data.dnNum}" class="btn btn-danger">삭제하기</a>
	              </div>
	              </c:if>
	            </div>
			</div>
		</div>
	</div>
</div>