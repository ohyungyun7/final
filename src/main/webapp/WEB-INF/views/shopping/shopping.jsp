<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<style>
#subject {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	width: 300px;
	height: 40px;
}

.table thead tr{
	background: #e2e2e2;
}

.table thead tr th{
	border : 1px solid white;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	var ws = new WebSocket("ws://localhost/echo2.do");
	window.onload = function() {
		var messages = document.getElementById("messages");
		var snd = document.getElementById("sender");
		var numb;
		var claNum;
		var colorUseList=[];
		var numnumnum=0;
		ws.onopen = function(event) {
			console.log("웹소켓 열림");
			if (event.data === undefined) {
				return;
			}
		};

		ws.onmessage = function(event) {
			writeResponse(event.data);//여기는 모든 사람이 다 보임
		};

		ws.onclose = function(event) {
			writeResponse("대화 종료");
		}
		
		var moreButton="";
		$("#moreButton").on("click",function(){
			let currentPage = $("#moreButton").val();
			
			currentPage = parseInt($("#moreButton").val()) + 1;
			
			let data  = {"currentPage" : currentPage};
			
			$.ajax({ 
		  		url : "/student/subjectAjax2",
		  		contentType : 'application/json;charset=utf-8',
		  		dataType : "json",
		  		type : "post",
		  		data : JSON.stringify(data),
		  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				}, 
				success : function(result){
					var str = "";
					
					for(var i = 0; i<result.subjectList.content.length; i++){
						var sbjRS = "";
		  				/* 지옥시작 */str+= "<tr class='nnn' style='text-align: center'>";
		  				/* 과목번호 */str+= "<td style='display: none;' id='num"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjNum+"</td>";	
		  						   str+="<td>"+parseInt(currentPage*10 - 10 + i + 1)+"</td>";
		  				/* 학 과 명 */str+= "<td>"+result.subjectList.content[i].deptNm+"</td>";
		  				/* 교 수 명 */str+= "<td id='teaNum"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].teaNmKor+"</td>";
		  				if(result.subjectList.content[i].sbjRs == 1){
		  					sbjRS = "필수";
		  				}else if(result.subjectList.content[i].sbjRs == 2){
		  					sbjRS = "선택";
		  				}
		  				
		  				/* 교 수 명 */str+= "<td id='sbjRs"+result.subjectList.content[i].sbjNum+"'>"+sbjRS+"</td>";
		  				/* 과 목 명 */str+= "<td id='claTitle"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjTitle+"</td>";
		  				/* 과목학년 */str+= "<td>"+result.subjectList.content[i].sbjGrade+"</td>";
		  				/* 과목학점 */str+= "<td id='claRecode"+result.subjectList.content[i].sbjRecode+"'>"+result.subjectList.content[i].sbjRecode+"</td>";
		  				/* 강의실명 */str+= "<td id='roomLect"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].roomLect+"</td>";
		  				/* 수강시간 뽑아오는거!!! */
		  				str+= "<td id='time"+result.subjectList.content[i].sbjNum+"'>";
		  				for(var j = 0; j<result.subjectList.content[i].timeTcodeList.length; j++){
		  					var realDay = "";
		  					var ddd = "";
		  					if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "MON"){
		  						ddd="월";
		  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "TUE"){
		  						ddd="화";
		  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "WEN"){
		  						ddd="수";
		  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "THU"){
		  						ddd="목";
		  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "FRI"){
		  						ddd="금";
		  					}
		  					
		  					realDay=ddd+result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(3,1);
		  					str+="<span class='timeTcode"+j+"'>"+realDay+"</span>";
		  				}
		  				str+="</td>";
		  				/* 수강시간 끝 */
		  				/* 해당정원 시작 */
		  				str+="<td class='pointer'>";
		  				str+="<span class='numb'>"+result.subjectList.content[i].currentData+"</span><span>/"+result.subjectList.content[i].sbjPersonnel+"</span>";
		  				str+="<td>";
		  				/* 해당정원 끝 */
		  				var flag = false;
		  				if(result.basketList.length>0){
		  					for(var k =0; k<result.basketList.length; k++){
		  						if(result.basketList[k].sbjNum == result.subjectList.content[i].sbjNum){
		  							flag = true;
		  						}
		  					}//for문 끝
		  				}//if문 끝
		  				if(flag == true){
							str+= "<button type='button' class='add btn btn-outline-success' value="
								  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
								  +snd.value+","+result.subjectList.content[i].sbjRecode+" style='display: none;'>신청</button>";
							str+= "<button type='button' class='minus btn btn-outline-danger' value="
								  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
								  +snd.value+","+result.subjectList.content[i].sbjRecode+">취소</button>";
		  				}else if(flag == false){
		  					str+= "<button type='button' class='add btn btn-outline-success' value="
								  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
								  +snd.value+","+result.subjectList.content[i].sbjRecode+">신청</button>";
							str+= "<button type='button' class='minus btn btn-outline-danger' value="
								  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
								  +snd.value+","+result.subjectList.content[i].sbjRecode+" style='display: none;'>취소</button>";
		  				}
		  			}
		  			/* 과목리스트 뽑아오는거 끝!! */
		  			/* 페이지네이션 가져오기 */
		  			
		  			$("#tBody").append(str);
		  			
		  			$("#moreButton").val(data.currentPage);
		  			
		  			if(parseInt(moreButton) == parseInt(data.currentPage)){
		  				$("#moreButton").css("display","none");
		  			}
				}//success 끝
			}) 
		})//moreButton 끝
		
		var colleage = null;
		var department = null;
		/* 비동기로 과목리스트 쫙 빼오는거 */
		$.ajax({
	  		url : "/student/subjectAjax",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "get",
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			}, 
	  		success : function(result){
	  			var str = "";
	  			var str2 = "";
	  			/* 마지막페이지값 */
	  			moreButton = result.subjectList.endPage;
	  			
	  			
	  			for(var i = 0; i<result.allList.length; i++){
	  				var sbjRS = "";
	  				var flag = false;
	  				if(result.basketList.length>0){
	  					for(var k =0; k<result.basketList.length; k++){
	  						if(result.basketList[k].sbjNum == result.allList[i].sbjNum){
	  							flag = true;
	  							numnumnum++;
	  						}
	  					}//for문 끝
	  				}//if문 끝	
	  				
	  				if(flag == true){
	  					
	  					/* 지옥시작 */str2+= "<tr class='nnn' style='text-align: center'>";
		  				/* 과목번호 */str2+= "<td style='display: none;' id='num"+result.allList[i].sbjNum+"'>"+result.allList[i].sbjNum+"</td>";
		  				str2+= "<td>"+numnumnum+"</td>";
		  				/* 학 과 명 */str2+= "<td>"+result.allList[i].deptNm+"</td>";
		  				/* 교 수 명 */str2+= "<td id='teaNum"+result.allList[i].sbjNum+"'>"+result.allList[i].teaNmKor+"</td>";
		  				if(result.allList[i].sbjRs == 1){
		  					sbjRS = "필수";
		  				}else if(result.allList[i].sbjRs == 2){
		  					sbjRS = "선택";
		  				}
		  				/* 전공구분 */str2+= "<td id='sbjRs"+result.allList[i].sbjNum+"'>"+sbjRS+"</td>";
		  				/* 과 목 명 */str2+= "<td id='claTitle"+result.allList[i].sbjNum+"'>"+result.allList[i].sbjTitle+"</td>";
		  				/* 과목학년 */str2+= "<td>"+result.allList[i].sbjGrade+"</td>";
		  				/* 과목학점 */str2+= "<td id='claRecode"+result.allList[i].sbjRecode+"'>"+result.allList[i].sbjRecode+"</td>";
		  				/* 강의실명 */str2+= "<td id='roomLect"+result.allList[i].sbjNum+"'>"+result.allList[i].roomLect+"</td>";
		  				/* 수강시간 뽑아오는거!!! */
		  				str2+= "<td id='time"+result.allList[i].sbjNum+"'>";
		  				for(var j = 0; j<result.allList[i].timeTcodeList.length; j++){
		  					var realDay = "";
		  					var ddd = "";
		  					if(result.allList[i].timeTcodeList[j].timeTcode.substr(0,3) == "MON"){
		  						ddd="월";
		  					}else if(result.allList[i].timeTcodeList[j].timeTcode.substr(0,3) == "TUE"){
		  						ddd="화";
		  					}else if(result.allList[i].timeTcodeList[j].timeTcode.substr(0,3) == "WEN"){
		  						ddd="수";
		  					}else if(result.allList[i].timeTcodeList[j].timeTcode.substr(0,3) == "THU"){
		  						ddd="목";
		  					}else if(result.allList[i].timeTcodeList[j].timeTcode.substr(0,3) == "FRI"){
		  						ddd="금";
		  					}
		  					realDay=ddd+result.allList[i].timeTcodeList[j].timeTcode.substr(3,1);
		  					str2+="<span class='timeTcode"+j+"'>"+realDay+"</span>";
		  				}
		  				str2+="</td>";
		  				/* 수강시간 끝 */
		  				/* 해당정원 시작 */
		  				str2+="<td class='pointer'>";
		  				str2+="<span class='numb'>"+result.allList[i].currentData+"</span><span>/"+result.allList[i].sbjPersonnel+"</span>";
		  				str2+="<td>";
		  				/* 해당정원 끝 */
		  				
		  				str2+= "<button type='button' class='minus btn btn-outline-danger' value="
							  +result.allList[i].sbjNum+","+result.allList[i].currentData+","+result.allList[i].sbjPersonnel+","
							  +snd.value+","+result.allList[i].sbjRecode+" style='display: none;'>신청</button>";
		  				str2+= "<button type='button' class='minus btn btn-outline-danger' value="
							  +result.allList[i].sbjNum+","+result.allList[i].currentData+","+result.allList[i].sbjPersonnel+","
							  +snd.value+","+result.allList[i].sbjRecode+">취소</button>";
		  				
						str2+="</tr>";	  
	  				}
	  				
	  			}
	  			$("#tBody2").html(str2);
	  			
	  			for(var i = 0; i<result.subjectList.content.length; i++){
	  				var sbjRS = "";
	  				var flag = false;
	  				if(result.basketList.length>0){
	  					for(var k =0; k<result.basketList.length; k++){
	  						if(result.basketList[k].sbjNum == result.subjectList.content[i].sbjNum){
	  							flag = true;
	  						}
	  					}//for문 끝
	  				}//if문 끝	
	  			
	  				/* 지옥시작 */str+= "<tr class='nnn' style='text-align: center'>";
	  				/* 과목번호 */str+= "<td style='display: none;' id='num"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjNum+"</td>";
	  				           str+="<td>"+parseInt(i+1)+"</td>";
	  				/* 학 과 명 */str+= "<td>"+result.subjectList.content[i].deptNm+"</td>";
	  				/* 교 수 명 */str+= "<td id='teaNum"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].teaNmKor+"</td>";
	  				if(result.subjectList.content[i].sbjRs == 1){
	  					sbjRS = "필수";
	  				}else if(result.subjectList.content[i].sbjRs == 2){
	  					sbjRS = "선택";
	  				}
	  				/* 전공구분 */str+= "<td id='sbjRs"+result.subjectList.content[i].sbjNum+"'>"+sbjRS+"</td>";
	  				/* 과 목 명 */str+= "<td id='claTitle"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjTitle+"</td>";
	  				/* 과목학년 */str+= "<td>"+result.subjectList.content[i].sbjGrade+"</td>";
	  				/* 과목학점 */str+= "<td id='claRecode"+result.subjectList.content[i].sbjRecode+"'>"+result.subjectList.content[i].sbjRecode+"</td>";
	  				/* 강의실명 */str+= "<td id='roomLect"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].roomLect+"</td>";
	  				/* 수강시간 뽑아오는거!!! */
	  				str+= "<td id='time"+result.subjectList.content[i].sbjNum+"'>";
	  				for(var j = 0; j<result.subjectList.content[i].timeTcodeList.length; j++){
	  					var realDay = "";
	  					var ddd = "";
	  					if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "MON"){
	  						ddd="월";
	  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "TUE"){
	  						ddd="화";
	  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "WEN"){
	  						ddd="수";
	  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "THU"){
	  						ddd="목";
	  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "FRI"){
	  						ddd="금";
	  					}
	  					realDay=ddd+result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(3,1);
	  					str+="<span class='timeTcode"+j+"'>"+realDay+"</span>";
	  				}
	  				str+="</td>";
	  				/* 수강시간 끝 */
	  				/* 해당정원 시작 */
	  				str+="<td class='pointer'>";
	  				str+="<span class='numb'>"+result.subjectList.content[i].currentData+"</span><span>/"+result.subjectList.content[i].sbjPersonnel+"</span>";
	  				str+="<td>";
	  				/* 해당정원 끝 */
	  			
	  				if(flag == true){
						str+= "<button type='button' class='add btn btn-outline-success' value="
							  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
							  +snd.value+","+result.subjectList.content[i].sbjRecode+" style='display: none;'>신청</button>";
						str+= "<button type='button' class='minus btn btn-outline-danger' value="
							  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
							  +snd.value+","+result.subjectList.content[i].sbjRecode+">취소</button>";
	  				}else if(flag == false){
	  					str+= "<button type='button' class='add btn btn-outline-success' value="
							  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
							  +snd.value+","+result.subjectList.content[i].sbjRecode+">신청</button>";
						str+= "<button type='button' class='minus btn btn-outline-danger' value="
							  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
							  +snd.value+","+result.subjectList.content[i].sbjRecode+" style='display: none;'>취소</button>";
	  				}
	  				
	  				
	  				//수강취소 버튼이 있을때만 따로 넣음
	  				str+="</tr>";
	  			}//for문 끝
	  			/* 과목리스트 뽑아오는거 끝!! */
	  			/* 페이지네이션 가져오기 */
	  			
	  			$("#tBody").html(str);
	  			
	  			if(result.basketList.length>0){
	  			/* let count = confirm("신청한 리스트가 존재합니다 불러오시겠습니까?"); */
	  			let colorList = ["rgb(255, 250, 124)", "rgb(202, 214, 255)","rgb(248, 238, 237)",
								 "rgb(200, 255, 246)", "rgb(4, 246, 156)", "rgb(230, 255, 94)",
								 "rgb(255, 246, 255)", "rgb(255, 250, 124)","rgb(255, 114, 8)"];
			
				let colorUseList = [];
	  			
	  			let userId = document.getElementById("sender").value;
	  			
					let data = {
						"userId" : userId
				};
					
					$.ajax({
						url : "/student/subject/mySubjectList",
						type : "post",
						contentType : 'application/json; charset=utf-8',
						data : JSON.stringify(data),
						dataType : "json",
						 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						}, 
						success : function(res) {
							var dayCode = "";
							$.each(res, function(index, item) {
								var randomNum = Math.floor(Math.random() * colorList.length + 1);
//								let result = item.roomLect+"<br>"+item.sbjTitle + "<br>" + item.teaNmKor+"<br>";
								let result = item.sbjTitle;
								
								var realDay="";
								if(item.timeTcode.substr(0,3) == "MON"){
									realDay="월";
								}else if(item.timeTcode.substr(0,3) == "TUE"){
									realDay="화";
								}else if(item.timeTcode.substr(0,3) == "WEN"){
									realDay="수";
								}else if(item.timeTcode.substr(0,3) == "THU"){
									realDay="목";
								}else if(item.timeTcode.substr(0,3) == "FRI"){
									realDay="금";
								}
								realDay=realDay+item.timeTcode.substr(3,1);
								
								if(index ==0 || index %3 !=0){
									dayCode+=realDay+",";
								}
								if(index !=0 && index % 3==0){
									dayCode+=","+realDay+",";
								}
								$("#" + realDay).html(result);
							});
							 dayCode = dayCode.substr(0, dayCode.length - 1);
			   				 var daysp1 = dayCode.split(",,");
							
							 for(var i =0; i<daysp1.length; i++){
								var daysp2 = daysp1[i].split(",");
								for(var j=0; j<daysp2.length; j++){
									$("#"+daysp2[j]).css("background", colorList[i]);
								} 
							} 
						}//success 끝
					})//ajax끝	
	  			/* 장바구니 리스트 뽑아오는거 끝!! */
	  			
	  			}
	  		}//success 끝
		 });//ajax 끝
		 
		 function showTime(){
			 $.ajax({
			  		url : "/shopping/shoppingRank",
			  		contentType : 'application/json;charset=utf-8',
			  		dataType : "json",
			  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					}, 
			  		type : "post",//interval
			  		success : function(result){
			  			//shoppingRank
			  			
			  			var str = "";
			  			
			  			if(result.shoppingRank.length==0 || result.shoppingRank ==null){
			  				str +="<span>현재 장바구니 집계가 없습니다.</span>";
			  			}else{
			  				for(var i = 0; i<result.shoppingRank.length; i++){
			  					str+="<span>"+parseInt(i+1)+"등 : "+result.shoppingRank[i].sbjTitle+"</span><br>";	
			  				}
			  			}
			  			$("#interval").html(str);
			  		}
			 });
		 }
		 
		 setInterval(showTime,1000);
		
		 $("#colleage").on("change",function(){
			colleage = $("#colleage option:selected").val();
			let data = {"colleage" : colleage};
			
			if(colleage=="전체"){
				$("#department option[id='id']").remove();
				var strr = "<option class='id'>단과대를 선택해주세요</option>";
				$("#department").html(strr);
			}else{
				$.ajax({
			  		url : "/student/subject/listDepartment",
			  		contentType : 'application/json;charset=utf-8',
			  		data : JSON.stringify(data),
			  		dataType : "json",
			  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					}, 
			  		type : "post",
			  		success : function(result){
			  			var str ="";
			  			$.each(result.departmentVOList, function(index, item) {
			  				$("#department option[value='id']").remove();
			  				
							str +="<option value='"+item.deptNm+"'>"+item.deptNm+"</option>";
			  				$("#department").html(str);
			  			})//each 끝
			  		}
				 });
			}
		}) 
		
		 $("#department").on("change",function(){
			department = $("#department option:selected").val();
		}) 
		
	 	$("#searchAll").on("click",function(){
			var keyword = $("#keyword").val();
			
			department= $("#department").val();
			if(colleage=="전체"){
				colleage=null;
				department=null;
			}
			
			if(department=="단과대를 선택해주세요"){
				department=null;
			}
			
			$("#department option:eq(0)").prop("selected", true);
			
	     	let data = {"colleage" : colleage, "department" : department, "keyword" : keyword};
			
			$.ajax({
		  		type : "post",
		  		url : "/student/subjectAjax2",
		  		contentType : 'application/json;charset=utf-8',
		  		data : JSON.stringify(data),
		  		dataType : "json",
		  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				}, 
		  		success : function(result){
		  		
		  			if($("#keyword").val() !=null || $("#keyword").val(colleage) !=""){
		  				$("#keyword").val(keyword);	
		  			}
		  			$("#tBody").empty();
		  			
		  			var str = "";
		  			for(var i = 0; i<result.subjectList.content.length; i++){
		  				var sbjRs = "";
		  				/* 지옥시작 */str+= "<tr class='nnn' style='text-align: center'>";
		  				/* 과목번호 */str+= "<td style='display: none;' id='num"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjNum+"</td>";
		  						   str+= "<td>"+parseInt(i+1)+"</td>";
		  				/* 학 과 명 */str+= "<td>"+result.subjectList.content[i].deptNm+"</td>";
		  				/* 교 수 명 */str+= "<td id='teaNum"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].teaNmKor+"</td>";
		  				if(result.subjectList.content[i].sbjRs == "1"){
		  					sbjRs = "필수";
		  				}else if(result.subjectList.content[i].sbjRs == "2"){
		  					sbjRs = "선택";
		  				}
		  				/* 전공구분 */str+= "<td id='sbjRs"+result.subjectList.content[i].sbjNum+"'>"+sbjRs+"</td>";
		  				/* 과 목 명 */str+= "<td id='claTitle"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjTitle+"</td>";
		  				/* 과목학년 */str+= "<td>"+result.subjectList.content[i].sbjGrade+"</td>";
		  				/* 과목학점 */str+= "<td id='claRecode"+result.subjectList.content[i].sbjRecode+"'>"+result.subjectList.content[i].sbjRecode+"</td>";
		  				/* 강의실명 */str+= "<td id='roomLect"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].roomLect+"</td>";
		  				/* 수강시간 뽑아오는거!!! */
		  				str+= "<td id='time"+result.subjectList.content[i].sbjNum+"'>";
		  				for(var j = 0; j<result.subjectList.content[i].timeTcodeList.length; j++){
		  					var realDay = "";
		  					var ddd = "";
		  					
		  					if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "MON"){
		  						ddd="월";
		  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "TUE"){
		  						ddd="화";
		  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "WEN"){
		  						ddd="수";
		  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "THU"){
		  						ddd="목";
		  					}else if(result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(0,3) == "FRI"){
		  						ddd="금";
		  					}
		  					
		  					realDay=ddd+result.subjectList.content[i].timeTcodeList[j].timeTcode.substr(3,1);
		  					str+="<span class='timeTcode"+j+"'>"+realDay+"</span>";
		  				}
		  				str+="</td>";
		  				/* 수강시간 끝 */
		  				/* 해당정원 시작 */
		  				str+="<td class='pointer'>";
		  				str+="<span class='numb'>"+result.subjectList.content[i].currentData+"</span><span>/"+result.subjectList.content[i].sbjPersonnel+"</span>";
		  				str+="<td>";
		  				/* 해당정원 끝 */
		  				var flag = false;
		  				if(result.basketList.length>0){
		  					for(var k =0; k<result.basketList.length; k++){
		  						if(result.basketList[k].sbjNum == result.subjectList.content[i].sbjNum){
		  							flag = true;
		  						}
		  					}//for문 끝
		  				}//if문 끝
		  				if(flag == true){
							str+= "<button type='button' class='add btn btn-outline-success' value="
								  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
								  +snd.value+","+result.subjectList.content[i].sbjRecode+" style='display: none;'>신청</button>";
							str+= "<button type='button' class='minus btn btn-outline-danger' value="
								  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
								  +snd.value+","+result.subjectList.content[i].sbjRecode+">취소</button>";
		  				}else if(flag == false){
		  					str+= "<button type='button' class='add btn btn-outline-success' value="
								  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
								  +snd.value+","+result.subjectList.content[i].sbjRecode+">신청</button>";
							str+= "<button type='button' class='minus btn btn-outline-danger' value="
								  +result.subjectList.content[i].sbjNum+","+result.subjectList.content[i].currentData+","+result.subjectList.content[i].sbjPersonnel+","
								  +snd.value+","+result.subjectList.content[i].sbjRecode+" style='display: none;'>취소</button>";
		  				}
		  			}
		  			$("#tBody").html(str);
		  			
		  			let currentPage = $("#moreButton").val();
		  			
		  			if(result.subjectList.content.length<10){
		  				$("#moreButton").css("display","none");
		  				$("#moreButton").val("1");
		  				$("#overflow").removeAttr("class");
		  			}else{
		  				$("#moreButton").css("display","block");
		  				$("#overflow").attr("class","overflow-auto");
		  			}
		  		}//success 끝
			 }) 
	 	}); 
		
		$(document).on("click",".add",function(){
			var finalRecode = $("#finalRecode").text();
			var grade1 = $("#grade1").text();
			
			if(parseInt(finalRecode)<=parseInt(grade1)){
				Swal.fire({
					title: '최대학점을 초과할수 없습니다.',
					showClass: {
						popup: 'animate__animated animate__bounceIn'
					},
					icon: 'warning',
					customClass: {
						confirmButton: 'btn btn-primary'
					},
					buttonsStyling: false
				});
				return false;
			}
			
			//총 정원 증가 시키는거
			let colorList = ["rgb(255, 250, 124)","rgb(202, 214, 255)","rgb(248, 238, 237)",
							 "rgb(200, 255, 246)","rgb(4, 246, 156)","rgb(230, 255, 94)",
							 "rgb(255, 246, 255)","rgb(255, 250, 124)","rgb(255, 114, 8)"];
					
					var myListCount = 0;
					var asd = $(this).val();
					var arr = asd.split(",");
					numb = $(this).parents(".nnn").find(".numb").text();
					var grade1 = document.getElementById("grade1");//신청해서더해지는학점
					var grade2 = document.getElementById("grade2");//내 학점에서 차감되는학점

					claNum = arr[0];//과목번호
					var currentData = arr[1];//현재수강생인원
					var limitNumber = arr[2];//수용인원
					var userId = arr[3];//세션아이디
					var claGrade = arr[4];//신청학점

					currentData = parseInt(currentData) + 1;

					let timeCode1 = $(this).parents(".nnn").find("#time" + claNum).find(".timeTcode0").text();
					let timeCode2 = $(this).parents(".nnn").find("#time" + claNum).find(".timeTcode1").text();
					let timeCode3 = $(this).parents(".nnn").find("#time" + claNum).find(".timeTcode2").text();

					if ($("#" + timeCode1).text() != "" || $("#" + timeCode2).text() != "" || $("#" + timeCode3).text() != "") {
						Swal.fire({
							title: '시간표가 겹쳐서 신청할수 없습니다.',
							showClass: {
								popup: 'animate__animated animate__bounceIn'
							},
							icon: 'warning',
							customClass: {
								confirmButton: 'btn btn-primary'
							},
							buttonsStyling: false
						});
						return false;
					}//시간표 겹치는거 확인
						
					if (parseInt(currentData) > parseInt(limitNumber)) {
						Swal.fire({
							title: '정원을 초과 하였습니다.',
							showClass: {
								popup: 'animate__animated animate__bounceIn'
							},
							icon: 'warning',
							customClass: {
								confirmButton: 'btn btn-primary'
							},
							buttonsStyling: false
						});
						return false;
					}//정원 초과 됬는지 안됬는지 확인
					
					let teaNum = $(this).parents(".nnn").find("#teaNum" + claNum).text(); //해당 행의 교수명
					let claTitle = $(this).parents(".nnn").find("#claTitle" + claNum).text();//해당 행의 제목
					let roomLect = $(this).parents(".nnn").find("#roomLect" + claNum).text();//해당 행의 강의실

					let calAppend = claTitle;
					
					$("#" + timeCode1).html(calAppend);
					$("#" + timeCode2).html(calAppend);
					$("#" + timeCode3).html(calAppend);
					
					let data = {
						"claNum" : claNum,
						"userId" : userId
					};
					
					//총 정원 증가 시키는거
					$.ajax({
						url : "/student/subject/incrementCurrent",
						type : "post",
						contentType : 'application/json; charset=utf-8',
						data : JSON.stringify(data),
						 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						}, 
						dataType : "json",
						success : function(res) {
							numnumnum++;
							var str2 = "";
							var sbjRS = "";
							str2+= "<tr class='nnn' style='text-align: center'>";
							str2+= "<td style='display: none;' id='num"+res.subjectVO.sbjNum+"'>"+res.subjectVO.sbjNum+"</td>";
							str2+= "<td>"+numnumnum+"</td>";
							str2+= "<td>"+res.subjectVO.deptNm+"</td>";
							str2+= "<td id='teaNum"+res.subjectVO.sbjNum+"'>"+res.subjectVO.teaNmKor+"</td>";
							
							if(res.subjectVO.sbjRs == 1){
								sbjRS="필수";
							}else if(res.subjectVO.sbjRs == 2){
								sbjRS="선택";
							}
							str2+= "<td id='sbjRS"+res.subjectVO.sbjNum+"'>"+sbjRS+"</td>";
							str2+= "<td id='claTitle"+res.subjectVO.sbjNum+"'>"+res.subjectVO.sbjTitle+"</td>";
							str2+= "<td>"+res.subjectVO.sbjGrade+"</td>";
							str2+= "<td id='claRecode"+res.subjectVO.sbjRecode+"'>"+res.subjectVO.sbjRecode+"</td>";
							str2+= "<td id='roomLect"+res.subjectVO.sbjNum+"'>"+res.subjectVO.roomLect+"</td>";
							str2+= "<td id='time"+res.subjectVO.sbjNum+"'>";
							for(var j = 0; j<res.subjectVO.timeTcodeList.length; j++){
								var realDay = "";
			  					var ddd = "";
			  					if(res.subjectVO.timeTcodeList[j].timeTcode.substr(0,3) == "MON"){
			  						ddd="월";
			  					}else if(res.subjectVO.timeTcodeList[j].timeTcode.substr(0,3) == "TUE"){
			  						ddd="화";
			  					}else if(res.subjectVO.timeTcodeList[j].timeTcode.substr(0,3) == "WEN"){
			  						ddd="수";
			  					}else if(res.subjectVO.timeTcodeList[j].timeTcode.substr(0,3) == "THU"){
			  						ddd="목";
			  					}else if(res.subjectVO.timeTcodeList[j].timeTcode.substr(0,3) == "FRI"){
			  						ddd="금";
			  					}
			  					realDay=ddd+res.subjectVO.timeTcodeList[j].timeTcode.substr(3,1);
			  					str2+="<span class='timeTcode"+j+"'>"+realDay+"</span>";
			  				}
							str2+="</td>";
							str2+="<td class='pointer'>";
							str2+="<span class='numb'>"+res.subjectVO.currentData+"</span><span>/"+res.subjectVO.sbjPersonnel+"</span>";
							str2+="<td>";
							str2+= "<button type='button' class='minus btn btn-outline-danger' value="
								  +res.subjectVO.sbjNum+","+res.subjectVO.currentData+","+res.subjectVO.sbjPersonnel+","
								  +snd.value+","+res.subjectVO.sbjRecode+" style='display: none;'>신청</button>";
			  				str2+= "<button type='button' class='minus btn btn-outline-danger' value="
								  +res.subjectVO.sbjNum+","+res.subjectVO.currentData+","+res.subjectVO.sbjPersonnel+","
								  +snd.value+","+res.subjectVO.sbjRecode+">취소</button>";
							str2+="</tr>";	  
							
							$("#tBody2").append(str2);
							$("#grade1").text(res.recodeCount);
						}
					})//ajax끝
					
				 	let data2 = {
							"userId" : userId
					}; 
						
					//과목 색깔때문에 하는거
					$.ajax({
						url : "/student/subject/myListCount",
						type : "post",
						contentType : 'application/json; charset=utf-8',
						data : JSON.stringify(data2),
						dataType : "json",
						 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						}, 
						success : function(res) {
							myListCount=res.count;
							$("#" + timeCode1).css("background-color", colorList[myListCount]);
							$("#" + timeCode2).css("background-color", colorList[myListCount]);
							$("#" + timeCode3).css("background-color", colorList[myListCount]);
						}
					})//ajax끝

					$(this).css("display", "none");
					$(this).next().css("display", "inline");

					numb = parseInt(numb) + 1;
					var text = numb + "," + claNum + "," + document.getElementById("sender").value;
					
					
					ws.send(text);
					
				})

		$(document).on("click",".minus",function(){		
					let colorList = ["rgb(255, 250, 124)","rgb(202, 214, 255)","rgb(248, 238, 237)",
									 "rgb(200, 255, 246)","rgb(4, 246, 156)","rgb(230, 255, 94)",
									 "rgb(255, 246, 255)","rgb(255, 250, 124)","rgb(255, 114, 8)"];
			
					var asd = $(this).val();
					var arr = asd.split(",");
					--numnumnum;
					numb = $(this).parents(".nnn").find(".numb").text();

					claNum = arr[0];//과목번호
					var currentData = arr[1];//현재수강생인원
					var limitNumber = arr[2];//수용인원
					var userId = arr[3];//로그인된 아이디

					currentData = parseInt(currentData) - 1;

					let timeCode1 = $(this).parents(".nnn").find("#time" + claNum).find(".timeTcode0").text();
					let timeCode2 = $(this).parents(".nnn").find("#time" + claNum).find(".timeTcode1").text();
					let timeCode3 = $(this).parents(".nnn").find("#time" + claNum).find(".timeTcode2").text();

					$("#" + timeCode1).text("");
					$("#" + timeCode2).text("");
					$("#" + timeCode3).text("");
					
					if(colorUseList.indexOf($("#" + timeCode3).css("background-color"))!=-1){
						//현재 해당하는 배열의 위치에서 삭제함!!
						colorUseList.splice(colorUseList.indexOf($("#" + timeCode3).css("background-color")),1);
					}//색상이 배열안에 들어있으면 삭제해야함
					
					$("#" + timeCode1).css("background","none");
					$("#" + timeCode2).css("background","none");
					$("#" + timeCode3).css("background","none");
					
					let data = {
						"claNum" : claNum,
						"userId" : userId
					};

					//현재 신청인원 1 차감
					$.ajax({
						url : "/student/subject/minusCurrent",
						type : "post",
						contentType : 'application/json; charset=utf-8',
						data : JSON.stringify(data),
						dataType : "json",
						 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						}, 
						success : function(res) {
							$("#grade1").text(res.recodeCount);
						}
					})//ajax끝

					$(this).css("display", "none");
					$(this).prev().css("display", "inline");
					
					$("#tBody").find(".nnn").find("#num"+claNum).siblings(".pointer").next().find(".add").css("display","inline");
					$("#tBody").find(".nnn").find("#num"+claNum).siblings(".pointer").next().find(".minus").css("display","none");
					$("#tBody2").find(".nnn").find("#num"+claNum).siblings(".pointer").next().find(".minus").parents(".nnn").remove();
					numb = parseInt(numb) - 1;
					var text = numb + "," + claNum + ","+ document.getElementById("sender").value;

					ws.send(text);
				})

		function closeSocket() {
			ws.close();
		}

		function writeResponse(text) {
			var arr = text.split(",");

			$("#num" + arr[1]).siblings(".pointer").find(".numb").text(arr[0]);
		}
		function clearText() {
			messages.parentNode.removeChild(messages)
		}

		let btn_add = document.querySelector("#add");
		let btn_minus = document.querySelector("#minus");
		////////////////////////////////////////////////////////////
	}
