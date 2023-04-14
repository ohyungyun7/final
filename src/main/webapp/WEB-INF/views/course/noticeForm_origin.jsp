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
	width: auto;
}
.div-header{
	margin: 5px;
}
.card-btn{
	display: inline;
	float: right;
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
	<div class="card-header">
		<h3 class="card-title">
			<div class="mt-2 mb-3">
				<label for="title" class="form-label">제목</label>
				<input id="title" class="form-control form-control-lg" type="text" 
					placeholder=".form-control-lg" value="기말고사 안내" />
			</div>
			<div class="card-btn">
				<button type="button" class="btn btn-label-primary">저장</button>
				<button type="button" class="btn btn-label-primary">취소</button>
			</div>
		</h3>
		<p>작성자 : 이수영</p>
		<p>작성일 : 2022.12.04</p>
		<p>조회수 : 30</p>
		<input class="form-control" type="file" id="formFile">
	</div>
	
	
	<div class="card-body">
		<textarea id="editor" cols="50" rows="20"></textarea>
	</div>
	
</div>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('editor');
CKEDITOR.instances.editor.setData('<p>이것은 공지 내용입니다.</p>'); 
</script>