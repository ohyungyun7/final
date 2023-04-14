<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.categoryBar{
	color: gray;
}
.si_target{
	width: 60%;
	text-align: center;
}
thead{
	text-align: center;
}
.btnWrite{
	float: right;
	width: auto;
}
.div-header{
	margin: 5px;
}
</style>

<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="javascript:void(0)">주차</a>
				<a class="nav-item nav-link" href="javascript:void(0)">학생목록</a>
				<a class="nav-item nav-link" href="javascript:void(0)">공지</a>
				<a class="nav-item nav-link" href="javascript:void(0)">출석</a>
				<a class="nav-item nav-link" href="javascript:void(0)">과제</a>
				<a class="nav-item nav-link active" href="javascript:void(0)">자료</a>
				<a class="nav-item nav-link" href="javascript:void(0)">성적</a>
			</div>
		</div>
	</div>
</nav>
<br />

<h5 class="title">
	<a href="#" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="#" class="categoryBar">재미있는 JAVA의 세계로(강의명)</a>
</h5>

<div class="card">
	<div class="div-header">
		<button type="button" class="btn btn-label-primary btnWrite" 
			data-bs-toggle="modal" data-bs-target="#addNewModal">글쓰기</button>
	</div>
	<table class="table table-bordered">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>주차</th>
				<th class="si_target">제목</th>
				<th>파일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>5</th>
				<td>참고</td>
				<td><button class="btn">다운로드</button></td>
				<td><button class="btn">삭제</button></td>
			</tr>
			<tr>
				<th>3</th>
				<td>3번 참고2</td>
				<td><button class="btn">다운로드</button></td>
				<td><button class="btn">삭제</button></td>
			</tr>
			<tr>
				<th>3</th>
				<td>3번 참고1</td>
				<td><button class="btn">다운로드</button></td>
				<td><button class="btn">삭제</button></td>
			</tr>
			<tr>
				<th>2</th>
				<td>자바 참고</td>
				<td><button class="btn">다운로드</button></td>
				<td><button class="btn">삭제</button></td>
			</tr>
			<tr>
				<th>1</th>
				<td>클래스 참고자료</td>
				<td><button class="btn">다운로드</button></td>
				<td><button class="btn">삭제</button></td>
			</tr>
		</tbody>
	</table>
	
	<div class="card-footer">
		<div class="demo-inline-spacing">
			<nav class="paging" aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item first">
						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
					</li>
					<li class="page-item prev">
						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);">2</a>
					</li>
					<li class="page-item active">
						<a class="page-link" href="javascript:void(0);">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);">5</a>
					</li>
					<li class="page-item next">
						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a>
					</li>
					<li class="page-item last">
						<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	
</div>

<div class="modal fade" id="addNewModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="text-center mb-4">
					<h3>파일 업로드</h3>
				</div>
				<form id="addNewCCForm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework">
					<div class="col-12 fv-plugins-icon-container">
						<div class="input-group input-group-merge">
							<input id="modalAdd" name="modalAdd" class="form-control" type="text" placeholder="제목" aria-describedby="modalAdd2">
							<span class="input-group-text cursor-pointer p-1" id="modalAddCard2"><span class="card-type"></span></span>
						</div>
					</div>
					<div class="col-12">
						<input class="form-control" type="file" id="formFile">
					</div>
					<div class="col-12 text-center">
						<button type="submit" class="btn btn-primary me-sm-3 me-1 mt-3">등록</button>
						<button type="reset" class="btn btn-label-secondary btn-reset mt-3" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
					<input type="hidden">
				</form>
			</div>
		</div>
	</div>
</div>
<script>



</script>