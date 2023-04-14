<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
$(function(){
	$("#layout-menu").remove();
	$("nav").remove();

   /*  $('body').click(function(e) {
    	if(!$(e.target).parents().hasClass("content")){
    		alert("해당영역을 선택할 수 없습니다.");
    		return false;
    	}
    });    */

	let today = new Date();

	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	let hours = today.getHours(); // 시
	let minutes = today.getMinutes();  // 분
	let seconds = today.getSeconds();  // 초
	let milliseconds = today.getMilliseconds(); // 밀리초
	 //⓿ ❶ ❷ ❸ ❹ ① ② ③ ④
	let omrNumber = ["①","②","③","④"];

	function remaindTime() {
	    var now = new Date(); //현재시간을 구한다.
	    var open = new Date(year,month,date,hours,minutes,seconds);

	    var nt = now.getTime(); // 현재의 시간만 가져온다
	    var ot = open.getTime(); // 오픈시간만 가져온다
	   if(nt<ot){ //현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다.
	     sec = parseInt(ot - nt) / 1000;
	     hour = parseInt(sec/60/60);
	     sec = (sec - (hour*60*60));
	     min = parseInt(sec/60);
	     sec = parseInt(sec-(min*60));

	     if(hour<10){hour="0"+hour;}
	     if(min<10){min="0"+min;}
	     if(sec<10){sec="0"+sec;}
	      //$("#d-day-hour").html(hour);
	      $("#countHour").html("남은시간 : ");
	      $("#d-day-min").html(min+"분");
	      $("#d-day-sec").html(sec+"초");
	   } else{ //현재시간이 종료시간보다 크면
	    $("#d-day-hour").html('00');
	    $("#d-day-min").html('00');
	    $("#d-day-sec").html('00');
	   }
	  }
	  let timer = setInterval(remaindTime,1000); //1초마다 검사를 해주면 실시간으로 시간을 알 수 있다.

	  	/////////////////////////////////////////////////
	  	/////////////////문제와 항목 리스트 불러오기////////////
	  	var ansFirst = 0;
	  	var ansLast = 0;
	  	var trueCount = 0;//맞은갯수
	  	var falseCount = 0;//틀린갯수
	  	var checkCount = 0;//체크카운트
		var sbjNum = $("#sbjNum").text();//과목번호
		var que = 0;					//문제번호
		var queList = 0;				//항목번호
		var clickCheckNum = 0;			//클릭한 라디오 박스의 que번호
		var clickCheckNumLast = 0;      //클릭한 라디오 박스의 queList번호
		var queAns = "";				//정답란
		var examNum = 0;				//첫번째 테이블(EXAM)의 기본키 값
		var exmqueNum = 0;				//두번째 테이블(EXAM_QUE)의 기본키 값
		var examqueList = [];
		 var count =0;
		let data = {"sbjNum" : sbjNum};

		//jsp 들어 온 후 비동기 방식으로 리스트 생성
		$.ajax({
	  		url : "/exam/examAllList",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		data : JSON.stringify(data),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){

				//질문 갯수, 마지막 질문의 항목 갯수 초기화!!
				que = result.examAllList.length;
				queList = result.examAllList[0].examSelList.length+1;

			 	for(var i =0; i<result.examAllList.length; i++){
			 		var str = "<div style='margin-left:auto; margin-right:auto; border-radius: 8px; background:white; width:68%; height : 350px;'>";
				    str+= 		"<br>";
				    str+= 		"&nbsp;&nbsp;&nbsp;&nbsp;<span style='font-size : 25px;'>"+parseInt(i+1)+".</span><textarea placeholder='질문' readonly id='que_"+parseInt(i+1)+"' value='"+result.examAllList[i].examqueQue+"' style='width:80%; height:auto; border:none; margin-left : 20px; border-bottom: 1px solid #9b9a9c;' type='text' >"+result.examAllList[i].examqueQue+"</textarea>";
				    str+= 		"<br>";
				    str+= 		"<br>";
					for(var j=0; j<result.examAllList[0].examSelList.length; j++){
						    str+= 		"<div id='queDiv_"+parseInt(i+1)+"-"+parseInt(j+1)+"'>";
						    str+= 			"<input name='que"+parseInt(i+1)+"' class='que' id='queCheck_"+parseInt(i+1)+"-"+parseInt(j+1)+"' value='"+result.examAllList[i].examSelList[j].esQue+"' type='radio' style='margin-left : 20px;'/>";
						    str+= 			"<input type='text' class='queText' id='queCheck_"+parseInt(i+1)+"-"+parseInt(j+1)+"value' value='"+result.examAllList[i].examSelList[j].esQue+"' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' readonly/>";
						    str+= 		"</div>";
					}
		//			str+= 	"<div id='queAnswerDiv"+parseInt(i+1)+"'>";
		//			str+= 			"<span style='margin-left : 20px'>정답 : </span>";
		//			str+= 			"<input type='text' id='queAnswer"+parseInt(i+1)+"' readonly/>";
		//	   		str+= 	"</div>";
					str+= 		"<div id='buttonDiv_"+parseInt(i+1)+"' style='margin-left : 20px; display: none;'>";
				    str+= 			"<button type='button' id='answer_"+parseInt(i+1)+"' class='btn btn-light'>정답</button>";
				    str+=       "</div>";
				    str+= "</div>";
				    str+= "<br>";
				    str+= "<br>";
					$("#br").before(str);

				}//2중 for문 끝

			 	//omr 비동기로 체크란 만들기
				var str2 = "";
			 	//style='font-size: 30px; margin-top: 70px; vertical-align: middle;'
				for(var k = 1; k<=result.examAllList.length; k++){
					str2 +="<tr id='answerOmr_"+k+"'>";
					str2 +="<td id="+k+">"+k+".</td>";
					for(var l = 1; l<=result.examAllList[0].examSelList.length; l++){
						str2 +="<td><span id='answerOmr_"+k+"-"+l+"'>"+omrNumber[l-1]+"</span></td>";
					}
					str2 +="</tr>";
				}
				$("#omrTitle").after(str2);
			}//success 끝
		});//ajax끝


	   //라디오버튼 누른 후 클릭한 값
	   $(document).on("click", "input[type=radio]" ,function(){
		   var arr1 = $(this).attr("id").split("_");
		   var num = arr1[1];
		   var queNum = num.split("-");
		   ansFirst = queNum[0];
		   ansLast  = queNum[1];

		  if($("#queAnswerDiv"+ansFirst).length > 0 ){
	   			$("#queAnswer"+ansFirst).val($("#queCheck_"+ansFirst+"-"+ansLast).val());
	   	  }else{
			   		var str = "";
					str+= 	"<div  style='display : none' id='queAnswerDiv"+ansFirst+"'>";
					str+= 			"<span style='margin-left : 20px'>정답 : </span>";
					str+= 			"<input type='text' id='queAnswer"+ansFirst+"'value='"+$("#queCheck_"+ansFirst+"-"+ansLast).val()+"' readonly/>";
					str+= 	"</div>";

				$("#answer_"+ansFirst).before(str);
	   	   }

		   for(var i = 1; i<=4; i++){
			   $("#answerOmr_"+ansFirst+"-"+i).css("background","white")
			   								  .css("color","black")
			   								  .css("border-radius","0px");
		   }

		   $("#answerOmr_"+ansFirst+"-"+ansLast).css("background","black")
		   										.css("color","white")
		   										.css("border-radius","100%");

		   $("#answerOmr_"+ansFirst+"-"+ansLast).bind("click", function(){
			   answer111(ansFirst , ansLast);
		   })
	   })//라디오버튼 누른후

	  $("#submit").on("click",function(){
		  clearInterval(timer);
		  var noAnswer = [];
		  if(queList==5){
			  queList=4;
		  }

		  for(var i =1; i<=que; i++){
			  $("#que_"+i).parent().css("border","3px solid white");
			  if($("#queAnswerDiv"+i).length == 0 || $("#queAnswerDiv"+i) == null ){
				  noAnswer.push(i);
			  }
		  }
		  //정답 미체크가 있을 시
		  if(noAnswer.length>0){
			  var str = "";
			  for(var i =1; i<=noAnswer.length; i++){
				  str+=noAnswer[i-1]+"번 정답 미체크\n";
			  }

			  alert(str); //정답 체크 안한 값 경고창 띄워주기

			  for(var i=0; i<noAnswer.length; i++){
				  $("#que_"+noAnswer[i]).parent().css("border","3px solid #f77c72");
			  }
			  return false;
		  }else{//정답 다 체크 한뒤
		  	  let data1 = {"sbjNum" : sbjNum};
			  $.ajax({
			  		url : "/exam/submitExamStudent",
			  		contentType : 'application/json;charset=utf-8',
			  		dataType : "json",
			  		type : "post",
			  		async:false,
			  		data : JSON.stringify(data1),
			  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result){
						examNum=result.exmNum;
					}
				});//ajax끝

				let data2 = {"exmNum" : examNum,
							 "sbjNum" : sbjNum
							 }

				let exmqueNumList = [];
				  $.ajax({
				  		url : "/exam/getExamQue",
				  		contentType : 'application/json;charset=utf-8',
				  		dataType : "json",
				  		type : "post",
				  		async:false,
				  		data : JSON.stringify(data2),
				  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success : function(result){
							exmqueNumList=result.examQueList;
						}
					});//ajax끝


					for(var i=0; i<exmqueNumList.length; i++){
						let data3 = {
										"exmqueNum" : exmqueNumList[i].exmqueNum,
										"exmNum" : exmqueNumList[0].exmNum,
										"sbjNum" : exmqueNumList[0].sbjNum,
										"ansAns" : $("#queAnswer"+parseInt(i+1)).val()
									};
						  $.ajax({
						  		url : "/exam/submitMyAnswer",
						  		contentType : 'application/json;charset=utf-8',
						  		dataType : "json",
						  		type : "post",
						  		async:false,
						  		data : JSON.stringify(data3),
						  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
					                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
								},
								success : function(result){
									count++;
									if(exmqueNumList.length == count){
										Swal.fire({
											  icon: 'success',
											  title: '제출이 완료되었습니다.'
										})
									}
								}
							});//ajax끝
					}//for문끝
			$("#confirm").css("display","inline");
			$("#submit").css("display","none");

		  }//else 문 끝
	  })//submit 끝



	  $("#back").on("click",function(){
			window.location="/main";
	  })//back 끝

	  $("#detail").on("click",function(){

		  	var ttt = parseInt(60) - ( parseInt($("#d-day-min").text()) + parseInt(1) );
		  	var sss = parseInt(60) - parseInt($("#d-day-sec").text());


		    //총배점 , 내점수, 맞은개수(ㅇㅋ)trueCount , 틀린개수falseCount,  전체문제수//trueCount+falseCount
		   window.location="/exam/detail?sbjNum="+sbjNum
				           +"&trueCount="+trueCount
				           +"&falseCount="+falseCount
				           +"&totalCount="+parseInt(trueCount+falseCount)
				           +"&minute="+ttt
				           +"&second="+sss;
	  })//detail끝

	  $("#confirm").on("click",function(){
		      $("#confirm").css("display","none");
		      $("#back").css("display","inline");
		      $("#detail").css("display","inline");
		      var checkBox = [];

			  let data = {"sbjNum" : sbjNum};


			  $.ajax({
			  		url : "/exam/compareExam",
			  		contentType : 'application/json;charset=utf-8',
			  		dataType : "json",
			  		type : "post",
			  		async:false,
			  		data : JSON.stringify(data),
			  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result){
						for(var i =0; i<result.examQueList.length; i++){
							 if(result.examQueList[i].examqueAns == result.answerVOList[i].ansAns){
								 checkCount+=100/result.examQueList.length;
								 checkBox.push(true);
							 }else{
								 checkBox.push(false);
							 }
						}

						$("#1").css("background-image" , "url('/resources/images/true-mark.png')");
						$("#1").css("background-repeat" , "no-repeat");
						$("#2").css("background-image" , "url('/resources/images/false-mark.png')");
						$("#2").css("background-repeat" , "no-repeat");


						for(var i =0; i<checkBox.length; i++){
							if(checkBox[i]==true){
								$("#"+parseInt(i+1)).css("background-image" , "url('/resources/images/true-mark.png')");
								$("#"+parseInt(i+1)).css("background-repeat" , "no-repeat");
							}else{
								$("#"+parseInt(i+1)).css("background-image" , "url('/resources/images/false-mark.png')");
								$("#"+parseInt(i+1)).css("background-repeat" , "no-repeat");
							}
						}//채점끝

						//$("#finalScore").text(count+"점");
						for(var i =0; i<checkBox.length; i++){
							if(checkBox[i]==false){
								falseCount++;
							}else{
								trueCount++;
							}
						}
					}
				});//ajax끝
	  })//confirm 끝
})
</script>
<style>
#nowTime{
  position: fixed;
  top: 100px;
}

