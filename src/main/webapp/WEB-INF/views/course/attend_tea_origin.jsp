<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<style>
select {
	border: 1px lightgray dashed;
	appearance: none;
	text-align: center;
}
.form-select-sm{
	padding-left: 0.3rem;
	padding-right: 0.3rem;	
}
table{
	float:left;
}
</style>
<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a>
				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
				<a class="nav-item nav-link active" href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
				<a class="nav-item nav-link" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
				<a class="nav-item nav-link" href="javascript:void(0)">성적</a>
			</div>
		</div>
	</div>
</nav>
<br />

${data}
<div class="card">
	<div class="card-header">
		<h5 class="title">
			<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">강의목록</a>
			&nbsp;/&nbsp;<a href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a>
		</h5>

	</div>	

	<div class="card-body ">
		
		<!-- Complex Headers -->
		<div class="card">
			<!-- Vertical & Horizontal Scrollbars -->
<!-- 		    <h5 class="card-header col-3"> -->
<!-- 		        <div class="input-group"> -->
<!-- 		          <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">선택</button> -->
<!-- 		          <ul class="dropdown-menu"> -->
<!-- 		            <li><a class="dropdown-item" href="javascript:void(0);">학번</a></li> -->
<!-- 		            <li><a class="dropdown-item" href="javascript:void(0);">학생명</a></li> -->
<!-- 		          </ul> -->
<!-- 		          <input type="text" class="form-control" aria-label="Text input with dropdown button"> -->
<!-- 		        </div> -->
<!-- 		    </h5> -->
		    
			<div class="col-12">
			  <div class="card overflow-hidden" style="height: 700px;">
			    <div class="card-body" id="both-scrollbars-example">
			    
				  <div class="card-datatable text-nowrap" id="stuList" style="height:600px;">
				  	<div class="row" style="float:right;">
				  	<div class="divTb" style="width:45%;">
				    <table class="dt-complex-header table table-bordered cell-fit" style="height: 100%;">
				      <thead class="table-light">
				        <tr>
				          <th rowspan="2">번호</th>
				          <th rowspan="2">이름</th>
				          <th rowspan="2">학번</th>
				          <th rowspan="2">학과</th>
				          <th rowspan="2">출석</th>
				          <th rowspan="2">지각</th>
				          <th rowspan="2">결석</th>
				        </tr>
				      </thead>
				      <tbody>
					      <tr>
						      <td>1</td>
					          <td>홍길영</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>2</td>
					          <td>홍길순</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>8.67</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>3</td>
					          <td>홍길현</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>4</td>
					          <td>홍길학</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>5</td>
					          <td>홍길길</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>6</td>
					          <td>홍길홍</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>7</td>
					          <td>홍길준</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>8</td>
					          <td>홍길석</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>9</td>
					          <td>홍길성</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>10</td>
					          <td>홍길운</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
					      <tr>
						      <td>11</td>
					          <td>홍길동</td>
					          <td>20000322</td>
					          <td>경영학과</td>
					          <td>10</td>
					          <td>0</td>
					          <td>0</td>
				          </tr>
				      </tbody>
				    </table>
				    </div>
				    <div class="tbDiv" style="width:54%;  overflow:hidden;" id="horizontal-example">
				    	<!-- 출석테이블 -->
					    <table class="dt-complex-header table table-bordered cell-fit" style="height: 100%;">
					      <thead class="table-light" style="height:30px; line-height: 10%;">
					        <tr>
					          <th colspan="2">1주차</th>
					          <th colspan="2">2주차</th>
					          <th colspan="2">3주차</th>
					          <th colspan="2">4주차</th>
					          <th colspan="2">5주차</th>
					          <th colspan="2">6주차</th>
					          <th colspan="2">7주차</th>
					          <th colspan="2">8주차</th>
					          <th colspan="2">9주차</th>
					          <th colspan="2">10주차</th>
					        </tr>
					        <tr>
					          <th>1-1</th>
					          <th>1-2</th>
					          <th>2-1</th>
					          <th>2-2</th>
					          <th>3-1</th>
					          <th>3-2</th>
					          <th>4-1</th>
					          <th>4-2</th>
					          <th>5-1</th>
					          <th>5-2</th>
					          <th>6-1</th>
					          <th>6-2</th>
					          <th>7-1</th>
					          <th>7-2</th>
					          <th>8-1</th>
					          <th>8-2</th>
					          <th>9-1</th>
					          <th>9-2</th>
					          <th>10-1</th>
					          <th>10-2</th>
					        </tr>
					      </thead>
					      <tbody>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
						      <tr>
						          <td class="week11">
									<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att11" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week21">
						          	<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att22" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week31">
						          	<select id="att3" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att33" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week41">
						          	<select id="att4" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att44" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week51">
						          	<select id="att5" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att55" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week61">
						          	<select id="att6" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att66" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week71">
						          	<select id="att7" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att77" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week81">
						          	<select id="att8" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att88" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week91">
						          	<select id="att9" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att99" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
						          <td class="week101">
						          	<select id="att10" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>	
								  </td>
						          <td>
						          	<select id="att110" class="form-select-sm search-sel" aria-label="Default select example">
										<option>○</option>
						            	<option>△</option>
						            	<option>X</option>
									</select>
								  </td>
					          </tr>
					      </tbody>
					    </table>
					    <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div>
				    </div>
				    </div>
				    
				  </div>
			    </div>
			  </div>
			</div>
  			<!--/ Vertical & Horizontal Scrollbars -->
		</div>
		<!--/ Complex Headers -->
		
		
	</div>
</div>

<script>
$(document).ready(function () {
//     $('#stuList').DataTable();
//     $('.testTb').DataTable();
    
});
</script>
<script src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/sneat/assets/js/extended-ui-perfect-scrollbar.js"></script>
