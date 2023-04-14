<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="org.apache.catalina.Session"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>

<%
	UserVO userVO = (UserVO)session.getAttribute("userVO");
	String auth = userVO.getAuth();
%>

<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-flag-alt page-icon"></i>
	학사공지사항
</h4>

<div class="row fv-plugins-icon-container">
	<div class="col-md-12">

	<%
		if(auth.equals("ROLE_ADMIN")){
	%>
		<ul class="nav nav-pills flex-column mb-3 text-sm-end">
			<li class="nav-item" style="margin-left: 68%; margin-right: 20px;">
		      	<a class="btn btn-outline-primary" href="/acadNotice/noticeForm">공지사항 등록</a>
			</li>
		</ul>
	<%
		}
	%>

		<div class="card">
		<div class="card-header">
		<ul class="nav nav-pills flex-column flex-md-row mb-3">
		      <li class="nav-item">
		      	<a class="nav-link <c:if test="${cate == '일반'}">active</c:if>
		      	" href="/acadNotice/list?cate=일반">일반공지</a>
		      </li>
		      <li class="nav-item">
		      	<a class="nav-link <c:if test="${cate == '학사'}">active</c:if>
		      	" href="/acadNotice/list?cate=학사">학사공지</a>
		      </li>
		      <li class="nav-item">
		      	<a class="nav-link <c:if test="${cate == '장학'}">active</c:if>
		      	" href="/acadNotice/list?cate=장학">장학공지</a>
		      </li>
		</ul>
		</div>
			<div class="card-datatable table-responsive">
				<div id="DataTables_Table_0_wrapper"
					class="dataTables_wrapper dt-bootstrap5 no-footer">
					<div class="row">
						<form action="/acadNotice/list">
						<input type="hidden" id="cate" name="cate" value="${param.cate}" />
							<div class="card-body">
								<div class="row gx-3 gy-2 align-items-center">
									<div class="col-md-6"></div>
									<div class="col-md-2">
										<select id="category" name="category"
											class="form-select color-dropdown">
											<option value=""
												<c:if test='${param.category == null}'>selected</c:if>>전체</option>
											<option value="title"
												<c:if test='${param.category == "title"}'>selected</c:if>>제목</option>
											<option value="content"
												<c:if test='${param.category == "content"}'>selected</c:if>>내용</option>
										</select>
									</div>
									<div class="col-md-3">
										<input id="keyword" name="keyword" value="${param.keyword}"
											type="text" class="form-control" placeholder="검색어를 입력해주세요.">
									</div>
									<input type="hidden" value="${param.cate}" />
									<div class="col-md-1">
										<label class="form-label" for="showToastPlacement">&nbsp;</label>
										<button type="submit" class="btn btn-label-primary">검색</button>
									</div>
								</div>
							</div>
							<sec:csrfInput/>
						</form>
					</div>
					<br />
					<table
						class="datatables-basic table border-top dataTable no-footer dtr-column table table-hover"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="font-size: 1.0em; text-align: center;">공지사항</th>
								<th style="font-size: 1.0em; text-align: center;">제목</th>
								<th style="font-size: 1.0em; text-align: center;">작성자</th>
								<th style="font-size: 1.0em; text-align: center;">날짜</th>
								<th style="font-size: 1.0em; text-align: center;">조회수</th>
								<%
									if (auth.equals("ROLE_ADMIN")) {
								%>
								<th style="font-size: 1.0em; text-align: center;">수정/삭제</th>
								<%
									}
								%>

							</tr>
						</thead>
						<tbody class="table-border-bottom-0">
							<c:forEach var="nbVO" items="${data.content}" varStatus="stat">
								<c:if test="${nbVO.nbRead == 1}">
									<tr>
										<td>
											<span class="badge badge-dot bg-danger me-1"></span>필수공지
										</td>
										<td>
											<a href="/acadNotice/detailView?nbNum=${nbVO.nbNum}">${nbVO.nbTitle}</a>
										</td>
										<td>관리자</td>
										<td><fmt:formatDate pattern="yyyy.MM.dd" value="${nbVO.nbDt}" /></td>
										<td>${nbVO.nbHit}</td>
										<%
											if (auth.equals("ROLE_ADMIN")) {
										%>
										<td>
											<div class="dropdown">
												<button type="button" class="btn p-0 dropdown-toggle hide-arrow"
													data-bs-toggle="dropdown">
													<i class="bx bx-dots-vertical-rounded"></i>
												</button>
												<div class="dropdown-menu">
												    <input type="hidden" id="nbNum" value="${nbVO.nbNum}" />
													<a class="dropdown-item"
														href="/acadNotice/update?nbNum=${nbVO.nbNum}"><i
														class="bx bx-edit-alt me-1"></i>수정하기
													</a>
													<a
													class="dropdown-item" id="deleteBtn"
													href="#">
													<i class="bx bx-trash me-1"></i> 삭제하기</a>
												</div>
											</div>
										</td>
										<%
											}
										%>
									</tr>
								</c:if>
							</c:forEach>
							<c:forEach var="nbVO" items="${data.content}" varStatus="stat">
								<c:if test="${nbVO.nbRead == 0}">
									<tr>
										<td>일반공지</td>
										<td><a href="/acadNotice/detailView?nbNum=${nbVO.nbNum}">${nbVO.nbTitle}</a></td>
										<td>관리자</td>
										<td><fmt:formatDate pattern="yyyy.MM.dd" value="${nbVO.nbDt}" /></td>
										<td>${nbVO.nbHit}</td>
										<%
											if (auth.equals("ROLE_ADMIN")) {
										%>
										<td>
											<div class="dropdown">
												<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
													<i class="bx bx-dots-vertical-rounded"></i>
												</button>
												<div class="dropdown-menu">
												    <input type="hidden" id="nbNum" value="${nbVO.nbNum}" />
													<a class="dropdown-item" href="/acadNotice/update?nbNum=${nbVO.nbNum}">
														<i class="bx bx-edit-alt me-1"></i> 수정하기
													</a>
													<a class="dropdown-item" href="#" id="deleteBtn">
														<i class="bx bx-trash me-1"></i> 삭제하기
													</a>
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
					<br />
					<br />
					<div class="">
						<div class="col">
							<div class="demo-inline-spacing">
								<!-- Basic Square Pagination -->
								<nav aria-label="Page navigation">
									<ul
										class="pagination pagination-round pagination-primary justify-content-center">
										<li
											class="page-item first <c:if test="${data.startPage -1 <= 0}">disabled</c:if>">
											<a
											href="/acadNotice/list?
													cate=${param.cate}&category=${param.category}&keyword=${param.keyword}&currentPage=${data.startPage -1}&size=${param.size}"
											class="page-link"> <i
												class="tf-icon bx bx-chevrons-left"></i>
										</a>
										</li>
										<c:forEach var="pNO" begin="${data.startPage}"
											end="${data.endPage}">
											<li class="page-item <c:if test='${param.currentPage==pNO}'>active</c:if>">
												<a class="page-link"
												href="/acadNotice/list?
													cate=${param.cate}&category=${param.category}&keyword=${param.keyword}&currentPage=${pNO}&size=${param.size}">${pNO}</a>
											</li>
										</c:forEach>
										<li class="page-item last <c:if test="${data.endPage ge data.totalPages}">disabled</c:if>">
											<a class="page-link"
											href="/acadNotice/list?
												cate=${param.cate}&category=${param.category}&keyword=${param.keyword}&currentPage=${data.endPage +1}&size=${param.size}">
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
	</div>
</div>

<script>
$(function(){
	$(document).on("click", "#deleteBtn", function(){
		btn = $(this);
		nbNum = $(this).prev().prev().val();
		cate = $("#cate").val();

		data = {"nbNum" : nbNum};

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
							    title: '공지사항이 삭제되었습니다.',
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