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
	    	<span class="badge bg-label-info">교직원</span>
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

		  <!-- 쪽지함 -->
		  <li class="menu-item">
		    <a href="/msg/messageList" class="menu-link">
		      <i class="menu-icon tf-icons bx bx-envelope"></i>
		      <div data-i18n="쪽지함">쪽지함</div>
		    </a>
		  </li>

		<!-- 강의 목록 라인 -->
		<li class="menu-header small text-uppercase"><span class="menu-header-text">관리</span></li>
		<!-- 강의 목록 -->
		<li class="menu-item">
		  <a href="javascript:void(0);" class="menu-link menu-toggle">
		    <i class="menu-icon tf-icons bx bx-collection"></i>
		    <div data-i18n="강의 관리">강의 관리</div>
		  </a>
		  <ul class="menu-sub">
		    <li class="menu-item">
		      <a href="/cm/classList" class="menu-link">
		        <div data-i18n="전체 조회">전체 조회</div>
		      </a>
		    </li>
		    <li class="menu-item">
		      <a href="/enroll/application" class="menu-link">
		        <div data-i18n="개설 신청 목록">개설 신청 목록</div>
		      </a>
		    </li>
		  </ul>
		</li>

		<!-- 학생 관리 -->
		<li class="menu-item">
			<a href="javascript:void(0);" class="menu-link menu-toggle">
			  <i class="menu-icon tf-icons bx bxs-group"></i>
			  <div data-i18n="학생 관리">학생 관리</div>
			</a>
			<ul class="menu-sub">
				<li class="menu-item">
				  <a href="/stuList/list" class="menu-link">
				    <div data-i18n="전체 조회">전체 조회</div>
				  </a>
				</li>
				<li class="menu-item">
				  <a href="/academic/acaListAdm" class="menu-link">
				    <div data-i18n="학적변동 신청 내역">학적변동 신청 내역</div>
				  </a>
				</li>
			</ul>
		</li>

		<!-- 교직원 관리 -->
		<li class="menu-item">
			<a href="javascript:void(0);" class="menu-link menu-toggle">
			  <i class="menu-icon tf-icons bx bx-group"></i>
			  <div data-i18n="교직원 관리">교직원 관리</div>
			</a>
			<ul class="menu-sub">
				<li class="menu-item">
				  <a href="/manage/proManage" class="menu-link">
				    <div data-i18n="교수 관리">교수 관리</div>
				  </a>
				</li>
				<li class="menu-item">
				  <a href="/manage/empManage" class="menu-link">
				    <div data-i18n="교직원 관리">교직원 관리</div>
				  </a>
				</li>
				<li class="menu-item">
				  <a href="/le/leCheck" class="menu-link">
				    <div data-i18n="강의평가 관리">강의평가 관리</div>
				  </a>
				</li>
			</ul>
		</li>

		<!-- 등록금 -->
		<li class="menu-item">
		  <a href="javascript:void(0)" class="menu-link menu-toggle">
		    <i class="menu-icon tf-icons bx bx-wallet-alt"></i>
		    <div data-i18n="등록금 관리">등록금 관리</div>
		  </a>
		  <ul class="menu-sub">
		    <li class="menu-item">
		      <a href="/tuition/tuition_admin" class="menu-link">
		        <div data-i18n="등록금 관리">등록금 관리</div>
		      </a>
		    </li>
		    <li class="menu-item">
		      <a href="/scholarship/recommendation_admin" class="menu-link">
		        <div data-i18n="장학금 관리">장학금 관리</div>
		      </a>
		    </li>
		  </ul>
		</li>

		<!-- 학과 -->
		<li class="menu-item">
		  <a href="javascript:void(0);" class="menu-link menu-toggle">
		    <i class="menu-icon tf-icons bx bx-grid-alt"></i>
		    <div data-i18n="학과 관리">학과 관리</div>
		  </a>
		  <ul class="menu-sub">
		    <li class="menu-item">
		      <a href="/manage/deptManage" class="menu-link">
		        <div data-i18n="전체 조회">전체 조회</div>
		      </a>
		    </li>
		  </ul>
		</li>

		<!-- 시설 -->
		<li class="menu-item">
		  <a href="javascript:void(0);" class="menu-link menu-toggle">
		    <i class="menu-icon tf-icons bx bx-buildings"></i>
		    <div data-i18n="시설 관리">시설 관리</div>
		  </a>
		  <ul class="menu-sub">
		    <li class="menu-item">
		      <a href="/room/list" class="menu-link">
		        <div data-i18n="전체 조회">전체 조회</div>
		      </a>
		    </li>
		    <li class="menu-item">
		      <a href="#" class="menu-link">
		        <div data-i18n="예약 내역 조회">예약 내역 조회</div>
		      </a>
		    </li>
		  </ul>
		</li>

		<!-- 스터디 -->
		<li class="menu-item">
		  <a href="javascript:void(0);" class="menu-link menu-toggle">
		    <i class="menu-icon tf-icons bx bxs-pencil"></i>
		    <div data-i18n="스터디 관리">스터디 관리</div>
		  </a>
		  <ul class="menu-sub">
		    <li class="menu-item">
		      <a href="/study/manageStudy" class="menu-link">
		        <div data-i18n="전체 조회">전체 조회</div>
		      </a>
		    </li>
		    <li class="menu-item">
		      <a href="/study/manageReportStudy" class="menu-link">
		        <div data-i18n="신고 목록">신고 목록</div>
		      </a>
		    </li>
		  </ul>
		</li>

		<!-- 총지표 라인 -->
		<li class="menu-header small text-uppercase">
		  <span class="menu-header-text">지표</span>
		</li>

		<!-- 총 지표 -->
		<li class="menu-item">
		  <a href="/graph/colleageGraph" class="menu-link">
		    <i class="menu-icon tf-icons bx bx-bar-chart-square"></i>
		    <div data-i18n="대학 총 지표">대학 총 지표</div>
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

