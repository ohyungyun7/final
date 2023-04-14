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
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/animate-css/animate.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.css" />
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
<script src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>
<script src="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
// 	var ws = new WebSocket("ws://192.168.145.33/echo.do");
	var ws = new WebSocket("ws://192.168.145.10/echo.do");
	window.onload = function() {
		var keyword = "";
		var messages = document.getElementById("messages");
		var snd = document.getElementById("sender");
		var numb;
		var claNum;
		var colorUseList=[];
		var numnumnum=0;
		var semester = $("#semester").text();
		var endPage = "";

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

		$("#submitt").on("click",function(){
			let data = {"semester" : semester};
			$.ajax({
		  		url : "/student/insertCourseList",
		  		contentType : 'application/json;charset=utf-8',
		  		dataType : "json",
		  		type : "post",
		  		data : JSON.stringify(data),
		  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					Swal.fire({
						title: "수강신청 "+result.count+"개의 과목이 <br/>정상적으로 추가되었습니다.",
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'success',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
					window.location="/main";
				}
			});//ajax 끝
		})

		var moreButton="";
		$("#moreButton").on("click",function(){
			let currentPage = $("#moreButton").val();

			currentPage = parseInt($("#moreButton").val()) + 1;
			let data  = {"currentPage" : currentPage,
						 "colleage" : colleage,
						 "department" : department,
						 "keyword" : $("#keyword").val()
						};

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

					for(var i = 0; i<result.subjectList.content.length; i++){//coursList
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
		  				var courCheck = false;
		  				for(var j = 0; j<result.coursList.length; j++){
		  					if(result.subjectList.content[i].sbjNum == result.coursList[j].sbjNum){
		  						courCheck=true;
		  					}
		  				}

		  				/* 교 수 명 */str+= "<td id='sbjRs"+result.subjectList.content[i].sbjNum+"'>"+sbjRS+"</td>";
		  				if(courCheck == true){
		  					/* 과 목 명 */str+= "<td style='font-weight : bold;' id='claTitle"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjTitle+"(수강완료)</td>";
		  				}else{
		  					/* 과 목 명 */str+= "<td id='claTitle"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjTitle+"</td>";
		  				}
		  				//str+= "<td id='claTitle"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjTitle+"</td>";
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

		  			if(
		  				(colleage!=null) ||
		  					(department!=null)	||
		  						(keyword!="")		){
						  			if(parseInt(endPage) == parseInt($("#moreButton").val())){
						  				$("#moreButton").css("display","none");
						  			}
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
	  			moreButton = result.endPage+1;
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
		  				var courCheckzz = false;
		  				for(var e = 0; e<result.coursList.length; e++){
		  					if(result.coursList[e].sbjNum == result.allList[i].sbjNum){
		  						courCheckzz=true;/* 과 목 명 */
		  					}
		  				}

		  				if(courCheckzz == true){
		  					str2+= "<td style='font-weight : bold;' id='claTitle"+result.allList[i].sbjNum+"'>"+result.allList[i].sbjTitle+"(수강완료)</td>";
		  				}else{
		  					str2+= "<td id='claTitle"+result.allList[i].sbjNum+"'>"+result.allList[i].sbjTitle+"</td>";
		  				}
		  				/* 과 목 명 *///str2+= "<td id='claTitle"+result.allList[i].sbjNum+"'>"+result.allList[i].sbjTitle+"</td>";
		  				/* 과목학년 */str2+= "<td>"+result.allList[i].sbjGrade+"</td>";
		  				/* 과목학점 */str2+= "<td id='claRecode"+result.allList[i].sbjRecode+"'>"+result.allList[i].sbjRecode+"</td>";
		  				/* 강의실명 */str2+= "<td id='roomLect"+result.allList[i].sbjNum+"'>"+result.allList[i].roomLect+"</td>";
		  				/* 수강시간 출력 */
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
				//$("#tBody2").append(str2);
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

	  				var courCheck = false;
	  				/* 전공구분 */str+= "<td id='sbjRs"+result.subjectList.content[i].sbjNum+"'>"+sbjRS+"</td>";


	  				for(var l = 0; l<result.coursList.length; l++){
	  					if(result.coursList[l].sbjNum == result.subjectList.content[i].sbjNum){
	  						courCheck = true;
	  					}
	  				}

	  				if(courCheck == true){
	  					str+= "<td style='font-weight : bold;' id='claTitle"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjTitle+"(수강완료)</td>";
	  				}else{
	  					str+= "<td id='claTitle"+result.subjectList.content[i].sbjNum+"'>"+result.subjectList.content[i].sbjTitle+"</td>";
	  				}
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
// 	  			let count = confirm("신청한 리스트가 존재합니다 불러오시겠습니까?");

	  			let colorList = ["rgb(255, 250, 124)", "rgb(202, 214, 255)","rgb(248, 238, 237)",
								 "rgb(200, 255, 246)", "rgb(4, 246, 156)", "rgb(230, 255, 94)",
								 "rgb(255, 246, 255)", "rgb(255, 250, 124)","rgb(255, 114, 8)"];

				let colorUseList = [];

	  			let userId = document.getElementById("sender").value;
				let data = {"userId" : userId};

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
		})//colleage(단과대) 끝

		 $("#department").on("change",function(){
			department = $("#department option:selected").val();
		})// department(학과) 끝

	 	$("#searchAll").on("click",function(){
			keyword = $("#keyword").val();
			$("#moreButton").val("1");
			department= $("#department").val();
			if(colleage=="전체"){
				colleage=null;
				department=null;
			}

			if(department=="단과대를 선택해주세요"){
				department=null;
			}

			//$("#department option:eq(0)").prop("selected", true);

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
		  			endPage = Math.ceil(result.subjectList.total/3/30);
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
	 	});//searchAll 끝

		$(document).on("click",".add",function(){
			var finalRecode = $("#finalRecode").text();
			var grade1 = $("#grade1").text();

			if(parseInt(finalRecode)<=parseInt(grade1)){
				Swal.fire({
					title: "최대학점을 초과할수 없습니다.",
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

			//var splitttt = $(this).val().split(",");
		 	//let data7 = {"sbjNum" : splitttt[0]};
			//클릭한 값이 수강했던 과목일 경우
			//3.0이상인지 이하인지 확인
			/* $.ajax({
				url : "/student/subject/check3dat0",
				type : "post",
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify(data7),
				 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				dataType : "json",
				success : function(res) {
					//check3dat0
					//if(res.check3dat0.)
				}
			}); */

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

					if (parseInt($(this).parent().prev().find(".numb").text()) == parseInt(limitNumber)) {
						Swal.fire({
							title: "정원 초과입니다.",
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

					currentData = parseInt(currentData) + 1;

					let timeCode1 = $(this).parents(".nnn").find("#time" + claNum).find(".timeTcode0").text();
					let timeCode2 = $(this).parents(".nnn").find("#time" + claNum).find(".timeTcode1").text();
					let timeCode3 = $(this).parents(".nnn").find("#time" + claNum).find(".timeTcode2").text();

					if ($("#" + timeCode1).text() != "" ||
								$("#" + timeCode2).text() != "" ||
										$("#" + timeCode3).text() != "") {
						Swal.fire({
							title: "시간표가 겹쳐서 신청할수 없습니다.",
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

		$("#back").on("click",function(){
			window.location="/main";
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
	}
</script>

<body>
<br>
<h1>2023년 1학기 수강신청</h1>
<br>
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
							<td><span id="semester">${student.stuSemester}</span>학기</td>
							<c:if test="${recode ne 0.0}">
								<td><span id="finalRecode">${finalRecode}</span>(직전학기 : <span id="recode">${recode}</span>)</td>
							</c:if>
							<c:if test="${recode eq 0.0}">
								<td><span id="finalRecode">${finalRecode}</span>(직전학기 : <span id="recode">신입생</span>)</td>
							</c:if>
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
											<button type="button" id="searchAll" style="padding-top: 1.5px; height: calc(1.8125rem + 2px);" class="btn btn-light">검색</button>
										</label>
										<div style="float:right;">
											<button type="button" id="back" style="padding-top: 1.5px; height: calc(1.8125rem + 2px);" class="btn btn-light">뒤로가기</button>
										</div>
										&nbsp;
										<div style="float:right;">
											<button type="button" id="submitt" style="padding-top: 1.5px; height: calc(1.8125rem + 2px);" class="btn btn-light">완료</button>
										</div>
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
<%-- 						<input type="text" id="sender" value="${sessionScope.userVO.getUsername}"
							style="display: none;"> --%>
						<input type="text"  style="display: none;" id="sender" value="${sessionScope.userVO.username}">
					</div>

					<div id="buttonDiv">
						<button type="button" id="moreButton" value="1" class="btn btn-info">더보기</button>
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

				<section class="col-lg-4 connectedSortable ui-sortable">
					<br><br><br><br>
					<div class="container">
						<table class="table table-bordered table-sm"
							style="text-align: center; font-size: 16px;">
							<thead>
								<tr>
									<th style="width: 100px;"></th>
									<th style="width: 150px;">월</th>
									<th style="width: 150px;">화</th>
									<th style="width: 150px;">수</th>
									<th style="width: 150px;">목</th>
									<th style="width: 150px;">금</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>09:00<br>-<br>09:50</th>

									<td id="월1"></td>
									<td id="화1"></td>
									<td id="수1"></td>
									<td id="목1"></td>
									<td id="금1"></td>
								</tr>
								<tr>
									<th>10:00<br>-<br>10:50
									</th>
									<td id="월2"></td>
									<td id="화2"></td>
									<td id="수2"></td>
									<td id="목2"></td>
									<td id="금2"></td>
								</tr>
								<tr>
									<th>11:00<br>-<br>11:50
									</th>
									<td id="월3"></td>
									<td id="화3"></td>
									<td id="수3"></td>
									<td id="목3"></td>
									<td id="금3"></td>
								</tr>
								<tr>
									<th>12:00<br>-<br>12:50
									</th>
									<td id="월4"></td>
									<td id="화4"></td>
									<td id="수4"></td>
									<td id="목4"></td>
									<td id="금4"></td>
								</tr>
								<tr>
									<th>13:00<br>-<br>13:50
									</th>
									<td id="월5"></td>
									<td id="화5"></td>
									<td id="수5"></td>
									<td id="목5"></td>
									<td id="금5"></td>
								</tr>
								<tr>
									<th>14:00<br>-<br>14:50
									</th>
									<td id="월6"></td>
									<td id="화6"></td>
									<td id="수6"></td>
									<td id="목6"></td>
									<td id="금6"></td>
								</tr>
								<tr>
									<th>15:00<br>-<br>15:50
									</th>
									<td id="월7"></td>
									<td id="화7"></td>
									<td id="수7"></td>
									<td id="목7"></td>
									<td id="금7"></td>
								</tr>
								<tr>
									<th>16:00<br>-<br>16:50
									</th>
									<td id="월8"></td>
									<td id="화8"></td>
									<td id="수8"></td>
									<td id="목8"></td>
									<td id="금8"></td>
								</tr>
								<tr>
									<th>17:00<br>-<br>17:50
									</th>
									<td id="월9"></td>
									<td id="화9"></td>
									<td id="수9"></td>
									<td id="목9"></td>
									<td id="금9"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
			</div>
		</div>
	</section>
</body>
</html>