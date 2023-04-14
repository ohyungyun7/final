<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.categoryBar{
	color: gray;
}
thead{
	text-align: center;
}
.card{
	overflow: auto;
}
.search-sel{
	width: 15%;
	display: inline;
}
.search-inp{
	width: 30%;
	display: inline;
}
.search-btn{
	display: inline;
}
</style>

<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="javascript:void(0)">주차</a>
				<a class="nav-item nav-link active" href="javascript:void(0)">학생목록</a>
				<a class="nav-item nav-link" href="javascript:void(0)">공지</a>
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
	<div class="card-header">
		<select class="form-select search-sel" aria-label="Default select example">
			<option value="학번" selected>학번</option>
			<option value="학생명">학생명</option>
		</select>
		
		<input type="text" class="form-control search-inp" placeholder="Search..." aria-label="Search..." aria-describedby="basic-addon-search31">
		<button class="input-group-text search-btn"><i class="bx bx-search"></i></button>
	</div>
	<table class="table table-bordered">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>번호</th>
				<th>학번</th>
				<th>학과</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">6</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">7</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">8</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">9</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">10</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">11</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">12</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">13</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">14</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
			<tr>
				<th scope="row">15</th>
				<td>2022011221</td>
				<td>컴퓨터 공학과</td>
				<td>이건상</td>
			</tr>
		</tbody>
	</table>
</div>