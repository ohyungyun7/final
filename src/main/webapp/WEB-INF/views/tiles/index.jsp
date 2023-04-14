<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ page import="kr.or.ddit.vo.UserVO"%>
<html lang="en"	class="light-style layout-navbar-fixed layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="/resources/sneat/assets/" data-template="vertical-menu-template">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

<title>home</title>

<meta name="description"	content="Most Powerful &amp; Comprehensive Bootstrap 5 HTML Admin Dashboard Template built for developers!">
<meta name="keywords"	content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
<!-- Canonical SEO -->
<link rel="canonical"	href="https://themeselection.com/item/sneat-bootstrap-html-admin-template/">


<!-- Google Tag Manager (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','dataLayer','GTM-5DDHKGP');</script>
<!-- End Google Tag Manager -->

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="/resources/sneat/assets/img/favicon/favicon.ico">
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">

<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/fonts/boxicons.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/fonts/fontawesome.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/fonts/flag-icons.css">
<!-- Core CSS -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/css/rtl/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="/resources/sneat/assets/css/demo.css">
<!-- Row Group CSS -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css">
<!-- Form Validation -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/formvalidation/dist/css/formValidation.min.css">
<!-- Vendors CSS -->
<link rel="stylesheet"	href="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">
<!-- <link rel="stylesheet"	href="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.css"> -->
<link rel="stylesheet"	href="/resources/sneat/assets/vendor/libs/select2/select2.css">
<!-- Editor -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/quill/typography.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/quill/editor.css">

<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css">
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/flatpickr/flatpickr.css">

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/sneat/assets/vendor/libs/select2/select2.js"></script>
<script src="/resources/js/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/tagify/tagify.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/bootstrap-select/bootstrap-select.css" />

<!-- sweetalert2 -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/animate-css/animate.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.css" />


<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">


<!-- Helpers -->
<script src="/resources/sneat/assets/vendor/js/helpers.js"></script>
<style type="text/css">
.layout-menu-fixed .layout-navbar-full .layout-menu,
	.layout-menu-fixed-offcanvas .layout-navbar-full .layout-menu {
	top: 62px !important;
}

.layout-page {
	padding-top: 62px !important;
}

.content-wrapper {
	padding-bottom: 38.9375px !important;
}

.page-icon{
	font-size: 1.5rem;
	margin-bottom: 0.2rem;
/* 	color: #696cff; */
}
.menu-title{
	font-weight: 700 !important;
    font-size: xx-large;
}
.menu{
	font-size: medium;
}
.categoryBar{
	color: #728294;
}
body *{
	font-size: 19px;
}
</style>

<!--! 템플릿 커스터마이저 및 테마 구성 파일은 <헤드> 섹션의 핵심 스타일시트 및 helpers.js 뒤에 포함되어야 합니다 -->
<!--? Template customizer: 사용자 지정자 집합을 숨기려면 config.js에서 사용자 지정자 값 false를 표시합니다.  -->
<!-- <script src="/resources/sneat/assets/vendor/js/template-customizer.js"></script> -->
<style>
#template-customizer {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol" !important;
	font-size: inherit !important;
	position: fixed;
	top: 0;
	right: 0;
	height: 100%;
	z-index: 99999999;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	width: 360px;
	background: #fff;
	-webkit-box-shadow: 0 0 20px 0 rgba(0, 0, 0, .2);
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, .2);
	-webkit-transition: all .2s ease-in;
	-o-transition: all .2s ease-in;
	transition: all .2s ease-in;
	-webkit-transform: translateX(380px);
	-ms-transform: translateX(380px);
	transform: translateX(380px)
}

#template-customizer h5 {
	position: relative;
	font-size: 11px;
	font-weight: 600
}

#template-customizer>h5 {
	flex: 0 0 auto
}

#template-customizer .disabled {
	color: #d1d2d3 !important
}

#template-customizer.template-customizer-open {
	-webkit-transition-delay: .1s;
	-o-transition-delay: .1s;
	transition-delay: .1s;
	-webkit-transform: none !important;
	-ms-transform: none !important;
	transform: none !important
}

