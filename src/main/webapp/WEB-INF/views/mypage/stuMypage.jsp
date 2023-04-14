<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="/resources/sneat/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script type="text/javascript" src="/resources/sneat/assets/js/extended-ui-sweetalert2.js"></script>

<script>
function openHomeSearch(){
	// 다음 우편번호 검색
	new daum.Postcode({
		// 다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
		oncomplete: function(data){
			// 우편번호
			$("#stuZip").val(data.zonecode);
			$("#stuAddr1").val(data.address);
			$("#stuAddr2").val(data.buildingName);
		}
	}).open();
	}

	 // 이미지 미리보기 시작 //
$(function(){
	 let sel_file = [];
	 $("#image").on("change", handleImgFileSelect);
	 // 파라미터 e : onchange 이벤트 객체
	 function handleImgFileSelect(e){
		 $(".imgs_wrap").html(""); // 초기화 작업

		 // 이벤트가 발생된 타겟 안에 들어있는 이미지 파일들을 가져옴
		 let files = e.target.files;

		 // 이미지가 여러개 있을 수 있으므로 이미지들을 분리해서 배열로 만듦
		 let fileArr = Array.prototype.slice.call(files);
		 // 파일 오브젝트의 배열 반복. f : 배열 안에 들어있는 각각의 이미지 파일 객체
		 fileArr.forEach(function(f){
			 // 이미지 파일이 아닌 경우 이미지 미리보기 실패 처리
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
			 // 이미지 객체(f)를 전역 배열타입 변수(sel_file)에 놓자
			 sel_file.push(f);
			 // 이미지 객체를 읽을 자바스크립트의 reader 객체 생성
			 let reader = new FileReader();
			 // e : reader객체가 이미지 객체를 읽는 이벤트
			 reader.onload = function(e){
				 // e.target : 이미지 객체
				 // e.target.result : reader가 이미지를 다 읽은 결과
				 // div 사이에 이미지가 렌더링 되어 화면에 보임
				 // 객체.append : 누적, .html : 새로고침, innerHTML : J/S
//				 $(".imgs_wrap").html(img_html);
				 $(".imgs_wrap").attr("src", e.target.result);
			 }
			 // f : 이미지 파일 객체를 읽은 후 다음 이미지 파일(f)을 위해 초기화 함
			 reader.readAsDataURL(f);
		 }); // end forEach
	 }
	 // 이미지 미리보기 종료 //

});

function pwCheck(){
	firstPw = $("#firstPw").val();
	var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/;

	if(!reg.test(firstPw)) {
		$("#regCK").css({"color" : "red", "font-size" : "0.8em"});
		$("#regCK").text("안전한 비밀번호로 다시 입력해주세요.");
	}else{
		$("#regCK").css({"color" : "blue", "font-size" : "0.8em"});
		$("#regCK").text("안전한 비밀번호입니다.");
	}
}

function reCheck(){
	firstPw = $("#firstPw").val();
	secondPw = $("#secondPw").val();
	if(firstPw == secondPw){
		$("#reCK").css({"color" : "blue", "font-size" : "0.8em"});
		$("#reCK").text("비밀번호가 일치합니다.");
	}else{
		$("#reCK").css({"color" : "red", "font-size" : "0.8em"});
		$("#reCK").text("비밀번호가 일치하지 않습니다.");
	}
}

$(function(){
	$("#image").on("change", function(){
		$("#chk").val("chk");
	});
});

</script>

<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-user-circle page-icon"></i>
	<span>마이페이지</span>
</h4>

