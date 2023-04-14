<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
	<div class="card-body">

		<div class="row g-4 mb-4">
		  <div class="col-sm-6 col-xl-3">
		    <div class="card tatalStuDiv">
		      <div class="card-body">
		        <div class="d-flex align-items-start justify-content-between">
		          <div class="content-left">
		            <span>전체 학생</span>
		            <div class="d-flex align-items-end mt-2">
		              <h4 class="mb-0 me-2 tatalStu">15,000</h4>
		<!--               <small class="text-success">(+29%)</small> -->
		            </div>
		            <small>전체 학생의 수(현재기준)</small>
		          </div>
		          <span class="badge bg-label-primary rounded p-2">
		            <i class="bx bx-user bx-sm"></i>
		          </span>
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6 col-xl-3">
		    <div class="card newStuDiv">
		      <div class="card-body">
		        <div class="d-flex align-items-start justify-content-between">
		          <div class="content-left">
		            <span>신입생</span>
		            <div class="d-flex align-items-end mt-2">
		              <h4 class="mb-0 me-2 newStu">2,320</h4>
		<!--               <small class="text-success">(+18%)</small> -->
		            </div>
		            <small>올해 신입생 수</small>
		          </div>
		          <span class="badge bg-label-danger rounded p-2">
		            <i class="bx bx-user-plus bx-sm"></i>
		          </span>
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6 col-xl-3">
		    <div class="card originStuDiv">
		      <div class="card-body">
		        <div class="d-flex align-items-start justify-content-between">
		          <div class="content-left">
		            <span>재학생</span>
		            <div class="d-flex align-items-end mt-2">
		              <h4 class="mb-0 me-2 originStu">12,500</h4>
		<!--               <small class="text-danger">(-14%)</small> -->
		            </div>
		            <small>이번 학기 재학생 수</small>
		          </div>
		          <span class="badge bg-label-success rounded p-2">
		            <i class="bx bx-group bx-sm"></i>
		          </span>
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6 col-xl-3">
		    <div class="card gradStuDiv">
		      <div class="card-body">
		        <div class="d-flex align-items-start justify-content-between">
		          <div class="content-left">
		            <span>졸업생</span>
		            <div class="d-flex align-items-end mt-2">
		              <h4 class="mb-0 me-2 gradStu">234,345</h4>
		<!--               <small class="text-success">(+42%)</small> -->
		            </div>
		            <small>총 졸업생 수(누적)</small>
		          </div>
		          <span class="badge bg-label-warning rounded p-2">
		            <i class="bx bx-user-voice bx-sm"></i>
		          </span>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Users List Table -->
		<div class="card">
		  <div class="card-header row">
		   	<h5 class="card-title" style="align-items: center; font-size: x-large; font-weight: bold;">학생 목록</h5>
		    <div class="col-2">
		    	<select id="statKey" class="select2 form-select" onchange="chageLangSelect()">
			            <option value="all">전체</option>
			            <option value="0">재학</option>
			            <option value="1">휴학</option>
			            <option value="2">자퇴</option>
			            <option value="3">졸업</option>
			            <option value="4">제적</option>
			            <option value="5">졸업유예</option>
			    </select>
		    </div>
		    <div class="col-10 user_role text-end">
		    	<button class="btn btn-primary" type="button" id="addStuBtn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasAddUser" aria-controls="offcanvasAddUser">학생 추가</button>
		    	<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#largeModal">신입생 추가</button>
		    </div>
		  </div>
		  <div class="card-body">
			  <div class="card-datatable table-responsive">
			    <table class="datatables-users table border-top table-hover">
			      <thead>
			        <tr>
			          <th>순번</th>
			          <th>이름</th>
			          <th>학번</th>
			          <th>학과</th>
			          <th>연락처</th>
			          <th>상태</th>
			          <th>학기</th>
			        </tr>
			      </thead>
			      <tbody>
			      	<c:forEach var="list" items="${data}" varStatus="i">
			   			<c:set value="bg-label-info" var="status"/>
			      		<c:if test="${list.stustat eq '제적' }">
			      			<c:set value="bg-label-danger" var="status"/>
			      		</c:if>
			      		<c:if test="${list.stustat eq '휴학' }">
			      			<c:set value="bg-label-warning" var="status"/>
			      		</c:if>
			      		<c:if test="${list.stustat eq '졸업' }">
			      			<c:set value="bg-label-dark" var="status"/>
			      		</c:if>
			      		<c:if test="${list.stustat eq '자퇴' }">
			      			<c:set value="bg-label-secondary" var="status"/>
			      		</c:if>
			      		<tr>
				      		<td>${i.count}</td>
							<td><a href="" class="text-body text-truncate"><span class="fw-semibold">${list.stuNmKor }</span></a></td>
							<td>${list.stuNum }</td>
							<td>${list.deptNm }</td>
							<td>${list.stuPn }</td>
							<td><span class="badge ${status}">${list.stustat}</span></td>
							<td>${list.stuSemester }</td>
				      	</tr>
			      	</c:forEach>
			      </tbody>
			    </table>
			  </div>
				<!-- Offcanvas to add new user -->
			  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasAddUser" aria-labelledby="offcanvasAddUserLabel">
			    <div class="offcanvas-header">
			      <h5 id="offcanvasAddUserLabel" class="offcanvas-title">학생 추가</h5>
			      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			    </div>
			    <div class="offcanvas-body mx-0 flex-grow-0">
			      <form class="add-new-user pt-0" id="addNewUserForm" onsubmit="return false">
			        <div class="mb-3">
			          <label class="form-label" for="add-user-name-kor">이름(한글)</label>
			          <input type="text" class="form-control" id="add-user-name-kor" placeholder="홍길동" name="stuNmKor" aria-label="홍길동" />
			        </div>
			        <div class="mb-3">
			          <label class="form-label" for="add-user-name-eng">이름(영어)</label>
			          <input type="text" class="form-control" id="add-user-name-eng" placeholder="Hong-GilDong" name="stuNmEng" aria-label="Hong-GilDong" />
			        </div>
			        <div class="mb-3">
			          <label class="form-label" for="add-user-email">학과</label>
			          <select id="dept" class="select2 form-select">
			            <option value="">컴공</option>
			          </select>
			        </div>
			        <div class="mb-3">
			          <label class="form-label" for="add-user-contact">학번</label>
			          <div class="input-group">
			          	<input type="text" id="add-user-contact" class="form-control phone-mask" aria-label="" name="userContact" readonly/>
			          	<button type="button" id="btnDP" class="btn btn-outline-primary">생성</button>
			          </div>
			        </div>
			        <div class="mb-3">
			          <label class="form-label" for="add-user-company">주민번호</label>
			          <div class="input-group">
				          <input type="text" id="add-user-company" class="form-control" placeholder="주민번호 앞자리" aria-label="jdoe1" name="companyName" maxLength=6/>
				          <input type="password" id="add-user-company" class="form-control" placeholder="주민번호 뒷자리" aria-label="jdoe1" name="companyName" maxLength=7/>
			          </div>
			        </div>
			        <div class="mb-3">
			          <label class="form-label" for="add-user-company">이메일</label>
			          <input type="text" id="add-user-email" class="form-control" placeholder="john.doe@example.com" aria-label="john.doe@example.com" name="userEmail" />
			        </div>
			        <div class="mb-3">
			          <label class="form-label" for="add-user-contact">연락처</label>
			          <input type="text" id="add-user-contact" class="form-control phone-mask" placeholder="+1 (609) 988-44-11" aria-label="john.doe@example.com" name="userContact" />
			        </div>	        
			        <div class="mb-3">
			          <label class="form-label" for="country">은행</label>
			          <select id="country" class="select2 form-select">
			            <option value="">Select</option>
			            <option value="(신)KB국민은행">(신)KB국민은행</option>
			            <option value="IBK기업은행">IBK기업은행</option>
			            <option value="NH농협은행">NH농협은행</option>
			            <option value="(신)신한은행">(신)신한은행</option>
			            <option value="우리은행">우리은행</option>
			            <option value="KEB하나은행">KEB하나은행</option>
			            <option value="외환은행">외환은행</option>
			            <option value="씨티은행">씨티은행</option>
			            <option value="DGB대구은행">DGB대구은행</option>
			            <option value="BNK부산은행">BNK부산은행</option>
			            <option value="SC제일은행">SC제일은행</option>
			            <option value="케이뱅크">케이뱅크</option>
			            <option value="카카오뱅크">카카오뱅크</option>
			          </select>
			        </div>
			        <div class="mb-3">
			          <label class="form-label" for="user-role">계좌번호</label>
			          <input type="text" id="add-user-contact" class="form-control phone-mask" placeholder="(82) 010-2323-1111" aria-label="john.doe@example.com" name="userContact" />
			        </div>
			        <div class="mb-3 w-50">
			        	<label class="form-label" for="user-role">학기</label>
						<div class="input-group input-group-merge">
						  <input type="text" id="basic-default-email" class="form-control text-end" value="1" aria-label="1" aria-describedby="semester" readonly />
						  <span class="input-group-text" id="semester">학기</span>
						</div>
			        </div>
			        <button type="submit" class="btn btn-primary me-sm-3 me-1 data-submit">추가</button>
			        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="offcanvas">취소</button>
			      </form>
			    </div>
			  </div>
		  </div>
		</div>
			
		<!-- Large Modal -->
		        <div class="modal fade" id="largeModal" tabindex="-1" aria-hidden="true">
		          <div class="modal-dialog modal-lg" role="document">
		            <div class="modal-content">
		              <div class="modal-header">
		                <h5 class="modal-title" id="exampleModalLabel3">신입생 추가</h5>
		                <button type="button" class="btn-close closeBtn" data-bs-dismiss="modal" aria-label="Close"></button>
		              </div>
		              <form name="frmManyStu" id="frmManyStu" method="post" enctype="multipart/form-data">
			              <div class="modal-body">
			              	<input type="hidden" name="testData" value="test용"/>
			                <div class="row">
			                  <div class="col mb-3">
			                    <label for="nameLarge" class="form-label">신입생 추가</label>
			                    <input type="file" id="poie" name="poie" class="form-control" placeholder="">
			                    <div class="form-text"> excel 파일 .xlsx 확장자만 가능합니다.</div>
			<!--                     <small>excel만 가능합니다.</small> -->
			                  </div>
			                </div>
			                <div class="row">
			                	<div class="col-8"></div>
				                <div class="col-4 mb-0 text-end">
					                <button type="button" class="btn btn-label-secondary closeBtn" data-bs-dismiss="modal">Close</button>
					                <button type="button" class="btn btn-primary" id="btnMS">확인</button>
				                </div>
			                </div>
			              </div>
			              <div class="modal-footer text-center">
			              </div>
		              </form>
		            </div>
		          </div>
		        </div>
			
	</div>
