<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험문제 출제하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		
		var que = 1;  		//문제번호
		var queList = 1;	//문제에 대한 항목 번호
		var question = "";	//해당 번호에 대한 질문 값
		var queAns = "";	//문제에 대한 정답
		var sbjNum = "";	//과목번호
		var examNum = 0;	//exam테이블에서 exmNum값                 --시험등록테이블(첫번째)
		var exmqueNum = 0;	//examQue테이블에서 examqueNum의 값		 --시험문제테이블(두번째)
		
	
		
		//정답설정 클릭
		$("#answer_"+que).on("click",function(){
			//체크박스 클릭시 체크박스 옆에 해당하는 값을 가져와야함
			$("#queCheck_"+que+"-"+parseInt(queList-1)).val($("#queCheck_"+que+"-"+parseInt(queList-1)+"value").val());
	   		if($('#queAnswerDiv').length > 0 ){
	   			$("#queAnswer"+que).val(queAns);
	   		}else{
		   		 var str  = 	"<div id='queAnswerDiv'>";
					 str += 			"<span style='margin-left : 20px'>정답 : </span>";
					 str += 			"<input type='text' id='queAnswer"+que+"' readonly/>";
			   		 str += 	"</div>";
			   		 $("#buttonDiv_"+que).before(str);
					 $("#queAnswer"+que).val(queAns);
	   		}
		});//"#answer_"+que 끝
		
		/* $("#queCheck_"+que+"-"+queList).on("click",function(){
				$(this).val($("#" + $(this).attr("id") + "value").val() );	
				alert("asdg : "+$(this).val());
		}); */
		
		//라디오버튼 클릭시
		$(document).on("click","input[type=radio]", function(){
			$(this).val($("#" + $(this).attr("id") + "value").val() );	
			queAns = $(this).val();
		})
		
		//옵션추가
		$("#optionAdd_"+que).on("click",function(){
			
			var str = "<div id='queDiv_"+que+"-"+queList+"'>";
	  	    str+= 	  "<input name='que'  id='queCheck_"+que+"-"+queList+"' type='radio' style='margin-left : 20px;'/>";
	        str+=     "<input type='text' id='queCheck_"+que+"-"+queList+"value' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
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
					icon: 'warning',
					customClass: {
						confirmButton: 'btn btn-primary'
					},
					buttonsStyling: false
				});
				$("#queCheck_"+que+"-"+parseInt(queList-1)).val($("#queCheck_"+que+"-"+parseInt(queList-1)+"value").val());
				return false;
			}
	   		
	   	 	$("#queCheck_"+que+"-"+parseInt(queList-1)).off("click");   // 이전 이벤트 설정 삭제
		 	//$("#queCheck_"+que+"-"+parseInt(queList-1)).val($("#queCheck_"+que+"-"+parseInt(queList-1)+"value").val());
			
		 	/*  if(queList==4){
		 		 $("#queCheck_"+que+"-"+parseInt(queList-1)).off("click"); 
				 $("#queCheck_"+que+"-"+parseInt(queList-1)).val($("#queCheck_"+que+"-"+parseInt(queList-1)+"value").val());
			 } */
			 
			 queList++;
			
			 $("#queCheck_"+que+"-"+queList).on("click",function(){
					//$(this).val($("#" + $(this).attr("id") + "value").val() );	
					queAns = $(this).val();
			 });
			 
			for(var i =1; i<=parseInt(queList-1); i++){
				$("#queCheck_"+que+"-"+i).val($("#queCheck_"+que+"-"+i+"value").val());
			}	
		})//#optionAdd 끝
		
		//옵션삭제
		$("#optionMinus_"+que).on("click",function(){
			
			if(parseInt(queList-1) ==0){
				Swal.fire({
					title: '더 이상 추가를 할수 없습니다!',
					showClass: {
						popup: 'animate__animated animate__bounceIn'
					},
					icon: 'warning',
					customClass: {
						confirmButton: 'btn btn-primary'
					},
					buttonsStyling: false
				});
			}
			
			$("#queDiv_"+que+"-"+parseInt(queList-1)).remove();
			queList--;
		})//#optionMinus 끝
		
		//시험 문제 출제!!
		$("#submit").on("click",function(){
			if(queList>4){
				queList=4;
			}
			
			for(var i=1; i<=queList; i++){
				$("#queCheck_"+que+"-"+queList).val($("#queCheck_"+que+"-"+queList+"value").val());
			}
			
			
			
			
			question = $("#que_1").val();
			sbjNum = $("#sbjNum").text();
			//que,queList,queAns
			/* 첫번째 질문 : que_que-queList
			첫번째 체크박스 : queCheck_que_queList
			첫번째 체크박스옆 값 : queCheck_que_queListvalue */
			
			let data = {"sbjNum" : sbjNum};
			//시험테이블에 온라인 시험 등록
			$.ajax({ 
		  		url : "/exam/examTable",
		  		contentType : 'application/json;charset=utf-8',
		  		dataType : "json",
		  		type : "post",
		  		async:false,
		  		data : JSON.stringify(data),
		  		/* beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				}, */
				success : function(result){
					if(result.result>0){//0보다 크면 examTable에 등록 성공!!
						examNum = result.examNum;
					}
				}
			});//ajax끝
			
			//alert("examNum : "+examNum);//위에 ajax보다 이게 먼저 실행됨 뭘까 씨벌것;
				
	          let data2  = {"examNum" : examNum, 
					  "sbjNum" : sbjNum, 
					  "question" : question,
					  "queAns" : queAns
				};
			
			
			
			//examQue테이블에 데이터 넣기
			$.ajax({ 
		  		url : "/exam/examQue",
		  		contentType : 'application/json;charset=utf-8',
		  		dataType : "json",
		  		type : "post",
		  		async:false,
		  		data : JSON.stringify(data2),
		  		/* beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				}, */
				success : function(result){
					exmqueNum = result.exmqueNum;
				}
			});//ajax끝
			
			//var que = 1;  		//문제번호
			//var queList = 1;	//문제에 대한 항목 번호
			/*  let data3  = {"exmqueNum" : exmqueNum, 
					 	   "examNum" : examNum, 
					       "sbjNum" : sbjNum,
					       ""
						   }; */
			for(var j =1; j<=que; j++){ //문제번호
				for(var i =1; i<=queList; i++){//문제항목번호
					var abc = $("#queCheck_"+j+"-"+i).val();
					
					let data3  = {"exmqueNum" : exmqueNum, 
						 	   "examNum" : examNum, 
						       "sbjNum" : sbjNum,
						       "queList" :  abc
					}; //data3 끝
					
					$.ajax({ 
				  		url : "/exam/examSel",
				  		contentType : 'application/json;charset=utf-8',
				  		dataType : "json",
				  		type : "post",
				  		data : JSON.stringify(data3),
				  		/* beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						}, */
						success : function(result){
							
						}
					});//ajax끝
				}
			}
			
			
		})//submit 끝
	})
