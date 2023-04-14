<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

</script>
<style type="text/css">
.card{
   min-height: 100%;
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
.div-header{
   text-align: right;
   padding-right: 1.625rem;
}
.innerCard{
   border: 1px solid lightgray;
   border-radius: 5px;
   margin: 5px;
   padding: 10px;
}
.search-sel{
   width: 15%;
}
textarea{
   resize: none;
   width: 100%;
   maxlength: 300;
}
.infoDiv{
   margin: 10px;
}
</style>
<h4 class="title fw-bold py-3 mb-2 categoryBar">
   <i class="bx bx-collection page-icon"></i>
   <span class="fw-light">교직원관리 / </span>교직원 목록조회
</h4>

<script>
//다음 우편번호 검색
function openHomeSearch(){
	// 다음 우편번호 검색
	new daum.Postcode({
		// 다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
		oncomplete: function(data){
			// 우편번호
			$("#empZip").val(data.zonecode);
			$("#empAddr1").val(data.address);
			$("#empAddr2").val(data.buildingName);
		}
	}).open();


}
function openHomeSearch1(){
	// 다음 우편번호 검색
	new daum.Postcode({
		// 다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
		oncomplete: function(data){
			// 우편번호
			$("#empZip1").val(data.zonecode);
			$("#empAddr3").val(data.address);
			$("#empAddr4").val(data.buildingName);
		}
	}).open();



}
</script>
<div class="card">
	<div class="card-body">
		<div class="row g-4 mb-4">
		  <div class="col-sm-6 col-xl-3">
		    <div class="card tatalStuDiv">
		      <div class="card-body">
		        <div class="d-flex align-items-start justify-content-between">
		          <div class="content-left">
		            <span>전체 교직원</span>
		            <div class="d-flex align-items-end mt-2">
		              <h4 class="mb-0 me-2 total"></h4>
		<!--               <small class="text-success">(+29%)</small> -->
		            </div>
		            <small>전체 교직원 수(현재기준)</small>
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
<h5 class="card-title" style="align-items: center; font-size: x-large; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교직원 목록</h5>
  <div class="container">
   <form method="get" action="/manage/empManage">
     	<div class="card innerCard">
         <div class="row g-3">
            <div class="col-md-8">
               <div class="row infoDiv">
                  <div class=""></div>
                  <select id="category" name ="category" class="col-sm-2 form-select search-sel">
                     <option value="" selected<c:if test='${param.category == null}'>selected</c:if>>전체</option>
                     <option value="empnmkor" <c:if test='${param.category == "empnmkor"}'>selected</c:if>>이름</option>
                     <option value="empnnum"<c:if test='${param.category == "empnnum"}'>selected</c:if>>사번</option>
                     <option value="empgroup"<c:if test='${param.category == "empgroup"}'>selected</c:if>>소속</option>
                     <option value="empdp"<c:if test='${param.category == "empdp"}'>selected</c:if>>부서</option>
                  </select>

                  <div class="col-sm-4">
                     <input id="keyword" name="keyword"  value="${param.keyword}" type="text" class="form-control aaa" placeholder="검색어를 입력해주세요.">
                  </div>

                  <div class="col-sm-3">
                     <button type="submit" class="btn btn-label-secondary">검색</button>
                  </div>
               </div>
            </div>

            <div class="col-md-4">
               <div class="row infoDiv">
                  <div class="div-header">
                     <button type="button" class="btn btn-label-info" data-bs-toggle="offcanvas" data-bs-target="#offcanvasAddUser" id="insert" aria-controls="offcanvasAddUser">추가</button>
      					<a href="#" id="deleteEmpNum" class="btn btn-label-info">삭제하기</a>
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
               <th>사번</th>
               <th>이름</th>
               <th>소속</th>
               <th>부서</th>
               <th>직책</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="admVO" items="${data.content}" varStatus="stat">
            <tr id="empNum${admVO.empNum}">
               <td><input value="${admVO.empNum}" class="form-check-input" type="checkbox" id="sel" name="sel"></td>
               <td>${stat.index+1}</td>
               <td class="empNum" data-bs-toggle="modal" data-bs-target="#empInfo"  data-empnum="${admVO.empNum}"><a href="#"  class="fw-semibold">${admVO.empNum}</a></td>
               <td>${admVO.empNmKor}</td>
               <td>${admVO.empGroup}</td>
               <td>${admVO.empDp}</td>
               <td>${admVO.empTitle}</td>
            </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>
   </div>


<div class="">
	<div class="col">
		<div class="demo-inline-spacing">
			<!-- Basic Square Pagination -->
			<nav aria-label="Page navigation">
				<ul class="pagination pagination-round pagination-primary justify-content-center">
					<li class="page-item first <c:if test="${data.startPage -1 <= 0}">disabled</c:if>">
						<a href="/manage/empManage?keyword=${param.keyword}&currentPage=${data.startPage -1}&size=${param.size}" class="page-link"> <i class="tf-icon bx bx-chevrons-left"></i></a>
					</li>
					<c:forEach var="pNO" begin="${data.startPage}" end="${data.endPage}">
						<li class="page-item <c:if test='${param.currentPage==pNO}'>active</c:if>">
							<a class="page-link" href="/manage/empManage?keyword=${param.keyword}&currentPage=${pNO}&size=${param.size}">${pNO}</a>
						</li>
					</c:forEach>
					<li class="page-item last <c:if test="${data.endPage ge data.totalPages}">disabled</c:if>">
						<a class="page-link" href="/manage/empManage?keyword=${param.keyword}&currentPage=${data.endPage +1}&size=${param.size}">
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



<!-- <img src="/resources/upload/2023/03/18/a640e467-b6da-491c-846d-524038454e0b_dkgk.jpg"> -->

<!-- 관리자 상세보기 모달 -->
<div class="modal fade" id="empInfo" tabindex="-1" style="display: none;" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc">
      <div class="modal-content p-3 p-md-5">
         <div class="modal-body">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <form id="updateForm" name="updateForm">
               <div class="row g-3">
                  <div class="col-md-5">
                     <div class="row register-images" >
         		   	    <img style="width: 160px; height: 200px; border-radius: 5px;" id="pp" class="imgs_wrap" src="/resources/upload${admVO.empPhoto}" alt="">
                     </div>
                  </div>
                  <div class="col-md-7">
                     <div class="row infoDiv">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empNum">사번</label>
                        <div class="col-sm-9">
                           <input type="text" id="empNum" name="empNum" class="form-control" value="" disabled>
                        </div>
                     </div>
                     <div class="row infoDiv">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empNmKor">이름</label>
                        <div class="col-sm-9">
                           <input type="text" id="empNmKor" name="empNmKor" class="form-control" value="" disabled>
                        </div>
                     </div>
                     <div class="row infoDiv">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empNmEng">영문이름</label>
                        <div class="col-sm-9">
                           <input type="text" id="empNmEng" name="empNmEng" class="form-control" value="" disabled>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <div class="row">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empAccount">계좌번호</label>
                        <div class="col-sm-3">
                           <select id="empBank" name="empBank" class="form-select" aria-label="Default select example" disabled>
                              <option value="국민">국민</option>
                              <option value="기업">기업</option>
                              <option value="농협">농협</option>
                              <option value="하나">하나</option>
                              <option value="신한">신한</option>
                           </select>
                        </div>
                        <div class="col-sm-6">
                           <input type="text" id="empAccount" name="empAccount" class="form-control" value="" disabled />
                        </div>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <div class="row">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empPn">연락처</label>
                        <div class="col-sm-9">
                           <input type="text" id="empPn" name="empPn" class="form-control" value="" disabled />
                        </div>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <div class="row">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empPn">주민번호</label>
                        <div class="col-sm-4">
                           <input type="text" id="empReg1" name="empReg1" class="form-control" value="" disabled />
                        </div>
                        <div class="col-sm-1" style="margin-top:9px;text-align: center;">
                        ―
                        </div>
                        <div class="col-sm-4">
                           <input type="text" id="empReg2" name="empReg2" class="form-control" value="" disabled />
                        </div>
                     </div>
                  </div>
<!--                   <button style="margin-left:68%; width:30%; height:30%;" type="button" class="btn btn-xs btn-label-secondary" onclick="openHomeSearch()" id="addrSearch" disabled>주소검색</button> -->
                  <div class="col-md-12">
                     <div class="row">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empAddr1">우편번호</label>
                        <div class="col-sm-4">
                           <input type="text" id="empZip" name="empZip" class="form-control" value="" disabled />
                        </div>
                        <div class="col-sm-1" style="margin-top:9px;text-align: center;"></div>
                        <div class="col-sm-4">
						<button style="margin-left:45%; width:55%; height:100%;" type="button" class="btn btn-xs btn-label-secondary" onclick="openHomeSearch()" id="addrSearch" disabled>주소검색</button>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <div class="row">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empAddr1">주소</label>
                        <div class="col-sm-9">
                           <input type="text" id="empAddr1" name="empAddr1" class="form-control" value="" disabled />
                        </div>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <div class="row">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empAddr2">상세주소</label>
                        <div class="col-sm-9">
                           <input type="text" id="empAddr2" name="empAddr2" class="form-control" value="" disabled />
                        </div>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <div class="row">
                        <label class="col-sm-3 col-form-label text-sm-end" for="empEmail">이메일</label>
                        <div class="col-sm-9">
                           <input type="text" id="empEmail" name="empEmail" class="form-control" value="" disabled />
                        </div>
                     </div>
                  </div>

                  <div class="col-md-12 text-center" id="updatePost33">
                     <button type="button" class="btn btn-primary me-sm-3 me-1" id="updatePost">수정</button>
                     <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close" >취소</button>
                  </div>
                  <div class="col-md-12 text-center"style="display: none" id="updatePost44">
                     <button type="button" id="save" class="btn btn-primary me-sm-3 me-1" id="updatePost1">저장</button>
                     <button type="button" class="btn btn-label-secondary" id="cancelBtn" >취소</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>

<!-- Offcanvas to add new user -->
	  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasAddUser" aria-labelledby="offcanvasAddUserLabel">
	    <div class="offcanvas-header">
	      <h5 id="offcanvasAddUserLabel" class="offcanvas-title">교직원 추가</h5>
	      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	    </div>
	    <div class="offcanvas-body mx-0 flex-grow-0">
	      <form id="createPost"  onsubmit="return false">
	        <div class="mb-3">
	          <label class="form-label" for="add-user-fullname">사번</label>
	          <input type="text" class="form-control" id="empNum1" name="empNum1"/>
	        </div>
	        <div class="mb-3">
	          <label class="form-label" for="add-user-fullname">이름(한글)</label>
	          <input type="text" class="form-control" id="empNmKor1" name="empNmKor1" placeholder="오윤균" required/>
	        </div>
	        <div class="mb-3">
	          <label class="form-label" for="add-user-fullname">이름(영어)</label>
	          <input type="text" class="form-control" id="empNmEng1" name="empNmEng1" placeholder="YunGyun Oh" required/>
	        </div>
	        <div class="mb-3">
	          <label class="form-label" for="empGroup1">소속</label>
	          <select id="empGroup1" name="empGroup1"class="select2 form-select">
	            <option value="" required>소속을 선택하세요</option>
	            <option value="시설운영팀">시설운영팀</option>
	            <option value="인사관리팀">인사관리팀</option>
	            <option value="경영지원팀">경영지원팀</option>
	          </select>
	        </div>
	        <div class="mb-3">
	          <label class="form-label" for="empDp1">직책</label>
	          <select id="empDp1" name="empDp1" class="select2 form-select">
	            <option value="" required>직책을 선택하세요</option>
	            <option value="부장">부장</option>
	            <option value="과장">과장</option>
	            <option value="주임">주임</option>
	            <option value="사원">사원</option>
	          </select>
	        </div>
	        <div class="mb-3">
	          <label class="form-label" for="add-user-company">주민번호</label>
	          <div class="input-group">
		          <input type="text" id="empReg3" class="form-control" placeholder="주민번호 앞자리"  name="empReg3" required/>
		          <input type="text" id="empReg4" class="form-control" placeholder="주민번호 뒷자리"  name="empReg4" required/>
	          </div>
	        </div>
	        <div class="mb-3">
	          <label class="form-label" for="add-user-company">이메일</label>
	          <input type="text" id="empEmail1" class="form-control" placeholder="yungyun@example.com" aria-label="john.doe@example.com" name="empEmail1" required/>
	        </div>
	        <div class="mb-3">
	          <label class="form-label" for="add-user-contact">연락처</label>
	          <input type="text" id="empPn1" class="form-control phone-mask" placeholder="010-1234-5678" aria-label="john.doe@example.com" name="empPn1" required/>
	        </div>

	        <div class="mb-3">
	           <button type="button" class="btn btn-xs btn-label-secondary" onclick="openHomeSearch1()" id="addrSearch" name="addrSearch" required>주소검색</button>
	        </div>
	        <div class="mb-3">
	          <label class="form-label" for="add-user-contact">우편번호</label>
	           <input type="text" id="empZip1" name="empZip1" class="form-control" value="" required/>
	        </div>

	        <div class="mb-3">
	          <label class="form-label" for="add-user-contact">주소</label>
	           <input type="text" id="empAddr3" name="empAddr3" class="form-control" value="" required/>
	        </div>

	        <div class="mb-3">
	          <label class="form-label" for="add-user-contact">상세주소</label>
	           <input type="text" id="empAddr4" name="empAddr4" class="form-control" value="" required/>
	        </div>
	        <button type="submit" class="btn btn-primary me-sm-3 me-1 data-submit" id="create">추가</button>
	        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="offcanvas">취소</button>
	      </form>
	    </div>
	  </div>

<script>
$(function(){
	var checkNum = [];
	var checkVal = $('input:checkbox[name=sel]:checked').val();
	let empNum = "";
	$('input:checkbox[name=sel]').on("click",function(){
		checkNum.push($(this).val());
	});

	$("#deleteEmpNum").on("click",function(){
		if(!checkNum.length>0){
			Swal.fire({
				  icon: 'error',
				  title: '체크박스 설정해주세요',
				})
			return false;
		};

		var count = 0;
		for(var i =0; i<checkNum.length; i++){
			let data = {"empNum" : checkNum[i]};
			$.ajax({
				url:"/manage/deleteEmp",
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

	function sayHi() {
		location.reload();
	}

	//모달창 1명 조회
   $(".empNum").on("click",function(){
		empNum = $(this).data("empnum");

		let data = {"empNum" : empNum};

		$.ajax({
			url:"/manage/empNum",
	         contentType:"application/json; charset:utf-8",
	         data: JSON.stringify(data),
	         type: "post",
	         dataType: "json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
	         success : function(result){
	        	 $("#empNum").val(result.admVO.empNum);
	        	 $("#empNmKor").val(result.admVO.empNmKor);
	        	 $("#empNmEng").val(result.admVO.empNmEng);
	        	 $("#empGroup").val(result.admVO.empGroup);
	        	 $("#empTitle").val(result.admVO.empTitle);
	        	 $("#empAccount").val(result.admVO.empAccount);
	        	 $("#empPn").val(result.admVO.empPn);
	        	 $("#empReg1").val(result.admVO.empReg1);
	        	 $("#empReg2").val(result.admVO.empReg2);
	        	 $("#empZip").val(result.admVO.empZip);
	        	 $("#empAddr1").val(result.admVO.empAddr1);
	        	 $("#empAddr2").val(result.admVO.empAddr2);
	        	 $("#empEmail").val(result.admVO.empEmail);
	        	 if(result.admVO.empPhoto != null){
		        	 $("#pp").attr("src","/resources/upload"+result.admVO.empPhoto);
	        	 }else{
	        		 $("#pp").removeAttr("src");
	        		 $("#pp").attr("src","/resources/noImage/KakaoTalk_20230324_175108600.jpg");
	        	 }
	        	 $("#empBank").val(result.admVO.empBank).attr("selected","selected");
	        	 $("#empBank").prop('disabled',true);
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
		$("#empNum").attr("readonly",true);
		$("#empReg1").attr("disabled","true");
		$("#empReg2").attr("disabled","true");
		$("#image").attr("disabled","true");
	});

	$("#cancelBtn").on("click", function(){
		if($("#save").text() == "저장"){
			$("#updatePost33").css("display","block");
			$("#updatePost44").css("display","none");
			$(".form-control").attr("disabled", "false");
			$(".form-select").attr("disabled", "false");
			$("#addrSearch").attr("disabled", "false");
			$("#empNum").attr("readonly",false);
			$(".aaa").attr("disabled", false);			//셀렉트
			$("#category").attr("disabled", false); 	//input type text
		}else{
			$('#empInfo').modal('hide');
	        $('#empInfo').hide();
		}
	});


	$("#save").on("click",function(){
		$("#empNum").val(empNum);
		 var updateForm = decodeURIComponent($("form[name=updateForm]").serialize() );
		$.ajax({
			url:"/manage/updatePost",
// 	        contentType:"application/json; charset:utf-8",
	        data: updateForm,
	        type: "post",
	        dataType: "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	       		 },
	        success : function(result){
        	 $("#empNmKor").val(result.admVO.empNmKor);
        	 $("#empNmEng").val(result.admVO.empNmEng);
        	 $("#empGroup").val(result.admVO.empGroup);
        	 $("#empTitle").val(result.admVO.empTitle);
        	 $("#empAccount").val(result.admVO.empAccount);
        	 $("#empPn").val(result.admVO.empPn);
        	 $("#empReg1").val(result.admVO.empReg1);
        	 $("#empReg2").val(result.admVO.empReg2);
        	 $("#empAddr1").val(result.admVO.empAddr1);
        	 $("#empAddr2").val(result.admVO.empAddr2);
        	 $("#empEmail").val(result.admVO.empEmail);

    		 Swal.fire({
      			  position: 'top-center',
      			  icon: 'success',
      			  title: '수정되었습니다.',
      			  showConfirmButton: false,
      			  timer: 1500
      		})
				setTimeout(sayHi,1500);

        	 $("#empInfo").modal("hide");

        	}
		});
	});


	//체크박스 선택시 추가 기능 막기
	var checkNum1 = [];
	var checkVal1 = $('input:checkbox[name=sel]:checked').val();

	$("#insert").on("click",function(){
		$.ajax({
			url:"/manage/getEmpNum",
	         type: "post",
	         //dataType: "json",
	         beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
       		 },
	         success : function(result){
	        	 $("#empNum1").val(result.empNum);
	        	 $("#empNum1").attr("readonly","true");
			}
		});

	});

	$("#create").on("click",function(){
		var form = $('#createPost')[0];
		var formData = new FormData(form);

		$.ajax({
			url : "/manage/createPost",
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
					  icon: 'success',
					  title: '교수를 추가하였습니다.',
					  confirmButtonText: '확인',
				})
				setTimeout(sayHi,1500);
			}

		});
	});

	//total
	$.ajax({
		type: "get",
		dataType: "json",
		url: '/manage/emptotal.do',
		beforeSend : function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      	},
      	success: function(data) {
      		$(".total").text(data.total);
      		$(".teaTitle").text(data.teaTitle);
      	},
      	error: function (xhr) {
			Swal.fire({
				title: "error : "+ xhr.status,
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'error',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
			console.log("학생 수 ajax에서 에러났다.");
		}
	});

});


</script>
