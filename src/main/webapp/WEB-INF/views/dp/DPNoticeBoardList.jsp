<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="org.apache.catalina.Session"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<style>
th{
	font-size: 10em;
}
</style>
<script>
// $(function(){
// 	$("#actions").css("display", "none");
// });
</script>

<%
	UserVO userVO = (UserVO)session.getAttribute("userVO");
	String auth = userVO.getAuth();
%>
<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-chalkboard page-icon"></i>
	학과 공지사항
</h4>

<div class="card">
	<div class="card-datatable table-responsive">
		<div id="DataTables_Table_0_wrapper"
			class="dataTables_wrapper dt-bootstrap5 no-footer">
			<div class="card-header flex-column flex-md-row">
				<div class="head-label text-center">
					<h5 class="card-title mb-0"></h5>
				</div>
				<%
					if(auth.equals("ROLE_TEA")){
				%>
				<a class="btn btn-primary" id="insertBtn" href="/dpNotieBoard/dpNoticeBoardForm">
					<span>
						<i class="bx bx-plus me-sm-1"></i>
						<span class="d-none d-sm-inline-block" style="font-size: 1.0em;">공지사항 등록</span>
					</span>
				</a>
				<%
					}
				%>

			</div>
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="dataTables_length" id="DataTables_Table_0_length">
					</div>
				</div>
				<form>
				<div class="card-body">
				    <div class="row gx-3 gy-2 align-items-center">
				      <div class="col-md-6"></div>
				      <div class="col-md-2">
				        <select id="category" name="category" class="form-select color-dropdown">
				          <option value="all" <c:if test='${param.category == null}'>selected</c:if>>전체</option>
				          <option value="title" <c:if test='${param.category == "title"}'>selected</c:if>>제목</option>
				          <option value="content" <c:if test='${param.category == "content"}'>selected</c:if>>내용</option>
				        </select>
				      </div>
				      <div class="col-md-3">
				          <input id="keyword" name="keyword" value="${param.keyword}" type="text" class="form-control" placeholder="검색어를 입력해주세요.">
			          </div>
				      <div class="col-md-1">
				        <label class="form-label" for="showToastPlacement">&nbsp;</label>
				        <button type="submit" class="btn btn-label-primary">검색</button>
				      </div>
				    </div>
				  </div>
				  </form>
			</div><br />
			<table class="datatables-basic table border-top dataTable no-footer dtr-column table table-hover" style="text-align: center;">
      <thead>
        <tr>
          <th style="font-size: 1.0em; text-align: center;">공지사항</th>
          <th style="font-size: 1.0em; text-align: center;">제목</th>
          <th style="font-size: 1.0em; text-align: center;">작성자</th>
          <th style="font-size: 1.0em; text-align: center;">날짜</th>
          <th style="font-size: 1.0em; text-align: center;">조회수</th>
          <%
			if(auth.equals("ROLE_TEA")){
		  %>
          <th style="font-size: 1.0em; text-align: center;">수정/삭제</th>
		  <%
			}
		  %>

        </tr>
      </thead>
      <tbody class="table-border-bottom-0">
      <c:forEach var="dnVO" items="${data.content}" varStatus="stat">
      	<c:if test="${dnVO.dnRead == 1}">
        <tr>
          <td><span class="badge badge-dot bg-danger me-1"></span>
          	필수공지</td>
          <td><a href="/dpNotieBoard/detailView?dnNum=${dnVO.dnNum}">${dnVO.dnTitle}</a></td>
          <td>${dnVO.name}</td>
          <td><fmt:formatDate pattern="yyyy.MM.dd" value="${dnVO.dnDt}"/></td>
          <td>${dnVO.dnHit}</td>
          <%
			if(auth.equals("ROLE_TEA")){
		  %>
           <td>
			<div class="dropdown">
				<button type="button"
					<c:if test="${dnVO.teaNum!=username}">disabled</c:if>
				 class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
				<div class="dropdown-menu">
				    <a class="dropdown-item" href="/dpNotieBoard/update?dnNum=${dnVO.dnNum}"><i class="bx bx-edit-alt me-1"></i>수정하기</a>
				    <a class="dropdown-item" href="/dpNotieBoard/delete?dnNum=${dnVO.dnNum}"><i class="bx bx-trash me-1"></i> 삭제하기</a>
				</div>
			</div>
          </td>
		  <%
			}
		  %>


        </tr>
        </c:if>
      </c:forEach>
      <c:forEach var="dnVO" items="${data.content}" varStatus="stat">
      <c:if test="${dnVO.dnRead == 0}">
        <tr>
          <td>일반공지</td>
          <td><a href="/dpNotieBoard/detailView?dnNum=${dnVO.dnNum}">${dnVO.dnTitle}</a></td>
          <td>${dnVO.name}</td>
          <td><fmt:formatDate pattern="yyyy.MM.dd" value="${dnVO.dnDt}"/></td>
          <td>${dnVO.dnHit}</td>
          <%
			if(auth.equals("ROLE_TEA")){
		  %>
           <td>
			<div class="dropdown">
				<button type="button"
					<c:if test="${dnVO.teaNum!=username}">disabled</c:if>
				 class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
				<div class="dropdown-menu">
				    <a class="dropdown-item" href="/dpNotieBoard/update?dnNum=${dnVO.dnNum}"><i class="bx bx-edit-alt me-1"></i>수정하기</a>
				    <a class="dropdown-item" href="/dpNotieBoard/delete?dnNum=${dnVO.dnNum}"><i class="bx bx-trash me-1"></i> 삭제하기</a>
				</div>
			</div>
          </td>
		  <%
			}
		  %>
        </tr>
        </c:if>
        </c:forEach>
      </tbody>
    </table>
    <br /><br />
	<div class="">
		<div class="col">
			<div class="demo-inline-spacing">
				<!-- Basic Square Pagination -->
				<nav aria-label="Page navigation">
					<ul class="pagination pagination-round pagination-primary justify-content-center">
						<li class="page-item first <c:if test="${data.startPage -1 <= 0}">disabled</c:if>" >
							<a href="/dpNotieBoard/dpNoticeBoardList?keyword=${param.keyword}&currentPage=${data.startPage -1}&size=${param.size}"
								 class="page-link">
							<i class="tf-icon bx bx-chevrons-left"></i>
							</a>
						</li>
						<c:forEach var="pNO" begin="${data.startPage}" end="${data.endPage}">
						<li class="page-item
							<c:if test='${param.currentPage==pNO}'>active</c:if>">
							<a class="page-link"
							href="/dpNotieBoard/dpNoticeBoardList?keyword=${param.keyword}&currentPage=${pNO}&size=${param.size}"
							>${pNO}</a>
						</li>
						</c:forEach>
						<li class="page-item last <c:if test="${data.endPage ge data.totalPages}">disabled</c:if>">
							<a class="page-link"
							href="/dpNotieBoard/dpNoticeBoardList?keyword=${param.keyword}&currentPage=${data.endPage +1}&size=${param.size}"
							>
							<i class="tf-icon bx bx-chevrons-right"></i>
							</a>
						</li>
					</ul>
				</nav>
				<!--/ Basic Square Pagination -->
			</div>
		</div>
	</div>


		</div>
	</div>
</div>