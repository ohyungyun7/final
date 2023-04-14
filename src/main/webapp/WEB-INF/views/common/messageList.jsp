<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@page import="org.apache.catalina.Session"%>
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/quill/editor.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/select2/select2.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/css/pages/app-email.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}
.position-absolute {
  position: absolute !important;
  right: 15px;
  top: 0px;
  width: 10px;
  height: 10px;
}
.x_div{
display:inline-flex;
  background-color: black;
}
.app-email .app-emails-list .email-list li .email-list-item-time{
	width: 7rem;
}
.app-email .app-emails-list .email-list li .email-list-item-subject {
    font-size: 1rem;
}
.font-600{
	FONT-WEIGHT: 600;
}
</style>
<script>
//실시간 알림
var userId ;
var data ;

$(document).ready(function() {
	userId = document.getElementById("husername").value;
	dataId = {"userId":userId}
    revlist();
});

function revlist(){
	var divData = "";
	
	$.ajax({
		url: "/msg/revList.do",
		type:"post",
		data: dataId,
		dataType: "json",
		beforeSend : function(xhr) {  
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(data){
			$.each(data, function(i, item){
				divData += '<li class="email-list-item" data-bs-toggle="sidebar" data-target="#app-email-view" data-reception="true" number="'+item.noteNum+'">';
				divData += '<div class="d-flex align-items-center">';
				divData += '<div class="form-check">';
				divData += '<input class="list-noteNum detailNum" type="hidden" id="" value="'+ item.noteNum +'"/>';
				divData += '<input class="email-list-item-input form-check-input" type="checkbox" id="email-4" value="'+ item.noteNum +'" />';
				divData += '<label class="form-check-label" for="email-4"></label>';
				divData += '</div>';
// 				divData += '<i class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer mx-4 bx-sm"></i>';
				divData += '<div class="avatar avatar-sm d-block flex-shrink-0 me-sm-3 me-0 det" style="margin-left: 1.5rem;"><span class="avatar-initial rounded-circle bg-label-info">'+(i+1)+'</span></div>';
				divData += '<img src="/resources/upload'+ item.photo +'" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32">'; 
				divData += '<div class="email-list-item-content ms-2 ms-sm-0 me-2 det">';
				divData += '<span class="email-list-item-username me-2 det">'+ item.sendNm +'</span>';
				divData += '<span class="email-list-item-subject d-xl-inline-block d-block">'+ item.noteTitle +'</span>';
				divData += '</div>';
				divData += '<div class="email-list-item-meta ms-auto d-flex align-items-center det">';
				
				if(item.noteStatus == 0){
					divData += '<span class="email-list-item-label badge badge-dot bg-danger d-none d-md-inline-block me-2" data-label="private"></span>';
					divData += '<small class="email-list-item-time text-muted">안 읽음</small>';
				}else {
					divData += '<span class="email-list-item-label badge badge-dot bg-success d-none d-md-inline-block me-2" data-label="work"></span>'; 
					divData += '<small class="email-list-item-time text-muted">읽음</small>';
				}
				
				const noteDate = new Date(item.noteDt);
				divData += '<small class="email-list-item-time text-muted">'+ noteDate.toLocaleTimeString();
				divData += '</small>';
				divData += '<ul class="list-inline email-list-item-actions">';
				divData += '<li class="list-inline-item email-delete"> <i class="bx bx-trash-alt fs-4"></i></li>';
				divData += '<li class="list-inline-item email-unread"> <i class="bx bx-envelope fs-4"></i> </li>';
				divData += '<li class="list-inline-item"> <i class="bx bx-error-circle fs-4"></i> </li>';
				divData += '</ul>';
				divData += '</div>';
				divData += '</div>';
				divData += '</li>';
			});
			$(".listContents").html(divData);
		},
		error: function (e) {
			console.log("ERROR : ", e);
		}
	});
	
}
function sendList(){
	var divData = "";
	
	$.ajax({
		url: "/msg/sendList.do",
		type:"get",
		data: dataId,
		dataType: "json",
		beforeSend : function(xhr) {  
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(data){
			$.each(data, function(i, item){
				divData += '<li class="email-list-item" data-bs-toggle="sidebar" data-target="#app-email-view" data-reception="true" number="'+item.noteNum+'">';
				divData += '<div class="d-flex align-items-center">';
				divData += '<div class="form-check">';
				divData += '<input class="list-noteNum detailNum" type="hidden" id="" value="'+ item.noteNum +'"/>';
				divData += '<input class="email-list-item-input form-check-input" type="checkbox" id="email-'+(i+1)+'" />';
				divData += '<label class="form-check-label" for="email-'+(i+1)+'"></label>';
				divData += '</div>';
// 				divData += '<i class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer mx-4 bx-sm"></i>';
				divData += '<div class="avatar avatar-sm d-block flex-shrink-0 me-sm-3 me-0 det" style="margin-left: 1.5rem;"><span class="avatar-initial rounded-circle bg-label-warning">'+(i+1)+'</span></div>';
				divData += '<img src="/resources/upload'+ item.photo +'" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32">'; 
				divData += '<div class="email-list-item-content ms-2 ms-sm-0 me-2 det">';
				divData += '<span class="email-list-item-username me-2 det">'+ item.revNm +'</span>';
				divData += '<span class="email-list-item-subject d-xl-inline-block d-block">'+ item.noteTitle +'</span>';
				divData += '</div>';
				divData += '<div class="email-list-item-meta ms-auto d-flex align-items-center det">';
				
				if(item.noteStatus == 0){
					divData += '<span class="email-list-item-label badge badge-dot bg-danger d-none d-md-inline-block me-2" data-label="private"></span>';
					divData += '<small class="email-list-item-time text-muted">안 읽음</small>';
				}else {
					divData += '<span class="email-list-item-label badge badge-dot bg-success d-none d-md-inline-block me-2" data-label="work"></span>'; 
					divData += '<small class="email-list-item-time text-muted">읽음</small>';
				}
				
				const noteDate = new Date(item.noteDt);
				divData += '<small class="email-list-item-time text-muted">'+ noteDate.toLocaleTimeString();
				divData += '</small>';
				divData += '<ul class="list-inline email-list-item-actions">';
				divData += '<li class="list-inline-item email-delete"> <i class="bx bx-trash-alt fs-4"></i></li>';
				divData += '<li class="list-inline-item email-unread"> <i class="bx bx-envelope fs-4"></i> </li>';
				divData += '<li class="list-inline-item"> <i class="bx bx-error-circle fs-4"></i> </li>';
				divData += '</ul>';
				divData += '</div>';
				divData += '</div>';
				divData += '</li>';
			});
			$(".listContents").html(divData);
		},
		error: function (e) {
			console.log("ERROR : ", e);
		}
	});
}
function delList(){
	var divData = "";
	
	$.ajax({
		url: "/msg/delList.do",
		type:"post",
		data: dataId,
		dataType: "json",
		beforeSend : function(xhr) {  
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(data){
			$.each(data, function(i, item){
				divData += '<li class="email-list-item" data-bs-toggle="sidebar" data-target="#app-email-view" data-reception="true" number="'+item.noteNum+'">';
				divData += '<div class="d-flex align-items-center">';
				divData += '<div class="form-check">';
				divData += '<input class="list-noteNum detailNum" type="hidden" id="" value="'+ item.noteNum +'"/>';
				divData += '<input class="email-list-item-input form-check-input" type="checkbox" id="email-'+(i+1)+'" />';
				divData += '<label class="form-check-label" for="email-'+(i+1)+'"></label>';
				divData += '</div>';
				
				if(item.noteSend == userId){
					divData += '<div class="avatar avatar-sm d-block flex-shrink-0 me-sm-3 me-0 det" style="margin-left: 1.5rem;"><span class="avatar-initial rounded-circle bg-label-warning">'+(i+1)+'</span></div>';
				}else if(item.noteRev == userId){
					divData += '<div class="avatar avatar-sm d-block flex-shrink-0 me-sm-3 me-0 det" style="margin-left: 1.5rem;"><span class="avatar-initial rounded-circle bg-label-info">'+(i+1)+'</span></div>';
				}
				
				divData += '<img src="/resources/upload'+ item.photo +'" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32">'; 
				divData += '<div class="email-list-item-content ms-2 ms-sm-0 me-2 det">';
				divData += '<span class="email-list-item-username me-2 det">'+ item.revNm +'</span>';
				divData += '<span class="email-list-item-subject d-xl-inline-block d-block">'+ item.noteTitle +'</span>';
				divData += '</div>';
				divData += '<div class="email-list-item-meta ms-auto d-flex align-items-center det">';
				
				const noteDate = new Date(item.noteDt);
				divData += '<small class="email-list-item-time text-muted">'+ noteDate.toLocaleTimeString();
				divData += '</small>';
				divData += '<ul class="list-inline email-list-item-actions">';
				divData += '<li class="list-inline-item email-delete"> <i class="bx bx-trash-alt fs-4"></i></li>';
				divData += '<li class="list-inline-item email-unread"> <i class="bx bx-envelope fs-4"></i> </li>';
				divData += '<li class="list-inline-item"> <i class="bx bx-error-circle fs-4"></i> </li>';
				divData += '</ul>';
				divData += '</div>';
				divData += '</div>';
				divData += '</li>';
			});
			$(".listContents").html(divData);
		},
		error: function (e) {
			console.log("ERROR : ", e);
		}
	});
}
function selfList(){
	var divData = "";
	
	$.ajax({
		url: "/msg/selfList.do",
		type:"post",
		data: dataId,
		dataType: "json",
		beforeSend : function(xhr) {  
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(data){
			$.each(data, function(i, item){
				divData += '<li class="email-list-item" data-bs-toggle="sidebar" data-target="#app-email-view" data-reception="true" number="'+item.noteNum+'">';
				divData += '<div class="d-flex align-items-center">';
				divData += '<div class="form-check">';
				divData += '<input class="list-noteNum detailNum" type="hidden" id="" value="'+ item.noteNum +'"/>';
				divData += '<input class="email-list-item-input form-check-input" type="checkbox" id="email-'+(i+1)+'" />';
				divData += '<label class="form-check-label" for="email-'+(i+1)+'"></label>';
				divData += '</div>';
// 				divData += '<i class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer mx-4 bx-sm"></i>';
				divData += '<div class="avatar avatar-sm d-block flex-shrink-0 me-sm-3 me-0 det" style="margin-left: 1.5rem;"><span class="avatar-initial rounded-circle bg-label-warning">'+(i+1)+'</span></div>';
				divData += '<img src="/resources/upload'+ item.photo +'" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32">'; 
				divData += '<div class="email-list-item-content ms-2 ms-sm-0 me-2 det">';
				divData += '<span class="email-list-item-username me-2 det">'+ item.revNm +'</span>';
				divData += '<span class="email-list-item-subject d-xl-inline-block d-block">'+ item.noteTitle +'</span>';
				divData += '</div>';
				divData += '<div class="email-list-item-meta ms-auto d-flex align-items-center det">';
				
				if(item.noteStatus == 0){
					divData += '<span class="email-list-item-label badge badge-dot bg-danger d-none d-md-inline-block me-2" data-label="private"></span>';
					divData += '<small class="email-list-item-time text-muted">안 읽음</small>';
				}else {
					divData += '<span class="email-list-item-label badge badge-dot bg-success d-none d-md-inline-block me-2" data-label="work"></span>'; 
					divData += '<small class="email-list-item-time text-muted">읽음</small>';
				}
				
				const noteDate = new Date(item.noteDt);
				divData += '<small class="email-list-item-time text-muted">'+ noteDate.toLocaleTimeString();
				divData += '</small>';
				divData += '<ul class="list-inline email-list-item-actions">';
				divData += '<li class="list-inline-item email-delete"> <i class="bx bx-trash-alt fs-4"></i></li>';
				divData += '<li class="list-inline-item email-unread"> <i class="bx bx-envelope fs-4"></i> </li>';
				divData += '<li class="list-inline-item"> <i class="bx bx-error-circle fs-4"></i> </li>';
				divData += '</ul>';
				divData += '</div>';
				divData += '</div>';
				divData += '</li>';
			});
			$(".listContents").html(divData);
		},
		error: function (e) {
			console.log("ERROR : ", e.status);
		}
	});
}

$(function(){
	$(".sendLi").on("click",function(){
		revlist();
	});
	$(".revLi").on("click",function(){
		sendList();
	});
	$(".trashLi").on("click",function(){
		delList();
	});
	$(".selfLi").on("click",function(){
		selfList();
	});
	$(".bx-chevron-left").on("click",function(){
		var ca = $(".email-filter-folders").children("li.active").find("span").html();
		if(!$(".app-email-view").hasClass("active")){
			if(ca == "받은 쪽지함"){
				revlist();
			}else if(ca == "보낸 쪽지함"){
				sendList();
			}
			
		}
	});


});


  
</script> 

<%-- ${list } --%>
<c:if test="${write eq 'success'}">
	<script>
		Swal.fire({
		    title: '전송 성공',
		    html: '<p>쪽지가 성공적으로 전송되었습니다.</p>',
		    timer: 3000,
		    showClass: {
		      popup: 'animate__animated animate__bounceIn'
		    },
		    icon: 'success',
		    customClass: {
		      confirmButton: 'btn btn-primary'
		    },
		    buttonsStyling: false
		});
		$(function(){
			$(".sendLi").removeClass("active");
			$(".sendBox").trigger("click");
		});
	</script>
</c:if>
<c:if test="${write eq 'my'}">
	<script>
		Swal.fire({
		    title: '전송 성공',
		    html: '<p>쪽지가 성공적으로 전송되었습니다.</p>',
		    timer: 3000,
		    showClass: {
		      popup: 'animate__animated animate__bounceIn'
		    },
		    icon: 'success',
		    customClass: {
		      confirmButton: 'btn btn-primary'
		    },
		    buttonsStyling: false
		});
		$(function(){
			$(".sendLi").removeClass("active");
			$(".myselfBox").trigger("click");
		});
	</script>
</c:if>

<h4 class="fw-bold mb-2 categoryBar">
	<i class="bx bx-envelope page-icon"></i>
	쪽지함
</h4>

<div class="app-email card">
<input type="hidden" class="husername" id="husername" name="husername" value="${user.username }" />
  <div class="border-0">
    <div class="row g-0">
      <!-- Email Sidebar -->
      <div class="col app-email-sidebar border-end flex-grow-0" id="app-email-sidebar">
        <div class="btn-compost-wrapper d-grid">
          <button class="btn btn-primary btn-compose" data-bs-toggle="modal" data-bs-target="#emailComposeSidebar"><i class="bx bx-edit me-1"></i>쪽지 쓰기</button>
        </div>
        <!-- Email Filters -->
        <div class="email-filters py-2">
          <!-- Email Filters: Folder -->
          <ul class="email-filter-folders list-unstyled pb-1">
            <li class="d-flex justify-content-between sendLi active" data-target="reception">
              <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                <i class='bx bx-box'></i>
                <span class="align-middle ms-2 recvBox font-600">받은 쪽지함</span>
              </a>
              <div class="badge bg-label-danger rounded-pill unreadNumber"></div>
            </li>
            <li class="d-flex revLi" data-target="sent">
              <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                <i class="bx bx-send"></i>
                <span class="align-middle ms-2 sendBox font-600">보낸 쪽지함</span>
              </a>
            </li>
            <li class="d-flex selfLi" data-target="my">
              <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                <i class='bx bx-user-pin'></i>
                <span class="align-middle ms-2 myselfBox font-600">내게 쓴 쪽지</span>
              </a>
            </li>
            <li class="d-flex align-items-center trashLi" data-target="trash" >
              <a href="javascript:void(0);" class="d-flex flex-wrap align-items-center">
                <i class="bx bx-trash-alt"></i>
                <span class="align-middle ms-2 font-600">휴지통</span>
              </a>
            </li>
          </ul>

        </div>
      </div>
      <!--/ Email Sidebar -->

      <!-- Emails List -->
      
      <div class="col app-emails-list">
        <div class="card shadow-none border-0">
          <div class="card-body emails-list-header p-3 py-lg-3 py-2">
            <!-- Email List: Search -->
            <div class="d-flex justify-content-between align-items-center">
              <div class="d-flex align-items-center w-100">
                <i class="bx bx-menu bx-sm cursor-pointer d-block d-lg-none me-3" data-bs-toggle="sidebar" data-target="#app-email-sidebar" data-overlay></i>
                <div class="mb-0 mb-lg-2 w-100">
                  <div class="input-group input-group-merge shadow-none">
                    <span class="input-group-text border-0 ps-0 py-0" id="email-search">
                      <i class="bx bx-search fs-4 text-muted"></i>
                    </span>
                    <input type="text" class="form-control email-search-input border-0 py-0" placeholder="검색할 제목을 입력해주세요" aria-label="Search..." aria-describedby="email-search">
                  </div>
                </div>
              </div>
              <div class="d-flex align-items-center mb-0 mb-md-2">
                <i class="bx bx-refresh scaleX-n1-rtl cursor-pointer email-refresh me-2 bx-sm text-muted"></i>
                <div class="dropdown">
                  <i class="bx bx-dots-vertical-rounded cursor-pointer bx-sm text-muted" id="emailsActions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  </i>
                  <div class="dropdown-menu dropdown-menu-end" aria-labelledby="emailsActions">
                    <a class="dropdown-item" href="javascript:void(0)">읽음으로 표시</a>
                    <a class="dropdown-item" href="javascript:void(0)">안읽음으로 표시</a>
                    <a class="dropdown-item" href="javascript:void(0)">삭제</a>
                  </div>
                </div>
              </div>
            </div>
            <hr class="mx-n3 emails-list-header-hr">
            <!-- Email List: Actions -->
            <div class="d-flex justify-content-between align-items-center">
              <div class="d-flex align-items-center">
                <div class="form-check me-2">
                  <input class="form-check-input" type="checkbox" id="email-select-all">
                  <label class="form-check-label" for="email-select-all"></label>
                </div>
                <i class="bx bx-trash-alt email-list-delete cursor-pointer me-3 fs-4"></i>
              </div>
              <div class="email-pagination d-sm-flex d-none align-items-center flex-wrap justify-content-between justify-sm-content-end">
                <p class="mb-0 total">보낸 쪽지 수 : &nbsp;&nbsp;&nbsp; ${msgCnt.send} &nbsp;&nbsp;&nbsp; 받은 쪽지 수 : &nbsp;&nbsp;&nbsp; ${msgCnt.rev} &nbsp;&nbsp;&nbsp; 전체 쪽지 수 : &nbsp;&nbsp;&nbsp; ${msgCnt.total }</p>
              </div>
            </div>
          </div>
          <hr class="container-m-nx m-0">
          
          <!-- Email List: Items -->
          <div class="email-list pt-0">
            <ul class="list-unstyled m-0 listContents">
            
            <div class="hiddenDiv" style="display:none;">
            	<!-- 반복문 시작 -->
				<c:forEach var="data" items="${list}" varStatus="i">
					<c:set var ="send" value="${data.noteSend}"/> 
					<c:set var ="rev" value="${data.noteRev}"/> 
					<c:set var ="userSession" value="${user.username }"/> 
					<c:set var ="status" value="${data.noteStatus}"/> 
					<!-- 내가 받은 메시지 시작 -->
					<c:if test="${rev eq userSession}">
						<li class="email-list-item" data-bs-toggle="sidebar" data-target="#app-email-view" data-reception="true" number="${data.noteNum}">
							<div class="d-flex align-items-center">
								<div class="form-check">
									<input class="email-list-item-input form-check-input" type="checkbox" id="email-4">
									<label class="form-check-label" for="email-4"></label>
								</div>
								<i class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer mx-4 bx-sm"></i>
				
				<%--                   	<img src="/resources/upload${user.photo}" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32"> --%>
								<div class="avatar avatar-sm d-block flex-shrink-0 me-sm-3 me-0">
									<c:set var = "string1" value = "${data.sendNm }"/>
									<c:set var = "string2" value = "${fn:substring(string1, 0, 1)}" />
									<span class="avatar-initial rounded-circle bg-label-info">${string2}</span>
								</div>
								<div class="email-list-item-content ms-2 ms-sm-0 me-2">
									<span class="email-list-item-username me-2 h6">${data.sendNm }</span>
									<span class="email-list-item-subject d-xl-inline-block d-block">${data.noteTitle }</span>
								</div>
								<div class="email-list-item-meta ms-auto d-flex align-items-center">
									<c:if test="${status == '0'}">
										<span class="email-list-item-label badge badge-dot bg-danger d-none d-md-inline-block me-2" data-label="private"></span>
										<small class="email-list-item-time text-muted">안 읽음</small>
									</c:if>
									<c:if test="${status == '1'}">
										<span class="email-list-item-label badge badge-dot bg-success d-none d-md-inline-block me-2" data-label="work"></span> 
										<small class="email-list-item-time text-muted">읽음</small>
									</c:if>
									<small class="email-list-item-time text-muted">
										<fmt:formatDate pattern="kk:mm:ss" value="${data.noteDt }"/>
									</small>
									<ul class="list-inline email-list-item-actions">
										<li class="list-inline-item email-delete"> <i class='bx bx-trash-alt fs-4'></i></li>
										<li class="list-inline-item email-unread"> <i class='bx bx-envelope fs-4'></i> </li>
										<li class="list-inline-item"> <i class="bx bx-error-circle fs-4"></i> </li>
									</ul>
								</div>
							</div>
						</li>
					</c:if>
					<!-- 내가 받은 메시지 끝 -->
					<!-- 내가 보낸 메시지 시작 -->
					<c:if test="${send eq userSession}">
						<li class="email-list-item" data-bs-toggle="sidebar" data-target="#app-email-view" data-sent="true" number="${data.noteNum}">
							<div class="d-flex align-items-center">
								<div class="form-check">
									<input class="email-list-item-input form-check-input" type="checkbox" id="email-4">
									<label class="form-check-label" for="email-4"></label>
								</div>
								<i class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer mx-4 bx-sm"></i>
				
				<%--                   	<img src="/resources/upload${user.photo}" alt="user-avatar" class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0" height="32" width="32"> --%>
									<div class="avatar avatar-sm d-block flex-shrink-0 me-sm-3 me-0">
										<c:set var = "string1" value = "${data.revNm }"/>
										<c:set var = "string2" value = "${fn:substring(string1, 0, 1)}" />
										<span class="avatar-initial rounded-circle bg-label-success">${string2}</span>
									</div>
								<div class="email-list-item-content ms-2 ms-sm-0 me-2">
									<span class="email-list-item-username me-2 h6">${data.revNm }</span>
									<span class="email-list-item-subject d-xl-inline-block d-block">${data.noteTitle }</span>
								</div>
								<div class="email-list-item-meta ms-auto d-flex align-items-center">
									<small class="email-list-item-time text-muted">
										<fmt:formatDate pattern="kk:mm:ss" value="${data.noteDt }"/>
									</small>
									<ul class="list-inline email-list-item-actions">
										<li class="list-inline-item email-delete"> <i class='bx bx-trash-alt fs-4'></i></li>
										<li class="list-inline-item email-unread"> <i class='bx bx-envelope fs-4'></i> </li>
										<li class="list-inline-item"> <i class="bx bx-error-circle fs-4"></i> </li>
									</ul>
								</div>
							</div>
						</li>
					</c:if>
					<!-- 내가 받은 메시지 끝 -->
				</c:forEach>
				<!-- 반복문 끝 -->
            </div>
              

            </ul>
          </div>
        </div>
        <div class="app-overlay"></div>
      </div>
      <!-- /Emails List -->

      <!-- Email View -->
      <div class="col app-email-view flex-grow-0 bg-body" id="app-email-view">
        <div class="app-email-view-header p-3 py-md-3 py-2 rounded-0">
          <!-- Email View : Title  bar-->
          <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center overflow-hidden">
              <i class="bx bx-chevron-left bx-sm cursor-pointer me-2" data-bs-toggle="sidebar" data-target="#app-email-view"></i>
              <h6 class="text-truncate mb-0 me-2">상세보기</h6>
              <span class="badge bg-label-warning">중요</span>
            </div>
            <!-- Email View : Action  bar-->
            <div class="d-flex">
              <i class='bx bx-printer d-sm-block d-none fs-4'></i>
              <div class="dropdown ms-3">
                <i class="bx bx-dots-vertical-rounded cursor-pointer fs-4" id="dropdownMoreOptions" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                </i>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMoreOptions">
                  <a class="dropdown-item" href="javascript:void(0)">
                    <i class="bx bx-envelope-open bx-xs me-1"></i>
                    <span class="align-middle">읽음 표시</span>
                  </a>
                  <a class="dropdown-item" href="javascript:void(0)">
                    <i class="bx bx-envelope-open bx-xs me-1"></i>
                    <span class="align-middle">안 읽음 표시</span>
                  </a>
                  <a class="dropdown-item" href="javascript:void(0)">
                    <i class="bx bx-star bx-xs me-1"></i>
                    <span class="align-middle">중요</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
<!--           <hr class="app-email-view-hr mx-n3 mb-2"> -->
<!--           <div class="d-flex justify-content-between align-items-center"> -->
<!--             <div class="d-flex align-items-center"> -->
<!--               <i class='bx bx-trash-alt cursor-pointer me-3 fs-4' data-bs-toggle="sidebar" data-target="#app-email-view"></i> -->
<!--               <i class='bx bx-envelope fs-4 cursor-pointer me-3'></i> -->
<!--             </div> -->
<!--             <div class="d-flex align-items-center flex-wrap justify-content-end"> -->
<!--               <i class="bx bx-chevron-left scaleX-n1-rtl cursor-pointer text-muted me-4 fs-4"></i> -->
<!--               <i class="bx bx-chevron-right scaleX-n1-rtl cursor-pointer fs-4"></i> -->
<!--             </div> -->
<!--           </div> -->
        </div>
        <hr class="m-0">
        <!-- Email View : Content-->
        <div class="app-email-view-content ">
<!--           <p class="email-earlier-msgs text-center text-muted cursor-pointer mb-5" id="open">열기</p> -->
          
          <!-- Email View : Previous mails-->
<!--           <div class="card email-card-prev mx-sm-4 mx-3 border"> -->
<!--             <div class="card-header d-flex justify-content-between align-items-center flex-wrap border-bottom"> -->
<!--               <div class="d-flex align-items-center mb-sm-0 mb-3"> -->
<!--                 <img src="/resources/sneat/assets/img/avatars/2.png" alt="user-avatar" class="flex-shrink-0 rounded-circle me-2" height="38" width="38" /> -->
<!--                 <div class="flex-grow-1 ms-1"> -->
<!--                   <h6 class="m-0 perNm">더보기 사람 이름</h6> -->
<!--                   <small class="text-muted perNum" >더보기 사람 번호</small> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="d-flex align-items-center"> -->
<!--                 <small class="mb-0 me-3 text-muted">날짜</small> -->
<!--                 <i class="bx bx-paperclip cursor-pointer me-2 bx-sm"></i> -->
<!--                 <i class="email-list-item-bookmark bx bx-star cursor-pointer me-2 bx-sm"></i> -->
<!--                 <div class="dropdown me-3"> -->
<!--                   <i class="bx bx-dots-vertical-rounded cursor-pointer bx-sm" id="dropdownEmail" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                   </i> -->
<!--                   <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownEmail"> -->
<!--                     <a class="dropdown-item scroll-to-reply" href="javascript:void(0)"> -->
<!--                       <i class="bx bx-share me-1"></i> -->
<!--                       <span class="align-middle">답장하기</span> -->
<!--                     </a> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="card-body pt-3"> -->
<!--               <p class="fw-bold mt-2" id="main">내용</p> -->
              
<!--             </div> -->
<!--           </div> -->
          
          <!-- Email View : 메일 상세보기-->
          <div class="card email-card mx-sm-4 mx-3 mt-4 border">
            <div class="card-header d-flex justify-content-between align-items-center flex-wrap border-bottom">
              <div class="d-flex align-items-center mb-sm-0 mb-3">
                <img src="" alt="user-avatar" class="flex-shrink-0 rounded-circle me-2" id="detailImg" height="38" width="38" />
                <div class="flex-grow-1 ms-1">
                  <h5 class="m-1 noteTRep fw-bold">제목</h5>
                  <small class="text-muted sendNumRep">편지를 보낸 사람</small>
                </div>
              </div>
              <div class="d-flex align-items-center">
                <small class="mb-0 me-3 text-muted dateNoteRep">날짜</small>
                <i class="email-list-item-bookmark bx bx-star cursor-pointer me-2 bx-sm"></i>
              </div>
            </div>
            <div class="card-body pt-3">
			  <div class="mt-2 noteContentsRep">내용</div>
            </div>
          </div>
          <!-- Email View : 답장하기 -->
          <div class="email-reply card mt-4 mx-sm-4 mx-3 border">
            <h6 class="card-header border-0 ">
            	<button class="btn btn-sm btn-label-secondary reply">
	            	<i class="bx bx-share me-1"></i>
	            	<span class="align-middle fw-bold">답장하기</span>
            	</button>
            </h6>
            <div class="card-body ">
	            <form id="replyfrm" name="replyfrm">
	            	<input type="hidden" id="noteSend" name="noteSend" value="${user.username }"/>
	            	<input type="hidden" id="sendNm" name="sendNm"/>
	            	<input type="hidden" id="noteRev" name="noteRev"/>
	            	<input type="hidden" id="revNm" name="revNm"/>
	            	<input type="hidden" id="noteTitle" name="noteTitle"/>
					<textarea class="noteContent1" id="noteContent1" name="noteContent" ></textarea>
					<div class="d-flex justify-content-end align-items-center mt-2">
					</div>
					<hr />
					<small>답장의 제목은 '[re:] <span class="noteTRep"></span>'으로 제목이 보내집니다.</small>
	            </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Email View -->
    </div>
  </div>

  <!-- Compose Email -->
  <div class="app-email-compose modal" id="emailComposeSidebar" tabindex="-1" aria-labelledby="emailComposeSidebarLabel" aria-hidden="true">
    <div class="modal-dialog m-0 me-md-4 mb-4 modal-lg">
      <div class="modal-content p-0">
        <div class="modal-header py-3 bg-body">
          <h5 class="modal-title fs-5">쪽지 작성하기</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body flex-grow-1 pb-sm-0 p-4 py-2">
          <form class="email-compose-form" id="notefrm" action="/msg/writeANote?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="application/json">
	          <input type="hidden" name="noteSend" value="${user.username }"/>
	          <input type="hidden" name="sendNm" value="${user.name }"/>
           <div class="hidRev" style="display:hidden;"></div>
           
            <div class="email-compose-to d-flex justify-content-between align-items-center">
              <label class="form-label mb-2 text-muted" for="emailContacts">받는 사람 : </label>
              <div class="select2-primary border-0 shadow-none flex-grow-1 mx-2">
                <select class="select2 select-email-contacts form-select" id="emailContacts" name="noteRevTmp" multiple>
	                <optgroup label="학생 목록">
		                <c:forEach var="slist" items="${stuList}" varStatus="i">
		                  <option data-avatar="${slist.stuPhoto}" value="${slist.stuNum}" name="${slist.stuNmKor}" >${slist.stuNum }&nbsp;${slist.stuNmKor }</option>
		                </c:forEach>
	                </optgroup>
	                <optgroup label="교수 목록">
		                <c:forEach var="tlist" items="${teaList}" varStatus="i">
		                  <option data-avatar="${tlist.teaPhoto}" value="${tlist.teaNum }" name="${tlist.teaNmKor}" >${tlist.teaNum }&nbsp;${tlist.teaNmKor }</option>
		                </c:forEach>
	                </optgroup>
	                <optgroup label="교직원 목록">
		                <c:forEach var="elist" items="${empList}" varStatus="i">
		                  <option data-avatar="${elist.empPhoto}" value="${elist.empNum }" name="${elist.empNmKor}" >${elist.empNum }&nbsp;${elist.empNmKor }</option>
		                </c:forEach>
	                </optgroup>
                </select>
              </div>
            </div>

            <hr class="mx-n4 my-0">
            <div class="email-compose-subject  align-items-center my-1">
              <label for="email-subject" class="form-label mb-0 text-muted">제목 </label>
              <input type="text" class="form-control border-0 shadow-none flex-grow-1 mx-2" id="email-subject" name="noteTitle">
              <hr style="margin-top: -0.3rem;color: darkgray;border-style: dashed;margin-left: 20px;">
            </div>
            <hr class="mx-n4 my-0">
              <label for="email-content" class="form-label mb-2 mt-2 text-muted">내용 </label>
            <textarea id="noteContent2" name="noteContent" class="form-control" placeholder="내용을 입력해주세요."></textarea>
            <hr class="mx-n4 mt-0 mb-2">
            <div class="email-compose-actions d-flex justify-content-between align-items-center my-2 py-1">
              <div class="d-flex align-items-center">
                <div class="btn-group">
                  <button type="submit" class="btn btn-primary" id="sendBtn" data-bs-dismiss="modal" aria-label="Close">보내기</button>
                  <button type="reset" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">취소</button>
                </div>
                  <button type="button" class="btn btn-secondary col-mb-3 ms-3 autoInsert" >자동채우기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- /Compose Email -->
</div>


<!-- Page JS -->
<script src="/resources/sneat/assets/js/app-email.js"></script>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
$(function(){
	//값넣기
	$("#emailContacts").on("change",function(){
		var arr = $(this).val();
		var data = "";
		$.each(arr, function (index, value){
			data += "<input type='hidden' name='noteRev' value='"+value+"' />"
		});

		$(".hidRev").html(data);
	});
	
	$(".btn-compose").on("click",function(){
		$("#email-subject").html("");
		$("#noteContent2").html("");
	});
	
	var flag = 0;
	
	//상세보기 '.tag1, .tag2'
	$(document).on("click",".det",function(){
		var noteNum = $(this).siblings('div').find(".detailNum").val();
// 		if(flag==0) {
			$(".app-email-view").addClass("show");
			var jasonData = {"noteNum": noteNum, "userId" : new String(userId)}
			console.log("JSON.stringify(jasonData) : ", JSON.stringify(jasonData));
			
			 $.ajax({
					type: "post",
					url: '/msg/detail.do',	
					contentType:"application/json;charset=utf-8",
					data: JSON.stringify(jasonData),
					dataType: "json",
					beforeSend : function(xhr) {  // 데이터 전송 전  헤더에 csrf값 설정
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			      	},
					success: function (data) {
						if(data!=null){
							var ddat="";
							$(".noteTRep").html(data.noteTitle);
							var text = data.noteContent;
							text = text.replaceAll(/\n/g, "<br>");
							$(".noteContentsRep").html(text);
							$(".sendNumRep").html("From: <b>"+data.sendNm + "</b> &nbsp;[ " + data.noteSend + " ]");
							
							//날짜 표기 (2023. 3. 27. 오후 2:23:48)
							var date = new Date(data.noteDt);
							var formattedDate = date.toLocaleString();
							$(".dateNoteRep").html(formattedDate); 
							$("#detailImg").attr("src","/resources/upload"+data.photo);
							
							//보낼 데이터 만들기
							$("#noteSend").val(data.noteSend);
							$("#sendNm").val(data.sendNm);
							$("#noteRev").val(data.noteRev);
							$("#revNm").val(data.revNm);
							$("#noteTitle").val("[re:]"+data.noteTitle);
						}else {
							Swal.fire({
								title: '데이터가 없습니다.',
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
						console.log("ERROR : ", e);
					}
				});
	});	//상세보기
	
	//답장하기
	$(".reply").on("click",function(){
		
		/* ckEditor 를 textarea값으로 바꿔주는 거? */
		for ( instance in CKEDITOR.instances ){
	        CKEDITOR.instances[instance].updateElement();
	        }
		/* 폼 데이터 묶어주기 */
		var form1 = $(document.querySelector("form[name=replyfrm]")).serialize();
		var formData  = new FormData(document.querySelector("form[name=replyfrm]"));
		
		/* key 확인하기 */
		for (let key of formData.keys()) {
			   console.log("key: "+key);
		}
		/* value 확인하기 */
		for (let value of formData.values()) {
		      console.log("value: "+value);
		}
		
		$.ajax({
			type : 'post',
			url : '/msg/replyMsg.do',
			data : formData,
			dataType : 'json',
			contentType:"application/json;charset=utf-8",
			beforeSend : function(xhr) {  // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      	},
			error: function(xhr, status, error){
				console.log(error);
			},
			success : function(json){
				Swal.fire({
				    title: '답장 성공',
				    timer: 3000,
				    showClass: {
				      popup: 'animate__animated animate__bounceIn'
				    },
				    icon: 'success',
				    customClass: {
				      confirmButton: 'btn btn-primary'
				    },
				    buttonsStyling: false
				  });
				
			}
		});
	});	//답장 끝
	
	//삭제하기
	$(document).on("click",".email-delete",function(){
		var note = $(this).parents().find(".email-list-item");
		var delNum = note.attr("number");
		flag = 1;
		
		var selectList = $("#email-4").val();
		var data = {"delNum":delNum, "userId":userId}
		
		$.ajax({
			type : 'get',
			url : '/msg/deleteMsg.do',
			data : data,
			dataType : 'json',
			contentType:"application/json;charset=utf-8",
			beforeSend : function(xhr) {  // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      	},
			success : function(res){
				Swal.fire({
				    title: '삭제 성공',
				    timer: 2000,
				    showClass: {
				      popup: 'animate__animated animate__bounceIn'
				    },
				    icon: 'success',
				    customClass: {
				      confirmButton: 'btn btn-primary'
				    },
				    buttonsStyling: false
				  });
				$(".app-email-view").removeClass("show");
			},
			error: function(xhr, status, error){
				console.log(error);
				
			}
		});
			
	}); //삭제하기 끝
	
	$("#open").on("click",function(){
// 		console.log("open");
	});
	
	$(".email-search-input").on("keyup",function(e){
		let keyword = $(this).val();
		
		let result = $(':contains('+keyword+')').val();
	});
	
	$(".autoInsert").on("click",function(){
		$("#email-subject").val("성적 이의 신청 수락");
		CKEDITOR.instances.noteContent2.setData('<b>[성적 이의 신청 수락]</b><p>의견을 수용하여 성적을 수정하였으니 확인 바랍니다.</p>');
	});
	
});
	CKEDITOR.replace('noteContent1',{height:100});
	CKEDITOR.replace('noteContent2');
</script>

