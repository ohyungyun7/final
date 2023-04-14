<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script>
$(function(){
	/* var getYear = "${param.year}";//연도선택
	var getSemester = "${param.semester}";//학기선택
	var getTpYn = "${param.tpYn}";//납부여부선택 */


	var getYear = "";//연도선택
	var getSemester = "";//학기선택
	var getTpYn = "";//납부여부선택

	let currentPage = "${param.currentPage}";

	if(currentPage == null || currentPage ==''){
		currentPage = 1;
	}

	//연도
	$("#year").on("change",function(){
		getYear = $("#year option:selected").val();
	})

	//학기
	$("#semester").on("change",function(){
		getSemester = $("#semester option:selected").val();
	})

	//납부여부
	$("#tpYn").on("change",function(){
		getTpYn = $("#tpYn option:selected").val();
	})

	$("#submit").on("click",function(){
		if(getYear == null || getYear == ""){
			getYear = "전체";
		}

		if(getSemester == null || getSemester == ""){
			getSemester = "전체";
		}

		if(getTpYn == null || getTpYn == ""){
			getTpYn = "전체";
		}
		window.location="/tuition/tuition_admin?currentPage="+currentPage+"&year="+getYear+"&semester="+getSemester+"&tpYn="+getTpYn;  //쿼리스트링으로 넘기는것은 get 헤더영역
	})


	//페이지 로딩 후 등록금 연도들 가져오는 쿼리
	$.ajax({
			url : "/tuition/getTuitionYear",
			contentType : 'application/json;charset=utf-8',
			dataType : "json",
			type : "post",
			 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
		success : function(result){
			var str = "";
				str+="<option value='전체'>전체</option>";
			for(var i=0; i<result.data.length; i++){
				str+="<option value='"+result.data[i].clSemester+"'>"+result.data[i].clSemester+"</option>";
			}

			$("#year").append(str);
		}
	})//ajax끝



})//function 끝
</script>
<style type="text/css">
.categoryBar{
	color: gray;
}
thead{
	text-align: center;
}
.card{
	min-height: 100%;
}
.input-box{
	width: 10%;
	display: inline;
}
.div-header{
	text-align: right;
	margin: 5px;
	padding-right: 1.625rem;
}
.innerCard{
	border: 1px solid lightgray;
	border-radius: 5px;
	margin: 5px;
	padding: 10px;
}
.search-sel{
	width: 30%;
	display: inline;
}
textarea{
	resize: none;
	maxlength: 300;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-wallet-alt page-icon"></i>
	등록금 · 장학금 납부내역
</h4>
<!-- <h5 class="title categoryBar">등록금 납부 내역</h5> -->

<div class="card">

	<div class="div-header"></div>
	<div class="container">
		<form action="" method="get">
		<div class="card innerCard">
			<div class="row g-3">
				<div class="col-md-5">
					<div class="row infoDiv">
						<label class="col-sm-2 col-form-label text-sm-end" for="year">연도</label>
							<select id="year" name="year" class="col-sm-6 form-select search-sel year" aria-label="Default select example">
							</select>
						<label class="col-sm-2 col-form-label text-sm-end" for="semester">학기</label>
							<select id="semester" name="semester" class="col-sm-6 form-select search-sel year" aria-label="Default select example">
								<option value="전체">전체</option>
								<option value="1">1</option>
								<option value="2" >2</option>
							</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row infoDiv">
						<label class="col-sm-4 col-form-label text-sm-end">납부여부</label>
						<select id="tpYn" name ="tpYn" class="col-sm-8 form-select search-sel semester" aria-label="Default select example">
							 <option value="전체" <c:if test="${tpYN eq null}">selected</c:if>  >전체</option>
							<option value="미납" <c:if test="${tpYN eq 0}">selected</c:if>  >미납</option>
							<option value="완납" <c:if test="${tpYN eq 1}">selected</c:if>  >완납</option>
						</select>
					</div>
				</div>

				<div class="col-md-3">
					<div class="row infoDiv">
						<div class="col-sm-12 text-sm-end">
							<label class="form-label" for="showToastPlacement">&nbsp;</label>
					        <button type="button" id="submit" class="btn btn-label-primary">조회</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>

	<div class="container">
		<table class="table table-bordered">
			<thead class="table-active">
				<tr style="text-align: center"class="text-nowrap">
					<th>번호</th>
					<th>년도</th>
					<th>학기</th>
					<th>전공</th>
					<th>학번</th>
					<th>이름</th>
					<th>연락처</th>
					<th>등록금 납부여부</th>
					<th>문자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="TuitionVO" items="${data.content}" varStatus="stat">
					<tr style="text-align: center"${TuitionVO.stuNum}>
						<td>${stat.index+1}</td>
						<td>${TuitionVO.tpYear}</td>
						<td>${TuitionVO.tpSemester}</td>
						<td>${TuitionVO.deptNm}</td>
						<td>${TuitionVO.stuNum}</td>
						<td>${TuitionVO.stuNmkor}</td>
						<td>${TuitionVO.stuPn}</td>
							<c:if test="${TuitionVO.tpYn eq 0}">
								<td>미납</td>
							</c:if>
							<c:if test="${TuitionVO.tpYn eq 1}">
								<td>완납</td>
							</c:if>
						<td>
						<c:if test="${TuitionVO.tpYn eq 0}">
							<a class="tuitionNum" data-show-stu-Num="${TuitionVO.stuNum}">
								<button class="btn btn-sm btn-label-secondary" data-show-stu-Num="${TuitionVO.stuNum}" data-bs-toggle="modal" data-bs-target="#le_check">
									문자 발송
								</button>
							</a>
						</c:if>
						<c:if test="${TuitionVO.tpYn eq 1}">
							<a class="tuitionNum" data-show-stu-Num="${TuitionVO.stuNum}">
								<button class="btn btn-sm btn-label-secondary" data-show-stu-Num="${TuitionVO.stuNum}" id="yes">
									문자 발송
								</button>
							</a>
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="">
		<div class="col">
			<div class="demo-inline-spacing">
				<!-- Basic Square Pagination -->
				<nav aria-label="Page navigation">
					<ul class="pagination pagination-round pagination-primary justify-content-center">
						<li class="page-item first <c:if test="${data.startPage -1 <= 0}">disabled</c:if>">
							<a href="/tuition/tuition_admin?tpYn=${param.tpYn}&year=${param.year}&semester=${param.semester}&currentPage=${data.startPage -1}&size=${param.size}" class="page-link"> <i class="tf-icon bx bx-chevrons-left"></i></a>
						</li>
						<c:forEach var="pNO" begin="${data.startPage}" end="${data.endPage}">
							<li class="page-item <c:if test='${param.currentPage==pNO}'>active</c:if>">
								<a class="page-link" href="/tuition/tuition_admin?tpYn=${param.tpYn}&year=${param.year}&semester=${param.semester}&currentPage=${pNO}&size=${param.size}">${pNO}</a>
							</li>
						</c:forEach>
						<li class="page-item last <c:if test="${data.endPage ge data.totalPages}">disabled</c:if>">
							<a class="page-link" href="/tuition/tuition_admin?tpYn=${param.tpYn}&year=${param.year}&semester=${param.semester}&currentPage=${data.endPage +1}&size=${param.size}">
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

<div class="modal fade" id="le_check" tabindex="-1">
	<div class="modal-dialog modal-md modal-simple modal-edit-user">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="text-left mb-4">
					<h5>문자 발송</h5>
				</div>
				<hr />
				<form:form modelAttribute="smsVO" action="/tuition/createPost" method="post" id="smsForm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework">

<!-- 					<div class="col-12 col-md-6" style="display : none;"> -->
						<input type="hidden" id="smsNum" name="smsNum"  value="문자발송번호 기본키" class="form-control modal-edit-tax-id" readonly>
<!-- 					</div> -->

					<div class="col-12 col-md-6" style="display : none;">
						<input type="date" id="smsDt" name="smsDt" class="form-control modal-edit-tax-id" readonly>
					</div>

					<div class="col-12 col-md-6" style="display : none;">
						<label class="form-label" for="from">발신자</label>
						<input type="text" id="from" name="from" class="form-control modal-edit-tax-id" value="010-4929-4476" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="deptNm">학과</label>
						<input type="text" id="deptNm" name="dept" class="form-control modal-edit-tax-id" value="" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNum">학번</label>
						<input type="text" id="stuNum" name="stuNum" value="" class="form-control" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="stuNmKor">이름</label>
						<input type="text" id="stuNmKor" name="smsNm" value="" class="form-control" readonly>
					</div>

					<div class="col-12 col-md-6">
						<label class="form-label" for="stuPn">연락처</label>
						<input type="text" id="stuPn" name="smsPn" value=""class="form-control" readonly>
					</div>

					<div class="col-12">
						<label class="form-label" for="smsContent">내용</label>
						<textarea id="smsContent" name="smsContent" class="form-control modal-edit-tax-id" rows="5"></textarea>
					</div>

					<div class="col-12 text-center">
						<button type="button" class="btn btn-label-secondary" id="btnAuto">자동채우기</button>
						<input type="submit" class="btn btn-primary timeTable_btnSubmit" onclick="sendSMS('createPost')" value="전송하기"/>
						<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$(".tuitionNum").on("click",function(){
		let showStuNum = $(this).data("show-stu-num");
		let data ={"stuNum" : showStuNum};

		$.ajax({
			 url:"/tuition/showStuNum",
	         contentType:"application/json; charset:utf-8",
	         data: JSON.stringify(data),
	         type: "post",
	         dataType: "json",
	         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	       		 },
	         success : function(result){
	        	 $("#deptNm").val(result.tuitionNum.deptNm);
	        	 $("#stuNum").val(result.tuitionNum.stuNum);
	        	 $("#stuNmKor").val(result.tuitionNum.stuNmkor);
	        	 $("#stuPn").val(result.tuitionNum.stuPn);
	         }
		});
	});
	$("#btnAuto").on("click",function(){
		$("#smsContent").val("대학/대학원 재학생 등록금 추가 납부 기간 안내 \n4월20일(월)~4월24일(금)\n①국민은행 가상계좌 (07:00~23:00)\n②신한/국민/농협은행 전국지점 (09:00~16:00)\n* 외국인 유학생은 신한은행 가상계좌로 납부해야 함.")
	});
});
    function sendSMS(pageName){
        $("#smsForm").attr("action", "/tuition/"+pageName);
        $("#smsForm").submit();
	   	 Swal.fire({
			  position: 'top-center',
			  icon: 'success',
			  title: '문자를 발송하였습니다.',
			  showConfirmButton: false,
			  timer: 1500
			})
     }

    document.getElementById('smsDt').valueAsDate = new Date();

    $(document).on("click","#yes", function(){
    	Swal.fire({
			  icon: 'error',
			  title: '이미 완납한 학생입니다.',
			})
		return false;

	});



</script>