</script>
<style>
.RVEQke {
	background-color: rgb(103, 58, 183);
	color: rgba(255, 255, 255, 1);
}
</style>
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
					<h3>${subjectVO.sbjTitle}시험출제</h3>
					<span style="margin-left: auto;">${subjectVO.teaNmKor}</span>
				</div>
			</div>
		</div>
		<br>
		<br>
			<div style="margin-left:auto; margin-right:auto; border-radius: 8px; background:white; width:500px; height : 350px;">
				<br>
				<!-- 시험문제 -->
				<input placeholder="질문" id="que_1" style="width:350px; height:40px; border:none; margin-left : 20px; background: #e2e1e3; border-bottom: 1px solid #9b9a9c;" type="text" />
				<br>
				<br>
				<!-- <div id="queDiv_1-1">
					<input name="que" id="queCheck_1-1" type="radio" style="margin-left : 20px;"/>
					<input type="text" id="queCheck_1-1value" placeholder="옵션" style="width:350px; height:40px; border:none; margin-left : 20px;" />
				</div> -->
				<div id="buttonDiv_1" style="margin-left : 20px;">
					<button type="button" id="optionAdd_1" class="btn btn-light">옵션추가</button>
					<button type="button" id="optionMinus_1" class="btn btn-light">옵션삭제</button>
					<button type="button" id="answer_1" class="btn btn-light">정답</button>
				</div>
			</div>
			<br>
			<div style="text-align : right; margin-left:auto; margin-right:auto; border-radius: 8px; width:500px; ">
				<button type="button" id="submit" class="btn btn-light">출제완료</button>
			</div>
	</section>
</body>
</html>