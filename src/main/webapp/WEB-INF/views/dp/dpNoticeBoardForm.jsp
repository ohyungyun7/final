<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<script>
$(function(){
	$("#insertBtn").on("click", function(){
		files = $("#files").val();
		if(files == null || files == ""){
			$("#chk").val("x");
		}
		$("#dpNfrm").submit();
	});
});
</script>

<h4 class="fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-chalkboard page-icon"></i>
	<span class="fw-light" onclick="javascript:history.back();" style="cursor:pointer;">학과 공지사항  / </span>
	작성하기
</h4>

<div class="card" style="height: auto;">
	<div class="card-body">
	<div class="row">
	<div class="col-lg-8 mx-auto">
		<form id="dpNfrm" action="/dpNotieBoard/createPost" method="post" enctype="multipart/form-data">
			<input type="hidden" id=dnNum name="dnNum" value="${dnNum}" />
			<div class="mb-3">
				<label class="form-label" for="basic-default-fullname">공지사항 종류</label>
				<div class="col-md-2">
				  <select id="dnRead" name="dnRead" class="form-select color-dropdown">
				    <option value="" selected>필수선택</option>
				    <option value="1">필독</option>
				    <option value="0">일반</option>
				  </select>
				</div>
			</div>
			<div class="mb-3">
		    <label class="form-label" for="basic-default-company">제목</label>
		    <input type="text" class="form-control" id="dnTitle" name="dnTitle" placeholder="제목을 입력해주세요." />
		  </div>
		  <div class="mb-3">
		    <label class="form-label" for="basic-default-message">내용</label>
		    <textarea id="dnContent" name="dnContent" class="form-control" placeholder="내용을 입력해주세요."></textarea>
		  </div>
		  <div class="mb-3">
            <label class="form-label" for="basic-default-upload-file">파일첨부</label>
            <input type="file" class="form-control" id="files" name="files" multiple >
            <input type="hidden"  id="chk" name="chk" value="" >
          </div>
		  <a style="margin-left: 75%;" id="a" href="/dpNotieBoard/dpNoticeBoardList" class="btn btn-secondary">목록보기</a>
		  <button type="button" id="insertBtn" class="btn btn-primary">등록하기</button>
		  <sec:csrfInput/>
		</form>
	</div>
	</div>
	</div>
</div>

<script type="text/javascript">
CKEDITOR.replace('dnContent');
</script>