tr{
	text-align: center;
}

td{
	border : 1px solid black;
}
</style>
</head>
<body>

	<div  class="abc" id="nowTime">
		<div style="text-align: left;">
			<br>
			<!-- 시간카운트 -->
				<span id="countHour"></span>
				<span id="d-day-min"></span>
				<span id="d-day-sec"></span>
			<br>
			<br>
			<table style="margin-left: auto; margin-right:auto; width : 150px; border : 3px solid black; background: white;">
				<tr height="40px" style="text-align: center;" id="omrTitle">
					<td colspan="5">OMR답안지</td>
				</tr>
			</table>
			<div id="finalScore"></div>
		</div>
	</div>

	<br>

	<section class="content">
		<div class="container-fluid" style="text-align: center;">
			<div style="margin-left: auto; margin-right: auto; border-top-left-radius: 8px; border-top-right-radius: 8px; background: #673ab7; width: 70%;">
				&nbsp;
			</div>
			<div style="margin-left: auto; margin-right: auto; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px; background: white; height: 100px; width: 70%;">
				<br>
				<div style="position: relative">
					<span id="sbjNum" style="display : none;">${sbjNum}</span>
					<h3>${sbjTitle}시험</h3>
					<span style="margin-left: auto;">${stuName}</span>
				</div>
			</div>
		</div>
		<br>
		<br>
			<br id="br">
			<div id="examDiv" style="text-align : right; margin-left:auto; margin-right:auto; border-radius: 8px; width:68%; ">
				<span>
					<button type="button" id="submit" class="btn btn-light">제출</button>
					<button type="button" id="confirm" style="display : none;" class="btn btn-light">결과</button>
					<button type="button" id="back" style="display : none;" class="btn btn-light">나가기</button>
					<button type="button" id="detail" style="display : none;" class="btn btn-light">상세보기</button>
				</span>
			</div>
	</section>

</body>
</html>