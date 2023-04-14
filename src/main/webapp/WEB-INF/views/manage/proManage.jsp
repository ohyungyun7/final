<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

</script>
<style type="text/css">
.card {
	min-height: 100%;
}

.si_target {
	width: 60%;
	text-align: center;
}

thead {
	text-align: center;
}

.table>thead {
	vertical-align: middle;
}

th {
	white-space: pre-line;
	text-align: center;
}

tr td {
	text-align: center;
}

.div-header {
	text-align: right;
	padding-right: 1.625rem;
}

.innerCard {
	border: 1px solid lightgray;
	border-radius: 5px;
	margin: 5px;
	padding: 10px;
}

.search-sel {
	width: 15%;
}

textarea {
	resize: none;
	width: 100%;
	maxlength: 300;
}

.infoDiv {
	margin: 10px;
}
</style>
<script>
//다음 우편번호 검색
function openHomeSearch(){
	// 다음 우편번호 검색
	new daum.Postcode({
		// 다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
		oncomplete: function(data){
			// 우편번호
			$("#teaZip").val(data.zonecode);
			$("#teaAddr1").val(data.address);
			$("#teaAddr2").val(data.buildingName);
		}
	}).open();



}
function openHomeSearch1(){
	// 다음 우편번호 검색
	new daum.Postcode({
		// 다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
		oncomplete: function(data){
			// 우편번호
			$("#teaZip1").val(data.zonecode);
			$("#teaAddr3").val(data.address);
			$("#teaAddr4").val(data.buildingName);
		}
	}).open();


}
</script>
<h4 class="title fw-bold py-3 mb-2 categoryBar">
   <i class="bx bx-collection page-icon"></i>
   <span class="fw-light">교직원관리 / </span>교수 목록조회
</h4>

<div class="card">
	<div class="card-body">
		<div class="row g-4 mb-4">
		  <div class="col-sm-6 col-xl-3">
		    <div class="card tatalStuDiv">
		      <div class="card-body">
		        <div class="d-flex align-items-start justify-content-between">
		          <div class="content-left">
		            <span>전체 교수</span>
		            <div class="d-flex align-items-end mt-2">
		              <h4 class="mb-0 me-2 total"></h4>
		<!--               <small class="text-success">(+29%)</small> -->
		            </div>
		            <small>전체 교수의 수(현재기준)</small>
		          </div>
		          <span class="badge bg-label-primary rounded p-2">
		            <i class="bx bx-user bx-sm"></i>
		          </span>
		        </div>
		      </div>
		    </div>
		  </div>
	  </div>



