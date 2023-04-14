<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="light-style customizer-hide" dir="ltr" data-theme="theme-default" data-assets-path="/resources/sneat/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>로그인</title>

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
    <!-- Content -->

    <div class="container-xxl cont">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register -->
          <div class="card">
            <div class="card-body">
              <h2 style="text-align:center;"><img src="/resources/images/logo.png" alt="logo.jpg" style="width:80px;"/>씩씩대학</h2>
<!--               <h4 class="mb-2">Welcome to siksik! <i class='bx bxs-school'></i></h4> -->
<!--               <p class="mb-4">Please sign-in to your account and start the adventure</p> -->

              <form id="formAuthentication" class="mb-3" action="/loginCheck" method="post">
                <div class="row" >
			    	<div class="col-4"><button class="btn rounded-pill btn-outline-info btn-sm d-grid w-100 " id="stuBtn" name="stuBtn" type="button">학생</button></div>
			    	<div class="col-4"><button class="btn rounded-pill btn-outline-warning btn-sm d-grid w-100 " id="teaBtn" name="teaBtn" type="button">교수</button></div>
			    	<div class="col-4"><button class="btn rounded-pill btn-outline-success btn-sm d-grid w-100 " id="admBtn" name="admBtn" type="button">교직원</button></div>
			    </div>
			    <br/>
                <div class="mb-3">
                  <div class="d-flex justify-content-between">
                    <label class="form-label" for="id">id</label>
                    <a href="/findId">
                      <small>아이디 찾기</small>
                    </a>
                  </div>
                  <div class="input-group input-group-merge">
                    <input
                      type="text"
                      class="form-control"
                      id="username"
                      name="username"
                      placeholder="학번/교번을 입력해주세요."
                      autofocus
                    />
                  </div>
                </div>
                <div class="mb-3 form-password-toggle">
                  <div class="d-flex justify-content-between">
                    <label class="form-label" for="password">Password</label>
                    <a href="/findPw">
                      <small>비밀번호 찾기</small>
                    </a>
                  </div>
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="password"
                      class="form-control"
                      name="password"
                      placeholder="비밀번호를 입력해주세요."
                      aria-describedby="password"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                </div>
                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="remember-me" />
                    <label class="form-check-label" for="remember-me"> Remember Me </label>
                  </div>
                </div>
                <div class="mb-3">
                	<button class="btn btn-primary d-grid w-100" type="submit">로그인</button>
                </div>
                <div class="mb-3">
                	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#enableOTP"> Show </button>
                </div>
              </form>

<!--               <p class="text-center"></p> -->

              
            </div>
          </div>
          <!-- /Register -->
        </div>
      </div>
    </div>
    
	<!-- Enable OTP Modal -->
	<div class="modal fade" id="enableOTP" tabindex="-1" aria-hidden="true">
	  <div class="modal-dialog modal-simple modal-enable-otp modal-dialog-centered">
	    <div class="modal-content p-3">
	      <div class="modal-body" style="padding: var(--bs-modal);">
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	    	<!-- 모달 탭 -->
			<ul class="nav nav-tabs nav-fill" role="tablist">
		        <li class="nav-item" role="presentation">
		          <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-home" aria-controls="navs-justified-home" aria-selected="true" > 아이디 찾기 </button>
		        </li>
		        <li class="nav-item" role="presentation">
		          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="false" tabindex="-1"> 비밀번호 찾기 </button>
		        </li>
			</ul>
			<!-- 모달 내용 -->
			<div class="tab-content">
				<div class="tab-pane fade active show" id="navs-justified-home" role="tabpanel">
					<!-- 아이디 찾기 -->
					<form id="findId" class="mb-3" action="#" method="POST">
						<div class="mb-3">
							<label for="email" class="form-label">이름</label>
							<input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" autofocus />
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">이메일</label>
							<input type="text" class="form-control" id="email" name="email" placeholder="Enter your email" autofocus />
						</div>
						<br/>
						<button class="btn btn-primary d-grid w-30" style="float: right;">아이디 찾기</button>
					</form>
				</div>
				<div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
					<!-- 비밀번호 찾기 -->
					<form id="findPw" class="mb-3" action="#" method="POST">
						<div class="mb-3">
							<label for="email" class="form-label">이름</label>
							<input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" autofocus />
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">이메일</label>
							<input type="text" class="form-control" id="email" name="email" placeholder="Enter your email" autofocus />
						</div>
						<br/>
						<button class="btn btn-primary d-grid w-30" style="float: right;">아이디 찾기</button>
					</form>
				</div>
			</div>
	    	<!-- test -->
	      </div>
	    </div>
	  </div>
	</div>
	<!--/ Enable OTP Modal -->
    <!-- / Content -->


    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="/resources/sneat/assets/vendor/libs/popper/popper.js"></script>
    <script src="/resources/sneat/assets/vendor/js/bootstrap.js"></script>
    <script src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="/resources/sneat/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="/resources/sneat/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    
    <script type="text/javascript">
    $(function(){
    	$("#stuBtn").on("click", function(){
    		$("#username").val("201901006");
    		$("#password").val("java");
    		$("#formAuthentication").submit();
    	});
    	
    	$("#teaBtn").on("click", function(){
    		$("#username").val("200101");
    		$("#password").val("java");
    		$("#formAuthentication").submit();
    	});

    	$("#admBtn").on("click", function(){
    		$("#username").val("90001");
    		$("#password").val("java");
    		$("#formAuthentication").submit();
    	});
    });
    </script>
    
  </body>
</html>
