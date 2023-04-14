<%@page import="kr.or.ddit.vo.UserVO"%>
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
</style>

<% 
	UserVO userVO = (UserVO) session.getAttribute("userVO"); 
	
	if(userVO.getAuth().equals("ROLE_STU")){
		
%>

<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link active" href="javascript:void(0)">주차</a>
				<a class="nav-item nav-link" href="javascript:void(0)">학생목록</a>
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
<%
	}
%>
<h5 class="title">
	<a href="#" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="#" class="categoryBar">재미있는 JAVA의 세계로(강의명)</a>
</h5>

<div class="card">
	<table class="table table-bordered">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>주차</th>
				<th class="si_target">학습목표</th>
				<th>수업 구분</th>
				<th>과제 여부</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">6</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">7</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">8</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">9</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">10</th>
				<td>중간</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">11</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">12</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">13</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">14</th>
				<td>java 기초</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
			<tr>
				<th scope="row">15</th>
				<td>기말</td>
				<td>대면</td>
				<td><button class="btn">제출하러 가기</button></td>
			</tr>
		</tbody>
	</table>
</div>