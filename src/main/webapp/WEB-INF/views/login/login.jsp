<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="org.apache.catalina.Session"%>
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
	  background-size: cover;
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
	<%
		int count = 0;
		if (session == null || session.getAttribute("failCount") == null || session.getAttribute("failCount").equals("")){
				count = 0;
		}else{
			count = (int)session.getAttribute("failCount");

		}
	%>
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

              <form id="formAuthentication" class="mb-3" action="/login" method="post">
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
                      autofocus required="required"
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
                      aria-describedby="password" required="required"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                  <br />
                  <input type="hidden" id="num" name="num" value="<%=count %>"/>
                  <span style="color: red; font-size: 0.9em;">${msg}&nbsp;&nbsp;&nbsp;</span>
                  <span style="color: red; font-size: 0.8em;" id="num2"></span>

                </div>
                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="remember-me" />
                    <label class="form-check-label" for="remember-me"> 로그인정보 저장하기 </label>
                  </div>
                </div>
                <div class="mb-3">
					<div id="captcha" style="display: none;">
						<input type="hidden" name="capcha" id="g-recaptcha-response" />
						<hr />
						<div style="margin-left: 27px;" class="g-recaptcha" data-sitekey="6LeCSJ0kAAAAAFb7RoeeCRzeKXA8HfWFYZ_7uwxv"></div>
						<br />
					</div>
                  	<button id="loginBtn1" class="btn btn-primary d-grid w-100" type="submit">로그인</button>
                </div>
                <sec:csrfInput/>
              </form>

<!--               <p class="text-center"></p> -->

            </div>
          </div>
          <!-- /Register -->
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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <script type="text/javascript">
    $(function(){

    	let num = $("#num").val();
    	if(num > 0){
	    	$("#num2").text("<" + num + "회 로그인 실패>");
    	}
    	if(num >= 3){
    		$("#loginBtn1").attr("id", "loginBtn2");
    		$("#captcha").css("display", "block");
    	}

    	$("#stuBtn").on("click", function(){
    		$("#username").val("201901006");
    		$("#password").val("java");
    		$("button[type='submit']").click();
    	});

    	$("#teaBtn").on("click", function(){
    		$("#username").val("200101");
    		$("#password").val("java");
    		$("button[type='submit']").click();
    	});

    	$("#admBtn").on("click", function(){
    		$("#username").val("90001");
    		$("#password").val("java");
    		$("button[type='submit']").click();
    	});

    	$(document).on("click", "#loginBtn2", function() {
    		var captcha = 1;
    		$.ajax({
                url: '/VerifyRecaptcha',
                type: 'post',
                data: {
                    recaptcha: $("#g-recaptcha-response").val()
                },
    			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정  <security 때문에 ajax 호출할 때마다 써야 함.>
    	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    			},
                success: function(data) {
                    switch (data) {
                        case 0:
//                             console.log("자동 가입 방지 봇 통과");
                            captcha = 0;
                            $("#formAuthentication").submit();
                    		break;
                        case 1:
      					  Swal.fire({
  						    title: '현재 보안에 취약합니다.',
  						    text: '인증을 완료해주세요.',
  						    showClass: {
  						      popup: 'animate__animated animate__bounceIn'
  						    },
  						    icon: 'warning',
  						    customClass: {
  						      confirmButton: 'btn btn-primary'
  						    },
  						    buttonsStyling: false
  						  });
                            break;
                        default:
	                        Swal.fire({
	                			title: "자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다.<br/>[Error bot Code : " + Number(data) + "]",
	                			showClass: {
	                				popup: 'animate__animated animate__bounceIn'
	                			},
	                			icon: 'warning',
	                			customClass: {
	                				confirmButton: 'btn btn-primary'
	                			},
	                			buttonsStyling: false
	                		});
                       		break;
                    }
                }
            });
    		if(captcha != 0) {
    			return false;
    		}

    	});

    });
    </script>

  </body>
</html>
