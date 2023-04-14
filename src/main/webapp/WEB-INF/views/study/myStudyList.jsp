<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	int study_userId = userVO.getUsername();
%>

<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<style type="text/css">
.card:hover{
   transition-duration: 0.4s;
   box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
.buttonFloor{
	float: right;
}
</style>
<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-pencil page-icon"></i>
	나의 스터디 리스트
	<a href="#" class="btn btn-info" id="openDiv" style="float: right;">스터디 찾아보기</a>
</h4>
	
	
	<h5 class="text-muted ms-3"><i class='bx bxs-log-in-circle' ></i>참여중인 스터디</h5>

	<div class="row mb-5 endterdDiv">
		<c:forEach var="studyVO" items="${studyVOList}" varStatus="stat">
			<c:if test="${studyVO.sGrade lt 2}">
				<div class="col-md-6 col-lg-4 mb-3">
					<div class="card h-100 sub-card">
						<div class="card-body">
							<h5 class="card-title" style="display: inline-block;">${studyVO.sNm}</h5>
							<p class="card-text">현재 참여자 ${studyVO.stuCount }명</p>
							<div class="buttonDiv">
								<span>${studyVO.od }</span>
								<c:choose>
									<c:when test="${studyVO.sGrade lt 0}">
										<span class="buttonFloor" style="color: red;">정지된 스터디</span>
									</c:when>
									<c:otherwise>
										<button type="button" id="${studyVO.sNum}" class="btn btn-outline-primary btnEnter buttonFloor">입장</button>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	
	<h5 class="text-muted ms-3"><i class='bx bxs-user-check' ></i>신청한 스터디</h5>
	
	<div class="row mb-5">
		<c:forEach var="studyVO" items="${studyVOList}" varStatus="stat">
			<c:if test="${studyVO.sGrade == 2}">
				<div class="col-md-6 col-lg-4 mb-3 studyDiv">
					<div class="card h-100 sub-card">
						<div class="card-body">
							<h5 class="card-title">${studyVO.sNm}</h5>
							
							<p class="card-text">현재 참여자 ${studyVO.stuCount }명</p>
							<div class="buttonDiv">
								<span>${studyVO.od }</span>
								<button type="button" id="${studyVO.sNum}" class="btn btn-outline-primary btnDelete buttonFloor">취소</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	
	<h5 class="text-muted ms-3"><i class='bx bxs-user-plus' ></i>초대받은 스터디</h5>
	
	<div class="row mb-5">
		<c:forEach var="studyVO" items="${studyVOList}" varStatus="stat">
			<c:if test="${studyVO.sGrade == 3}">
				<div class="col-md-6 col-lg-4 mb-3 studyDiv">
					<div class="card h-100 sub-card">
						<div class="card-body">
							<h5 class="card-title">${studyVO.sNm}</h5>
							
							<p class="card-text">현재 참여자 ${studyVO.stuCount }명</p>
							<span style="margin-right: 38%;">${studyVO.od }</span>
							<button type="button" id="${studyVO.sNum}" class="btn btn-outline-primary btnUpdate">수락</button>
							<button type="button" id="${studyVO.sNum}" class="btn btn-outline-primary btnDelete">거절</button>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>


<script>
function cancelCheck(sNm) {
	Swal.fire({
		title: "\"" + sNm + "\"에 대한 신청을 취소하시겠습니까?",
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
			return true;
		}
		
		if(result.isDenied){
			return false;
		}
	});
}

$(".btnEnter").on("click", function() {
	let sNum = $(this).attr("id");
	$.ajax({
		url: "/study/setSNum",
		data: {"sNum" : sNum},
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
		success: function(result) {
			if(result == 1){
				location.href = "/study/studyMain";
			}
		}
	});
});

$(".btnUpdate").on("click", function() {
	let sNum = $(this).attr("id");
	
	let data = {"sNum" : sNum, 
				"stuNum" : "${studyVOList[0].stuNum}",
				"sGrade" : 0};
	
	ajaxFunction(data)
});

$(".btnDelete").on("click", function() {
	let sNum = $(this).attr("id");
	let data = {"sNum" : sNum, 
				"stuNum" : parseInt("${studyVOList[0].stuNum}"),
				"sGrade" : -1};

	ajaxFunction(data);
});

function ajaxFunction(data) {
	$.ajax({
		url: "/study/modiStudyGrade",
		data: data,
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
		success: function(result) {
			if(result == 1){
				location.href = "/study/myStudyList";
			}
		}
	});
}

$("#openDiv").on("click", function () {
	let studyPopup = window.open("/study/wholeStudyList?stuNum=<%=study_userId %>", "스터디 찾아보기", "width = 1000, height = 1000, left = 33%, top = 12%");
    popupInterval = window.setInterval(function() {
        try {
            // 창이 꺼졌는지 판단
            if( studyPopup == null || studyPopup.closed ) {
                window.clearInterval(popupInterval);
                studyPopup = null;
                location.reload();
            }
        } catch (e) { }
    }, 500);
});
</script>