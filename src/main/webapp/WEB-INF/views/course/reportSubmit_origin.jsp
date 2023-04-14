<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Vendors CSS -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/dropzone/dropzone.css" />

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a>
				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
				<a class="nav-item nav-link" href="/course/attendStu?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
				<a class="nav-item nav-link active" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
			</div>
		</div>
	</div>
</nav>
<br />
<div class="card">

<div class="card-header">
	<h5 class="title">
			<a href="/student/mypagePWcheck" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list" class="categoryBar">강의목록</a>
			&nbsp;/&nbsp;<a href="#" class="categoryBar">${sbjTitle}</a>
	</h5>
</div>

<div class="card-body">
	<div class="row">
	<!-- Vertical Scrollbar -->
		<div class="col-md-12 col-sm-12">
	    	<div class="card overflow-hidden mb-4" style="height: 500px;">
				<h5 class="card-header">과제 제목</h5>
				<div class="card-body" id="vertical-example">
			        <p>
			          Sweet roll I love I love. Tiramisu I love soufflé cake tart sweet roll
			          cotton candy cookie. Macaroon biscuit dessert. Bonbon cake soufflé
			          jelly gummi bears lemon drops. Chocolate bar I love macaroon danish
			          candy pudding. Jelly carrot cake I love tart cake bear claw macaroon
			          candy candy canes. Muffin gingerbread sweet jujubes croissant sweet
			          roll. Topping muffin carrot cake sweet. Toffee chocolate muffin I love
			          croissant. Donut carrot cake ice cream ice cream. Wafer I love pie
			          danish marshmallow cheesecake oat cake pie I love. Icing pie chocolate
			          marzipan jelly ice cream cake.
			        </p>
			        <p>
			          Marzipan oat cake caramels chocolate. Lemon drops cheesecake jelly
			          beans sweet icing pudding croissant. Donut candy canes carrot cake
			          soufflé. Croissant candy wafer pie I love oat cake lemon drops
			          caramels jujubes. I love macaroon halvah liquorice cake. Danish sweet
			          roll pudding cookie sweet roll I love. Jelly cake I love bear claw
			          jujubes dragée gingerbread. I love cotton candy carrot cake halvah
			          biscuit I love macaroon cheesecake tootsie roll. Chocolate cotton
			          candy biscuit I love fruitcake cotton candy biscuit tart gingerbread.
			          Powder oat cake I love. Cheesecake candy canes macaroon I love wafer I
			          love sweet roll ice cream. Toffee cookie macaroon lemon drops tart
			          candy canes. Gummies gummies pie tiramisu I love bear claw cheesecake.
			        </p>
			        <p>
			          Marzipan oat cake caramels chocolate. Lemon drops cheesecake jelly
			          beans sweet icing pudding croissant. Donut candy canes carrot cake
			          soufflé. Croissant candy wafer pie I love oat cake lemon drops
			          caramels jujubes. I love macaroon halvah liquorice cake. Danish sweet
			          roll pudding cookie sweet roll I love. Jelly cake I love bear claw
			          jujubes dragée gingerbread. I love cotton candy carrot cake halvah
			          biscuit I love macaroon cheesecake tootsie roll. Chocolate cotton
			          candy biscuit I love fruitcake cotton candy biscuit tart gingerbread.
			          Powder oat cake I love. Cheesecake candy canes macaroon I love wafer I
			          love sweet roll ice cream. Toffee cookie macaroon lemon drops tart
			          candy canes. Gummies gummies pie tiramisu I love bear claw cheesecake.
			        </p>
			        <p>
			          Sweet roll I love I love. Tiramisu I love soufflé cake tart sweet roll
			          cotton candy cookie. Macaroon biscuit dessert. Bonbon cake soufflé
			          jelly gummi bears lemon drops. Chocolate bar I love macaroon danish
			          candy pudding. Jelly carrot cake I love tart cake bear claw macaroon
			          candy candy canes. Muffin gingerbread sweet jujubes croissant sweet
			          roll. Topping muffin carrot cake sweet. Toffee chocolate muffin I love
			          croissant. Donut carrot cake ice cream ice cream. Wafer I love pie
			          danish marshmallow cheesecake oat cake pie I love. Icing pie chocolate
			          marzipan jelly ice cream cake.
			        </p>
			        <p>
			          Sweet roll I love I love. Tiramisu I love soufflé cake tart sweet roll
			          cotton candy cookie. Macaroon biscuit dessert. Bonbon cake soufflé
			          jelly gummi bears lemon drops. Chocolate bar I love macaroon danish
			          candy pudding. Jelly carrot cake I love tart cake bear claw macaroon
			          candy candy canes. Muffin gingerbread sweet jujubes croissant sweet
			          roll. Topping muffin carrot cake sweet. Toffee chocolate muffin I love
			          croissant. Donut carrot cake ice cream ice cream. Wafer I love pie
			          danish marshmallow cheesecake oat cake pie I love. Icing pie chocolate
			          marzipan jelly ice cream cake.
			        </p>
			        <p>
			          Sweet roll I love I love. Tiramisu I love soufflé cake tart sweet roll
			          cotton candy cookie. Macaroon biscuit dessert. Bonbon cake soufflé
			          jelly gummi bears lemon drops. Chocolate bar I love macaroon danish
			          candy pudding. Jelly carrot cake I love tart cake bear claw macaroon
			          candy candy canes. Muffin gingerbread sweet jujubes croissant sweet
			          roll. Topping muffin carrot cake sweet. Toffee chocolate muffin I love
			          croissant. Donut carrot cake ice cream ice cream. Wafer I love pie
			          danish marshmallow cheesecake oat cake pie I love. Icing pie chocolate
			          marzipan jelly ice cream cake.
			        </p>
      			</div>
			</div>
		</div>
		<!--/ Vertical Scrollbar -->
		
		<div>
		<a href="#"><button type="button" class="btn btn-primary">수정</button></a>
		<a href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-info">리스트</button></a>
		
		</div>
	</div>
	<%
	UserVO userVO = (UserVO)session.getAttribute("userVO");
	if(userVO.getAuth().equals("ROLE_STU")) {
	%>
	<hr style="border-top: 1px dashed #bbb;"/>
	<div class="row">
	  <div class="col-xl">
	    <div class="card mb-4">
	      <div class="card-header d-flex justify-content-between align-items-center">
	        <h5 class="mb-0">과제 제출</h5> 
<!-- 	        <small class="text-muted float-end">Default label</small> -->
	      </div>
	      <div class="card-body">
	        <form>
	          <div class="mb-3">
	            <label class="form-label" for="basic-default-message">내용</label>
	            <textarea id="basic-default-message" class="form-control" placeholder="과제 내용을 입력하세요" style="height: 6.25em; resize: none;"></textarea>
	          </div>
	          
				<div class="mb-3">
				  <label for="formFileMultiple" class="form-label">파일 업로드</label>
				  <input class="form-control" type="file" id="formFileMultiple" multiple>
				</div>

	          <button type="submit" class="btn btn-primary">제출</button>
	          <a href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-info">리스트</button></a>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	<%
	}
	%>
	
</div>
<!-- card-body end -->

<script src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/sneat/assets/js/extended-ui-perfect-scrollbar.js"></script>
<!-- Vendors JS -->
<script src="/resources/sneat/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/resources/sneat/assets/js/forms-file-upload.js"></script>
<!-- Page JS -->