<div class="card">
<br/>
<h5 class="card-title" style="align-items: center; font-size: x-large; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교수 목록</h5>
	<div class="container">
		<form method="get" action="/manage/proManage">
			<div class="card innerCard">
				<div class="row g-3">
					<div class="col-md-8">
						<div class="row infoDiv">
							<div class=""></div>
							<select id="category" name="category" class="col-sm-2 form-select search-sel" >
								<option value="" selected
									<c:if test='${param.category == null}'>selected</c:if>>전체</option>
								<option value="teanmkor"
									<c:if test='${param.category == "teanmkor"}'>selected</c:if>>이름</option>
								<option value="teanum"
									<c:if test='${param.category == "teanum"}'>selected</c:if>>교번</option>
								<option value="major"
									<c:if test='${param.category == "major"}'>selected</c:if>>전공</option>
								<option value="teatitle"
									<c:if test='${param.category == "teatitle"}'>selected</c:if>>직함</option>
							</select>
							<div class="col-sm-4">
								<input id="keyword" name="keyword" value="${param.keyword}" type="text" class="form-control aaa" placeholder="검색어를 입력해주세요.">
							</div>

							<div class="col-sm-3">
								<button type="submit" class="btn btn-label-secondary">검색</button>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="row infoDiv">
							<div class="div-header">
								<button type="button" class="btn btn-primary"  data-bs-toggle="offcanvas" data-bs-target="#offcanvasAddUser" id="insert" aria-controls="offcanvasAddUser">추가</button>
								<a href="#" id="deleteTeaNum" class="btn btn-primary" >삭제하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<div class="container">
	 <table class="datatables-users table border-top table-hover">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th class="col-1"></th>
					<th class="col-1">번호</th>
					<th>교번</th>
					<th>이름</th>
					<th>전공</th>
					<th>직함</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="teaVO" items="${data.content}" varStatus="stat">
					<tr id="teaNum${teaVO.teaNum}">
						<td><input value="${teaVO.teaNum}" class="form-check-input" type="checkbox" id="sel" name="sel"></td>
						<td>${stat.index+1}</td>
						<td class="teaNum"  data-bs-toggle="modal" data-bs-target="#teaInfo" data-teanum="${teaVO.teaNum}"><a href ="#" class="fw-semibold">${teaVO.teaNum}</a></td>
						<td>${teaVO.teaNmKor}</td>
						<td>${teaVO.major}</td>
						<td>${teaVO.teaTitle}</td>
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
							<a href="/manage/proManage?keyword=${param.keyword}&currentPage=${data.startPage -1}&size=${param.size}" class="page-link"> <i class="tf-icon bx bx-chevrons-left"></i></a>
						</li>
						<c:forEach var="pNO" begin="${data.startPage}" end="${data.endPage}">
							<li class="page-item <c:if test='${param.currentPage==pNO}'>active</c:if>">
								<a class="page-link" href="/manage/proManage?keyword=${param.keyword}&currentPage=${pNO}&size=${param.size}">${pNO}</a>
							</li>
						</c:forEach>
						<li class="page-item last <c:if test="${data.endPage ge data.totalPages}">disabled</c:if>">
							<a class="page-link" href="/manage/proManage?keyword=${param.keyword}&currentPage=${data.endPage +1}&size=${param.size}">
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

