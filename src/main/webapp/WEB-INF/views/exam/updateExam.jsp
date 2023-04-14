<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 문제 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(function(){
	var sbjNum = $("#sbjNum").text();//과목번호
	var que = 0;					//문제번호
	var queList = 0;				//항목번호
	var clickCheckNum = 0;			//클릭한 라디오 박스의 que번호
	var clickCheckNumLast = 0;      //클릭한 라디오 박스의 queList번호
	var queAns = "";				//정답란
	var examNum = 0;				//첫번째 테이블(EXAM)의 기본키 값
	var exmqueNum = 0;				//두번째 테이블(EXAM_QUE)의 기본키 값
	var examqueList = [];
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
		 		var str = "<div style='margin-left:auto; margin-right:auto; border-radius: 8px; background:white; width:500px; height : 350px;'>";
			    str+= 		"<br>";
			    str+= 		"<input placeholder='질문' id='que_"+parseInt(i+1)+"' value='"+result.examAllList[i].examqueQue+"' style='width:350px; height:40px; border:none; margin-left : 20px; background: #e2e1e3; border-bottom: 1px solid #9b9a9c;' type='text' />";
			    str+= 		"<br>";
			    str+= 		"<br>";
				for(var j=0; j<result.examAllList[0].examSelList.length; j++){
					    str+= 		"<div id='queDiv_"+parseInt(i+1)+"-"+parseInt(j+1)+"'>";
					    str+= 			"<input name='que' class='que' id='queCheck_"+parseInt(i+1)+"-"+parseInt(j+1)+"' value='"+result.examAllList[i].examSelList[j].esQue+"' type='radio' style='margin-left : 20px;'/>";
					    str+= 			"<input type='text' class='queText' id='queCheck_"+parseInt(i+1)+"-"+parseInt(j+1)+"value' value='"+result.examAllList[i].examSelList[j].esQue+"' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
					    str+= 		"</div>";
				}
				str+= 	"<div id='queAnswerDiv"+parseInt(i+1)+"'>";
				str+= 			"<span style='margin-left : 20px'>정답 : </span>";
				str+= 			"<input type='text' id='queAnswer"+parseInt(i+1)+"' value='"+result.examAllList[i].examqueAns+"' readonly/>";
		   		str+= 	"</div>";
				str+= 		"<div id='buttonDiv_"+parseInt(i+1)+"' style='margin-left : 20px;'>";
			    str+= 			"<button type='button' id='optionAdd_"+parseInt(i+1)+"' class='btn btn-light'>옵션추가</button>";
			    str+= 			"<button type='button' id='optionMinus_"+parseInt(i+1)+"' class='btn btn-light'>옵션삭제</button>";
			    str+= 			"<button type='button' id='answer_"+parseInt(i+1)+"' class='btn btn-light'>정답</button>";
			    str+=       "</div>";
			    str+= "</div>";
			    str+= "<br>";
			    str+= "<br>";
				$("#br").before(str);
				
			}//2중 for문 끝 
		}//success 끝
	});//ajax끝
	
	$("#minusExam").on("click",function(){
		if(que ==0){
			Swal.fire({
				title: '더 이상 문제를 삭제 할 수 없습니다.',
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
		$("#br").prev().remove();
		$("#br").prev().remove();
		$("#que_"+que).parent().remove();
		queList=5;
		que--;
	})//minusExam끝
	
	
	
	$("#addExam").on("click",function(){
		if($("#queAnswer"+que).val() == null ||  $("#queAnswer"+que).val() == ""){
			Swal.fire({
				title: '정답을 체크 해주세요!',
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
		
		if(queList <5){
			Swal.fire({
				title: '항목은 4개를 작성하여야 합니다',
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
	
		que++;
		queList=1;
		
		var str = "<div style='margin-left:auto; margin-right:auto; border-radius: 8px; background:white; width:500px; height : 350px;'>";
			str+= "<br>";
			str+= "<input placeholder='질문' id='que_"+que+"' style='width:350px; height:40px; border:none; margin-left : 20px; background: #e2e1e3; border-bottom: 1px solid #9b9a9c;' type='text'>";
			str+= "<br>";
			str+= "<br>";
			str+= "<div id='buttonDiv_"+que+"' style='margin-left : 20px;'>";
			str+= "<button type='button' id='optionAdd_"+que+"' class='btn btn-light'>옵션추가</button>";
			str+= "<button type='button' id='optionMinus_"+que+"' class='btn btn-light'>옵션삭제</button>";
			str+= "<button type='button' id='answer_"+que+"' class='btn btn-light'>정답</button>";
			str+= "</div>";
			str+= "</div>";
			str+= "<br>";
			str+= "<br>";
			$("#br").before(str);
			
			//옵션추가
			$("#optionAdd_"+que).bind("click", function(){
				addQueList(que);
			});
			
			//옵션삭제
			$("#optionMinus_"+que).bind("click", function(){
				minusQueList(que);
			});
			
			//정답
			$("#answer_"+que).bind("click", function(){
				answerQue(que);
			});
			
	})//addExam끝
	
	
	
	//동적으로 생성된 정답체크 이벤트 넣기
	function answerQue(que){
		if(queList<5){
			Swal.fire({
				title: '항목을 4개 설정 후 정답을 설정해주세요',
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
		
		
   		if($("#queAnswerDiv"+que).length > 0 ){
   			$("#queAnswer"+que).val(queAns);
   		}else{
	   		 var str  = 	"<div id='queAnswerDiv"+que+"'>";
				 str += 			"<span style='margin-left : 20px'>정답 : </span>";
				 str += 			"<input type='text' id='queAnswer"+que+"' readonly/>";
		   		 str += 	"</div>";
		   		 $("#buttonDiv_"+que).before(str);
				 $("#queAnswer"+que).val(queAns);
   		}
	}
	
	//동적으로 생성된 optionMinus 이벤트 넣기
	function minusQueList(que){
		
		var currentQueList = $("#buttonDiv_"+que).prevAll().length-4;
		
		if(currentQueList ==0){
			Swal.fire({
				title: '더 이상 삭제를 할수 없습니다!',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'error',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
		}else if(currentQueList == 5){
			currentQueList=4;
		}
		
		//$("#queDiv_"+que+"-"+parseInt(queList-1)).remove();
		$("#queDiv_"+que+"-"+parseInt(currentQueList)).remove();
		$("#queAnswerDiv"+que).remove();
		queList=currentQueList;
		//queList--;
	};
	
	//동적으로 생성된 optionAdd 이벤트 넣기!!!!!!!!!!!!!!!!!!!!!!
	function addQueList(que){
		
		if(queList == 0){
			queList=1;
		}else if(queList==5){
			Swal.fire({
				title: '더 이상 항목 추가 할수 없습니다.',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'error',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});			
			return false;
		}
		
		var str = "<div id='queDiv_"+que+"-"+queList+"'>";
  	    str+= 	  "<input name='que'  id='queCheck_"+que+"-"+queList+"' type='radio' class='que' style='margin-left : 20px;'/>";
        str+=     "<input type='text' id='queCheck_"+que+"-"+queList+"value' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
   		str+=     "</div>";
   		if(queList == 0){
   			queList = 1;	
   		}else if(queList==1){
			 $("#buttonDiv_"+que).before(str);
		}else if(queList>=2 && queList<=4){
			 $("#queDiv_"+que+"-"+parseInt(queList-1)).after(str);
		}else{
			Swal.fire({
				title: '더 이상 추가를 할수 없습니다!',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'error',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});	
			$("#queCheck_"+que+"-"+parseInt(queList-1)).val($("#queCheck_"+que+"-"+parseInt(queList-1)+"value").val());
			return false;
		}
   		
   	 	$("#queCheck_"+que+"-"+parseInt(queList-1)).off("click");   // 이전 이벤트 설정 삭제
		 
		 queList++;
		
		 $("#queCheck_"+que+"-"+queList).on("click",function(){
				queAns = $(this).val();
		 });
	}//동적으로 생성된 optionAdd 이벤트 넣기 끝!!!!!!!!!!!!!!!!!!!!!!
	
	
	//라디오버튼 클릭시
	$(document).on("click","input[type=radio]", function(){
		var arr = $(this).attr("id").split("_");
		var arr1 = arr[1].split("-");
		
		clickCheckNumFirst=arr1[0];
		clickCheckNumLast=arr1[1];
		
		$("#answer_"+clickCheckNumFirst).bind("click", function(){
			updateAnswer(clickCheckNumFirst,clickCheckNumLast);
		});
	})
	
	
	function updateAnswer(clickCheckNumFirst,clickCheckNumLast){
		//선택한 값을 정답란에 직접 넣음
		$("#queAnswer"+clickCheckNumFirst).val($("#queCheck_"+clickCheckNumFirst+"-"+clickCheckNumLast).val());
	}
	
	$(document).on("keypress", ".queText",function(){
		$(this).parent().find(".que").val($(this).val());
	}); 
	
/* 	$("#answer_"+que).on("click",function(){
		//체크박스 클릭시 체크박스 옆에 해당하는 값을 가져와야함
		if(queList<5){
			alert("항목을 4개 설정 후 정답을 설정해주세요");
			return false;
		}
		
		alert("queAns : "+queAns);
		alert("정답 버튼 누른 후 queList : "+queList);
		$("#queCheck_"+que+"-"+parseInt(queList-1)).val($("#queCheck_"+que+"-"+parseInt(queList-1)+"value").val());
   		if($("#queAnswerDiv"+que).length > 0 ){
   			$("#queAnswer"+que).val(queAns);
   		}else{
	   		 var str  = 	"<div id='queAnswerDiv"+que+"'>";
				 str += 			"<span style='margin-left : 20px'>정답 : </span>";
				 str += 			"<input type='text' id='queAnswer"+que+"' readonly/>";
		   		 str += 	"</div>";
		   		 $("#buttonDiv_"+que).before(str);
				 $("#queAnswer"+que).val(queAns);
   		}
	});//"#answer_"+que 끝 */
	
	
	$("#submit").on("click",function(){
		for(var a = 1; a<=que; a++){
			if($("#queAnswer"+a).val() == null || $("#queAnswer"+a).val() == ""){
				Swal.fire({
					title: a+"번 정답을 체크해주세요.",
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
		}
		
		if(queList>4){
			queList=4;
		}
		
		for(var j=1; j<=que; j++){ 
			for(var i=1; i<=queList; i++){
				$("#queCheck_"+j+"-"+i+"value").val($("#queCheck_"+j+"-"+i).val());
			}
		}
		
		let data = {"sbjNum" : sbjNum};
		//시험테이블에 온라인 시험 등록
		
		$.ajax({ 
	  		url : "/exam/examDelete",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		async:false,
	  		data : JSON.stringify(data),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			}, 
			success : function(result){
				
			}
		});//ajax끝
		
		//exam테이블에 등록!!
		$.ajax({ 
	  		url : "/exam/examTable",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		async:false,
	  		data : JSON.stringify(data),
	  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			}, 
			success : function(result){
				if(result.result>0){//0보다 크면 examTable에 등록 성공!!
				 	examNum = result.examNum;
				}
			}
		});//ajax끝
		
		
		//examQue테이블에 질문과 답 넣기
        for(var a = 1; a <=que; a++){
	          let data2  = {"examNum" : examNum, 
							"sbjNum" : sbjNum, 
							"question" : $("#que_"+a).val(),
							"queAns" : $("#queAnswer"+a).val()
							};
	          
	      		//examQue테이블에 데이터 넣기
				$.ajax({ 
			  		url : "/exam/examQue",
			  		contentType : 'application/json;charset=utf-8',
			  		dataType : "json",
			  		type : "post",
			  		async:false,
			  		data : JSON.stringify(data2),
			  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					}, 
					success : function(result){
						exmqueNum = result.exmqueNum;
						examqueList.push(exmqueNum);
					}
				});//ajax끝
        }//for문 끝
        
        var count = 0;
      	for(var j =1; j<=que; j++){ //문제번호
			for(var i =1; i<=queList; i++){//문제항목번호
				
				let data3  = {"exmqueNum" : examqueList[j-1], 
					 	   "examNum" : examNum, 
					       "sbjNum" : sbjNum,
					       "queList" :  $("#queCheck_"+j+"-"+i).val()
				}; //data3 끝
				
				$.ajax({ 
			  		url : "/exam/examSel",
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
						
						if(que * queList == count){
							Swal.fire({
								title: "시험 출제가 완료되었습니다!",
								showClass: {
									popup: 'animate__animated animate__bounceIn'
								},
								icon: 'warning',
								customClass: {
									confirmButton: 'btn btn-primary'
								},
								buttonsStyling: false
							});	
							//window.location = "/login/home";
						}
					}
				});//ajax끝
			}//문제항목번호 끝
		}//문제번호끝	
     
	})

})
</script>

	<!-- 
				<div id="queDiv_1-1">
					<input name="que" id="queCheck_1-1" type="radio" style="margin-left : 20px;"/>
					<input type="text" id="queCheck_1-1value" placeholder="옵션" style="width:350px; height:40px; border:none; margin-left : 20px;" />
				</div>
				<div id="buttonDiv_1" style="margin-left : 20px;">
					<button type="button" id="optionAdd_1" class="btn btn-light">옵션추가</button>
					<button type="button" id="optionMinus_1" class="btn btn-light">옵션삭제</button>
					<button type="button" id="answer_1" class="btn btn-light">정답</button>
				</div>
			</div> -->
			
</head>
<body>
<section class="content">
		
		<div class="container-fluid" style="text-align: center;">
			<div style="margin-left: auto; margin-right: auto; border-top-left-radius: 8px; border-top-right-radius: 8px; background: #673ab7; width: 500px;">
				&nbsp;
			</div>
			<div style="margin-left: auto; margin-right: auto; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px; background: white; height: 100px; width: 500px;">
				<br>
				<div style="position: relative">
					<span id="sbjNum" style="display : none;">${subjectVO.sbjNum}</span>
					<h3>${subjectVO.sbjTitle}시험출제(수정중)</h3>
					<span style="margin-left: auto;">${subjectVO.teaNmKor}</span>
				</div>
			</div>
		</div>
		<br>
		<br>
	
			<br id="br">
			<div id="examDiv" style="text-align : right; margin-left:auto; margin-right:auto; border-radius: 8px; width:500px; ">
				<button type="button" id="addExam" class="btn btn-light">문제추가</button>
				<button type="button" id="minusExam" class="btn btn-light">문제삭제</button>
				<button type="button" id="submit" class="btn btn-light">출제완료</button>
			</div>
	</section>

</body>
</html>