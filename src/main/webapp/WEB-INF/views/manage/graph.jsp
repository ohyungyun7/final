<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.card{
	min-height: 100%;
}
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
.table > thead {
	vertical-align: middle;
}
th{
 	white-space: pre-line;
 	text-align: center;
 }
tr td {
  text-align: center;
}
.innerCard{
	border: 1px solid lightgray;
	border-radius: 5px;
	margin: 5px;
	padding: 10px;
}
.search-sel{
	width: 20%;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 300;
}
.infoDiv{
	margin: 10px;
}
.left-container{
	width: 46%;
	float: left;
	margin: 10px;
}
.right-container{
	width: 46%;
	float: right;
	margin: 10px;
}
</style>

<h5 class="title categoryBar">학과 지표</h5>

<div class="card">

	<div class="container">
		<div class="card innerCard">
			<div class="row g-3">
				<div class="col-md-12">
					<div class="row infoDiv">
						<select id="colleage" class="col-sm-1 form-select search-sel" aria-label="Default select example">
							<option>단과대</option>
							<option value=""></option>
							<option value=""></option>
							<option value=""></option>
						</select>
						
						<select id="department" class="col-sm-1 form-select search-sel" aria-label="Default select example">
							<option>학과</option>
							<option value=""></option>
							<option value=""></option>
							<option value=""></option>
						</select>
						
						<div class="col-sm-5">
							<input type="text" class="form-control" />
						</div>
						
						<div class="col-sm-2">
							<button type="button" class="btn btn-label-secondary">검색</button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="left-container innerCard">
			<h6 class="title categoryBar">수학교육과 성별 비율</h6>
		</div>
		
		<div class="right-container innerCard">
			<h6 class="title categoryBar">수학교육과 학년별 성비</h6>
		</div>
		
		<div class="left-container innerCard">
			<h6 class="title categoryBar">연도별 인원</h6>
		</div>
		
		<div class="right-container innerCard">
			<h6 class="title categoryBar">신입생 비율</h6>
		</div>
		
	</div>
	
</div>