<!-- 관리자 상세보기 모달 -->
<div class="modal fade" id="teaInfo" tabindex="-1"
	style="display: none;" aria-hidden="true">
	<div
		class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="updateForm" name="updateForm">
					<div class="row g-3">
						<div class="col-md-5">
							<div class="row register-images">
								<img style="width: 160px; height: 200px; border-radius: 5px;" id="photo" class="imgs_wrap" src="/resources/upload${teaVO.teaPhoto}" alt="">
							</div>
						</div>
						<div class="col-md-7">
							<div class="row infoDiv">
								<label class="col-sm-3 col-form-label text-sm-end" for=teaNum>교번</label>
								<div class="col-sm-9">
									<input type="text" id="teaNum" name="teaNum" class="form-control" value="" disabled>
								</div>
							</div>
							<div class="row infoDiv">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaNmKor">이름</label>
								<div class="col-sm-9">
									<input type="text" id="teaNmKor" name="teaNmKor" class="form-control" value="" disabled>
								</div>
							</div>
							<div class="row infoDiv">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaNmEng">영문이름</label>
								<div class="col-sm-9">
									<input type="text" id="teaNmEng" name="teaNmEng" class="form-control" value="" disabled>
								</div>
							</div>
							<div class="row infoDiv">
								<label class="col-sm-3 col-form-label text-sm-end" for="major">전공</label>
								<div class="col-sm-9">
									<input type="text" id="major" name="major" class="form-control" value="" disabled>
								</div>
							</div>
							<div class="row infoDiv">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaTitle">직함</label>
								<div class="col-sm-9">
									<select id="teaTitle" name="teaTitle" class="select2 form-select">
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="deptNm">학과명</label>
								<div class="col-sm-9">
									<select id="deptNm" name="deptNm" class="select2 form-select">

									</select>
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaPn">연락처</label>
								<div class="col-sm-9">
									<input type="text" id="teaPn" name="teaPn" class="form-control" value="" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaEmail">이메일</label>
								<div class="col-sm-9">
									<input type="text" id="teaEmail" name="teaEmail" class="form-control" value="" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaAddr">주민번호</label>
								<div class="col-sm-4">
									<input type="text" id="teaReg1" name="teaAddr1" class="form-control" value="" disabled />
								</div>
								<div class="col-sm-1" style="margin-top: 9px; text-align: center;">―</div>
								<div class="col-sm-4">
									<input type="text" id="teaReg2" name="teaAddr2" class="form-control" value="" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaBank">계좌번호</label>
								<div class="col-sm-3">
									<select id="teaBank" name="teaBank" class="form-select"
										aria-label="Default select example" disabled>
										<option value="국민">국민</option>
										<option value="기업">기업</option>
										<option value="농협">농협</option>
										<option value="하나">하나</option>
										<option value="신한">신한</option>
									</select>
								</div>
								<div class="col-sm-6">
									<input type="text" id="teaAccount" name="teaAccount" class="form-control" value="" disabled />
								</div>
							</div>
						</div>

						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaZip">우편번호</label>
								<div class="col-sm-4">
									<input type="text" id="teaZip" name="teaZip" class="form-control" value="" disabled />
								</div>
								<div class="col-sm-1" style="margin-top: 9px; text-align: center;"></div>
								<div class="col-sm-4">
									<button style="margin-left: 45%; width: 55%; height: 100%;" type="button" class="btn btn-xs btn-label-secondary" onclick="openHomeSearch()" id="addrSearch" disabled>주소검색</button>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaAddr1">주소</label>
								<div class="col-sm-9">
									<input type="text" id="teaAddr1" name="teaAddr1" class="form-control" value="" disabled />
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="row">
								<label class="col-sm-3 col-form-label text-sm-end" for="teaAddr2">상세주소</label>
								<div class="col-sm-9">
									<input type="text" id="teaAddr2" name="teaAddr2" class="form-control" value="" disabled />
								</div>
							</div>
						</div>

						<div class="col-md-12 text-center" id="updatePost33">
							<button type="button" class="btn btn-primary me-sm-3 me-1" id="updatePost">수정</button>
							<button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">취소</button>
						</div>
						<div class="col-md-12 text-center" style="display: none" id="updatePost44">
							<button type="button" id="save" class="btn btn-primary me-sm-3 me-1" id="updatePost1">저장</button>
							<button type="button" class="btn btn-label-secondary" id="cancelBtn">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 교수 추가 -->