<!-- 	card-body end -->

</div>



<script type="text/javascript">
// 학적상태 검색 키워드 변경(statKey:selectBox)
function chageLangSelect(){
    var langSelect = document.getElementById("statKey");
     
    // select element에서 선택된 option의 value가 저장된다.
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
 
    // select element에서 선택된 option의 text가 저장된다.
//     var selectText = langSelect.options[langSelect.selectedIndex].text;
    location.href = "/stuList/list?selectKey="+selectValue;
}

$(function(){
	//페이지 로드 시 데이터 표시

	//totalStu
	$.ajax({
		type: "get",
		dataType: "json",
		url: '/stuList/totalStu.do',	
		beforeSend : function(xhr) {   
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      	},
      	success: function(data) {
      		$(".tatalStu").text(data.total); 
      		$(".newStu").text(data.newS); 
      		$(".originStu").text(data.origin); 
      		$(".gradStu").text(data.grad); 
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
		}
	});
	
// 	//div 클릭시 필터
// 	$(".tatalStuDiv").on("click",function(){
// 		location.href = "/stuList/list?selectKey=015";
// 	});
	
	
	
	var table = $(".table").DataTable({
// 		"lengthMenu": [ 10, 25, 50, 100 ], 
	    "pageLength": 25, 
	    "dom": 'rtBifp' 
	});
	

	$("#addStuBtn").on("click",function(){
		
		//학과 목록 가져오기
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: '/stuList/deptList.do',	
			dataType: "json",
			beforeSend : function(xhr) {   
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      	},
	      	success: function (data) {
				// 잘 불러왔다는 확인 알림
				Swal.fire({
				    title: '성공',
				    timer: 1000,
				    showClass: {
				      popup: 'animate__animated animate__bounceIn'
				    },
				    icon: 'success',
				    customClass: {
				      confirmButton: 'btn btn-primary'
				    },
				    buttonsStyling: false
				  });
				  
				let deptData = "";
				$.each(data, function(i, item){
				  deptData +=  '<option value="'+item.deptNum+'">'+item.deptNm+'</option>';
				});
				  
				$("#dept").html(deptData);	
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
			}
			
		});
		
	});


	$(document).on("click", "#btnMS", function(){
		// Get form
		var formValues = $("form[name=frmManyStu]")[0] ;

		// Create an FormData object 
		var data = new FormData(formValues);
		
        $.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: '/manyStudent.do',	// form을 전송할 실제 파일경로
			data: data,
			dataType: "json",
			processData: false,
			contentType: false,
			beforeSend : function(xhr) {   // 전송 전 실행 코드 // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      	},
			success: function (data) {
				// 전송 후 성공 시 실행 코드
				// 확인 알림
				if(data!=null){
					Swal.fire({
					    title: '추가 성공',
					    timer: 5000,
					    showClass: {
					      popup: 'animate__animated animate__bounceIn'
					    },
					    icon: 'success',
					    customClass: {
					      confirmButton: 'btn btn-primary'
					    },
					    buttonsStyling: false
					  });
					
					var ddat = "<div class='table-responsive text-nowrap w-100 h-px-700'>";
					
					ddat += "<table class='table cell-fit table-hover'> ";
					
					$.each(data, function(i, item){
						ddat += '<tr>'
						
						$.each(item, function(ii, iitem){
							if(ii==0){
								ddat += '<th>' + iitem + '</th>';
							}else{
								ddat += '<td>' + iitem + '</td>';
							}
						});
						ddat += '</tr>';
					});
					ddat += '</table></div>';
					
					$(".modal-footer").html(ddat);
				}else {
					Swal.fire({
					    title: '추가 실패',
					    html: 'excel 데이터만 추가해주세요 <br/> 학생 데이터의 목록과 일치해야 합니다.',
					    timer: 5000,
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
			},
			error: function (e) {
				// 전송 후 에러 발생 시 실행 코드
				Swal.fire({
				    title: '추가 실패',
				    html: 'excel 데이터만 추가해주세요 <br/> 학생 데이터의 목록과 일치해야 합니다.',
				    timer: 5000,
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
        
	});// btnMs 버튼 클릭
	
	$('#largeModal').on('hidden.bs.modal', function () {
		$("#poie").val("");
	});
});



	
</script>

