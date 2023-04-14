<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<script>

$(function(){
	// 이미지 미리보기 시작 --------------------
	$("#files").on("change", handleImgFileSelect);
	// e: change 이벤트
	function handleImgFileSelect(e){
		$("#imageView").empty();
		// 파일객체에 파일들
		let files = e.target.files;
		// 이미지 배열
		let fileArr = Array.prototype.slice.call(files);

		// fileArr에서 하나 꺼내면 f(파일 객체 1개)
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
			}
			else{
				// 이미지를 읽을 객체
				let reader = new FileReader();

				//reader.readAsDataURL(f);의 이벤트
				reader.onload = function(e){
					let img_html = "<img src='" + e.target.result + "' style='width:30%' />";
					$("#imageView").append(img_html);
				}

				// 이미지를 읽자
				reader.readAsDataURL(f);
			}
		}); // end forEach
	}
	// 이미지 미리보기 종료 --------------------

	$("#autoBtn").on("click", function(){
		$("#autoOp1").attr("selected", true);
		$("#autoOp2").attr("selected", true);
		$("#nbTitle").val(" 대학일자리플러스본부 Dream+ 서포터즈 6기 모집");
		CKEDITOR.instances.nbContent.setData(
		'<p><strong>1.&nbsp;신청기간</strong>: 2023. 4. 13.(목) ~17.(월)</p><p><strong>2.&nbsp;제출서류</strong>:&nbsp;서포터즈&nbsp;6기 신청서 및 개인정보동의서(하단 다운로드)</p><p><strong>3.&nbsp;신청방법</strong>:&nbsp;메일 발송(대학일자리플러스본부 담당자&nbsp;miasanta@pcu.ac.kr)</p><p><strong>4.&nbsp;선발인원</strong>:&nbsp;최대&nbsp;10명</p><p><strong>5.&nbsp;선발절차</strong></p><p>&nbsp; -1차 서류접수</p><p>&nbsp; -2차 개별 면담(기간: 4월&nbsp;20일~25일/ SP201호)</p><p>&nbsp; -3차 최종선발(30일,&nbsp;4월)</p>'
		);
	});


});


</script>

<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-flag-alt page-icon"></i>
	<span class="fw-light" onclick="javascript:history.back();" style="cursor:pointer;">학사 공지사항  / </span>
	작성
 <button type="button" id="autoBtn" style="float: right;" class="btn btn-secondary">자동채우기</button>
</h4>

<div class="card" style="height: auto;">
	<div class="card-body">
	<div class="row">
	<div class="col-lg-8 mx-auto">
		<form id="dpNfrm" action="/acadNotice/createPost" method="post" enctype="multipart/form-data">
			<input type="hidden" id=nbNum name="nbNum" value="${nbNum}" />
			<div class="mb-3">
				<label class="form-label" for="basic-default-fullname">공지사항 수준</label>
				<div class="col-md-2">
				  <select id="nbRead" name="nbRead" class="form-select color-dropdown">
				    <option value="" selected>필수선택</option>
				    <option id="autoOp1" value="1">필독</option>
				    <option value="0">일반</option>
				  </select>
				</div>
			</div>
			<div class="mb-3">
				<label class="form-label" for="basic-default-fullname">공지사항 종류</label>
				<div class="col-md-2">
				  <select id="nbCate" name="nbCate" class="form-select color-dropdown">
				    <option value="" selected>필수선택</option>
				    <option id="autoOp2" value="일반">일반공지</option>
				    <option value="학사">학사공지</option>
				    <option value="장학">장학공지</option>
				  </select>
				</div>
			</div>
			<div class="mb-3">
		    <label class="form-label" for="basic-default-company">제목</label>
		    <input type="text" class="form-control" id="nbTitle" name="nbTitle" placeholder="제목을 입력해주세요." />
		  </div>
		  <div class="mb-3">
		    <label class="form-label" for="basic-default-message">내용</label>
		    <textarea id="nbContent" name="nbContent" class="form-control" placeholder="내용을 입력해주세요."></textarea>
		  </div>
		  <div class="mb-3" id="imageView">
          </div>
		  <div class="mb-3">
            <label class="form-label" for="basic-default-upload-file">파일 첨부</label>
            <input type="file" class="form-control" id="files" name="files" multiple >
          </div>
		  <a style="margin-left: 75%;" href="/acadNotice/list" class="btn btn-secondary">목록보기</a>
		  <button type="submit" id="insertBtn" class="btn btn-primary">등록하기</button>
		  <sec:csrfInput/>
		</form>
	</div>
	</div>
	</div>
</div>

<script type="text/javascript">
CKEDITOR.replace('nbContent');
</script>