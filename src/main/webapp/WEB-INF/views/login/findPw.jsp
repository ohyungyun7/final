<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en" class="light-style customizer-hide" dir="ltr" data-theme="theme-default" data-assets-path="/resources/sneat/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>로그인하기</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/resources/sneat/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/resources/sneat/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/sneat/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/sneat/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/sneat/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="/resources/sneat/assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="/resources/sneat/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/sneat/assets/js/config.js"></script>
	<style>
	
	body {
	  width: 100%;
	  height: 100%;
/* 	  text-align: center; */
	  position: relative;
	  z-index: 1;
	}
	body::after {
	  width: 100%;
	  height: 100%;
	  content: "";
	  background: url("/resources/images/back2.gif");
	  position: absolute;
	  top: 0;
	  left: 0;
	  z-index: -1;
	  opacity: 0.4;
	  background-position: center;
	}
	.autoLogin{
		margin: 20px;
	}

	</style>
  </head>

  <body>
    <div class="container-xxl">
  <div class="authentication-wrapper authentication-basic container-p-y">
    <div class="authentication-inner py-4">

      <!-- Forgot Password -->
      <div class="card">
        <div class="card-body">
          <h4 class="mb-2">비밀번호 찾기 🔒</h4>
          <p class="mb-4">본인인증 후 비밀번호를 변경할 수 있습니다.</p>
          <form id="formAuthentication" class="mb-3">
            <div class="mb-3">
              <label for="name" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요." autofocus>
            </div>
            <div class="mb-3">
              <label for="id" class="form-label">아이디</label>
              <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요." autofocus>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">이메일</label>
              <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요." autofocus>
            </div>
            <button id="chaPwBtn" type="button" class="btn btn-primary d-grid w-100">비밀번호 변경</button>
          </form>
          <div class="text-center">
            <a href="/start" class="d-flex align-items-center justify-content-center">
              <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
              	로그인으로 돌아가기
            </a>
          </div>
        </div>
      </div>
      <!-- /Forgot Password -->
    </div>
  </div>
</div>

<!-- otp 모달창 -->
<div class="modal fade" id="OTPModal" tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="fw-bold py-3 mb-4">2차 본인인증</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
			
			<div id="sign-body">
				<div class="form-signin">
					<div class="signin-box">   
						<div id="member-box" class="login-wrap text-cetner">
							<div class="form-box ">
							<!-- login-top -->        
							<div class="login-top">
							</div>
							<!-- login-top //-->        
							 
							<!-- login-form -->              
							<div class="login-form">
							    <form id="otpForm">
							    	 <hr />
							         <input type="hidden" class="form-control" id="encodedKey" name="encodedKey1" value="" readonly="readonly"/>
							         <p style="font-weight:bold;">큐알코드 :</p>
							         <img id="qrimg" src="" style="margin-left: 110px;"/>
							         <br />
							         <br />
							         <p style="font-weight:bold;">인증코드 입력 :</p>
							         <input type="text" class="form-control"  id="code" name="code1" placeholder="코드를 입력해주세요." />
							    </form>
							</div>
							<!-- login-form //-->    
							</div>    
						</div>  
					</div>
				</div>
			</div>
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-label-secondary" id="closeBtn1"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="otpBtn">확인</button>
			</div>
		</div>
	</div>
</div>


<!-- 비밀번호 변경 모달창 -->
<div class="modal fade" id="pwModifyModal" tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="fw-bold py-3 mb-4">비밀번호 변경하기</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">새 비밀번호</label> 
						<span id="regCK"></span>
						<input type="password" id="firstPw" class="form-control" placeholder="새 비밀번호 입력" required="required">
						<p style="color: red; font-size: 0.8em;">&nbsp;&nbsp;대소문자 구분없이 영문자, 숫자, 특수문자를 조합하여 8~12자 필수 입력</p>
					</div>
				</div>
				<div class="row">
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">새 비밀번호 확인</label> 
						<span id="reCK"></span>
						<input type="password" id="secondPw" class="form-control" placeholder="비밀번호 확인" required="required">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-label-secondary" id="closeBtn"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="updBtn">변경하기</button>
			</div>
		</div>
	</div>
</div>


<!-- / Content -->
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="/resources/sneat/assets/vendor/libs/popper/popper.js"></script>
    <script src="/resources/sneat/assets/vendor/js/bootstrap.js"></script>
    <script src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="/resources/sneat/assets/vendor/js/menu.js"></script>
    <!-- Main JS -->
    <script src="/resources/sneat/assets/js/main.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
