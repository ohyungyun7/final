<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<c:if test="${count==0}">
<script>
Swal.fire({
	title: "아이디 비밀번호 불일치",
	showClass: {
		popup: 'animate__animated animate__bounceIn'
	},
	icon: 'error',
	customClass: {
		confirmButton: 'btn btn-primary'
	},
	buttonsStyling: false
});
</script>
</c:if>

<head>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
	<style>
	    body {
	        background: #f8f8f8;
	        padding: 60px 0;
	    }
	    
	    #login-form > div {
	        margin: 15px 0;
	    }
	</style>
	<title>Home</title>
</head>

<h1>수강신청</h1>
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">환영합니다!</div>
            </div>
            <div class="panel-body">
                <form id="login-form" method="post" action="/subject/loginProcess.do">
                    <div>
                        <input type="text"  name="id" class="form-control" name="아이디 입력" placeholder="학번을 입력해주세요" autofocus>
                        <input type="password" name="pw" class="form-control" name="아이디 입력" placeholder="비밀번호를 입력해주세요" autofocus>
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary">로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</html>