<form id="updBform" enctype="multipart/form-data">
<div class="row">
	<!-- 왼쪽 프로필 -->
	<div class="col-xl-4 col-lg-5 col-md-5 order-1 order-md-0">
	<div class="card mb-4">
      <div class="card-body">
        <div class="user-avatar-section">
          <div class=" d-flex align-items-center flex-column">
            <hr style="color: white;" />
            <img id="stuImg" style="width: 160px; height: 200px; border-radius: 5px;" class="imgs_wrap" src="/resources/upload${stuVO.stuPhoto}"  alt="">
            <input type="hidden" id="stuPhoto" name="stuPhoto" value="${stuVO.stuPhoto}" />
            <div class="user-info text-center">
              <h4 class="mb-2" style="margin-top: 15px;"></h4>
            </div>
          </div>
        </div>
        <div class="d-flex justify-content-around flex-wrap my-4 py-3">
        	<label for="formFile" class="form-label">프로필사진 등록</label>
			<input class="form-control" type="file" id="image" name="image" />
            <input type="hidden" id="chk" name="chk" value="" />
        </div>
      </div>
    </div>
	</div>

	<!-- 오른쪽-->
	<div class="col-xl-8 col-lg-7 col-md-7 order-0 order-md-1">
		<div class="card mb-4">
		<div class="card-body">

        <div class="row">
          <hr style="color: white;" />
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">국적</label>
            <input type="text" class="form-control date-mask" id="stuNation" name="stuNation" value="${stuVO.stuNation}" disabled />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">한글명</label>
            <input type="text" id="stuNmKor" name="stuNmKor" value="${stuVO.stuNmKor}" class="form-control date-mask" disabled />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">영문명</label>
            <input type="text" id="stuNmEng" name="stuNmEng" value="${stuVO.stuNmEng}" class="form-control date-mask" disabled />
          </div>

          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">학번</label>
            <input type="text" value="${stuVO.stuNum}" class="form-control date-mask" disabled />
            <input type="hidden" id="stuNum" name="stuNum" value="${stuVO.stuNum}" />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">단과대학</label>
            <input type="text" id="collNm" name="collNm" value="${stuVO.collNm}" class="form-control date-mask" disabled />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">전공</label>
            <input type="text" id="deptNm" name="deptNm" value="${stuVO.deptNm}" class="form-control date-mask" disabled />
          </div>

          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">부전공</label>
            <input type="text" id="stuMinor" name="stuMinor" value="${stuVO.stuMinor}" class="form-control date-mask" placeholder="-" disabled />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">복수전공</label>
            <input type="text" id="stuDmajor" name="stuDmajor" value="${stuVO.stuDmajor}" class="form-control date-mask" placeholder="-" disabled />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">연락처</label>
            <input type="text" id="stuPn" name="stuPn" value="${stuVO.stuPn}" class="form-control date-mask" required />
          </div>

          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">현재학년</label>
            <input type="text" id="grade" name="grade" value="${stuVO.grade}" class="form-control date-mask" disabled />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">이수학기</label>
            <input type="text" id="semester" name="semester" value="${stuVO.stuSemester}학기" class="form-control date-mask" disabled />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">학적상태</label>
            <input type="text" id="stustat" name="stustat" value="${stuVO.stustat}" class="form-control date-mask" disabled />
          </div>

          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">생년월일</label>
            <input type="hidden" id="stuReg1" name="stuReg1" value="${stuVO.stuReg1}" class="form-control time-mask" disabled />
            <input type="text" id="birth" name="birth" value="${stuVO.birth}" class="form-control time-mask" disabled />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">이메일</label>
            <input type="text" id="stuEmail" name="stuEmail" value="${stuVO.stuEmail}" class="form-control numeral-mask" required />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4">
            <label class="fw-bold me-2">비밀번호</label>
            <button style="float:right; margin-bottom: 5px;" type="button" class="btn btn-xs btn-label-secondary" id="mdBtn"
            		data-bs-toggle="modal" data-bs-target="#pwModifyModal">비밀번호변경</button>
            <input type="password" id="password" name="password" value="${stuVO.password}" class="form-control delimiter-mask" />
          </div>

          <div class="col-xl-4 col-md-6 col-sm-12 mb-4 mb-xl-0">
            <label class="fw-bold me-2">우편번호</label>
            <input type="text" id="stuZip" name="stuZip" value="${stuVO.stuZip}" class="form-control delimiter-mask" required />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4 mb-xl-0">
            <label class="fw-bold me-2">주소</label>
            <input type="text" id="stuAddr1" name="stuAddr1" value="${stuVO.stuAddr1}" class="form-control custom-delimiter-mask" required />
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12">
            <label class="fw-bold me-2">상세주소</label>
            <button style="float:right; margin-bottom: 5px;" type="button" class="btn btn-xs btn-label-secondary" onclick="openHomeSearch()">주소검색</button>
            <input type="text" id="stuAddr2" name="stuAddr2" value="${stuVO.stuAddr2}" class="form-control custom-delimiter-mask" required />
          </div>
		  <hr style="color: white;" />
          <div class="col-xl-4 col-md-6 col-sm-12 mb-4 mb-xl-0">
            <label class="fw-bold me-2">은행명</label>
            <input type="text" id="stuBank" name="stuBank" value="${stuVO.stuBank}" class="form-control delimiter-mask" required />
          </div>
          <div class="col-xl-8 col-md-6 col-sm-12 mb-4 mb-xl-0">
            <label class="fw-bold me-2">계좌번호</label>
            <input type="text" id="stuAccount" name="stuAccount" value="${stuVO.stuAccount}" class="form-control custom-delimiter-mask" required />
          </div>
		  <hr style="color: white;" />
          <div class="col-xl-6 col-md-6 col-sm-12 mb-4 mb-xl-0">
            <label class="fw-bold me-2">병역유무</label>
            <select id="stuMs" name="stuMs" class="form-select text-capitalize" required>
	            <option value="">선택해주세요.</option>
				<option value="N" <c:if test="${stuVO.stuMs == 'N'}">selected</c:if>>미필</option>
				<option value="Y" <c:if test="${stuVO.stuMs == 'Y'}">selected</c:if>>군필</option>
			</select>
			</div>
          <div class="col-xl-6 col-md-6 col-sm-12 mb-4 mb-xl-0">
            <label class="fw-bold me-2">장애유무</label>
            <select id="stuHdc" name="stuHdc" class="form-select text-capitalize" required>
	            <option value="">선택해주세요.</option>
				<option value="Y" <c:if test="${stuVO.stuHdc == 'Y'}">selected</c:if>>장애</option>
				<option value="N" <c:if test="${stuVO.stuHdc == 'N'}">selected</c:if>>비장애</option>
			</select>
		  </div>
          <div class="col-xl-4 col-md-6 col-sm-12">
          </div>
          <hr style="color: white;" />
          <hr style="color: white;" />
          <hr style="color: white;" />
          <hr style="color: white;" />
          <hr style="color: white;" />
          <div class="col-xl-4 col-md-6 col-sm-12">
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12">
          </div>
          <div class="col-xl-4 col-md-6 col-sm-12">
			<button id="saveBtn" style="float:right;"type="button" class="btn btn-primary">저장하기</button>
          </div>
        </div>
      </div>
	</div>
	</div>