</script>

<body>

<h1>장바구니</h1>

<section class="content">
		<div class="container-fluid">
			<div class="row">
				<table class="table table-hover">
					<thead>
						<tr style="background: #e2e2e2; text-align: center;">
							<th style="width:30px;">학번</th>
							<th style="width:50px;">성명</th>
							<th style="width:100px;">대학</th>
							<th style="width:100px;">학과</th>
							<th style="width:50px;">학년</th>
							<th style="width:100px;">신청학기</th>
							<th style="width:50px;">최대학점</th>
							<th style="width:50px;">신청학점</th>
						</tr>
					</thead>
					<tbody>
						<tr style="background : white; text-align: center;">
							<td>${student.stuNum}</td>
							<td>${student.stuNmKor}</td>
							<td>${student.collNm}</td>
							<td>${student.deptNm}</td>
							<td>${student.stuGrade}학년</td>
							<td>${student.stuSemester}학기</td>
							<td><span id="finalRecode">${finalRecode}</span>(직전학기 : <span id="recode">${recode}</span>)</td>
							<td><span id="grade1">${currentRecode}</span>학점</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row">
				<section class="col-lg-8 connectedSortable ui-sortable">
					<br><br>
							<div class="row">
								<div class="col-sm-12 col-md-12">
									<div class="dataTables_length" id="dataTable_length" >
										<label>
											<select aria-controls="dataTable" name="colleage" id="colleage"
												class="custom-select custom-select-sm form-control form-control-sm">
													<option	value="전체">전체</option>
													<option	value="자연과학대학">자연과학대학</option>
													<option	value="공과대학">공과대학</option>
													<option	value="예술대학">예술대학</option>
													<option	value="사범대학">사범대학</option>
											</select>
										</label>
										&nbsp;&nbsp;
										<label>
											<select aria-controls="dataTable" name="department" id="department"
												class="custom-select custom-select-sm form-control form-control-sm">
													<option id="id">단과대를 선택해주세요</option>
											</select>
										</label>
										&nbsp;&nbsp;
										<label>
										<input type="search" name="keyword" id="keyword"
											class="form-control form-control-sm" 
											placeholder="검색어를 입력해주세요"
											aria-controls="dataTable">
										</label>
										<label>
										<button type="button" id="searchAll" style="padding-top: 1.5px; height: calc(1.8125rem + 2px);" class="btn btn-block btn-default">검색</button>
										</label>
									</div>
								</div>
								<div class="col-sm-12 col-md-6">
									<div id="dataTable_filter" class="dataTables_filter">
									
									</div>
								</div>
							</div>
					<div id="overflow" class="overflow-auto"  style="height : 700px;">
						<br>
						<table class="table table-hover">
							<thead>
								<tr style="text-align: center;">
									<th>번호</th>
									<th>개설학과</th>
									<th>교수명</th>
									<th>전공구분</th>
									<th>제목</th>
									<th>학년</th>
									<th>학점</th>
									<th>강의실</th>
									<th>강의요일</th>
									<th>해당정원</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="tBody">
								
							</tbody>
						</table>
						<input type="text"  style="display: none;" id="sender" value="${sessionScope.userVO.username}">
					</div>
					
					<div id="buttonDiv">
						<button type="button" id="moreButton" value="1" class="btn btn-block btn-default btn-lg">더보기</button>
					</div>
					<h1>신청한 목록</h1>
					<table class="table table-hover">
							<thead>
								<tr style="text-align: center;">
									<th>번호</th>
									<th>개설학과</th>
									<th>교수명</th>
									<th>전공구분</th>
									<th>제목</th>
									<th>학년</th>
									<th>학점</th>
									<th>강의실</th>
									<th>강의요일</th>
									<th>해당정원</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="tBody2">
								
							</tbody>
						</table>
				</section>
				
				<!-- 오른쪽화면 -->
				<section class="col-lg-4 connectedSortable ui-sortable">
					<br><br><br><br>
					<div class="container">
					<h1>실시간 수강신청 현황</h1>
						<div id="interval">
						
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
</body>
</html>