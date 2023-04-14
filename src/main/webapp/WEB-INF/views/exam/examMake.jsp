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
	var queList = 1;	//문제에 대한 항목 번호
	var que = 1;  		//문제번호

	$(function() {
		var examqueList = [];//문제들이 여러개이니 배열로 담음
		var question = "";	//해당 번호에 대한 질문 값
		var queAns = "";	//문제에 대한 정답
		var sbjNum = "";	//과목번호
		var examNum = 0;	//exam테이블에서 exmNum값                 --시험등록테이블(첫번째)
		var exmqueNum = 0;	//examQue테이블에서 examqueNum의 값		 --시험문제테이블(두번째)
		var queListArr = []; //추가될때마다 숫자가 들어감
		var moveQue = "";	//동적으로 움직이는 문제번호

		//문제 추가하기
		$("#addExam").on("click",function(){
			queListArr=[];//문제 넣는 배열 초기화

			if($("#queAnswer"+que).val() == null ||  $("#queAnswer"+que).val() == ""){
				Swal.fire({
					  icon: 'warning',
					  title: "정답을 체크 해주세요!",
		 	    	  confirmButtonText: '확인'
					});
				return false;
			}
			if(queList <5){
				Swal.fire({
					  icon: 'warning',
					  title: "항목은 4개를 작성하여야 합니다",
		 	    	  confirmButtonText: '확인'
					});
				return false;
			}
			que++;
			queList=1;


			var str = "<br>";
				str+= "<br>";
			    str+= "<div id='ex_"+que+"' style='margin-left:auto; margin-right:auto; border-radius: 8px; background:white; width:68%; height : 350px;'>";
				str+= "<br id='brbr"+que+"'>";
				str+= "<input placeholder='질문' id='que_"+que+"' style='width:80%; height:40px; border:none; margin-left : 20px; border-bottom: 1px solid #9b9a9c;' type='text'>";
				str+= "<br>";
				str+= "<br>";
				str+= "<div id='buttonDiv_"+que+"' style='margin-left : 20px;'>";
				str+= "<button type='button' id='optionAdd_"+que+"' class='btn btn-light'>옵션추가</button>";
				str+= "<button type='button' id='optionMinus_"+que+"' class='btn btn-light'>옵션삭제</button>";
				str+= "<button type='button' id='answer_"+que+"' class='btn btn-light'>정답</button>";
				str+= "</div>";
				str+= "</div>";
				str+= "<br>";
				//$("#examDiv").prev().before(str);
				$("#examDiv").before(str);
				//$("#examDivPrev").after(str);

				//옵션추가
				$("#optionAdd_"+que).bind("click", function(){
					var thisAdd = $(this).attr("id");
					addQueList(que,thisAdd);
				});
				//옵션삭제
				$("#optionMinus_"+que).bind("click", function(){
					var thisMinus = $(this).attr("id");
					minusQueList(que,thisMinus);
				});
				//정답
				$("#answer_"+que).bind("click", function(){
					var thisAnswer =  $(this).attr("id");
					answerQue(que,thisAnswer);
				});

		})//addExam끝

		//동적으로 생성된 정답체크 이벤트 넣기
		function answerQue(que,thisAnswer){

			var arr = thisAnswer.split("_");

			if($("div[id*=queDiv_"+arr[1]+"]").length<4){
				Swal.fire({
					  icon: 'warning',
					  title: "항목을 4개 설정 후 정답을 설정해주세요",
		 	    	  confirmButtonText: '확인'
					});
				return false;
			}


	   		if($("#queAnswerDiv"+arr[1]).length > 0 ){
	   			$("#queAnswer"+arr[1]).val(queAns);
	   		}else{
		   		 var str  = 	"<div id='queAnswerDiv"+arr[1]+"'>";
					 str += 			"<span style='margin-left : 20px'>정답 : </span>";
					 str += 			"<input type='text' id='queAnswer"+arr[1]+"' readonly/>";
			   		 str += 	"</div>";
			   		 $("#buttonDiv_"+arr[1]).before(str);
					 $("#queAnswer"+arr[1]).val(queAns);
	   		}
		}

		//동적으로 생성된 optionMinus 이벤트 넣기
		function minusQueList(que,thisMinus){

			var arr = thisMinus.split("_");
			var idArr = [];

			$("div[id*=queDiv_"+arr[1]+"]").each(function(i,v){
				var s = $(v).attr("id").split("-"); //queCheck_1-4

				idArr.push(s[1]);
			});

			queListArr=idArr;

			var currentQueList = $("#buttonDiv_"+que).prevAll().length-4;

			if(currentQueList ==0){
				Swal.fire({
					  icon: 'warning',
					  title: "더 이상 삭제를 할수 없습니다!",
		 	    	  confirmButtonText: '확인'
					});
			}else if(currentQueList == 5){
				currentQueList=4;
			}
			$("#"+$("#span"+arr[1]).text()).remove();
			//$("#span"+arr[1]).remove();
			$("#queAnswerDiv"+arr[1]).remove();

			for(let i = 0; i < queListArr.length; i++) {
				 if(parseInt(queListArr[i]) === parseInt(arr[1]))  {
					 queListArr.splice(i, 1);
				    i--;
				 }
			}

			//현재 queListArr = 1, 3
			//부족한 배열 순서대로 다시 정렬
			for(var i=0; i<queListArr.length; i++){
				$("#queDiv_"+arr[1]+"-"+queListArr[i]).attr("id","queDiv_"+arr[1]+"-"+parseInt(i+1));
				//queCheck_1-4
				$("#queCheck_"+arr[1]+"-"+queListArr[i]).attr("id","queCheck_"+arr[1]+"-"+parseInt(i+1));
				//queCheck_1-4value
				$("#queCheck_"+arr[1]+"-"+queListArr[i]+"value").attr("id","queCheck_"+arr[1]+"-"+parseInt(i+1)+"value");
			}


			queList=parseInt($("div[id^=queDiv_"+arr[1]+"]").length+1);


			queListArr = [];
			for(var i =1; i<=queList; i++){
				queListArr.push(i);
			}
		};

		//동적으로 생성된 optionAdd 이벤트 넣기!!!!!!!!!!!!!!!!!!!!!!
		function addQueList(que,thisAdd){
			var arr = thisAdd.split("_");

			if($("div[id^=queDiv_"+arr[1]+"]").length == 0){
				queList=1;
			}else if($("div[id^=queDiv_"+arr[1]+"]").length>=5){
				Swal.fire({
					  icon: 'warning',
					  title: "더 이상 항목 추가 할수 없습니다.",
		 	    	  confirmButtonText: '확인'
					});
				return false;
			}else{
				queList = parseInt($("div[id^=queDiv_"+arr[1]+"]").length)+parseInt(1);
			}

			var str = "<div id='queDiv_"+arr[1]+"-"+queList+"'>";
	  	    //str+= 	  "<input name='que'  id='queCheck_"+que+"-"+queList+"' type='radio' class='que' style='margin-left : 20px;'/>";
	  	    str+= 	  "<input name='que"+arr[1]+"'  id='queCheck_"+arr[1]+"-"+queList+"' type='radio' class='que"+arr[1]+"' style='margin-left : 20px;'/>";
	        str+=     "<input type='text' id='queCheck_"+arr[1]+"-"+queList+"value' class='queText' placeholder='옵션' style='width:80%; height:40px; border:none; margin-left : 20px;' />";
	   		str+=     "</div>";
	   		if(queList == 0){
	   			queList = 1;
	   		}else if(queList==1){
				 $("#buttonDiv_"+arr[1]).before(str);
			}else if(queList>=2 && queList<=4){
				 $("#queDiv_"+arr[1]+"-"+parseInt(queList-1)).after(str);
			}else{
				Swal.fire({
					  icon: 'warning',
					  title: "더 이상 추가를 할수 없습니다!",
		 	    	  confirmButtonText: '확인'
					});
				$("#queCheck_"+arr[1]+"-"+parseInt(queList-1)).val($("#queCheck_"+arr[1]+"-"+parseInt(queList-1)+"value").val());
				return false;
			}


	   	 	$("#queCheck_"+arr[1]+"-"+parseInt(queList-1)).off("click");   // 이전 이벤트 설정 삭제
	   	 	 queListArr.push(queList);
			 queList++;


			 $("#queCheck_"+que+"-"+queList).on("click",function(){
					//$(this).val($("#" + $(this).attr("id") + "value").val() );
					queAns = $(this).val();
			 });

		}//동적으로 생성된 optionAdd 이벤트 넣기 끝!!!!!!!!!!!!!!!!!!!!!!


		//문제 삭제하기
		//$(document).on("click", "#minusExam",function(){
		$("#minusExam").on("click",function(){
			if(que ==1){
				Swal.fire({
					  icon: 'warning',
					  title: "더 이상 문제를 삭제 할 수 없습니다",
		 	    	  confirmButtonText: '확인'
					});
				que=1;
				queList=5;
				return false;
			}

			$("#que_"+que).parent().remove();
			que--;
			queList=parseInt($("div[id^=queDiv_"+que+"]").length+1);
		})//minusExam끝

		//정답설정 클릭
		$("#answer_"+que).on("click",function(){

			var clickId = $(this).attr("id").split("_");//answer_1

			//체크박스 클릭시 체크박스 옆에 해당하는 값을 가져와야함
			//if(que!=1){
				if(queList<5){
					Swal.fire({
						  icon: 'warning',
						  title: "항목을 4개 설정 후 정답을 설정해주세요",
			 	    	  confirmButtonText: '확인'
						});
					return false;
				}
			//}

			$("#queCheck_"+clickId[1]+"-"+parseInt(queList-1)).val($("#queCheck_"+clickId[1]+"-"+parseInt(queList-1)+"value").val());
	   		if($("#queAnswerDiv"+clickId[1]).length > 0 ){
	   			$("#queAnswer"+clickId[1]).val(queAns);
	   		}else{
		   		 var str  = 	"<div id='queAnswerDiv"+clickId[1]+"'>";
					 str += 			"<span style='margin-left : 20px'>정답 : </span>";
					 str += 			"<input type='text' id='queAnswer"+clickId[1]+"' readonly/>";
			   		 str += 	"</div>";
			   		 $("#buttonDiv_"+clickId[1]).before(str);
					 $("#queAnswer"+clickId[1]).val(queAns);
	   		}
		});//"#answer_"+que 끝


		//라디오버튼 클릭시
		$(document).on("click","input[type=radio]", function(){


			//arr의값 : queDiv_1,3
 			var arr = $(this).parent().attr("id").split("-");
			var arrrr = arr[0].split("_");
			if($("#span"+arrrr[1]).length>0){
				$("#span"+arrrr[1]).remove();
				var str = "<span id='span"+arrrr[1]+"' style='display : none;'>"+$(this).parent().attr("id")+"</span>";
				$("#brbr"+arrrr[1]).before(str);
			}else{
				var str = "<span id='span"+arrrr[1]+"' style='display : none;'>"+$(this).parent().attr("id")+"</span>";
				$("#brbr"+arrrr[1]).before(str);
			}


			$(this).val($("#" + $(this).attr("id") + "value").val() );
			queAns = $(this).val();
		})


		$(document).on("keypress", ".queText",function(){
			$(this).parent().find(".que"+que).val($(this).val());
		});

		//옵션추가(1번 문제는 이걸로 사용)
		$(document).on("click","#optionAdd_"+que, function(){
			//문제의 항목이 추가 될때마다 배열에 넣음
			var clickArr = $(this).attr("id").split("_");

			queList = parseInt($("div[id^=queDiv_"+clickArr[1]+"]").length+1);

			var str = "<div id='queDiv_"+clickArr[1]+"-"+queList+"'>";
	  	    str+= 	  "<input name='que"+clickArr[1]+"'  id='queCheck_"+clickArr[1]+"-"+queList+"' type='radio' class='que"+clickArr[1]+"' style=' margin-left : 20px;'/>";
	        str+=     "<input type='text' id='queCheck_"+clickArr[1]+"-"+queList+"value' class='queText' placeholder='옵션' style='width:80%; height:40px; border:none; margin-left : 20px;' />";
	   		str+=     "</div>";

	   		if(queList == 0){
	   			queList = 1;
	   		}else if(queList==1){
				 $("#buttonDiv_"+clickArr[1]).before(str);
			}else if(queList>=2 && queList<=4){
				$("#buttonDiv_"+clickArr[1]).before(str);
			}else{

				Swal.fire({
					  icon: 'warning',
					  title: "더 이상 추가를 할수 없습니다!",
		 	    	  confirmButtonText: '확인'
					});
				$("#queCheck_"+clickArr[1]+"-"+parseInt(queList-1)).val($("#queCheck_"+clickArr[1]+"-"+parseInt(queList-1)+"value").val());
				return false;
			}

	   	 	$("#queCheck_"+clickArr[1]+"-"+parseInt(queList-1)).off("click");   // 이전 이벤트 설정 삭제
	   	 	 queListArr.push(queList);//배열에 값을 넣음
			 queList++;

			 $("#queCheck_"+clickArr[1]+"-"+queList).on("click",function(){
					queAns = $(this).val();
			 });

		})//#optionAdd 끝

		//옵션삭제
		$(document).on("click","#optionMinus_"+que, function(){

			var sss = $(this).attr("id").split("_");//optionMinus_1 을 _ 기준으로 스플릿함

			let idArr = [];

			$("div[id*=queDiv_"+sss[1]+"]").each(function(i,v){
				var s = $(v).attr("id").split("-"); //queCheck_1-4

				idArr.push(s[1]);
			});

			queListArr = idArr;



			var optionSplit = $(this).attr("id").split("_");

			var split = $("#span"+optionSplit[1]).text().split("-"); //queDiv_1-1 에서 '-' 뒷자리 숫자를 배열에서 없앰
			var splitt = split[0].split("_");		  //queDiv_1에서 '_' 기준으로 자름


			for(let i = 0; i < queListArr.length; i++) {
				 if(parseInt(queListArr[i]) === parseInt(split[1]))  {
					 queListArr.splice(i, 1);
				    i--;
				 }
			}


			//부족한 배열 순서대로 다시 정렬
			for(var i=0; i<queListArr.length; i++){
				$("#queDiv_"+splitt[1]+"-"+queListArr[i]).attr("id","queDiv_"+splitt[1]+"-"+(i+1));
				//queCheck_1-4
				$("#queCheck_"+splitt[1]+"-"+queListArr[i]).attr("id","queCheck_"+splitt[1]+"-"+(i+1));
				//queCheck_1-4value
				$("#queCheck_"+splitt[1]+"-"+queListArr[i]+"value").attr("id","queCheck_"+splitt[1]+"-"+(i+1)+"value");
			}


			if(parseInt(queList-1) ==0){

				Swal.fire({
					  icon: 'warning',
					  title: "더 이상 삭제를 할수 없습니다!",
		 	    	  confirmButtonText: '확인'
					});
			}
			$("#"+$("#span"+optionSplit[1]).text()).remove();
			$("#queAnswerDiv"+optionSplit[1]).remove();

			queList=parseInt($("div[id^=queDiv_"+optionSplit[1]+"]").length+1);

			queListArr = [];
			for(var i =0; i<queList-1; i++){
				queListArr.push(i+1);
			}

			if($("#queAnswerDiv"+split[1]).length>0){
				$("#queAnswerDiv"+split[1]).remove();
			}
		})//#optionMinus 끝

		//시험 문제 출제!!
		$("#submit").on("click",function(){

			que = $("div[id*=ex_]").length;

			if(queList<4){
				Swal.fire({
					  icon: 'warning',
					  title: "항목은 4개여야 합니다",
		 	    	  confirmButtonText: '확인'
					});
				return false;
			}

			for(var a = 1; a<=que; a++){
				if($("#queAnswer"+a).val() == null || $("#queAnswer"+a).val() == ""){
					Swal.fire({
						  icon: 'warning',
						  title: a+"번 정답을 체크해주세요.",
			 	    	  confirmButtonText: '확인'
						});
					return false;
				}
			}

			if(queList>4){
				queList=4;
			}

			for(var j=1; j<=que; j++){
				for(var i=1; i<=queList; i++){
					$("#queCheck_"+j+"-"+i).val($("#queCheck_"+j+"-"+i+"value").val());
				}
			}




			question = $("#que_1").val();
			sbjNum = $("#sbjNum").text();
			//que,queList,queAns
			//alert("현재 que 값 : "+que + ", queList : "+queList+" , queAns : "+queAns +" , question : "+question);
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
		  		 beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result.result>0){//0보다 크면 examTable에 등록 성공!!
						examNum = result.examNum;
					}
				}
			});//ajax끝


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
									  icon: 'success',
									  title: "시험 출제가 완료되었습니다!",
						 	    	  confirmButtonText: '확인'
								});
								//window.location = "/exam/exam";
							}
						}
					});//ajax끝
				}//문제항목번호 끝
			}//문제번호끝
		})//submit 끝

		$("#input_imgs1").on("change",handleImgFileSelect);
		//e: change이벤트
		function handleImgFileSelect(e){
			$("")

			//파일객체에 파일들
			let files = e.target.files;
			//이미지 배열
			let fileArr = Array.prototype.slice.call(files);
			//fileArr에서 하나 꺼내면 f(파일객체 1개)
			fileArr.forEach(function(f){
				//이미지만 가능
				if(!f.type.match("image.*")){
					Swal.fire({
						title: '이미지 확장자만 가능합니다.',
						showClass: {
							popup: 'animate__animated animate__bounceIn'
						},
						icon: 'warning',
						customClass: {
							confirmButton: 'btn btn-primary'
						},
						buttonsStyling: false
					});
					return;
				}
				//이미지를 읽을 객체
				let reader = new FileReader();
				//reader.readAsDataURL(f);의 이벤트
				reader.onload = function(e){
					let img_html = "<img src=\"" + e.target.result + "\" style='width:100%;' />";

					$(".imgs_wrap").html(img_html);
				}
				//이미지를 읽자
				reader.readAsDataURL(f);
			});//end forEach
		}


		$("#exExam").on("click",function(){

			$("div[id*=ex_]").each(function(i,v){
				v.remove();
			});

			var str = "";
			//문제 1번
			str += "<div id='ex_1' style='margin-left:auto; margin-right:auto; border-radius: 8px; background:white; width:68%; height : 350px;'>";
			str += "<br id='brbr1'>"; 
			str += "<input placeholder='질문' value='질문1.원소의 기원에 대한 빅뱅 이론의 원자에 대한 설명으로 옳지 않은 것은?' id='que_1' style='width:80%; height:40px; border:none; margin-left : 20px; border-bottom: 1px solid #9b9a9c;' type='text'>";
			str += "<br>";
			str += "<br>";
			str += "<div id='queDiv_1-1'>";
				str +=   "<input name='que1'  id='queCheck_1-1' type='radio' class='que1' style='margin-left : 20px;' checked/>";
				str +=   "<input type='text' id='queCheck_1-1value' value='1. 양성자는 원자핵의 구성 입자이다.' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
			str += "<div id='queDiv_1-2'>";
				str +=   "<input name='que1'  id='queCheck_1-2' type='radio' class='que1' style='margin-left : 20px;'/>";
				str +=   "<input type='text' id='queCheck_1-2value' value='2. 중수소와 삼중수소는 동위 원소이다.' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
			str += "<div id='queDiv_1-3'>";
				str +=   "<input name='que1'  id='queCheck_1-3' type='radio' class='que1' style='margin-left : 20px;'/>";
				str +=   "<input type='text' id='queCheck_1-3value' value='3. 질량수는 양성자수와 중성자수의 합이다.' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
			str += "<div id='queDiv_1-4'>";
				str +=   "<input name='que1'  id='queCheck_1-4' type='radio' class='que1' style='margin-left : 20px;'/>";
				str +=   "<input type='text' id='queCheck_1-4value' class='w-50' value='4. 원자핵 속의 중성자수를 원자 번호라고 한다.' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
				
			str +=   "<div id='queAnswerDiv1'>";
			str +=   	"<span style='margin-left : 20px'>정답 : </span>";
			str +=   	"<input type='text' class='w-50' value='4. 원자핵 속의 중성자수를 원자 번호라고 한다.' id='queAnswer1' readonly/>";
			str += 	"</div>";

			str += 		"<div id='buttonDiv_1' style='margin-left : 20px;'>";
			str += 			"<button type='button' id='optionAdd_1' class='btn btn-light'>옵션추가</button>";
			str += 			"<button type='button' id='optionMinus_1' class='btn btn-light'>옵션삭제</button>";
			str += 			"<button type='button' id='answer_1' class='btn btn-light'>정답</button>";
			str += 		"</div>";
			str += "</div>";
			str += "<br>";
			str += "<br>";
			//문제 2번
			str += "<div id='ex_2' style='margin-left:auto; margin-right:auto; border-radius: 8px; background:white; width:68%; height : 350px;'>";
			str += "<br id='brbr2'>";
			str += "<input placeholder='질문' value='질문2. 나트륨(Na)의 원자가전자의 값은?' id='que_2' style='width:80%; height:40px; border:none; margin-left : 20px; border-bottom: 1px solid #9b9a9c;' type='text'>";
			str += "<br>";
			str += "<br>";
			str += "<div id='queDiv_2-1'>";
				str +=   "<input name='que1'  id='queCheck_2-1' type='radio' class='que2' style='margin-left : 20px;' checked/>";
				str +=   "<input type='text' id='queCheck_2-1value' value='1. 1' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
			str += "<div id='queDiv_2-2'>";
				str +=   "<input name='que1'  id='queCheck_2-2' type='radio' class='que2' style='margin-left : 20px;'/>";
				str +=   "<input type='text' id='queCheck_2-2value' value='2. 2' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
			str += "<div id='queDiv_2-3'>";
				str +=   "<input name='que1'  id='queCheck_2-3' type='radio' class='que2' style='margin-left : 20px;'/>";
				str +=   "<input type='text' id='queCheck_2-3value' value='3. 3' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
			str += "<div id='queDiv_2-4'>";
				str +=   "<input name='que1'  id='queCheck_2-4' type='radio' class='que2' style='margin-left : 20px;'/>";
				str +=   "<input type='text' id='queCheck_2-4value' value='4. 4' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
				
			str +=   "<div id='queAnswerDiv2'>";
			str +=   	"<span style='margin-left : 20px'>정답 : </span>";
			str +=   	"<input type='text' value='1. 1' id='queAnswer2' readonly/>";
			str += 	"</div>";

			str += 		"<div id='buttonDiv_2' style='margin-left : 20px;'>";
			str += 			"<button type='button' id='optionAdd_2' class='btn btn-light'>옵션추가</button>";
			str += 			"<button type='button' id='optionMinus_2' class='btn btn-light'>옵션삭제</button>";
			str += 			"<button type='button' id='answer_2' class='btn btn-light'>정답</button>";
			str += 		"</div>";
			str += "</div>";
			str += "<br>";
			str += "<br>";
			//문제 3번
			str += "<div id='ex_3' style='margin-left:auto; margin-right:auto; border-radius: 8px; background:white; width:68%; '>";
			str += "<br id='brbr3'>";
			str += "<textarea placeholder='질문' value='' id='que_3' style='width:80%; height:100px; overflow:hidden; border:none; margin-left : 20px; border-bottom: 1px solid #9b9a9c;' >문제3. 다음은 화학이 일상생활의 문제를 해결하는데 기여한 사례에 대한 설명이다. 합성 의약품의 개발로 인해 현재 인간의 수명이 과거보다 현저하게 늘어나는 효과를 가지고 왔다. 다음 중 이 사례와 가장 관련이 깊은 화학자와 그의 화학 반응이나 발견으로 옳은 것은?</textarea>";
			str += "<br>";
			str += "<br>";
			str += "<div id='queDiv_3-1'>";
				str +=   "<input name='que1'  id='queCheck_3-1' type='radio' class='que3' style='margin-left : 20px;' checked/>";
				str +=   "<input type='text' id='queCheck_3-1value' value='1. 하버 – 암모니아 합성' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
			str += "<div id='queDiv_3-2'>";
				str +=   "<input name='que1'  id='queCheck_3-2' type='radio' class='que3' style='margin-left : 20px;'/>";
				str +=   "<input type='text' id='queCheck_3-2value' value='2. 캐러더스 – 나일론 합성' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
			str += "<div id='queDiv_3-3'>";
				str +=   "<input name='que1'  id='queCheck_3-3' type='radio' class='que3' style='margin-left : 20px;'/>";
				str +=   "<input type='text' id='queCheck_3-3value' value='3. 보슈 – 페니실린 발견 ' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
			str += "<div id='queDiv_3-4'>";
				str +=   "<input name='que1'  id='queCheck_3-4' type='radio' class='que3' style='margin-left : 20px;'/>";
				str +=   "<input type='text' id='queCheck_3-4value' value='4. 호프만 – 아스피린 합성' class='queText' placeholder='옵션' style='width:350px; height:40px; border:none; margin-left : 20px;' />";
			str += "</div>";
				
			str +=   "<div id='queAnswerDiv3'>";
			str +=   	"<span style='margin-left : 20px'>정답 : </span>";
			str +=   	"<input type='text' value='4. 호프만 – 아스피린 합성' id='queAnswer3' readonly/>";
			str += 	"</div>";

			str += 		"<div id='buttonDiv_3' style='margin-left : 20px;'>";
			str += 			"<button type='button' id='optionAdd_3' class='btn btn-light'>옵션추가</button>";
			str += 			"<button type='button' id='optionMinus_3' class='btn btn-light'>옵션삭제</button>";
			str += 			"<button type='button' id='answer_3' class='btn btn-light'>정답</button>";
			str += 		"</div>";
			str += "</div>";
			str += "<br>";
			str += "<br>";

			queList = 5;

			$("#examDivPrev").before(str);
		})//exExam끝

	});//$(function)끝
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
			<div style="margin-left: auto; margin-right: auto; border-top-left-radius: 8px; border-top-right-radius: 8px; background: #673ab7; width: 70%;">
				&nbsp;
			</div>
			<div style="margin-left: auto; margin-right: auto; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px; background: white; height: 100px; width: 70%;">
				<br>
				<div style="position: relative">
					<span id="sbjNum" style="display : none;">${subjectVO.sbjNum}</span>
					<h3>${subjectVO.sbjTitle}시험출제</h3>
					<span style="margin-left: auto;">${subjectVO.teaNmKor}교수</span>
				</div>
			</div>
		</div>
		<br>
		<br>
			<div id="ex_1" style="margin-left:auto; margin-right:auto; border-radius: 8px; background:white; width:68%;height:auto;min-height:350px;">
				<br id="brbr1">
				<!-- 시험문제 -->
				<input placeholder="질문" id="que_1" style="width:80%; height:40px; border:none; margin-left : 20px; border-bottom: 1px solid #9b9a9c;" type="text" />
				<br>
				<br>
				<!-- <div style="text-align: center;" class="imgs_wrap"></div> -->
				<br>
				<div id="buttonDiv_1" style="margin-left : 20px;">
					<!-- <input type="file" id="input_imgs1" multiple="multiple"><br> -->
					<button type="button" id="optionAdd_1" class="btn btn-light">옵션추가</button>
					<button type="button" id="optionMinus_1" class="btn btn-light">옵션삭제</button>
					<button type="button" id="answer_1" class="btn btn-light">정답</button>
				</div>
			</div>

			<br id="examDivPrev">
			<div id="examDiv" style="text-align : right; margin-left:auto; margin-right:auto; border-radius: 8px; width:68%; ">
				<button type="button" id="exExam" class="btn btn-light">문제미리생성</button>
				<button type="button" id="addExam" class="btn btn-light">문제추가</button>
				<button type="button" id="minusExam" class="btn btn-light">문제삭제</button>
				<button type="button" id="submit" class="btn btn-light">출제완료</button>
			</div>
	</section>
</body>
</html>