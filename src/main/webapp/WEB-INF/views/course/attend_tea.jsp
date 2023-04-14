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

th {
 	text-align: center;
}

table{
float:left;
}

#changeColor {
      background-color: lightyellow;
}
</style>

<div class="card-header">
	<ul class="nav nav-pills flex-column flex-md-row mb-3">
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link" href="/course/detailTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link active"
	      		href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-item nav-link"
	      		href="/course/reportCard?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">성적</a>
	      </li>
	</ul>
</div>
<br />
<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-collection page-icon"></i>
	<span class="fw-light" onclick="location.href='/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar'" style="cursor: pointer;">강의목록 / </span>
	<span onclick="location.href='/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}'" class="categoryBar fw-light" style="cursor: pointer;">${sbjTitle} / </span>
	출석
</h4>

<div class="card">
	<div class="card-body ">
		<input type="hidden" id="sbjNum" value="${sbjNum}" />
		
		<div style="text-align: right; margin-bottom: 5px;">
			<button type="button" id="autoAttend" class="btn btn-label-secondary">전체 출석</button>
		</div>
		<!-- Complex Headers -->
		<div class="card">
			<!-- Vertical & Horizontal Scrollbars -->
			<div class="col-12">
			  <div class="card overflow-hidden" style="height: 700px;">
			    <div class="card-body" id="both-scrollbars-example">

				  <div class="card-datatable text-nowrap" id="stuList" style="height:600px;">
				  	<div class="row" style="float:left; width: 1330px;">
				  	<div class="divTb" style="width:645px; float: left;">
				    <table class="dt-complex-header table table-bordered cell-fit" style="height: 100%;">
				      <thead class="table-light" style="height: 43px; vertical-align: center;">
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

				      <tbody id="tbody">
				      	<c:forEach var="atVO" items="${atList}" varStatus="stat">
					      <tr class="atList1">
						      <td>${stat.count}</td>
					          <td>${atVO.stuNmKor}</td>
					          <td>${atVO.stuNum}</td>
					          <td>${atVO.deptNm}</td>
					          <td>${atVO.attend}</td>
					          <td>${atVO.late}</td>
					          <td>${atVO.absent}</td>
				          </tr>
					    </c:forEach>
				      </tbody>
				    </table>
				    </div>
				    <div class="tbDiv" style="width:695px;  overflow:hidden; float: left; margin-left: -10px;" id="horizontal-example">
				    	<!-- 출석테이블 -->
					    <table class="dt-complex-header table table-bordered cell-fit" style="height: 100%;">
					      <thead class="table-light" style="height:15px; line-height: 3%;">

					        <tr class="week">
					         <c:forEach begin="1" end="15" varStatus="stat">
					          <th colspan="${count}">${stat.count}주차</th>
					         </c:forEach>
					        </tr>
					        <!-- COL COUNT 시작 -->
					        <tr>
					        <c:forEach begin="1" end="15" varStatus="stat">
								<c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				          		  <th style="font-size: 0.7em; height: 10px;">${dayMap.get("TIME_TCODE")}</th>
				          		</c:forEach>
					        </c:forEach>
					        </tr>
					        <!-- COL COUNT 끝 -->
					      </thead>

					      <!-- 출석 SELECT BOX 시작 -->
					      <tbody class="tbody2">
					      	<c:forEach var="atList" items="${atList}" varStatus="stat">
					      	  <!-- tr 시작 -->
						      <tr class="test1">
						      			<!-- td 시작 -->
										<c:forEach var="atListVO" items="${atList.atList}" varStatus="stat">
										  <c:choose>
											<c:when test="${atListVO.atCheck==1}">
									           <td class="week11 1">
												<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
													<option value="" disabled style="display: none;"></option>
													<option value="1" selected>○</option>
									            	<option>△</option>
									            	<option>X</option>
												</select>
											   </td>
											</c:when>
										    <c:when test="${atListVO.atCheck==0.67}">
										  	  <td class="week11 2">
											    <select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
												  <option value="" disabled style="display: none;"></option>
												  <option value="1">○</option>
								            	  <option selected>△</option>
								            	  <option>X</option>
											  </select>
									   		 </td>
										   </c:when>
										   <c:when test="${atListVO.atCheck==0}">
											 <td class="week11 3">
											   <select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
												  <option value="" disabled style="display: none;"></option>
												  <option value="1">○</option>
								            	  <option>△</option>
								            	  <option selected>X</option>
											  </select>
										    </td>
										   </c:when>
										   <c:when test="${atListVO.atCheck==2}">
											<td class="week11 4">
											<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
												<option value="" selected disabled style="display: none;"></option>
												<option value="1">○</option>
								            	<option>△</option>
								            	<option>X</option>
											</select>
										   </td>
										   </c:when>
										  </c:choose>
										</c:forEach>
								<c:if test="${atList.atList.size() < (count*15)}">
									<c:forEach begin="${atList.atList.size()+1}" end ="${count*15}">
										<td class="week11 6">
										<select id="att2" class="form-select-sm search-sel" aria-label="Default select example">
											<option style="display: none;"></option>
											<option value="1">○</option>
							            	<option>△</option>
							            	<option>X</option>
										</select>
									   </td>
									</c:forEach>
								</c:if>
						        <!-- td 끝 -->
					          </tr>
					          <!-- tr 끝 -->
					        </c:forEach>
					      </tbody>
					      <!-- 출석 SELECT BOX 끝 -->
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
$(document).ready(function() {
	const Toast = Swal.mixin({
	    toast: true,
	    position: 'top',
	    showCloseButton: true,
	    showConfirmButton: false,
	    timerProgressBar: true,
	    didOpen: (toast) => {
	        toast.addEventListener('mouseenter', Swal.stopTimer)
	        toast.addEventListener('mouseleave', Swal.resumeTimer)
	    }
	});

	changeColor();
	let cnt = ${count};

	$(".search-sel").on("click", function(){
		let dx = $(this).parent().index();

		let sv = $(this).parent().prev().find("select").val();
		let ev = $(this).find("option").eq(1).val();
		if(dx != 0 && (sv == "" || sv == null)){
			Toast.fire({
			    icon: 'warning',
			    text: '순서대로 채워주세요.'
			});
		}
	});

	let opt = $("#att2").find("option");
	$(opt).on("click", function(){
		let v_ths = $(this).text();
		if(v_ths == null || v_ths == ""){
// 			alert("경고");
		}
	});

	$(".search-sel").on("change", function(){
		let select = $(this).parent().find(".search-sel option").index( $(this).parent().find(".search-sel option:selected") );
		let atCheck = "";

		if(select == 1){
			atCheck = 1;
		}else if(select == 2){
			atCheck = 0.67;
		}else if(select == 3){
			atCheck = 0;
		}else{
			Toast.fire({
			    icon: 'warning',
			    text: '○ / △ / X만 선택 가능합니다.'
			});
		}

		let idx = $(this).parent().index(); //td의 인덱스

		if(cnt == 1) {	//강의요일(cnt)이 한 개인 경우

			let week = $(this).parents(".tbDiv").find("th").eq(idx).text();
			let word = week.split("주");

			let atWeek = word[0];

			let trIdx = $(this).closest("tr").index();
			let stuNum = $(".divTb").find(".atList1").eq(trIdx).find("td").eq(2).text();

			let trTxt = $(this).parents(".tbDiv").find("tr").next("tr").find("th").eq(idx).text();

			let sbjNum = $("#sbjNum").val();

			let data = {
							"sbjNum":sbjNum,
							"timeTcode":trTxt,
							"atStuNum":stuNum,
							"atWeek":atWeek,
							"atCheck":atCheck
						};

			$.ajax({
				url : "/course/updateAttendance",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(data){
					$("#tbody").empty();

					$.each(data, function(index, item) { // 데이터 =item
						let idx2 = index + 1;

						let html = "";
						html += "<tr class='atList1'>";
						html += "<td>"+idx2+"</td>";
						html += "<td>"+item.stuNmKor+"</td>";
						html += "<td>"+item.stuNum+"</td>";
						html += "<td>"+item.deptNm+"</td>";
						html += "<td>"+item.attend+"</td>";
						html += "<td>"+item.late+"</td>";
						html += "<td>"+item.absent+"</td>";
						html += "</tr>";

						$("#tbody").append(html);

					});
				},
				error : function(){
					Swal.fire({
						title: '오류발생.<br/>등록이 불가합니다.',
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'error',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
				}
			});

		}else {	//강의요일(cnt)이 두 개인 경우

			let atWeek = Math.floor((parseInt(idx) / 2)) + 1;

			let trIdx = $(this).closest("tr").index();
			let stuNum = $(".divTb").find(".atList1").eq(trIdx).find("td").eq(2).text();

			let trTxt = $(this).parents(".tbDiv").find("tr").next("tr").find("th").eq(idx).text();

			let sbjNum = $("#sbjNum").val();

			let data = {
							"sbjNum":sbjNum,
							"timeTcode":trTxt,
							"atStuNum":stuNum,
							"atWeek":atWeek,
							"atCheck":atCheck
						};

			$.ajax({
				url : "/course/updateAttendance",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(data){

					$("#tbody").empty();

					$.each(data, function(index, item) { // 데이터 =item
						let idx2 = index + 1;

						let html = "";
						html += "<tr class='atList1'>";
						html += "<td>"+idx2+"</td>";
						html += "<td>"+item.stuNmKor+"</td>";
						html += "<td>"+item.stuNum+"</td>";
						html += "<td>"+item.deptNm+"</td>";
						html += "<td>"+item.attend+"</td>";
						html += "<td>"+item.late+"</td>";
						html += "<td>"+item.absent+"</td>";
						html += "</tr>";

						$("#tbody").append(html);

					});
				},
				error : function(){
					Swal.fire({
						title: '오류발생.<br/>등록이 불가합니다.',
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'error',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
				}
			});

		}
	});
	
	$("#autoAttend").on("click", function() {
		let selectArr = $(".search-sel");
		for(var i = 0; i < selectArr.length; i++){
			$(selectArr[i]).val('1').trigger('change');
		}
	});
});

function changeColor(){
	let childTd = $(".atList1").find('td');
	$(childTd).mouseover(function(){

		let parent = $(this).parent();
		let pIdx = $(this).parent().index();
		$(this).parent().attr("id", "changeColor");
		$(".tbody2").find('tr').eq(pIdx).attr("id", "changeColor");

	}).mouseout(function(){
		$(this).parent().removeAttr("id");
		$(".tbody2").find('tr').removeAttr("id");
	});

	let tbodyChildren = $(".tbody2").find('td');
	$(tbodyChildren).mouseover(function(){
		let tbParentIdx = $(this).parent().index();
		$(this).parent().attr("id", "changeColor");
		$("#tbody").find('tr').eq(tbParentIdx).attr("id", "changeColor");
	}).mouseout(function(){
		$(this).parent().removeAttr("id");
		$("#tbody").find('tr').removeAttr("id");
	});
}
</script>
<script src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/sneat/assets/js/extended-ui-perfect-scrollbar.js"></script>
