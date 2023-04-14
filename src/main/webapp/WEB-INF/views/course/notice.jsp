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
				<a class="nav-item nav-link active" href="javascript:void(0)">공지</a>
				<a class="nav-item nav-link" href="javascript:void(0)">출석</a>
				<a class="nav-item nav-link" href="javascript:void(0)">과제</a>
				<a class="nav-item nav-link" href="javascript:void(0)">자료</a>
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
		<button type="button" class="btn btn-label-primary btnWrite">글쓰기</button>
	</div>
	<table class="table table-bordered">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>번호</th>
				<th class="si_target">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>기말고사 안내</td>
				<td>이수영</td>
				<td>2022.12.04</td>
				<td>22</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>기말고사 안내2</td>
				<td>이수영</td>
				<td>2022.12.01</td>
				<td>232</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>기말고사 안내3</td>
				<td>이수영</td>
				<td>2022.11.04</td>
				<td>11</td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>기말고사 안내4</td>
				<td>이수영</td>
				<td>2022.10.24</td>
				<td>22</td>
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>기말고사 안내5</td>
				<td>이수영</td>
				<td>2022.10.14</td>
				<td>222</td>
			</tr>
			<tr>
				<th scope="row">6</th>
				<td>기말고사 안내6</td>
				<td>이수영</td>
				<td>2022.10.04</td>
				<td>12</td>
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