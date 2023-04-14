<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<P>  The time on the server is ${CT}. </P>

<h1>임시메인페이지</h1>

<%
	UserVO userVO = (UserVO)session.getAttribute("userVO");
%>

<%if(userVO.getAuth().equals("ROLE_STU")){%>
<div>
	<a href="/student/subjectList">수강신청하기</a>
	<span>url : /student/subjectList</span>
</div>
<div>
	<a href="/shopping/subjectList">장바구니가기</a>
	<span>url : /shopping/subjectList</span>
</div>
<div>
	<a href="/exam/onlineList">온라인 시험보러가기</a>
	<span>url : /exam/onlineList</span>
</div>
<div>
	<a href="/grade/gradeList">전체성적조회</a>
	<span>url : /grade/gradeList</span>
</div>
<%}else if(userVO.getAuth().equals("ROLE_TEA")){ %>
<a href="/exam/exam">시험만들기</a>
<span>url : /exam/exam</span>
<%} %>


<p><%= userVO.getAuth() %><p>
<p><%= userVO.getName() %><p>