<!-- Offcanvas to add new user -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasAddUser"
	aria-labelledby="offcanvasAddUserLabel">
	<div class="offcanvas-header">
		<h5 id="offcanvasAddUserLabel" class="offcanvas-title">교직원 추가</h5>
		<button type="button" class="btn-close text-reset"
			data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body mx-0 flex-grow-0">
		<form id="createPost" onsubmit="return false">
			<div class="mb-3">
				<label class="form-label" for="add-user-fullname">교번</label>
				<input type="text" class="form-control" id="teaNum1" name="teaNum1"/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="deptNm1">학과명</label>
				<select id="deptNm1" name="deptNm1" class="select2 form-select" >
				</select>
			</div>
			<div class="mb-3">
				<label class="form-label" for="add-user-fullname">이름(한글)</label>
				<input type="text" class="form-control" id="teaNmKor1" name="teaNmKor1" placeholder="오윤균" required/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="add-user-fullname">이름(영어)</label>
				<input type="text" class="form-control" id="teaNmEng1" name="teaNmEng1" placeholder="YunGyun Oh" required/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="add-user-contact">연락처</label>
				<input type="text" id="teaPn1" class="form-control phone-mask" placeholder="010-1234-5678" aria-label="john.doe@example.com" name="teaPn1" required/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="add-user-fullname">전공</label>
				<input type="text" class="form-control" id="major1" name="major1" placeholder="입자물리학" required />
			</div>
			<div class="mb-3">
				<label class="form-label" for="add-user-fullname">직함</label>
				<input type="text" class="form-control" id="teaTitle1" name="teaTitle1" placeholder="정교수" required/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="add-user-company">이메일</label>
				<input type="text" id="teaEmail1" class="form-control" placeholder="yungyun@example.com" aria-label="john.doe@example.com" name="teaEmail1"required/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="add-user-company">주민번호</label>
				<div class="input-group">
					<input type="text" id="teaReg3" class="form-control" placeholder="주민번호 앞자리" name="teaReg3" placeholder="123456" required/>
					<input type="text" id="teaReg4" class="form-control" placeholder="주민번호 뒷자리" name="teaReg4" placeholder="1234567" required/>
				</div>
			</div>
			<div class="mb-3">
				<button type="button" class="btn btn-xs btn-label-secondary"
					onclick="openHomeSearch1()" id="addrSearch" name="addrSearch">주소검색</button>
			</div>
			<div class="mb-3">
				<label class="form-label" for="add-user-contact">우편번호</label>
				<input type="text" id="teaZip1" name="teaZip1" class="form-control" value="" required/>
			</div>

			<div class="mb-3">
				<label class="form-label" for="add-user-contact">주소</label>
				<input type="text" id="teaAddr3" name="teaAddr3" class="form-control" value="" required/>
			</div>

			<div class="mb-3">
				<label class="form-label" for="add-user-contact">상세주소</label>
				<input type="text" id="teaAddr4" name="teaAddr4" class="form-control" value="" required/>
			</div>
			<button type="button" class="btn btn-success" id="btnAuto">자동채우기</button>
			<button type="submit" class="btn btn-primary timeTable_btnSubmit" id="create">추가</button>
			<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="offcanvas" aria-label="Close">취소</button>
		</form>
	</div>
</div>