#template-customizer .template-customizer-open-btn {
	position: absolute;
	top: 180px;
	left: 0;
	z-index: -1;
	display: block;
	width: 42px;
	height: 42px;
	border-top-left-radius: 15%;
	border-bottom-left-radius: 15%;
	background: #333;
	color: #fff !important;
	text-align: center;
	font-size: 18px !important;
	line-height: 42px;
	opacity: 1;
	-webkit-transition: all .1s linear .2s;
	-o-transition: all .1s linear .2s;
	transition: all .1s linear .2s;
	-webkit-transform: translateX(-62px);
	-ms-transform: translateX(-62px);
	transform: translateX(-62px)
}

@media ( max-width : 991.98px) {
	#template-customizer .template-customizer-open-btn {
		top: 145px
	}
}

.dark-style #template-customizer .template-customizer-open-btn {
	background: #555
}

#template-customizer .template-customizer-open-btn::before {
	content: "";
	width: 22px;
	height: 22px;
	display: block;
	background-size: 100% 100%;
	position: absolute;
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAABClJREFUaEPtmY1RFEEQhbsjUCIQIhAiUCNQIxAiECIQIxAiECIAIpAMhAiECIQI2vquZqnZvp6fhb3SK5mqq6Ju92b69bzXf6is+dI1t1+eAfztG5z1BsxsU0S+ici2iPB3vm5E5EpEDlSVv2dZswFIxv8UkZcNy+5EZGcuEHMCOBeR951uvVDVD53vVl+bE8DvDu8Pxtyo6ta/BsByg1R15Bwzqz5/LJgn34CZwfnPInI4BUB6/1hV0cSjVxcAM4PbcBZjL0XklIPN7Is3fLCkdQPpPYw/VNXj5IhPIvJWRIhSl6p60ULWBGBm30Vk123EwRxCuIzWkkjNrCZywith10ewE1Xdq4GoAjCz/RTXW44Ynt+LyBEfT43kYfbj86J3w5Q32DNcRQDpwF+dkQXDMey8xem0L3TEqB4g3PZWad8agBMRgZPeu96D1/C2Zbh3X0p80Op1xxloztN48bMQQNoc7+eLEuAoPSPiIDY4Ooo+E6ixeNXM+D3GERz2U3CIqMstLJUgJQDe+7eq6mub0NYEkLAKwEHkiBQDCZtddZCZ8d6r7JDwFkoARklHRPZUFVDVZWbwGuNrC4EfdOzFrRABh3Wnqhv+d70AEBLGFROPmeHlnM81G69UdSd6IUuM0GgUVn1uqWmg5EmMfBeEyB7Pe3txBkY+rGT8j0J+WXq/BgDkUCaqLgEAnwcRog0veMIqFAAwCy2wnw+bI2GaGboBgF9k5N0o0rUSGUb4eO0BeO9j/GYhkSHMHMTIqwGARX6p6a+nlPBl8kZuXMD9j6pKfF9aZuaFOdJCEL5D4eYb9wCYVCanrBmGyii/tIq+SLj/HQBCaM5bLzwfPqdQ6FpVHyra4IbuVbXaY7dETC2ESPNNWiIOi69CcdgSMXsh4tNSUiklMgwmC0aNd08Y5WAES6HHehM4gu97wyhBgWpgqXsrASglprDy7CwhehMZOSbK6JMSma+Fio1KltCmlBIj7gfZOGx8ppQSXrhzFnOhJ/31BDkjFHRvOd09x0mRBA9SFgxUgHpQg0q0t5ymPMlL+EnldFTfDA0NAmf+OTQ0X0sRouf7NNkYGhrOYNrxtIaGg83MNzVDSe3LXLhP7O/yrCsCz1zlWTpjWkuZAOBpX3yVnLqI1yLCOKU6qMrmP7SSrUEw54XF4WBIK5FxCMOr3lVsfGqNSmPzBXUnJTIX1jyVBq9wO6UObOpgC5GjO98vFKnTdQMZXxEsWZlDiCZMIxAbNxQOqlpVZtobejBaZNoBnRDzMFpkxvTQOD36BlrcySZuI6p1ACB6LU3wWuf5581+oHfD1vi89bz3nFUC8Nm7ZlP3nKkFbM4bWPt/MSFwklprYItwt6cmvpWJ2IVcQBCz6bLysSCv3SaANCiTsnaNRrNRqMXVVT1/BrAqz/buu/Y38Ad3KC5PARej0QAAAABJRU5ErkJggg==);
	margin: 10px
}

