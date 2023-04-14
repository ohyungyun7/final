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
          <h4 class="mb-2">비밀번호 변경 🔒</h4>
          <p class="mb-4">본인인증 후 비밀번호를 변경할 수 있습니다.</p>
          <form id="formAuthentication" class="mb-3" action="auth-reset-password-basic.html" method="POST">
            <div class="mb-3">
              <label for="email" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" autofocus>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">아이디</label>
              <input type="text" class="form-control" id="id" name="id" placeholder="Enter your id" autofocus>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">이메일</label>
              <input type="text" class="form-control" id="email" name="email" placeholder="Enter your email" autofocus>
            </div>
            <button class="btn btn-primary d-grid w-100">비밀번호 변경</button>
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
  </body>
</html>
