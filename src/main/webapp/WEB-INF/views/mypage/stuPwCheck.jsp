<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<script src="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script type="text/javascript" src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>
<%
	UserVO userVO = (UserVO)session.getAttribute("userVO");
	String auth = userVO.getAuth();
%>

<input type="hidden" id="auth" name="auth" value="<%=auth %>" />

<script>

$(function(){
	auth = $("#auth").val();
	$("#pwBtn").on("click", function(){
		pw = $("#password").val();
		data = {"pw" : pw};
		if(auth == "ROLE_STU"){
			$.ajax({
				url: "/student/mypagePWcheck",
				type: "post",
				data: data,
				dataType: "json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(data){
					if(data.data == "o"){
						location.href = "/student/stuMypage";
					}
					else{
						  Swal.fire({
							    title: '비밀번호를 다시 입력해주세요.',
							    showClass: {
							      popup: 'animate__animated animate__bounceIn'
							    },
							    icon: 'warning',
							    customClass: {
							      confirmButton: 'btn btn-primary'
							    },
							    buttonsStyling: false
							  });
						  $("#password").val("");
					}
				}
			});
		}else if(auth == "ROLE_TEA"){
			$.ajax({
				url: "/teacher/mypagePWcheck",
				type: "post",
				data: data,
				dataType: "json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(data){
					if(data.data == "o"){
						location.href = "/teacher/teaMypage";
					}
					else{
						  Swal.fire({
							    title: '비밀번호를 다시 입력해주세요.',
							    showClass: {
							      popup: 'animate__animated animate__bounceIn'
							    },
							    icon: 'warning',
							    customClass: {
							      confirmButton: 'btn btn-primary'
							    },
							    buttonsStyling: false
							  });
						  $("#password").val("");
					}
				}
			});
		}else{
			$.ajax({
				url: "/admin/mypagePWcheck",
				type: "post",
				data: data,
				dataType: "json",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(data){
					if(data.data == "o"){
						location.href = "/admin/admMypage";
					}
					else{
						  Swal.fire({
							    title: '비밀번호를 다시 입력해주세요.',
							    showClass: {
							      popup: 'animate__animated animate__bounceIn'
							    },
							    icon: 'warning',
							    customClass: {
							      confirmButton: 'btn btn-primary'
							    },
							    buttonsStyling: false
							  });
						  $("#password").val("");
					}
				}
			});
		}
	});
});

</script>

<input type="hidden" id="pwCHK" name="pwCHK" value="${pwCHK}" />

<!-- <h4 class="fw-bold py-3 mb-4" > -->
<!--   마이페이지 -->
<!-- </h4> -->
<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-user-circle page-icon"></i>
	<span>마이페이지</span>
</h4>

<div class="card" style="height: 90%;">
	<div class="card-body">
	<div style="border: 1.5px solid #330099; border-radius: 5px; background-color: #EFEFFB; width: 75%;'">
		<br />
		<div class="container">
			<span class="badge badge-center rounded-pill bg-primary"><i class="bx bx-star"></i></span>
			<br /><br />			
			<p>마이페이지는 개인정보를 포함하고 있습니다.</p>
			<p>본인확인을 위해 한 번 더 비밀번호를 입력해주세요.</p>
			<p>비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</p>
			<br />
			<p style="color: red;">인증되지 않은 사용자는 해당 페이지에 접근할 수 없습니다.</p>
			<br />
		</div>
	</div>	
		<br />
		<form id="pwFrm" action="/student/mypagePWcheck" method="post">
			<div class="mb-3 form-password-toggle">
				<label class="form-label" for="bs-validation-password" style="font-size: 1.2em;">현재 비밀번호</label>
				<div class="input-group input-group-merge" style="width: 50%">
					<input type="password" id="password" name="password"
						class="form-control" placeholder="············" required />
					<span class="input-group-text cursor-pointer"id="basic-default-password4"><i class="bx bx-hide"></i></span> 
					<span>
						<button type="button" class="btn btn-primary active d-block" style="margin-left: 10px;" data-bs-toggle="button"
						 autocomplete="off" aria-pressed="true" id="pwBtn" name="pwBtn">비밀번호 확인</button>
					</span>
				</div>
			</div>
		</form>
	</div>
</div>