.customizer-hide #template-customizer .template-customizer-open-btn {
	display: none
}

[dir=rtl] #template-customizer .template-customizer-open-btn {
	border-radius: 0;
	border-top-right-radius: 15%;
	border-bottom-right-radius: 15%
}

[dir=rtl] #template-customizer .template-customizer-open-btn::before {
	margin-left: -2px
}

#template-customizer.template-customizer-open .template-customizer-open-btn
	{
	opacity: 0;
	-webkit-transition-delay: 0s;
	-o-transition-delay: 0s;
	transition-delay: 0s;
	-webkit-transform: none !important;
	-ms-transform: none !important;
	transform: none !important
}

#template-customizer .template-customizer-close-btn {
	position: absolute;
	top: 32px;
	right: 0;
	display: block;
	font-size: 20px;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%)
}

#template-customizer .template-customizer-inner {
	position: relative;
	overflow: auto;
	-webkit-box-flex: 0;
	-ms-flex: 0 1 auto;
	flex: 0 1 auto;
	opacity: 1;
	-webkit-transition: opacity .2s;
	-o-transition: opacity .2s;
	transition: opacity .2s
}

#template-customizer .template-customizer-inner>div:first-child>hr:first-of-type
	{
	display: none !important
}

#template-customizer .template-customizer-inner>div:first-child>h5:first-of-type
	{
	padding-top: 0 !important
}

#template-customizer .template-customizer-themes-inner {
	position: relative;
	opacity: 1;
	-webkit-transition: opacity .2s;
	-o-transition: opacity .2s;
	transition: opacity .2s
}

#template-customizer .template-customizer-theme-item {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-ms-flex-align: center;
	-webkit-box-flex: 1;
	-ms-flex: 1 1 100%;
	flex: 1 1 100%;
	-webkit-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
	margin-bottom: 10px;
	padding: 0 24px;
	width: 100%;
	cursor: pointer
}

#template-customizer .template-customizer-theme-item input {
	position: absolute;
	z-index: -1;
	opacity: 0
}

#template-customizer .template-customizer-theme-item input ~span {
	opacity: .25;
	-webkit-transition: all .2s;
	-o-transition: all .2s;
	transition: all .2s
}

#template-customizer .template-customizer-theme-item .template-customizer-theme-checkmark
	{
	display: inline-block;
	width: 6px;
	height: 12px;
	border-right: 1px solid;
	border-bottom: 1px solid;
	opacity: 0;
	-webkit-transition: all .2s;
	-o-transition: all .2s;
	transition: all .2s;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg)
}

[dir=rtl] #template-customizer .template-customizer-theme-item .template-customizer-theme-checkmark
	{
	border-right: none;
	border-left: 1px solid;
	-webkit-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	transform: rotate(-45deg)
}

#template-customizer .template-customizer-theme-item input:checked:not([disabled])
	~span, #template-customizer .template-customizer-theme-item:hover input:not([disabled])
	~span {
	opacity: 1
}

#template-customizer .template-customizer-theme-item input:checked:not([disabled])
	~span .template-customizer-theme-checkmark {
	opacity: 1
}

#template-customizer .template-customizer-theme-colors span {
	display: block;
	margin: 0 1px;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	-webkit-box-shadow: 0 0 0 1px rgba(0, 0, 0, .1) inset;
	box-shadow: 0 0 0 1px rgba(0, 0, 0, .1) inset
}