</div>
</form>


<div class="modal fade" id="pwModifyModal" tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="fw-bold py-3 mb-4">비밀번호 변경하기</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">현재 비밀번호</label>
						<span id="pwCK"></span>
						<input type="password" id="curPw" class="form-control" placeholder="현재 비밀번호 입력">
					</div>
				</div>
				<div class="row">
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">새 비밀번호</label>
						<span id="regCK"></span>
						<input type="password" id="firstPw" class="form-control" placeholder="새 비밀번호 입력">
						<p style="color: red; font-size: 0.8em;">&nbsp;&nbsp;대소문자 구분없이 영문자, 숫자, 특수문자를 조합하여 8~12자 필수 입력</p>
					</div>
				</div>
				<div class="row">
					<div class="col mb-3">
						<label for="nameWithTitle" class="fw-bold me-2">새 비밀번호 확인</label>
						<span id="reCK"></span>
						<input type="password" id="secondPw" class="form-control" placeholder="비밀번호 확인">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-label-secondary" id="closeBtn"
					data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="updBtn">변경하기</button>
			</div>
		</div>
	</div>
</div>

<script>
$(function(){

	$("#password").on("focus", function(){
		$("#mdBtn").click();
	});

	$("#curPw").on("keyup", function(){
		var curPw = $("#curPw").val();
		var data = {"curPw" : curPw};
		$.ajax({
			url : "/student/pwCheck",
			type : "post",
			data : data,
			dataType : "json",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
           		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if(result.data == "비밀번호가 일치합니다."){
				$("#pwCK").css({"color" : "blue", "font-size" : "0.8em"});
				}else{
				$("#pwCK").css({"color" : "red", "font-size" : "0.8em"});
				}
				$("#pwCK").text(result.data);
			},
			error: function (xhr) {
				Swal.fire({
					title: "error : " + xhr.status,
					showClass: {
						popup: 'animate__animated animate__bounceIn'
					},
					icon: 'error',
					customClass: {
						confirmButton: 'btn btn-primary'
					},
					buttonsStyling: false
				});
			}
		});
	});

	$("#firstPw").on("keyup", pwCheck);

	$("#secondPw").on("keyup", reCheck);

	$("#updBtn").on("click",function(){
		pwCK = $("#pwCK").text();
		regCK = $("#regCK").text();
		reCK = $("#reCK").text();
		if(pwCK == "비밀번호가 일치합니다." && regCK == "안전한 비밀번호입니다." && reCK == "비밀번호가 일치합니다."){
			firstPw = $("#firstPw").val();
			data = {"pw" : firstPw};
			$.ajax({
				url : "/student/pwUpadate",
				type: "post",
				data : data,
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result == 1){
					  Swal.fire({
						    title: '비밀번호가 변경되었습니다.',
						    showClass: {
						      popup: 'animate__animated animate__bounceIn'
						    },
						    icon: 'success',
						    customClass: {
						      confirmButton: 'btn btn-primary'
						    },
						    buttonsStyling: false
						  });
						$("#password").val(firstPw);
						$("#closeBtn").click();
					}
				}
			});

		}else{
			Swal.fire({
				title: "알림메시지들을 확인해주시기 바랍니다.",
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
	});

	$('#pwModifyModal').on('hidden.bs.modal', function() {
		$("#pwCK").text("");
		$("#regCK").text("");
		$("#reCK").text("");
		$("#curPw").val("");
		$("#firstPw").val("");
		$("#secondPw").val("");
	})


	$("#saveBtn").on("click", function(){
		var form = $('#updBform')[0];
		var formData = new FormData(form);

		$.ajax({
			url : "/student/myPageUpdate",
			processData : false,
			contentType : false,
			data : formData,
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				  Swal.fire({
					    title: '마이페이지가 수정되었습니다.',
					    showClass: {
					      popup: 'animate__animated animate__bounceIn'
					    },
					    icon: 'success',
					    customClass: {
					      confirmButton: 'btn btn-primary'
					    },
					    buttonsStyling: false
					  });
				$("#image").val("");
				$("#stuPhoto").val(result.stuPhoto);
				$("#stuImg").attr("src", "/resources/upload" + result.stuPhoto);
				$("#smallpp").attr("src", "/resources/upload" + result.stuPhoto);
				$("#stuPn").val(result.stuPn);
				$("#stuEmail").val(result.stuEmail);
				$("#password").val(result.password);
				$("#stuZip").val(result.stuZip);
				$("#stuAddr1").val(result.stuAddr1);
				$("#stuAddr2").val(result.stuAddr2);
				$("#stuBank").val(result.stuBank);
				$("#stuAccount").val(result.stuAccount);
				$("#stuAccount").val(result.stuAccount);

				if(result.stuMs == 'N'){
					$("#stuMs").val("N").prop("selected", true);
				}else{
					$("#stuMs").val("Y").prop("selected", true);
				}

				if(result.stuHdc == 'N'){
					$("#stuHdc").val("N").prop("selected", true);
				}else{
					$("#stuHdc").val("Y").prop("selected", true);
				}

			}
		});
	});
});
</script>