<script type="text/javascript">
$(function(){
	$("#chaPwBtn").on("click", function(){
		var form = $('#formAuthentication')[0];
		var formData = new FormData(form);
		
		$.ajax({  
			url : "/changePw",
			processData : false,
			contentType : false,
			data : formData,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			dataType : "json",
			type : "post",
			success : function(result) {
				if(result == 0){
				  Swal.fire({
					    title: '일치하는 정보가 없습니다.',
					    showClass: {
					      popup: 'animate__animated animate__bounceIn'
					    },
					    icon: 'warning',
					    customClass: {
					      confirmButton: 'btn btn-primary'
					    },
					    buttonsStyling: false
					  });
					$("#id").val("");
					$("#name").val("");
					$("#email").val("");
				}else if(result == 1){
					$.ajax({
						url: "/otp",
						dataType : "json",
						type : "post",
						beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success : function(result){
							let encodedKey = result.encodedKey;
							let QrUrl = result.QrUrl;
							
							$("#OTPModal").modal('show');
							$("#encodedKey").val(encodedKey);
							$("#qrcode").val(QrUrl);
							$("#qrimg").attr("src", QrUrl);
						}
					});
				}
			}
		});
	});
	
	$("#otpBtn").on("click", function(){
		
		if ($("#code").val() == "") {
			Swal.fire({
				title: '코드를 입력해주세요.',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'warning',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
			$("#code").focus();
			return false;
		}
		
		var otpForm = $('#otpForm')[0];
		var otpFormData = new FormData(otpForm);
		
		$.ajax({  
			url : "/otpcheck",
			processData : false,
			contentType : false,
			data : otpFormData,
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			type : "post",
			success : function(result) {
				if(result == 0){
					$("#encodedKey").val("");
					$("#qrcode").val("");
					$("#qrimg").attr("src", "");
					$("#code").val("");
					$("#OTPModal").modal('hide');
					  Swal.fire({
						    title: '2차 본인인증에 실패하셨습니다.',
						    text: '다시 인증해주세요.',
						    showClass: {
						      popup: 'animate__animated animate__bounceIn'
						    },
						    icon: 'warning',
						    customClass: {
						      confirmButton: 'btn btn-primary'
						    },
						    buttonsStyling: false
						  });
				}else{
					$("#OTPModal").modal('hide');
					$("#pwModifyModal").modal('show');
				}
			}
		});
		
	});


	function pwCheck(){
		firstPw = $("#firstPw").val();
		var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/;
		
		if(!reg.test(firstPw)) {
			$("#regCK").css({"color" : "red", "font-size" : "0.8em"});
			$("#regCK").text("안전한 비밀번호로 다시 입력해주세요.");
		}else{
			$("#regCK").css({"color" : "blue", "font-size" : "0.8em"});
			$("#regCK").text("안전한 비밀번호입니다.");
		}   
	}

	function reCheck(){
		firstPw = $("#firstPw").val();
		secondPw = $("#secondPw").val();
		if(firstPw == secondPw){
			$("#reCK").css({"color" : "blue", "font-size" : "0.8em"});
			$("#reCK").text("비밀번호가 일치합니다.");
		}else{
			$("#reCK").css({"color" : "red", "font-size" : "0.8em"});
			$("#reCK").text("비밀번호가 일치하지 않습니다.");
		}	
	}	
	
	$("#firstPw").on("keyup", pwCheck);
	
	$("#secondPw").on("keyup", reCheck);

	$("#updBtn").on("click",function(){
		regCK = $("#regCK").text();
		reCK = $("#reCK").text();
		if(regCK == "안전한 비밀번호입니다." && reCK == "비밀번호가 일치합니다."){
			firstPw = $("#firstPw").val();
			username = $("#id").val();
			data = {"pw" : firstPw,
					"username" : username
					};
			
			$.ajax({
				url : "/pwUpadate",
				type: "post",
				data : data,
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result == 1){
					  $("#closeBtn").click();
					  Swal.fire({
						    title: '비밀번호가 변경되었습니다.',
						    text: '로그인창으로 이동합니다.',
						    showClass: {
						      popup: 'animate__animated animate__bounceIn'
						    },
						    icon: 'success',
						    customClass: {
						      confirmButton: 'btn btn-primary'
						    },
						    buttonsStyling: false
						  }).then(function(){
							  location.href='/start';
						  })
					}
				}
			});
		}else{
			  Swal.fire({
				    title: '알림메시지들을 확인해주시기 바랍니다.',
				    showClass: {
				      popup: 'animate__animated animate__bounceIn'
				    },
				    icon: 'warning',
				    customClass: {
				      confirmButton: 'btn btn-primary'
				    },
				    buttonsStyling: false
				  });
		}
	});
	
	var errorMsg = "${errorMsg}";
	if(errorMsg != ""){
		Swal.fire({
			title: errorMsg,
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
	
	function frmCheck() {
		if ($("#code").val() == "") {
			Swal.fire({
				title: "코드를 입력해주세요.",
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'warning',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
			$("#code").focus();
			return false;
		}
	}
});
</script>    
    
  </body>
</html>