#template-customizer.template-customizer-loading .template-customizer-inner,
	#template-customizer.template-customizer-loading-theme .template-customizer-themes-inner
	{
	opacity: .2
}

#template-customizer.template-customizer-loading .template-customizer-inner::after,
	#template-customizer.template-customizer-loading-theme .template-customizer-themes-inner::after
	{
	content: "";
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 999;
	display: block
}

.layout-menu-100vh #template-customizer {
	height: 100vh
}

[dir=rtl] #template-customizer {
	right: auto;
	left: 0;
	-webkit-transform: translateX(-380px);
	-ms-transform: translateX(-380px);
	transform: translateX(-380px)
}

[dir=rtl] #template-customizer .template-customizer-open-btn {
	right: 0;
	left: auto;
	-webkit-transform: translateX(62px);
	-ms-transform: translateX(62px);
	transform: translateX(62px)
}

[dir=rtl] #template-customizer .template-customizer-close-btn {
	right: auto;
	left: 0
}

#template-customizer .template-customizer-layouts-options[disabled] {
	opacity: .5;
	pointer-events: none
}

[dir=rtl] .template-customizer-t-style_switch_light {
	padding-right: 0 !important
}

layout-container card body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<!--? Config:  필수 테마 구성 파일에는 글로벌 변수 및 기본 테마 옵션이 포함되어 있습니다. 이 파일에서 원하는 테마 옵션을 설정하십시오.  -->
<script src="/resources/sneat/assets/js/config.js"></script>

<link rel="stylesheet" type="text/css"
			href="/resources/sneat/assets/vendor/css/rtl/core.css"	class="template-customizer-core-css">
<link rel="stylesheet" type="text/css"
			href="/resources/sneat/assets/vendor/css/rtl/theme-default.css"	class="template-customizer-theme-css">
</head>

<body>

<!-- 화면 로딩중 -->
<script>
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(document).height();
    var maskWidth  = window.document.body.clientWidth;

    //화면에 출력할 마스크를 설정해줍니다.
    var loadingImg = '';
    loadingImg += "<div id='loadingImg'>";
    loadingImg += " <img src='/resources/images/logo2.png' style='position: absolute; display: block; margin: 0px; top: " + (maskHeight/2 - 100) + "; left:" + (maskWidth/2 - 50) + ";'/>";
    loadingImg += "</div>";

    var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'>" + loadingImg + "</div>";

    //화면에 레이어 추가
    $('body').append(mask)

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
            'width' : maskWidth
            , 'height': maskHeight
            , 'background' : 'white'
    });

    //마스크 표시
    $('#mask').show();

    $(function () {
    	$('#mask').hide();
	})
</script>
<!-- 화면 로딩중 -->

	<!-- Google Tag Manager (noscript) (Default ThemeSelection: GTM-5DDHKGP, PixInvent: GTM-5J3LMKC) -->
<!-- 	<noscript> -->
<!-- 		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5DDHKGP" -->
<!-- 			height="0" width="0" style="display: none; visibility: hidden"></iframe> -->
<!-- 	</noscript> -->
	<!-- End Google Tag Manager (noscript) -->

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar  ">
		<div class="layout-container">

<!-- 			Menu aside -->
			<!-- Main Sidebar Container aside.jsp 시작 -->


<%-- 			<% --%>
<!-- // 			UserVO userVO = (UserVO)session.getAttribute("userVO"); -->
<!-- // 			String auth = userVO.getAuth(); -->