<script>
$(function(){
	var checkNum = [];
	var checkVal = $('input:checkbox[name=sel]:checked').val();
	let teaNum = "";
	$('input:checkbox[name=sel]').on("click",function(){
		checkNum.push($(this).val());
	});

	$("#deleteTeaNum").on("click",function(){
		if(!checkNum.length>0){
			Swal.fire({
				  icon: 'error',
				  title: '체크박스 설정해주세요',
				})
			return false;
		};

		var count = 0;
		for(var i =0; i<checkNum.length; i++){
			let data = {"teaNum" : checkNum[i]};
			$.ajax({
				url:"/manage/deleteTea",
		         contentType:"application/json; charset:utf-8",
		         data: JSON.stringify(data),
		         type: "post",
		         dataType: "json",
		         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		           	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		 			},
		         success : function(result){
		        	 count++;


		        	 if(count == checkNum.length){
		        		 Swal.fire({
		        			  position: 'top-center',
		        			  icon: 'success',
		        			  title: '삭제되었습니다.',
		        			  showConfirmButton: false,
		        			  timer: 1500
		        		})
		        			setTimeout(sayHi,1500);
		        	 }
				}
			});//ajax 끝
		}//for문끝
	})//deleteNum 끝


	//모달창 1명 조회
   $(".teaNum").on("click",function(){
	   teaNum = $(this).data("teanum");

		let data = {"teaNum" : teaNum};

		$.ajax({
			url:"/manage/teaNum",
	         contentType:"application/json; charset:utf-8",
	         data: JSON.stringify(data),
	         type: "post",
	         dataType: "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
          	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
	         success : function(result){
	        	 $("#teaNum").val(result.teaVO.teaNum);
	        	 $("#teaNmKor").val(result.teaVO.teaNmKor);
	        	 $("#teaNmEng").val(result.teaVO.teaNmEng);
	        	 $("#major").val(result.teaVO.major);
	        	 $("#teaTitle").val(result.teaVO.teaTitle);
	        	 $("#teaAccount").val(result.teaVO.teaAccount);
	        	 $("#teaPn").val(result.teaVO.teaPn);
	        	 $("#teaReg1").val(result.teaVO.teaReg1);
	        	 $("#teaReg2").val(result.teaVO.teaReg2);
	        	 $("#teaZip").val(result.teaVO.teaZip);
	        	 $("#teaAddr1").val(result.teaVO.teaAddr1);
	        	 $("#teaAddr2").val(result.teaVO.teaAddr2);
	        	 $("#teaEmail").val(result.teaVO.teaEmail);
	        	 var str = "<option value='"+result.teaVO.deptNm+","+result.teaVO.deptNum+"' 'disabled'>" + result.teaVO.deptNm+ "</option>";
	        	 var str1="<option value='"+result.teaVO.teaTitle+"'>"+result.teaVO.teaTitle+"</option>";
	        	 $("#deptNm").html(str);
	        	 $("#teaTitle").html(str1);
	        	 $("#deptNm").attr("disabled",true);
	        	 $("#teaTitle").attr("disabled",true);
	        	 if(result.teaVO.teaPhoto != null){
		        	 $("#photo").attr("src","/resources/upload"+result.teaVO.teaPhoto);
	        	 }else{
	        		 $("#photo").removeAttr("src");
	        		 $("#photo").attr("src","/resources/noImage/KakaoTalk_20230324_175108600.jpg");
	        	 }
// 	        	 $("#teaBank").val(result.admVO.teaBank).attr("selected","selected");
	        	 $("#teaBank").prop('disabled',true);
			}
		});

   });

	// 모달창 1명 수정
	$("#updatePost").on("click",function(){
		$("#updatePost33").css("display","none");
		$("#updatePost44").css("display","block");
		$(".form-control").removeAttr("disabled");
		$(".form-select").removeAttr("disabled");
		$("#addrSearch").removeAttr("disabled");
		$("#teaNum").attr("readonly",true);
		$("#teaReg1").attr("disabled","true");
		$("#teaReg2").attr("disabled","true");

		$.ajax({
			url : "/manage/getDepartMentNm",
			contentType : 'application/json;charset=utf-8',
			dataType : "json",
			type : "post",
			 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			var str = "";
// 				str+="<option value='전체'>전체</option>";
			for(var i=0; i<result.data.length; i++){
				str+="<option value='"+result.data[i].deptNm+","+result.data[i].deptNum+"'>"+result.data[i].deptNm+"</option>";
			}

			$("#deptNm").append(str);
		}
	})//ajax끝
		$.ajax({			//직함 나오는 ajax시작
			url : "/manage/getTeacher",
			contentType : 'application/json;charset=utf-8',
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success:function(result){
				var str ="";
				for(var i =0; i<result.data.length; i++){
					str+="<option value='"+result.data[i].teaTitle+"'>"+result.data[i].teaTitle+"</option>";
				}
				$("#teaTitle").html(str);
			}
		}); //ajax끝
	});

	$("#cancelBtn").on("click", function(){
		if($("#save").text() == "저장"){
			$("#updatePost33").css("display","block");
			$("#updatePost44").css("display","none");
			$(".form-control").attr("disabled","false");
			$(".form-select").attr("disabled","false");
			$("#addrSearch").attr("disabled","false");
			$(".aaa").attr("disabled", false);			//셀렉트
			$("#category").attr("disabled", false); 	//input type text


		}else{
			$(".form-control").removeAttr("disabled");
			$('#teaInfo').modal('hide');
	        $('#teaInfo').hide();
		}
	});


	$("#save").on("click",function(){
		$("#teaNum").val(teaNum);
		var updateForm = decodeURIComponent($("form[name=updateForm]").serialize() );
		$.ajax({
			url:"/manage/updateTeacher",
// 	        contentType:"application/json; charset:utf-8",
	        data: updateForm,
	        type: "post",
	        dataType: "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	       		 },
	        success : function(result){
        	 $("#teaNmKor").val(result.teaVO.teaNmKor);
        	 $("#teaNmEng").val(result.teaVO.teaNmEng);
        	 $("#major").val(result.teaVO.major);
        	 $("#teaTitle").val(result.teaVO.teaTitle);
        	 $("#teaAccount").val(result.teaVO.teaAccount);
        	 $("#teaPn").val(result.teaVO.teaPn);
        	 $("#teaReg1").val(result.teaVO.teaReg1);
        	 $("#teaReg2").val(result.teaVO.teaReg2);
        	 $("#teaZip").val(result.teaVO.teaZip);
        	 $("#teaAddr1").val(result.teaVO.teaAddr1);
        	 $("#teaAddr2").val(result.teaVO.teaAddr2);
        	 $("#teaEmail").val(result.teaVO.teaEmail);

    		 Swal.fire({
      			  position: 'top-center',
      			  icon: 'success',
      			  title: '수정되었습니다.',
//       			  showConfirmButton: false,
      			  timer: 1500
      		})
				setTimeout(sayHi,1500);

        	 $("#teaInfo").modal("hide");

        	}
		});
	});


	//체크박스 선택시 추가 기능 막기

	$("#insert").on("click",function(){
		$("#createPost .mb-3").children().removeAttr("disabled");
		//$(".offcanvas-body").attr("class");
		$.ajax({
			url:"/manage/getTeaNum",
	         type: "post",
// 	         dataType: "json",
	         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
       		 },
	         success : function(result){
	        	 $("#teaNum1").val(result.getTeaNum);
	        	 $("#teaNum1").attr("readonly","true");
			}
		});
		//	학과명 출력
		$.ajax({
				url : "/manage/getDepartMentNm",
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
					str+="<option value='"+result.data[i].deptNm+","+result.data[i].deptNum+"'>"+result.data[i].deptNm+"</option>";
				}

				$("#deptNm1").append(str);
			}
		})//ajax끝

	});

	$("#create").on("click",function(){
		var form = $('#createPost')[0];
		var formData = new FormData(form);
		$.ajax({
			url : "/manage/createTeacher",
			processData : false,
			contentType:false,
			data : formData,
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
          	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				 Swal.fire({
       			  position: 'top-center',
       			  icon: 'success',
       			  title: '등록되었습니다.',
       			  showConfirmButton: false,
       			  timer: 1500
       		})
				setTimeout(sayHi,1500);
			}

		});
	});

	//total
	$.ajax({
		type: "get",
		dataType: "json",
		url: '/manage/total.do',
		beforeSend : function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      	},
      	success: function(data) {
      		$(".total").text(data.total);
      		$(".teaTitle").text(data.teaTitle);
//       		$(".originStu").text(data.origin);
//       		$(".gradStu").text(data.grad);
      	},
      	error: function (xhr) {
			console.log("학생 수 ajax에서 에러났다.");
		}
	});

	$("#btnAuto").on("click",function(){
		$("#deptNm1").prop("selected","국어교육과");
		$("#teaNmKor1").val("김지우");
		$("#teaNmEng1").val("Kim-Jiwoo");
		$("#teaPn1").val("010-1234-1234");
		$("#major1").val("생명과학과");
		$("#teaTitle1").val("학과장");
		$("#teaEmail1").val("pro@naver.com");
		$("#teaReg3").val("780123");
		$("#teaReg4").val("1111111");
		$("#teaZip1").val("1234");
		$("#teaAddr3").val("동춘당로114번길");
		$("#teaAddr4").val("스타크래프트");
	});

});
	var table = $(".table").DataTable({
	//		"lengthMenu": [ 10, 25, 50, 100 ],
	    "pageLength": 25,
	    "dom": 'rtBifp'
	});

	function sayHi() {
		location.reload();
	}
</script>
