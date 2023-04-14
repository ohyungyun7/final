<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.card:hover{
   transition-duration: 0.4s;
   box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(function(){
	$(".button").on("click",function(){
		var sbjNum = $(this).data("no");
		let data = {"sbjNum" : sbjNum};
		$.ajax({
	  		url : "/exam/examCheck",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		data : JSON.stringify(data),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				//window.location = "/exam/examMake?sbjNum="+sbjNum;
				//시험문제가 이미 냈음
			   if(result.result>0){
		    		Swal.fire({
						title: "이미 작성한 시험이 있습니다 수정하시겠습니까?",
						showDenyButton: true,
						confirmButtonText: 'Yes',
						denyButtonText: 'No',
						customClass: {
							actions: 'my-actions',
							cancelButton: '',
							confirmButton: 'btn btn-primary',
							denyButton: 'btn btn-secondary',
						}
					}).then((result) => {
						if(result.isConfirmed){
							window.location = "/exam/examUpdate?sbjNum="+sbjNum;
						}else{
							return false;
						}
					});
				}else{//시험문제 아직 없음
					window.location = "/exam/examMake?sbjNum="+sbjNum;
				}
			}
		})//ajax끝
	})//.button 끝
})
</script>
<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-report page-icon"></i>
	<span style="font-weight: normal;">시험등록 / </span>온라인시험
</h4>
		<div class="row mb-5">
			<c:if test="${subjectVO ne null}">
				<c:forEach var="subject" items="${subjectVO}" varStatus="stat">
					<div class="col-md-6 col-lg-4 mb-3">
						<div class="card h-100 sub-card">
							<div class="card-body">
								<h5 class="card-title">${subject.sbjTitle}</h5>
								<button class="btn btn-outline-primary button" data-no="${subject.sbjNum}">시험출제하기</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<c:if test="${subjectVO eq null}">
			<div class="row mb-5">
				<div class="col-md-6 col-lg-4 mb-3">
						<div class="card h-100 sub-card">
							<div class="card-body">
								<h5 class="card-title">온라인 과목이 없습니다.</h5>
							</div>
						</div>
				</div>
			</div>
		</c:if>