<!-- // 			if(auth.equals("ROLE_STU")){ -->
<%-- 			%> --%>
<%-- 				<tiles:insertAttribute name="aside_stu" /> --%>
<%-- 			<%	 --%>
<!-- // 			}else if(auth.equals("ROLE_TEA")){ -->
<%-- 			%> --%>
<%-- 				<tiles:insertAttribute name="aside_pro" /> --%>
<%-- 			<%	 --%>
<!-- // 			}else{ -->
<%-- 			%> --%>
<%-- 				<tiles:insertAttribute name="aside_adm" /> --%>
<%-- 			<% --%>
<!-- // 			} -->
<%-- 			%> --%>



			<!-- 시큐리티 적용 / 지우지마세요!!!!!!!!!!!!!!!!!!!! -->
			<sec:authorize access="hasRole('ROLE_STU')">
				 <tiles:insertAttribute name="aside_stu" />
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_TEA')">
				 <tiles:insertAttribute name="aside_pro" />
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				 <tiles:insertAttribute name="aside_adm" />
			</sec:authorize>

			  <!-- Main Sidebar Container aside.jsp 끝 -->
			<!-- Layout container -->
			<div class="layout-page">


				<!-- Navbar -->
				  <!-- ---------------- Navbar header.jsp 시작 ---------------- -->
				  <tiles:insertAttribute name="header" />
				  <!-- ---------------- /.navbar header.jsp 끝----------------  -->
				<!-- / Navbar -->

				<br/>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<div class="container">
						<!-- --------------  body 시작 ----------------------- -->
				  		<tiles:insertAttribute name="body" />
				  		<!-- --------------  body 끝 ----------------------- -->

						<div class="content-backdrop fade"></div>
					</div>
				</div>
					<!-- --------------  footer.jsp 시작 ----------------------- -->
				  	<tiles:insertAttribute name="footer" />
				  	<!-- --------------  footer.jsp 끝 ----------------------- -->
			</div>
			<!-- /Content wrapper -->
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>

		<!-- Drag Target Area To SlideIn Menu On Small Screens -->
		<div class="drag-target"
			style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>
	</div>
	<!-- / Layout wrapper -->


<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script src="/resources/sneat/assets/vendor/libs/popper/popper.js"></script>
<script src="/resources/sneat/assets/vendor/js/bootstrap.js"></script>
<script	src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="/resources/sneat/assets/vendor/libs/hammer/hammer.js"></script>
<script src="/resources/sneat/assets/vendor/libs/i18n/i18n.js"></script>
<!-- <script src="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.js"></script> -->

<script src="/resources/sneat/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Datatable -->
<!-- Vendors JS -->
<!-- Form Validation -->
<script src="/resources/sneat/assets/vendor/libs/formvalidation/dist/js/FormValidation.min.js"></script>
<script src="/resources/sneat/assets/vendor/libs/formvalidation/dist/js/plugins/Bootstrap5.min.js"></script>
<script src="/resources/sneat/assets/vendor/libs/formvalidation/dist/js/plugins/AutoFocus.min.js"></script>
<script src="/resources/sneat/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<!-- Flat Picker -->
<script src="/resources/sneat/assets/vendor/libs/moment/moment.js"></script>
<script src="/resources/sneat/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<!-- Main JS -->
<script src="/resources/sneat/assets/js/main.js"></script>

<!-- Page JS -->
<script src="/resources/sneat/assets/js/tables-datatables-extensions.js"></script>
<script src="/resources/sneat/assets/js/forms-editors.js"></script>
<script src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>

<script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.3/js/dataTables.bootstrap5.min.js"></script>
<!-- Vendors JS -->
<!-- Editor -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="/resources/sneat/assets/vendor/libs/quill/katex.js"></script>
<script src="/resources/sneat/assets/vendor/libs/quill/quill.js"></script>
<!-- sweetalert -->
<script src="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/resources/sneat/assets/vendor/libs/tagify/tagify.js"></script>
<script src="/resources/sneat/assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
<script src="/resources/sneat/assets/vendor/libs/bloodhound/bloodhound.js"></script>
<script src="/resources/sneat/assets/js/forms-tagify.js"></script>

  <!-- Page JS -->
<!-- <script src="/resources/sneat/assets/js/forms-typeahead.js"></script> -->


<!-- 삭제 절대 xxxxxx -->
<script src="/resources/sneat/assets/vendor/libs/select2/select2.js"></script>
<script src="/resources/sneat/assets/vendor/libs/block-ui/block-ui.js"></script>

</body>
</html>