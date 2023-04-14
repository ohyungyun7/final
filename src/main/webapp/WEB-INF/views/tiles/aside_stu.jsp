<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/jquery-3.6.0.js"></script>

<script>
$(function(){

})

</script>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme" data-bg-class="bg-menu-theme" style="touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">


<div class="app-brand demo ">
	<a href="/main" class="app-brand-link">
		<span class="app-brand-logo demo">
			<img class="logo-picture" src="/resources/images/logo2.png" alt="siksik cu logo" style="width: 50;">
		</span>
		<span class="app-brand-text demo menu-text ms-2 menu-title p-3">씩씩대학</span>
	</a>
	<a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
		<i class="bx bx-chevron-left bx-sm align-middle"></i>
	</a>
</div>

<div class="menu-inner-shadow"></div>



<ul class="menu-inner py-1 ps ps--active-y">
	<li class="menu-item" style="margin-left: 20px;">
		<span class="badge bg-label-info">학생</span>
	</li>
	<li class="menu-item">
		<a href="/student/mypagePWcheck" class="menu-link">
			<i class="menu-icon tf-icons bx bx-user-circle"></i>
			<div data-i18n="마이페이지">마이페이지</div>
		</a>
	</li>
	<!-- 학사 -->
	<li class="menu-item">
		<a href="javascript:void(0);" class="menu-link menu-toggle">
			<i class="menu-icon tf-icons bx bx-layout"></i>
			<div data-i18n="학사">학사</div>
		</a>
		<ul class="menu-sub">
			<li class="menu-item">
				<a href="/acadCal/acadCal" class="menu-link">
					<div data-i18n="학사 일정">학사 일정</div>
				</a>
			</li>
	    	<li class="menu-item">
				<a href="/acadNotice/list" class="menu-link">
					<div data-i18n="학사 공지">학사 공지</div>
	      		</a>
	    	</li>
	  	</ul>
	</li>

	<!-- 학과 -->
	<li class="menu-item">
	  	<a href="javascript:void(0);" class="menu-link menu-toggle">
	    	<i class="menu-icon tf-icons bx bx-chalkboard"></i>
	    	<div data-i18n="학과">학과</div>
	  	</a>
	  	<ul class="menu-sub">
	    	<li class="menu-item">
	      		<a href="/dpNotieBoard/dpNoticeBoardList" class="menu-link">
	        	<div data-i18n="학과 공지">학과 공지</div>
	      		</a>
	    	</li>
	    	<li class="menu-item">
	      		<a href="/dp/teachers" class="menu-link">
	        		<div data-i18n="학과 교수진">학과 교수진</div>
	      		</a>
	    	</li>
		    <li class="menu-item">
		      	<a href="/dp/subjects" class="menu-link">
		        	<div data-i18n="학과 과목">학과 과목</div>
		      	</a>
		    </li>
	  	</ul>
	</li>

	<!-- 쪽지함 -->
	<li class="menu-item">
	  <a href="/msg/messageList" class="menu-link">
	    <i class="menu-icon tf-icons bx bx-envelope"></i>
	    <div data-i18n="쪽지함">쪽지함</div>
	  </a>
	</li>

	<!-- 강의 목록 라인 -->
	<li class="menu-header small text-uppercase"><span class="menu-header-text">강의</span></li>
	<!-- 강의 목록 -->
	<li class="menu-item">
		<a href="/course/list" class="menu-link">
	    	<i class="menu-icon tf-icons bx bx-collection"></i>
	    	<div data-i18n="강의 목록">강의 목록</div>
	  	</a>
	</li>

	<!-- 수강신청 -->
	<li class="menu-item">
		<a href="/student/subjectList" class="menu-link">
			<i class="menu-icon tf-icons bx bx-book-open"></i>
    		<div data-i18n="수강신청">수강신청</div>
  		</a>
	</li>

	<!-- 성적 조회 -->
	<li class="menu-item">
	  <a href="javascript:void(0)" class="menu-link menu-toggle">
	    <i class="menu-icon tf-icons bx bxs-report"></i>
	    <div data-i18n="성적조회">성적조회</div>
	  </a>
	  <ul class="menu-sub">
	    <li class="menu-item">
	      <a href="/grade/gradeCheck" class="menu-link" id="rmagkrrl">
	        <div data-i18n="금학기 성적조회">금학기 성적조회</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/grade/gradeList" class="menu-link">
	        <div data-i18n="전체학기 성적조회">전체학기 성적조회</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/grade/gradeObjc" class="menu-link">
	        <div data-i18n="성적이의 신청">성적이의 신청</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/le/leStuList" class="menu-link">
	        <div data-i18n="강의 평가">강의 평가</div>
	      </a>
	    </li>
	  </ul>
	</li>


	<!-- 학적변동 라인 -->
	<li class="menu-header small text-uppercase"><span class="menu-header-text">학적상태</span></li>
	   <!-- 학적변동 -->
	<li class="menu-item">
	  <a href="javascript:void(0)" class="menu-link menu-toggle">
	    <i class="menu-icon tf-icons bx bx-street-view"></i>
	    <div data-i18n="학적변동 신청">학적변동 신청</div>
	  </a>
	  <ul class="menu-sub">
	    <li class="menu-item">
	      <a href="/academic/acaListStu" class="menu-link">
	        <div data-i18n="학적변동 신청 내역">학적변동 신청 내역</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/academic/leaveReturnStu" class="menu-link">
	        <div data-i18n="휴학&amp;복학">휴학 &amp; 복학</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/academic/acaDMStu" class="menu-link">
	        <div data-i18n="복수전공&amp;부전공">복수전공  &amp; 부전공</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/academic/acaTRStu" class="menu-link">
	        <div data-i18n="전과">전과</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/academic/acaDropout" class="menu-link">
	        <div data-i18n="자퇴">자퇴</div>
	      </a>
	    </li>
	  </ul>
	</li>

	<!-- 졸업 -->
	<li class="menu-item">
	  <a href="javascript:void(0);" class="menu-link menu-toggle">
	    <i class="menu-icon tf-icons bx bxs-graduation"></i>
	    <div data-i18n="졸업">졸업</div>
	  </a>
	  <ul class="menu-sub">
	    <li class="menu-item">
	      <a href="/grad/selfTest" class="menu-link">
	        <div data-i18n="자가진단">자가진단</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/grad/delayGraduation" class="menu-link">
	        <div data-i18n="졸업유예">졸업유예</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/grad/earlyGraduation" class="menu-link">
	        <div data-i18n="조기졸업">조기졸업</div>
	      </a>
	    </li>
	  </ul>
	</li>

	<!-- 증명서 -->
	<li class="menu-item">
	  <a href="javascript:void(0);" class="menu-link menu-toggle">
	    <i class="menu-icon tf-icons bx bx-clipboard"></i>
	    <div data-i18n="증명서 발급">증명서 발급</div>
	  </a>
	  <ul class="menu-sub">
	    <li class="menu-item">
	      <a href="/certificate/issueCertificate" class="menu-link">
	        <div data-i18n="증명서 발급">증명서 발급</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/certificate/lokerCertificate" class="menu-link">
	        <div data-i18n="증명서 보관함">증명서 보관함</div>
	      </a>
	    </li>
	  </ul>
	</li>

	<!-- 등록금 조회 -->
	<li class="menu-item">
	  <a href="/scholarship/list" class="menu-link">
	    <i class="menu-icon tf-icons bx bx-wallet-alt"></i>
	    <div data-i18n="등록금  ·  장학금 확인">등록금 및 장학금 확인</div>
	  </a>
	</li>


	<!-- 스터디 라인 -->
	<li class="menu-header small text-uppercase">
	  <span class="menu-header-text">스터디</span>
	</li>
	<!-- 스터디 -->
	<li class="menu-item">
	  <a href="/study/myStudyList" class="menu-link">
	    <i class="menu-icon tf-icons bx bxs-pencil"></i>
	    <div data-i18n="나의 스터디">나의 스터디</div>
	  </a>
	</li>

	<!-- 시설 라인 -->
	<li class="menu-header small text-uppercase">
	  <span class="menu-header-text">기타</span>
	</li>

	<!-- 상담 -->
	<li class="menu-item">
	  <a href="javascript:void(0)" class="menu-link menu-toggle">
	    <i class="menu-icon tf-icons bx bxs-heart-circle"></i>
	    <div data-i18n="상담">상담</div>
	  </a>
	  <ul class="menu-sub">
	    <li class="menu-item">
	      <a href="/consult/consultStuMain" class="menu-link">
	        <div data-i18n="상담 신청">상담 신청</div>
	      </a>
	    </li>
	    <li class="menu-item">
	      <a href="/consult/historyConsult" class="menu-link">
	        <div data-i18n="상담 내역">상담 내역</div>
	      </a>
	    </li>
	  </ul>
	</li>

	<!-- 스터디 -->
		<li class="menu-item">
		  <a href="javascript:void(0);" class="menu-link menu-toggle">
		    <i class="menu-icon tf-icons bx bx-buildings"></i>
		    <div data-i18n="시설">시설</div>
		  </a>
		  <ul class="menu-sub">
		    <li class="menu-item">
		      <a href="/room/list" class="menu-link">
		        <div data-i18n="시설 예약">시설 예약</div>
		      </a>
		    </li>
		    <li class="menu-item">
		      <a href="#" class="menu-link">
		        <div data-i18n="예약 내역">예약 내역</div>
		      </a>
		    </li>
		  </ul>
	</li>
	<!-- 공백 -->
	<br/>
	<br/>

	<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
	<div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
	</div>
	<div class="ps__rail-y" style="top: 0px; height: 981px; right: 4px;">
	<div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 625px;"></div>
	</div>
</ul>


</aside>

