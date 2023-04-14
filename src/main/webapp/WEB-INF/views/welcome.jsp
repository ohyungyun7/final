<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	//1초에 한 번씩 pCt요소의 text를 현재시각으로 변경해보자
	setInterval(function(){
		//요청URI : /getCurrentTime
		//응답데이터타입: json
		//ajax(Asynchronous Javascript And XML)
		//processType:false, : let f = new formDate();
		//contentType: 보내는 데이터 타입
		//data: 보내는 데이터
		//dataType:"json" 응답 데이터 타입(Controll에서 String으로 리턴 시 생략)
		$.ajax({
            type : "get",           
            url : "/getCurrentTime",  
            success : function(res){
            	//.append() : 누적 , .html():새로고침
            	$("#pCt").text(res);
            }
        });
	},1000);
});
</script>
<div class="container">
	<h1>${greeting}</h1>
	<p>${strapline}</p>
	<p id="pCt">${CT}</p>
</div>
