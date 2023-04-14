<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<hr/>
	<div class="menu-inner-shadow"></div>
 	<ul class="menu-inner py-1 ps ps--active-y">
		<li class="menu-item" style="margin-left: 20px;">
		   	<span class="badge bg-label-info">교수</span>
		</li>
		<li class="menu-item">
			<a href="/student/mypagePWcheck" class="menu-link">
				<i class="menu-icon tf-icons bx bx-text"></i>
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
		      <i class="menu-icon tf-icons bx bx-group"></i>
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
		    <a href="javascript:void(0);" class="menu-link menu-toggle">
		      <i class="menu-icon tf-icons bx bx-collection"></i>
		      <div data-i18n="강의">강의</div>
		    </a>
		    <ul class="menu-sub">
		      <li class="menu-item">
		        <a href="/course/list_pro" class="menu-link">
		          <div data-i18n="강의 목록">강의 목록</div>
		        </a>
		      </li>
		      <li class="menu-item">
		        <a href="/enroll/application" class="menu-link">
		          <div data-i18n="강의 개설 신청">강의 개설 신청</div>
		        </a>
		      </li>
		      <li class="menu-item">
		        <a href="/grade/gradeObjcCheck" class="menu-link">
		          <div data-i18n="성적이의 신청 조회">성적이의 신청 조회</div>
		        </a>
		      </li>
		      <li class="menu-item">
		        <a href="/le/leCheck" class="menu-link">
		          <div data-i18n="강의평가 조회">강의평가 조회</div>
		        </a>
		      </li>
		      <li class="menu-item">
		        <a href="/exam/exam" class="menu-link">
		          <div data-i18n="시험 등록">시험 등록</div>
		        </a>
		      </li>
		    </ul>
		  </li>

		<!-- 상담 -->
		<li class="menu-item">
		  <a href="javascript:void(0)" class="menu-link menu-toggle">
		    <i class="menu-icon tf-icons bx bxs-heart-circle"></i>
		    <div data-i18n="상담">상담</div>
		  </a>
		  <ul class="menu-sub">
		    <li class="menu-item">
		      <a href="/consult/consultTeaMain" class="menu-link">
		        <div data-i18n="상담 신청 확인">상담 신청 확인</div>
		      </a>
		    </li>
		    <li class="menu-item">
		      <a href="/consult/consultHistory" class="menu-link">
		        <div data-i18n="상담 내역">상담 내역</div>
		      </a>
		    </li>
		  </ul>
		</li>

		<!-- 장학생  -->
		<li class="menu-item">
		  <a href="/scholarship/recommendation" class="menu-link">
		    <i class="menu-icon tf-icons bx bx-detail"></i>
		    <div data-i18n="장학생 추천">장학생 추천</div>
		  </a>
		</li>


		<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
			<div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
		</div>
		<div class="ps__rail-y" style="top: 0px; height: 981px; right: 4px;">
			<div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 625px;"></div>
		</div>
	</ul>


</aside>

