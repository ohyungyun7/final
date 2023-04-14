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
    
    <script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>


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
          <h4 class="mb-2">아이디 찾기</h4>
          <p class="mb-4">본인 정보를 입력하여 아이디를 찾을 수 있습니다.</p>
            <div class="mb-3">
              <label for="email" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요." autofocus>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">이메일</label>
              <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요." autofocus>
            </div>
            <br/>
            
            <div class="divRes" style="margin:auto; border: 0.5px solid lightgray; display: none;
        						padding: 10px; box-shadow: 1px 1px 3px 1px #dadce0; border-radius: 0.5em;">
	        	<span class="fw-semibold mx-2">아이디 :</span>
	        	<span id="username"></span>
        	</div>
        	<br />
            <br />
            <button id="idBtn" class="btn btn-primary d-grid w-100">아이디 찾기</button>
          <div class="text-center">
          <br />
            <a href="/start" class="d-flex align-items-center justify-content-center">
              <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
              	로그인으로 돌아가기
            </a>
          </div>
        </div>
<!--         <div class="card-footer" style=""> -->
<!--         </div> -->
      </div>
      <!-- /Forgot Password -->
    </div>
  </div>
</div>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">

$(function(){
	$("#idBtn").on("click", function(){
		
		let name = $("#name").val();
		let email = $("#email").val();
		
		let data = {
				"name" : name,
				"email" : email
		};
		
        $.ajax({
	          type: "post",
	          contentType: "application/json;charset=utf-8",
	          url: "/findId",
	          data: JSON.stringify(data),
			  beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
				             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			  },
	  		  async: false,
	          success: function (result) {
				if(result == 'x'){
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
					  $("#name").val("");
					  $("#email").val("");
				}else{
					$(".divRes").css("display", "block");
					$("#username").text(result);
				}
	          },
	          error:function(xhr){
	             }
        });
	});
});

</script>
<!-- / Content -->


    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    
    <script src="/resources/sneat/assets/vendor/libs/popper/popper.js"></script>
    <script src="/resources/sneat/assets/vendor/js/bootstrap.js"></script>
    <script src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="/resources/sneat/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="/resources/sneat/assets/js/main.js"></script>

   	<script src="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
	<script type="text/javascript" src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>    

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    
    
  </body>
</html>
